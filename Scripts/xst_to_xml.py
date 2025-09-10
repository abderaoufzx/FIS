#!/usr/bin/env python3
"""
XSD to XML Generator
Generates sample XML documents from XSD schema files
"""

import xml.etree.ElementTree as ET
from xml.dom import minidom
import argparse
import sys
import os
from typing import Dict, List, Optional, Tuple
import re

class XSDToXMLGenerator:
    def __init__(self, xsd_file: str):
        self.xsd_file = xsd_file
        self.xsd_tree = None
        self.namespaces = {}
        self.target_namespace = None
        self.elements = {}
        self.complex_types = {}
        self.simple_types = {}
        
    def parse_xsd(self):
        """Parse the XSD file and extract schema information"""
        try:
            self.xsd_tree = ET.parse(self.xsd_file)
            root = self.xsd_tree.getroot()
            
            # Extract namespaces
            for prefix, uri in root.attrib.items():
                if prefix.startswith('xmlns'):
                    ns_prefix = prefix.split(':')[1] if ':' in prefix else 'default'
                    self.namespaces[ns_prefix] = uri
            
            # Get target namespace
            self.target_namespace = root.get('targetNamespace')
            
            # Register namespaces for XPath queries
            if 'xs' not in self.namespaces:
                self.namespaces['xs'] = 'http://www.w3.org/2001/XMLSchema'
            
            # Parse elements, complex types, and simple types
            self._parse_elements(root)
            self._parse_complex_types(root)
            self._parse_simple_types(root)
            
        except ET.ParseError as e:
            print(f"Error parsing XSD file: {e}")
            sys.exit(1)
        except FileNotFoundError:
            print(f"XSD file not found: {self.xsd_file}")
            sys.exit(1)
    
    def _parse_elements(self, root):
        """Parse top-level elements from XSD"""
        for elem in root.findall('.//xs:element', self.namespaces):
            name = elem.get('name')
            if name:
                self.elements[name] = elem
    
    def _parse_complex_types(self, root):
        """Parse complex types from XSD"""
        for ct in root.findall('.//xs:complexType', self.namespaces):
            name = ct.get('name')
            if name:
                self.complex_types[name] = ct
    
    def _parse_simple_types(self, root):
        """Parse simple types from XSD"""
        for st in root.findall('.//xs:simpleType', self.namespaces):
            name = st.get('name')
            if name:
                self.simple_types[name] = st
    
    def _get_sample_value(self, element_type: str, restrictions: Dict = None) -> str:
        """Generate sample values based on type and restrictions"""
        sample_values = {
            'string': 'SampleString',
            'int': '123',
            'integer': '123',
            'decimal': '123.45',
            'float': '123.45',
            'double': '123.45',
            'boolean': 'true',
            'date': '2023-12-25',
            'dateTime': '2023-12-25T10:30:00',
            'time': '10:30:00',
            'anyURI': 'http://example.com',
            'base64Binary': 'U2FtcGxlRGF0YQ==',
            'hexBinary': '48656C6C6F',
        }
        
        # Remove namespace prefix if present
        clean_type = element_type.split(':')[-1] if ':' in element_type else element_type
        
        base_value = sample_values.get(clean_type, 'SampleValue')
        
        # Apply restrictions if any
        if restrictions:
            if 'enumeration' in restrictions:
                return restrictions['enumeration'][0]  # Use first enumeration value
            elif 'minLength' in restrictions or 'maxLength' in restrictions:
                min_len = restrictions.get('minLength', 1)
                max_len = restrictions.get('maxLength', 20)
                # Adjust string length
                if clean_type == 'string':
                    base_value = 'Sample' + 'X' * max(0, min_len - 6)
                    if len(base_value) > max_len:
                        base_value = base_value[:max_len]
        
        return base_value
    
    def _parse_restrictions(self, element) -> Dict:
        """Parse restrictions from simple type or element"""
        restrictions = {}
        
        # Look for restrictions in simpleType
        simple_type = element.find('.//xs:simpleType', self.namespaces)
        if simple_type is not None:
            restriction = simple_type.find('.//xs:restriction', self.namespaces)
            if restriction is not None:
                # Parse enumerations
                enums = restriction.findall('xs:enumeration', self.namespaces)
                if enums:
                    restrictions['enumeration'] = [e.get('value') for e in enums]
                
                # Parse length restrictions
                min_length = restriction.find('xs:minLength', self.namespaces)
                if min_length is not None:
                    restrictions['minLength'] = int(min_length.get('value'))
                
                max_length = restriction.find('xs:maxLength', self.namespaces)
                if max_length is not None:
                    restrictions['maxLength'] = int(max_length.get('value'))
        
        return restrictions
    
    def _generate_element_content(self, element, parent_xml_elem):
        """Generate content for an XML element based on XSD definition"""
        elem_name = element.get('name')
        elem_type = element.get('type')
        
        # Create XML element
        if self.target_namespace:
            xml_elem = ET.SubElement(parent_xml_elem, elem_name)
        else:
            xml_elem = ET.SubElement(parent_xml_elem, elem_name)
        
        # Handle different element types
        if elem_type:
            # Element has a type reference
            if elem_type.startswith('xs:') or elem_type in ['string', 'int', 'integer', 'decimal', 'boolean', 'date', 'dateTime']:
                # Simple type
                restrictions = self._parse_restrictions(element)
                xml_elem.text = self._get_sample_value(elem_type, restrictions)
            elif elem_type in self.complex_types:
                # Complex type reference
                self._generate_complex_type_content(self.complex_types[elem_type], xml_elem)
            elif elem_type in self.simple_types:
                # Simple type reference
                simple_type_def = self.simple_types[elem_type]
                restrictions = self._parse_restrictions(simple_type_def)
                base_type = simple_type_def.find('.//xs:restriction', self.namespaces)
                if base_type is not None:
                    base = base_type.get('base', 'string')
                    xml_elem.text = self._get_sample_value(base, restrictions)
                else:
                    xml_elem.text = self._get_sample_value('string', restrictions)
        else:
            # Inline type definition
            complex_type = element.find('xs:complexType', self.namespaces)
            if complex_type is not None:
                self._generate_complex_type_content(complex_type, xml_elem)
            else:
                simple_type = element.find('xs:simpleType', self.namespaces)
                if simple_type is not None:
                    restrictions = self._parse_restrictions(element)
                    xml_elem.text = self._get_sample_value('string', restrictions)
                else:
                    xml_elem.text = self._get_sample_value('string')
    
    def _generate_complex_type_content(self, complex_type, xml_elem):
        """Generate content for complex type elements"""
        # Handle attributes
        attributes = complex_type.findall('.//xs:attribute', self.namespaces)
        for attr in attributes:
            attr_name = attr.get('name')
            attr_type = attr.get('type', 'string')
            attr_use = attr.get('use', 'optional')
            
            if attr_use == 'required' or attr_use == 'optional':  # Generate for both required and optional
                xml_elem.set(attr_name, self._get_sample_value(attr_type))
        
        # Handle sequences
        sequence = complex_type.find('.//xs:sequence', self.namespaces)
        if sequence is not None:
            for child_elem in sequence.findall('xs:element', self.namespaces):
                min_occurs = int(child_elem.get('minOccurs', '1'))
                max_occurs = child_elem.get('maxOccurs', '1')
                
                # Generate at least minOccurs elements
                occurrences = min_occurs if min_occurs > 0 else 1
                if max_occurs != 'unbounded' and int(max_occurs) < occurrences:
                    occurrences = int(max_occurs)
                
                for _ in range(occurrences):
                    self._generate_element_content(child_elem, xml_elem)
        
        # Handle choice
        choice = complex_type.find('.//xs:choice', self.namespaces)
        if choice is not None:
            child_elements = choice.findall('xs:element', self.namespaces)
            if child_elements:
                # Generate first choice option
                self._generate_element_content(child_elements[0], xml_elem)
        
        # Handle all
        all_group = complex_type.find('.//xs:all', self.namespaces)
        if all_group is not None:
            for child_elem in all_group.findall('xs:element', self.namespaces):
                self._generate_element_content(child_elem, xml_elem)
    
    def generate_xml(self, root_element_name: str = None) -> str:
        """Generate XML document from XSD"""
        if not root_element_name:
            # Use first available element as root
            if not self.elements:
                raise ValueError("No elements found in XSD or root element not specified")
            root_element_name = list(self.elements.keys())[0]
        
        if root_element_name not in self.elements:
            raise ValueError(f"Element '{root_element_name}' not found in XSD")
        
        # Create root XML element
        root_elem = self.elements[root_element_name]
        
        # Create XML document
        if self.target_namespace:
            root_xml = ET.Element(root_element_name, attrib={
                'xmlns': self.target_namespace
            })
        else:
            root_xml = ET.Element(root_element_name)
        
        # Generate content
        self._generate_element_content(root_elem, ET.Element('temp'))
        
        # Copy content from temp element to root
        temp_elem = ET.Element('temp')
        self._generate_element_content(root_elem, temp_elem)
        
        # Recreate root with proper content
        if self.target_namespace:
            root_xml = ET.Element(root_element_name, attrib={
                'xmlns': self.target_namespace
            })
        else:
            root_xml = ET.Element(root_element_name)
            
        # Handle root element type
        elem_type = root_elem.get('type')
        if elem_type and elem_type in self.complex_types:
            self._generate_complex_type_content(self.complex_types[elem_type], root_xml)
        elif root_elem.find('xs:complexType', self.namespaces) is not None:
            complex_type = root_elem.find('xs:complexType', self.namespaces)
            self._generate_complex_type_content(complex_type, root_xml)
        else:
            # Simple element
            restrictions = self._parse_restrictions(root_elem)
            root_xml.text = self._get_sample_value(elem_type or 'string', restrictions)
        
        # Convert to formatted string
        rough_string = ET.tostring(root_xml, encoding='unicode')
        reparsed = minidom.parseString(rough_string)
        return reparsed.toprettyxml(indent="  ")[23:]  # Remove XML declaration line
    
    def save_xml(self, output_file: str, root_element_name: str = None):
        """Generate and save XML to file"""
        xml_content = self.generate_xml(root_element_name)
        
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write('<?xml version="1.0" encoding="UTF-8"?>\n')
            f.write(xml_content)
        
        print(f"XML file generated: {output_file}")

def main():
    parser = argparse.ArgumentParser(description='Generate XML from XSD schema')
    parser.add_argument('xsd_file', help='Path to XSD schema file')
    parser.add_argument('-o', '--output', help='Output XML file path', default='generated.xml')
    parser.add_argument('-r', '--root', help='Root element name (if not specified, uses first element found)')
    parser.add_argument('--print', action='store_true', help='Print XML to console instead of saving to file')
    
    args = parser.parse_args()
    
    if not os.path.exists(args.xsd_file):
        print(f"Error: XSD file '{args.xsd_file}' not found")
        sys.exit(1)
    
    try:
        generator = XSDToXMLGenerator(args.xsd_file)
        generator.parse_xsd()
        
        if args.print:
            xml_content = generator.generate_xml(args.root)
            print('<?xml version="1.0" encoding="UTF-8"?>')
            print(xml_content)
        else:
            generator.save_xml(args.output, args.root)
            
    except Exception as e:
        print(f"Error generating XML: {e}")
        sys.exit(1)

if __name__ == '__main__':
    main()