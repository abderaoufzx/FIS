<?xml version="1.0" encoding="utf-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
 targetNamespace="http://www.infotecnet.com/XML/"
 xmlns="http://www.infotecnet.com/XML/"
 elementFormDefault="qualified">
	<!-- Main element -->
	<xs:element name="INFOTECXML" type="infotecxmltype"/>
	<xs:complexType name="infotecxmltype">
		<xs:choice>
			<!-- Sub elements -->
			<xs:element name="LOGIN" type="xs:string"/>
			<xs:element name="CHART" type="charttype"/>
			<xs:element name="OPTIONS" type="optionstype"/>
			<xs:element name="WARRANTS" type="warrantstype"/>
			<xs:element name="NEWS" type="newstype"/>
			<xs:element name="STORY" type="storytype"/>
			<xs:element name="TIMESERIES" type="timeseriestype"/>
			<xs:element name="SEARCHES" type="searchestype"/>
			<xs:element name="QUOTELIST" type="quotelisttype"/>
			<xs:element name="QUOTE" type="quotetype"/>
		</xs:choice>
	</xs:complexType>
	<xs:complexType  name="charttype">
		<xs:attribute name="symbol" type="xs:string"/>
	</xs:complexType>
	<xs:complexType  name="optionstype">
		<xs:sequence minOccurs="0" maxOccurs="unbounded">
			<xs:element name="OPTION" type="optiontype"/>
		</xs:sequence>
		<xs:attribute name="symbol" type="xs:string"/>
		<xs:attribute name="ticker" type="xs:string"/>
		<xs:attribute name="status" type="xs:string"/>
		<xs:attribute name="type" type="xs:string"/>
		<xs:attribute name="nboptions" type="xs:integer"/>
		<xs:attribute name="avail-sg" type="xs:unsignedInt"/>
		<xs:attribute name="avail-quot" type="xs:unsignedInt"/>
	</xs:complexType>
	<xs:complexType name="optiontype">
		<xs:sequence>
			<xs:element name="ERROR" type="xs:string" minOccurs="0"/>
			<xs:element name="instrument" type="xs:string"/>
			<xs:element name="day" type="xs:string"/>
			<xs:element name="month" type="xs:string"/>
			<xs:element name="year" type="xs:integer"/>
			<xs:element name="strike" type="xs:float" minOccurs="0"/>
		</xs:sequence>
	</xs:complexType>
	<xs:complexType  name="warrantstype">
		<xs:sequence minOccurs="0" maxOccurs="unbounded">
			<xs:element name="WARRANT" type="warranttype"/>
		</xs:sequence>
		<xs:attribute name="symbol" type="xs:string"/>
		<xs:attribute name="ticker" type="xs:string"/>
		<xs:attribute name="status" type="xs:string"/>
		<xs:attribute name="type" type="xs:string"/>
		<xs:attribute name="nbwarrants" type="xs:integer"/>
		<xs:attribute name="avail-sg" type="xs:unsignedInt"/>
		<xs:attribute name="avail-quot" type="xs:unsignedInt"/>
	</xs:complexType>
	<xs:complexType name="warranttype">
		<xs:sequence>
			<xs:element name="instrument" type="xs:string"/>
			<xs:element name="day" type="xs:string"/>
			<xs:element name="month" type="xs:string"/>
			<xs:element name="year" type="xs:integer"/>
			<xs:element name="strike" type="xs:float" minOccurs="0"/>
		</xs:sequence>
	</xs:complexType>
	<xs:complexType  name="newstype">
		<xs:sequence minOccurs="1" maxOccurs="unbounded">
			<xs:element name="HEADLINE" type="headlinetype"/>
		</xs:sequence>
		<xs:attribute name="status" type="xs:string"/>
		<xs:attribute name="avail-news" type="xs:unsignedInt"/>
		<xs:attribute name="nbheadlines" type="xs:integer"/>
		<xs:attribute name="sources" type="xs:string"/>
		<xs:attribute name="logic" type="xs:string"/>
		<xs:attribute name="text" type="xs:string"/>
		<xs:attribute name="country" type="xs:string"/>
		<xs:attribute name="sector" type="xs:string"/>
		<xs:attribute name="subject" type="xs:string"/>
		<xs:attribute name="instrument" type="xs:string"/>
		<xs:attribute name="government" type="xs:string"/>
		<xs:attribute name="statistics" type="xs:string"/>
		<xs:attribute name="currency" type="xs:string"/>
	</xs:complexType>
	<xs:complexType name="headlinetype">
		<xs:sequence>
			<xs:element name="date" type="xs:date" minOccurs="0"/>
			<xs:element name="gmt" type="xs:time" minOccurs="0"/>
			<xs:element name="HEADLINETEXT" type="xs:string"/>
			<xs:element name="STORYID" type="xs:string" minOccurs="0"/>
			<xs:element name="STORYURL" type="xs:string" minOccurs="0"/>
		</xs:sequence>
		<xs:attribute name="source" type="xs:string"/>
	</xs:complexType>
	<xs:complexType name="storytype">
		<xs:sequence>
			<xs:element name="HEADLINETEXT" type="xs:string"/>
			<xs:element name="STORYTEXT" type="xs:string"/>
			<xs:element name="COUNTRY" type="xs:string" minOccurs="0"/>
			<xs:element name="SECTOR" type="xs:string" minOccurs="0"/>
			<xs:element name="SUBJECT" type="xs:string" minOccurs="0"/>
			<xs:element name="INSTRUMENT" type="xs:string" minOccurs="0"/>
			<xs:element name="GOVERNMENT" type="xs:string" minOccurs="0"/>
			<xs:element name="STATISTICS" type="xs:string" minOccurs="0"/>
			<xs:element name="CURRENCY" type="xs:string" minOccurs="0"/>
		</xs:sequence>
		<xs:attribute name="status" type="xs:string"/>
	</xs:complexType>
	<xs:complexType  name="timeseriestype">
		<xs:sequence minOccurs="0" maxOccurs="unbounded">
			<xs:element name="TIMESERIESPOINT" type="timeseriespointtype" minOccurs="0"/>
		</xs:sequence>
		<xs:attribute name="symbol" type="xs:string"/>
		<xs:attribute name="ticker" type="xs:string"/>
		<xs:attribute name="status" type="xs:string"/>
    <xs:attribute name="avail-hist" type="xs:unsignedInt"/>
    <xs:attribute name="timescale" type="xs:integer"/>
		<xs:attribute name="nbpoints" type="xs:integer"/>
	</xs:complexType>
	<xs:complexType  name="timeseriespointtype">
		<xs:all>
			<xs:element name="date" type="xs:date" minOccurs="0"/>
			<xs:element name="gmt" type="xs:time" minOccurs="0"/>
			<xs:element name="time" type="xs:time" minOccurs="0"/>
			<xs:element name="last" type="xs:float" minOccurs="0"/>
			<xs:element name="open" type="xs:float" minOccurs="0"/>
			<xs:element name="high" type="xs:float" minOccurs="0"/>
			<xs:element name="low" type="xs:float" minOccurs="0"/>
			<xs:element name="bid" type="xs:float" minOccurs="0"/>
			<xs:element name="ask" type="xs:float" minOccurs="0"/>
			<xs:element name="volume" type="xs:integer" minOccurs="0"/>
			<xs:element name="openint" type="xs:integer" minOccurs="0"/>
		</xs:all>
	</xs:complexType>
	 <xs:complexType  name="quoteseriestype">
			<xs:sequence minOccurs="0" maxOccurs="unbounded">
				 <xs:element name="QUOTESERIESPOINT" type="quoteseriespointtype" minOccurs="0"/>
			</xs:sequence>
			<xs:attribute name="symbol" type="xs:string"/>
			<xs:attribute name="ticker" type="xs:string"/>
			<xs:attribute name="status" type="xs:string"/>
			<xs:attribute name="nbpoints" type="xs:integer"/>
			<xs:attribute name="avail-hist" type="xs:unsignedInt"/>
	 </xs:complexType>
	 <xs:complexType  name="quoteseriespointtype">
			<xs:all>
				 <xs:element name="date" type="xs:date" minOccurs="0"/>
				 <xs:element name="gmt" type="xs:time" minOccurs="0"/>
				 <xs:element name="time" type="xs:time" minOccurs="0"/>
				 <xs:element name="bid" type="xs:float" minOccurs="0"/>
				 <xs:element name="ask" type="xs:float" minOccurs="0"/>
				 <xs:element name="bidsz" type="xs:integer" minOccurs="0"/>
				 <xs:element name="asksz" type="xs:integer" minOccurs="0"/>
			</xs:all>
	 </xs:complexType>

	 <xs:complexType  name="searchestype">
		<xs:sequence minOccurs="1" maxOccurs="unbounded">
			<xs:element name="PREVIOUS" type="xs:string" minOccurs="0"/>
			<xs:element name="NEXT" type="xs:string" minOccurs="0"/>
			<xs:element name="SEARCH" type="searchtype"/>
		</xs:sequence>
		<xs:attribute name="search" type="xs:string"/>
		<xs:attribute name="on" type="xs:string"/>
		<xs:attribute name="exchange" type="xs:string"/>
		<xs:attribute name="type" type="xs:string"/>
		<xs:attribute name="class" type="xs:string"/>
		<xs:attribute name="page" type="xs:integer"/>
		<xs:attribute name="total" type="xs:integer"/>
		<xs:attribute name="avail-sg" type="xs:unsignedInt"/>
	</xs:complexType>
	<xs:complexType name="searchtype">
		<xs:all>
			<xs:element name="instrument" type="xs:string" minOccurs="0"/>
			<xs:element name="name" type="xs:string" minOccurs="0"/>
			<xs:element name="market" type="xs:string" minOccurs="0"/>
			<xs:element name="nsin" type="xs:string" minOccurs="0"/>
			<xs:element name="isin" type="xs:string" minOccurs="0"/>
			<xs:element name="type" type="xs:string" minOccurs="0"/>
			<xs:element name="class" type="xs:string" minOccurs="0"/>
			<xs:element name="cur" type="xs:string" minOccurs="0"/>
			<xs:element name="country" type="xs:string" minOccurs="0"/>
			<xs:element name="coupon" type="xs:float" minOccurs="0"/>
			<xs:element name="maturity" type="xs:date" minOccurs="0"/>
			<xs:element name="yield" type="xs:float" minOccurs="0"/>
			<xs:element name="ytm" type="xs:float" minOccurs="0"/>
		</xs:all>
	</xs:complexType>
	<xs:complexType  name="quotelisttype">
		<xs:sequence minOccurs="1" maxOccurs="unbounded">
			<xs:element name="PREVIOUS" type="xs:string" minOccurs="0"/>
			<xs:element name="NEXT" type="xs:string" minOccurs="0"/>
			<xs:element name="INVALIDFIELDS" type="xs:string" minOccurs="0"/>
			<xs:element name="UNDEFINED" type="xs:string" minOccurs="0"/>
			<xs:element name="ERROR" type="xs:string" minOccurs="0"/>
			<xs:element name="QUOTE" type="quotetype"/>
		</xs:sequence>
		<xs:attribute name="request" type="xs:string"/>
		<xs:attribute name="nbsymbols" type="xs:integer"/>
		<xs:attribute name="symbollist" type="xs:string"/>
		<xs:attribute name="avail-quot" type="xs:unsignedInt"/>
	</xs:complexType>
	<xs:complexType name="logos">
		<xs:sequence minOccurs="0" maxOccurs="unbounded">
			<xs:element name="logo" type="logotype" minOccurs="0"/>
		</xs:sequence>
	</xs:complexType>
	<xs:complexType name="logotype">
		<xs:complexContent>
			<xs:restriction base="xs:anyType">
				<xs:attribute name="type" type="xs:string"/>
				<xs:attribute name="format" type="xs:string"/>
				<xs:attribute name="size" type="xs:integer"/>
			</xs:restriction>
		</xs:complexContent>
	</xs:complexType>
	<xs:complexType name="urls">
		<xs:sequence minOccurs="0" maxOccurs="unbounded">
			<xs:element name="url" type="urltype" minOccurs="0"/>
		</xs:sequence>
	</xs:complexType>
	<xs:complexType name="urltype">
		<xs:complexContent>
			<xs:restriction base="xs:anyType">
				<xs:attribute name="domain" type="xs:string"/>
			</xs:restriction>
		</xs:complexContent>
	</xs:complexType>
	<xs:complexType name="flags">
		<xs:sequence minOccurs="0" maxOccurs="unbounded">
			<xs:element name="flag" type="flagtype" minOccurs="0"/>
		</xs:sequence>
	</xs:complexType>
	<xs:complexType name="flagtype">
		<xs:complexContent>
			<xs:restriction base="xs:anyType">
				<xs:attribute name="width" type="xs:string"/>
				<xs:attribute name="height" type="xs:string"/>
				<xs:attribute name="format" type="xs:string"/>
			</xs:restriction>
		</xs:complexContent>
	</xs:complexType>
	<xs:complexType name="quotetype">
		<xs:all>
			<xs:element name="INVALIDFIELDS" type="xs:string" minOccurs="0"/>
			<xs:element name="UNDEFINED" type="xs:string" minOccurs="0"/>
			<xs:element name="ERROR" type="xs:string" minOccurs="0"/>
			<!-- FIDS -->
			<xs:element name="name" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Expanded name for the instrument (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="gmt" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Greenwich Mean Time of last update to instrument (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="last" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Last value at which this instrument traded  (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="netchg" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The +ve or -ve change between the LAST traded value and the most recent non-zero Previous Close value or Settlement price. (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="high" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The Maximum value reached by the instrument today (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="low" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The Minimum value reached by the instrument today (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="netchgindicator" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Direction arrow (up, down or stable) showing Instrument's Net Change (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="cur" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Currency of the instrument (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tradedate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Date when this instrument last traded (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="date" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Date when this instrument was last updated (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tradetimes" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Time when this instrument last traded (5 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="tradetime" type="xs:time" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="open" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Today's opening price or value. The source of this field depends upon the market and instrument type  (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pclose" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Most recent non-zero closing value or settlement price (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bid" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Current bid price (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bidspread" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Bid Spread (Raiffeisen) (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ask" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Current ask price (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="askspread" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Ask Spread (Raiffeisen) (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="news" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="newstimeall" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bidsize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The amount that is being offered at the current bid price (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="asksize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The amount that is being requested at the current Ask price (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="volume" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Total volume traded today (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="eps" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Earnings per share (as per last Annual Report) (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="yield" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>For stocks:- the dividend per share expressed as a percentage of the price, for bonds:- the current yield (to maturity) (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="p.e." type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Priced Earning Ratio (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="dividendtype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="divdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Payment date for dividend  (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="exdivdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The date on which the issue will trade ex-dividend (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="month" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The month in which the contract should be delivered unless liquidated or traded out before (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="blockvolume" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="exchgid" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tradingunits" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lotsizeunits" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lotsize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change between the Last price and the Previous Closing price. (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="closebid" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="openint" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Open interest. The total number of option or futures contracts that have not been closed or, in the case of commodities, liquidated or offset by delivery (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="strike" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Strike price: the price at which an option or a warrant is exercisable (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="expiry" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Expiry Date - the date on which the future, option or warrant expires (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="maturity" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Expiry Date - the date on which a bond matures (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="coupon" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Annual rate of interest on a bond (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="settle" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Settlement price. The price of an executed order settled by the buyer or the seller of a stock or the official closing price of a futures or option contract set by the clearing house at the end of the trading day (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="div" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Dividend - The latest reported dividend to be paid per share to shareholders (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="notrades" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Number of Trades today (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="offcode" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (12 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="histclosedate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="voltotal" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="yearhi" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The highest value reached by the Last price during this calendar year (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="yearlo" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The lowest value reached by the Last price during this calendar year (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pyrhi" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The highest value reached by the Last during the previous calendar year (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pyrlo" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The lowest value reached by the Last during the previous calendar year (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pyrcls" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The historical close for the issue on the final trading day of the previous calendar year (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="turnover" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Today's total value of all trades (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="coupondate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="rating" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Rating of instrument (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bondtype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="issuedate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Bond issue date (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bidnetchg" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Absolute difference between the current BID value and the previous reported BID (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="days" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="cum_exmarker" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="nav" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Net Asset Value (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="navnetchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Absolute difference between the current NAV and the previous reported NAV (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="assets" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sevendayyield" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="duration" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ytm" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The Yield of the instrument up to its Maturity (date) (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="marketstat" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mid" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The average of the current BID and ASK values (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="midnetchg" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Absolute difference between the current MID and the previous MID (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="valorennumber" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="offcls" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="footnote" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="navdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="offerprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="navpday" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="navpdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ytmbid" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ytmask" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="kassakurs" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="parityprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="incvol" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Transactional volume of the last trade price reported (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="issueprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="take_overstat" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="todayhibid" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="todaylobid" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="histclsbid" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mktmakerid" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mktmakersrc" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mktmakername" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sprnav" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="prev" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (14 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="next" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (14 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bidtime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Time of the latest update to the BID field (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="asktime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Time of the latest update to the ASK field (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="acttype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="secondactivy" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="secacttype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="opentime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Time at which the opening value was made (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="hitime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Time at which the high value was made (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lotime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Time at which the low value was made (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="settledate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The date of the settlement price held in the SETTLE field (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bidmmid" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="askmmid" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="rows" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Page Row 1 (80 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="row" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="yhidate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Date on which the year or contract high was made (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ylodate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Date on which the year or contract low was made (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pytm" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bidyield" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="askyield" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pyield" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="opintdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="issueamount" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lasttime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pvolume" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The previous accumulated volume traded (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="suspensiontype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="voldate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="primact" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="exercised" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bestbidsizes" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="bestbidsize" type="xs:integer" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="bestasksizes" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="bestasksize" type="xs:integer" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="orderbid" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Number of orders at best bid price (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="orderask" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Number of orders at best ask price (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bestbids" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="bestbid" type="xs:float" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="bestasks" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="bestask" type="xs:float" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="dateline" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Expanded date (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sess1cls" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="exdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="excode" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="source" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (12 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="payfreq" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="convprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="prem" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Premium (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="valuedates" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="valuedate" type="xs:date" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="volatility" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="thhi" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Theoretical high (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="thlo" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Theoretical low (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="wntratio" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Number of shares per warrant (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="hstclose" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="actflag" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="scaflag" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="valuets" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="seqnum" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Sequence Number (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="quotetime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>QMF Message quote Time (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="nominal" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Par value of a stock or denomination of a bond (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="condcdes" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="condcde" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="beta" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Beta value - the relative volatility of the instrument's price based on index returns (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="convfactr" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="curr" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Currency 2 (Raiffeisen) (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lengthprs" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Length Period 1 (Raiffeisen) (3 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="lengthpr" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="dvdndamountps" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="dvdndamountp" type="xs:float" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="epsestm" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>EPS forecast  (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mktcap" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The market price of an entire company, calculated by multiplying the number of shares outstanding by the price per share (Infotec calculates this price on the 'Last') (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="no.shrsauthsd" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="capchngdtep" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="capchngdscp" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (11 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="baseprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indsectorcode" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Industrial sector code (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="currassetsp" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="cash_s_tdepp" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="currliabltsp" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lngtrmdebtp" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="accruedint" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Accrued Interest (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lcldspnm" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (32 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sessiontype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mktclstime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="vwap" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Volume-Weighted Average Price for current day (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="floorprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>LME Ring price / In Money Market, an interest rate agreement in which payments are made when the reference rate falls below the strike rate. Lower limit (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="offexchlast" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="offexchvol" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="convcost" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="upc_71" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="convexity" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="exdivdaterule" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="shr_wntprcrat" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="convratio" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="redemptiondate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The earliest redemption possible (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sourceid" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="autoquotebid" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="autoquoteask" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="thval" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Theoretical Value (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="impliedvoltlty" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Implied Volatility (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="put_call" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Indicates whether instrument is a Put or a Call (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="cntryissr" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="accumvoltime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="exchangeid" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="shrsout" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The number of shares of a corporation's stock that have been issued and are in the hands of the public (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="divtype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="cchdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctyrchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change from Last day of last year (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctpyrchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="instrumentname" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indexname" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (7 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="dividendfreq" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="hstvolatility" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Historical Volatility (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="wklypctchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mktvalue" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Market Value (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indexid" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tradeid" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Trade identifier (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="listingdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctmidchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tradedvalue" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="cusip" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Committee on Uniform Security Identification Procedures (CUSIP) 9-digit code (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="delay" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Indicates the delay for the prices (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="paymentrecfreq" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="intrate" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Interest Rate (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="adjustment" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="securityname" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Name of the security (78 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="issuer" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Issuer name for the security (60 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="convfrom" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="convto" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="undlyingmktprc" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>UMP- Underlying Market Price (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="imvolbid" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Implied Volatility Bid (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="imvolask" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Implied Volatility Ask (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="delta" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Delta - is the option's or warrant's sensitivity to small movements in the underlying asset price (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="gamma" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Gamma - is the delta's sensitivity to a small movement in the underlying asset price. Identical for call and put (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="theta" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Theta - is the option's or warrant's sensitivity to a small change in time to maturity. As time to maturity decreases, it is normal to express the Theta as minus the partial derivative with respect to time (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="vega" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Vega - is the option's or warrant's sensitivity to small movements in the volatility of the underlying asset. Identical for call and put. Also called 'Kappa' (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="rho" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Rho - is the option's or warrant's sensitivity to a small change in the risk-free interest rate (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="intval" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Intrinsic Value (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="timeval" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Time Value (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="strikeprcindn" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Type of strike limit value (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="thopen" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Theoretical Open (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="wavgsprd" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="spread" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Spread versus the next future month's contract (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="basisspread" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Spread versus the first month's contract (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="avgvol" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Average Volume (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fiftytwowhi" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Last 52 weeks' highest price (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fiftytwowlo" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Last 52 weeks' lowest price (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="inddiv" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="earnprd" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (11 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="twelvemeps" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="epsyear" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="acteps" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="epscomment" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (40 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="intepscomment" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (40 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pct5yrgrowth" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (6 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fiscalyr" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sandprank" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="optionsymbol" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The root symbol for an option contract (7 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctinstitution" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="leaps" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The symbols of related long-term equity anticipation securities (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="balancedate" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="prefshrsout" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Number of outstanding preference shares (11 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fincomment" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (40 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="hi_loyear" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="yrhis" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="yrhi" type="xs:float" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="yrlos" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="yrlo" type="xs:float" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="divyear" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Current year for the latest share dividend (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="divyrs" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Past year for the share dividend (9 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="divyr" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="epsyrs" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Current year for the earnings per share (2 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="epsyr" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="eqpsyrs" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (7 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="eqpsyr" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="revyrs" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="revyr" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="netyrs" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="netyr" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="splitfactors" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Factor for the latest stock split (14 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="splitfactor" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="instrument" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Infotec Symbol (14 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="segment" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (14 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="market" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Complete name of the Market (14 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="xsymbol" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Symbol sent by the data provider (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="totalcntrval" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="subscriptnum" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="concludenum" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="openprognum" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lstcontractqty" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lstcontractprc" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="negotiateqty" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mmkrclass" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bidaskcond" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="retcap" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="shortcapgain" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="med.capgain" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="longcapgain" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="unallocdist" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indhighprc" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indlowprc" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indincvol" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indtrval" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indopen" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indvol" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="regbid" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="regask" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="regbidsize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="regasksize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tradetype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="gearing" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="isin" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>International Security Identification Number (made up of 12 characters) (12 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="nsin" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>National Security Identification Number (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="months" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lasttraderule" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="minticksize" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Minimum tick size (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="nms" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Normal Market Size (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="category" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Indicates the category of the security e.g. domestic or foreign (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="instrumenttype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Instrument type: Equity, Derivative, Government Bond etc. (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="commoncode" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="industrycode" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Industrial classification (broader classification) (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="alerts" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="oexch" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Infotec Original Exchange ID (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="type" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Instrument or other data type code (e.g. S, B, W: see following Section on Types) (6 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="subtype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sessions" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="histstart" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="onemhi" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Last month's highest price (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="onemlo" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Last month's lowest price (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="threemhi" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Last 3 months' highest price (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="threemlo" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Last 3 months' lowest price (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sixmhi" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Last 6 months' highest price (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sixmlo" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Last 6 months' lowest price (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pwkcls" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Closing price from last day of last week. (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctwkchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change from Last day of last week. (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="excodeend" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pmoncls" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Closing price from last day of last month (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctmonchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change from Last day of last month (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pquartcls" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Closing price from last day of last quarter (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctquartchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change from Last day of last quarter (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sevendcls" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Closing price from same week day of last week (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pct7dchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change from same week day of last week (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="thirtydcls" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Closing price from 30 days back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pct30dchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change from 30 days back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ninetydcls" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Closing price from 90 days back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pct90dchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change from 90 days back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="eighteen0dcls" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Closing price from 180 days back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pct180dchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change from 180 days back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fiftytwowcls" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Closing price from 52 weeks back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pct52wchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change from 52 weeks back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="threeyrcls" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Closing price from this date, three years back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pct3yrchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change from this date, three years back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fiveyrcls" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Closing price from this date, five years back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pct5yrchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Closing price from this date, five years back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="wkchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Change from Last day of last week. (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="monchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Change from Last day of last month (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="quartchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Change from Last day of last quarter (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sevendchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Change from same week day of last week (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="thirtydchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Change from 30 days back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ninetydchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Change from 90 days back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="eighteen0dchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Change from 180 days back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fiftytwowchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Change from 52 weeks back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="threeyrchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Change from this date, three years back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fiveyrchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Closing price from this date, five years back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="yrchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The change in value from last year close (31st December closing price) until today (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="expirytime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="nbmktmaker" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="onewhi" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="onewlo" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="onewhistchg" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="twoyrcls" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Closing price from this date, two years back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="twoyrchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Change from this date, two years back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pct2yrchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change from this date, two years back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="p2yrcls" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The historical close for the issue on the final trading day of the previous-1 calendar year (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctidx" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change of the current price (LAST) compared to the current value of the underlying Index (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctidx7d" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change of the current price (LAST) compared to the underlying index on the same week day of last week (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctidx30d" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change of the current price (LAST) compared to the underlying index 30 days back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctidx90d" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change of the current price (LAST) compared to the underlying index 90 days back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctidx180d" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change of the current price (LAST) compared to the underlying index 180 days back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctidx52w" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change of the current price (LAST) compared to the underlying index 52 weeks ago (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctidxyr" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change of the current price (LAST) compared to the underlying index on the last day of last year (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctidx3yr" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change of the current price (LAST) compared to the underlying index from this date, three years back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctidx5yr" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change of the current price (LAST) compared to the underlying index from this date, five years back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctidxwk" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change of the current price (LAST) compared the underlying index on the last day of last week. (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctidxmon" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change of the current price (LAST) compared to the underlying index on the last day of last month (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctidxquart" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change of the current price (LAST) compared to the underlying index on the last day of last quarter (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctidx2yr" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change of the current price (LAST) compared to the underlying index from this date, two years back (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sales_turnover" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pretaxincome" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="netincome" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="e.p.s." type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fixedassets" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="intangibles" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ltinvestments" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="otherltassets" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="cashandequiv." type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="currentassets" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="currentliabilities" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ltdebt" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="otherltliabilities" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="stockholdersequity" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="netoperatingcashflow" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="depreciationandamortisation" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="operatingincome" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="intexpense" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="taxes" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="minorityint" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="extraordinaryitems" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="epsincludingexords" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="goodwill" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="investmentsassoc.cos" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="otherltinvestments" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="receivables" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="inventory" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="othercurrentassets" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="shorttermdebt" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tradepayables" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="othercurrentliabilities" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="deferredtax" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="minorityintb_s" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="otherltliabsv" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="preferredcapital" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ordinarycapital" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="othercapitalstock" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="reserves" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="netoperatingmarginpct" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pretaxprofitmarginpct" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="returnonassetspct" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="returnonord.equitypct" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="returnoninvestedcap.pct" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pretaxintcoverage" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="currentratio" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="quickratio" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="debt_shareholdersequitypct" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="debt_investedcapitalpct" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="debt_totalassetspct" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ltfinancingratio" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="capitalisationratio" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ltdebt_totalliabilitiespct" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="balyear" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="balmonth" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="industrysector" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="country" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="descunderlying" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="profiledate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="offexchid" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indnav" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="perfpct" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="navtype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="intprofit" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="perf" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="perfytd" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="perfwtd" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="redprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ter" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="terexperf" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="terdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="terincr" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="paymentdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="conditions" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (255 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="issuecond" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="redcond" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="offexchtotvol" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="current" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="productname" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Product Name (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="offexchturnover" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tenor" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bidfactor" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Bid discount factor (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="askfactor" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Ask discount factor (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bpvolatility" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Basis Point Volatility (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctwtukg" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>% weight within overall index (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctwtindex" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>% weight within band index (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="nextxddate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Next XD date (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="accridxbase" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Accrued interest / Index base value (Accrued Interest) (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="aciadd" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Interest xd today / Index base value (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="aveprc" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Average price for each index band (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bvi" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Base value for each band (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="nomival" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Nominal (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ncoupon" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Semi annual coupon payment (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fcoupon" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>First interest payment (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="cumaci" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Cumulative ACIADD year-to-date (7 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="equilibrium" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Equilibrium price (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fraction" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Fraction of time from settlement to redemption date / Total period (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="grrdpyield" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Gross redemption yield (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="gry0pct" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Gross redemption yield assuming 0% infltation (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="gry10pct" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Gross redemption yield assuming 10% infltation (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="gry3pct" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Gross redemption yield assuming 3% infltation (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="gry5pct" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Gross redemption yield assuming 5% infltation (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="accrual" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Accrual (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="modduration" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Modified Duration (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="idxmktvalue" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Idx MKT Value (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="idxweighting" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Idx Weighting (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lstpaydate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Lastest interest payment date (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="rdpyield" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Redemption Yield (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="rpifrac" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Month between RPI at last payment and current and current RPI*frequency/12 (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="rpirat" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Current RPI / Base RPI (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="rpi8mth" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>RPI 8 month ago (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="rpibase" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>RPI Basis (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="rpic" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Current RPI (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="rpidt" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>RPIdt (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="rpipu" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Date on which current RPI is calculated (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="term" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Term from settlement to redemption in fraction (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="totretidx" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Total return Index (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ptotrtd" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Closing clean price + Accrued interest (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="xdmarker" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Xd marker 0=Stock not XD 1=Stock is XD (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="xdytd" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>XD adjustment Year-to-date (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="xdacc" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Interest received per Index (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="finalreddate" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Final Redemption Payment Date (6 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="marketctr" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (6 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="nomcur" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Currency of the nominal value (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="divcur" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="underlying" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Underlying instrument for warrant, option, future (for indices, reference file of components) (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="flatcode" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="version" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lasttradedate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="eventdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="events" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (50 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="event" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="linkdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="linkcodes" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (50 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="linkcode" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="linksecuritys" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (20 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="linksecurity" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="dvdnddates" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="dvdnddate" type="xs:date" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="earliestexecdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Earliest date of exercise of warrants (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="latestexecdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Latest date of exercise of warrants (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="deletiondate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The last trading day (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="expirationmonth" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (50 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="cap" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>In Money Market, an interest rate agreement in which payments are made when the reference rate is higher than the strike rate. Upper limit (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="chain" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="command" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="reset" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="maxyield" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="rollover" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Futures rollover date (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="rollovertime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="thmatchvol" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pnetchg" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Previous Netchg (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctpchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The previous day's percentage change  (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bidorders" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="bidorder" type="xs:integer" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="askorders" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="askorder" type="xs:integer" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="ticktrend" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Price comparison: + (higher), - (lower) or 0 (no change) (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bidsizepreopen" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bidorderpreopen" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bestbidpreopen" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bestaskpreopen" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="askorderpreopen" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="asksizepreopen" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="suspsource" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="suspdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="susptime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="suspcond" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="suspmodif" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="suspend" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="suspenddate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="adjstdbaseprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="rolledoverstrike" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lendingfee" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="rolledoverintrst" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="convrates" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="convrate" type="xs:float" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="otcmin.price" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="otcmax.price" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="minimumpriceblock" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="maximumpriceblock" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="maxposifluctuation" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="maxnegafluctuation" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="preopenstarttime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="openingtime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="closingtime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="aftermktreporttime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mktlimit" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="preopenmark" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="issuancecountry" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="listingunit" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tradingrule" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="yclosecapitalpct" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="calcfrequency" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="numoftradedissues" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctofcapitalization" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="trendeclaireurindex" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="netchngeeclaireurindex" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tickofindex_liquidationday" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctchange_liquidationday" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tickofindex_prev.year" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctchange_prev.year" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="netyieldindex" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="grossyieldindex" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="issueslower" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="issueshigher" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="issuesunchanged" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="issuesnottraded" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="issuesreserved" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="issuessuspended" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="totalnumofissues" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tickofvariation" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctchngeofissues" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (6 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctchngeofissueslower" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (6 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctchngeofissueshigher" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (6 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indexcompcapital" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (17 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="publicitytype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pricechngeindicator" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="min.contract" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="strikelimit" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Knock out value (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="strikecur" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="min.openintrst" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="strikesteps" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="preopen" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="denomination" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="optiontype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="unitvalue" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="maximumcontract" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="slscond" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="hit_tak" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tal" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Trading at last (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="whopen" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Current day's warehouse opening stock (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="whin" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Previous day's movements into warehouse (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="whout" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Previous day's movements out of warehouse (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="whclose" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="whonwnt" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Previous day's warranted stock at close (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="whcancel" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Previous day's stock marked for removal (at close) (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="whchng" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Previous day's net stock change (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="monthavg" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mmbid" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mmbidsize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mmbidtime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mmask" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mmasksize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mmasktime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="flbid" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="flbidsize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="flbidtime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="flask" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="flasksize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="flasktime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="selbid" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="selbidsize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="selbidtime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="selask" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="selasksize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="selasktime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sellast" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="selincvol" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="selvolume" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="selpvolume" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mtincvol" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mtvolume" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mtlast" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Last Match Trade price (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mttradetime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Transaction Volume of the last Match Trade price reported MT Inc Vol (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mktopenint" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Market Open interest. (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="closesize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="closetime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="close" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mincrosscounterv" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="minwholesalecounterv" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="imbalance" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pqa" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="blockcountervalue" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="underlyingtype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="auctionauctiondiff" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="auctionmaxdiff" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="marketdesc" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="gvu" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="settlgroupcode" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tonqualinc" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tonminamt" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="minissueamt" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="buybidask" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sellbidask" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tonpreauctionind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tonsegmind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tradingreginterval" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pdnlevelbuy" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pdnlevelsell" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="numberopenings" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="nocontractstart" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="noexectrades" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="auctionobscinterv" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tonobscinterv" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="shrsindexcalc" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="weightindexcalc" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctchngstartyr" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="subscprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="refprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="prefprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="firsttradevol" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="statusunderl" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="settletype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ratios" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="ratio" type="xs:float" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="entryind" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="psessionprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="opensuitind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="closesuitind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="psessiondate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="upvind" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="changetolast" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indexlinkcoef" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="misaligncoef" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="crossorderind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="taxsystemind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="messagenumber" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="exerciselimit" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pricequotfactor" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="modifier" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="maxordervol" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="auctionpricetype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pricediffind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tradediffind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lastdiff" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="controlprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="benchmarkind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="breakeven" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="gearingstatus" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="impliedvolaaskstatus" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="impliedvolabidstatus" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="impliedvolalaststatus" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="leveragestatus" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="premiump.a." type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="premiumperannumstatus" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="spreadpercent" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="spreadpercentstatus" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="impliedvolamidstatus" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="imvolmid" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="undisin" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (12 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lvge" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctmoney" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="imvolavg" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="quotingexch" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (12 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="___announcement" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="asksupplement" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bidsupplement" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="cashid" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="changeid" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="conttradid" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="correctiontickid" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="currenttradingphase" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="highsize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lastsuppl" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lasttype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="listingtype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (25 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lowsize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="maklerid" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="opensize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="otherannouncement" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tickaction" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tickid" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="askrange" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="askind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bidind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bidrange" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="capadjustment" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indsize" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="inter_daytickdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="auctionprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="auctionsize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="auctiontime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tradephase" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="quotationtype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="expiryym" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="optgennum" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lasttrdsizeactual" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="origstrike" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="potentialopen" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="productstate" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="constituentnumber" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="constituentsupdated" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indexcalc" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indexstatus" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indexval" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indexvalsupplement" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indexvariantid" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="prelspecialopen" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="regressioncoefficients" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="regressioncoefficient" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="specialopen" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="totalturnover" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="contractsize" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ptnauc" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="creationdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mktsegmentlegal" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="cum_exannouncement" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="purchasedate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="repurchasedate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="gperatio" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ltgrowth" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="nbanalysts" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="relperf" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="valrating" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="earnrevtrend" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="techtrend" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="revpoint" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="yranalysis" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bearmktfactor" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="badnewsfactor" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="beta12m" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="vol1m" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Annualized Historical Volatility for 1 month period (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="vol12m" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Annualized Historical Volatility for a 12 months period (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sevenw_erew" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="midhi" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="midlo" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="uncrossvol" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="uncrossprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="latetradevol" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="latetradeprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tradetimetype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bidpct" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="askpct" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indexvartype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="dtrvargrs" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="dtrlocgrsdiv" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="dtrusdgrsdiv" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="dtrvarnet" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="dtrlocnetdiv" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="dtrusdnetdiv" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mtrvargrs" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mtrlocgrsdiv" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mtrusdgrsdiv" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mtrvarnet" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mtrlocnetdiv" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mtrusdnetdiv" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="otrvargrs" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="otrlocgrsdiv" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="otrusdgrsdiv" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="otrvarnet" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="otrlocnetdiv" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="otrusdnetdiv" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="matband" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="hedged" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="parentidx" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="parentvar" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="hgdcur" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="hgdpct" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="assetshgd" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (24 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="assetsunhgd" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (24 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="onewtr" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="onemtr" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="threemtr" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="oneytr" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="threeytr" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fiveytr" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ratingdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="structured" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="basket" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="future" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="quanto" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="cpc" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="exercise" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="nsinunderl" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="varamount" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="maxspread" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="maxspreadpct" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="threshold" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="minsize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="minsizeeuro" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fees" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="reallocation" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="cancellation" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="suppldata" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="chooser" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="discount" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="leverage" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="knockin" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="knockout" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ranges" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (30 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="range" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="other" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="vardata" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="assetalloc" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="euwax" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="appropriation" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mgmtcomp" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="refmkts" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="refmkt" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="salesauth" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="token" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="rolling" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="accrintperiod" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="wkn" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Wertpapier Kenn Nummer (7 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="longname" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="agm_egmdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="paymentfrom" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="paymentto" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="divpaymenttype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="earncur" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Earnings Currency (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="wthtax" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Withholding Tax (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="redwthtax" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Reduced Withholding Tax (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="eusavings" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Subject to EU Savings Directive (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="taxcreditrate" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="taxtype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="conv_exchtype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="conv_exchdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="capchngtype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Capital Change Type (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="capchngratio" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Capital Change Ratio (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="conv_exchratio" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Conversion/Exchange Ratio (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="newwkn" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>WKN after Conversion/Exchange (7 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="germansymbol" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>German Symbol (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="inttype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="paymentstatus" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mindenom" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Smallest Denomination (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bidindpreopen" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="askindpreopen" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bid1ind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bid2ind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bid3ind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bid4ind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bid5ind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bid6ind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bid7ind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bid8ind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bid9ind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bid10ind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ask1ind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ask2ind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ask3ind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ask4ind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ask5ind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ask6ind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ask7ind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ask8ind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ask9ind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ask10ind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="impliedbid" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="impliedbidsize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="impliedask" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="impliedasksize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="classification" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="marketstatus" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Market Status Condition (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sector" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Market Sector Code (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="companyinflastupdatedate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Company Information Last Update (date) (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="companyinflastupdatetime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Company Information Last Update (time) (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="instrumentshortname" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Instrument Short Name (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="numwarrantsissd" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Number Warrants Issued (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="settlementtype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Expiry Date Complement 2/Settlement Type (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="settlementsource" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Expiry Date Complement 1/Expiry Source (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="periodstarttime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Period Start Time (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="periodname" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Period Name (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ems" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Exchange Market Size (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="quoteunitsize" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Quote Unit Size (7 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="reducedminqtesize" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Reduced Minimum Quote Size (12 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="minprcpordersize" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Minimum Principal Order Size (12 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="minagtordersize" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Minimum Agent Order Size (12 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="effectivedate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Market Sector Effective Date (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="localmnemonic" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Local Market TIDM (6 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bestpricestatus" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Best Price Status Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="announceno" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Announcement Number (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="announcecode" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Announcement Code (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="announcemarker" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Set Announcement Marker (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="brainstrustcode" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>BrainsTrust Code (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="brainstrustsecuritywght" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>BrainsTrust Security Weighting (7 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ftseindexcode" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>FTSE Index Code (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ftseindustrialsectorcode" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>FTSE Industrial Sector Code (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ftsesecuritywght" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>FTSE Security Weighting (7 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="nofmngrsholding" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Number of Fund Managers Holding (7 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="nofundsholding" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Number of Funds Holding (6 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="brainstrustoverwghtpos" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>BrainsTrust Overweight Position (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="brainstrustconvfct" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>BrainsTrust Conviction Factor (7 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="generateddate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Generated Date (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="classificationscheme" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Classification Scheme Code (12 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="classificationclass" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Classification Class Code (12 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fmngrid" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Manager ID (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fundname" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Fund Name (50 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fmngrname" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Manager Name (50 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fmngrrating" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Manager ID (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fmngrratio" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Citywire Fund Manager Rating (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="periodmonths" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Period Months (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="periodstart" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Period Start (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="periodend" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Period End (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fmngrperf" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Citywire Manager Performance (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fmngravgperf" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Citywire Average Manager Performance (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ranking" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Citywire Ranking (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="totlfmngrs" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Total Number of Managers (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bestmonthlyperf" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Best Monthly Performance (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bestmonthlyperfdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Best Monthly Performance Date (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="worstmonthlyperf" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Worst Monthly Performance (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="worstmonthlyperfdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Worst Monthly Performance Date (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="issuercode" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Issuer Code (6 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="expdateinterimreslt" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Expected Date Interim Results (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="expdatefinalreslt" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Expected Date Final Results (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="profitaftertax" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Profit After Tax (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="inflastupdatedte" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Information Last Update (Date) (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="inflastupdatetim" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Information Last Update (Time) (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="autmtradeind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Automatic Trades Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="monthtodatevolume" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Month-To-Date Volume (13 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="yeartodatevolume" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Year-To-Date Volume (13 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indexstatustime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Time of Change (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indexexceptstatus" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Index Exceptional Status Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="shareholders" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Shareholder (45 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="shareholder" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="shareholderranks" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Shareholder Ranking (1 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="shareholderrank" type="xs:unsignedLong" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="currentnumshrs" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Current Number of Shares (12 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="currentpercshrss" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Current Percentage of Shares (7 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="currentpercshrs" type="xs:float" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="currenthldgsdtes" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Current Date (9 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="currenthldgsdte" type="xs:date" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="prevnumshrs" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Previous Number of Shares (12 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="prevpercshrss" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Previous Percentage of Shares (7 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="prevpercshrs" type="xs:float" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="prevhldgsdtes" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Previous Date (9 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="prevhldgsdte" type="xs:date" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="minquotesizemult" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Minimum Quote Size Multiplier (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="maxquotesizemult" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Maximum Quote Size Multiplier (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="reducedminqtesizemult" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Reduced Minimum Quote Size Multiplier (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="minagrsizemult" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Minimum Aggregate Size Multiplier (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="maxtrdsizeflrmult" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Maximum Trade Size Floor Multiplier (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mintrdsizeclngmult" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Minimum Trade Size Ceiling Multiplier (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="minagtordersizemult" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Minimum Agent Order Size Multiplier (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="maxagtordersizemult" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Maximum Agent Order Size Multiplier (7 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="minprcpordersizemult" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Minimum Principal Order Size Multiplier (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="maxprcpordersizemult" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Maximum Principal Order Size Multiplier (7 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tradesizerestrind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Trade Size Restriction Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ordersbestind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Orders Best Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bbo_atind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>BBO/AT Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="allquotesbestind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>All Quotes Best Ind (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="firmquoteexecrank" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Firm Quote Exec Rank (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="limitorderexecrank" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Limit Order Execution Rank (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="commitdprinciporderexecrank" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Committed Principal Order Execution Rank (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="participcodedisseminationind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Participant Code Dissemination Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="orderexpdisseminationind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Order Expiration Dissemination Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tradesizedisseminationind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Trade Size Dissemination Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="aggregsizedisseminationind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Aggregate Size Dissemination Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="dlngcapacitydisseminationind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Dealing Capacity Dissemination Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bestprcdisseminationind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Best Price Dissemination Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="firmquotedisseminationind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Firm Quote Dissemination Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indquotedisseminationind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Indicative Quote Dissemination Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="cmtdprincipdisseminationind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Committed Principal Dissemination Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="limitorderdisseminationind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Limit Order Dissemination Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="firmexpsrorderdisseminationind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Firm Exposure Order Dissemination Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indexpsrorderdisseminationind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Indicative Exposure Order Dissemination Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indorderprcentryind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Indicative Order Price Entry Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="indordersizeentryind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Indicative Order size Entry Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="orderexpdateind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Order Expiry Date Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="numvaliddays" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Number of Valid Days (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ordersinglefillind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Order Single Fill Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="prefcounterpartyind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Preferred Counterparty Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="trade_bestind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Trade/Best Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tradereprtprdstarttime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Trade Reporting Period Start Time (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tradereprtprdendtime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Trade Reporting Period End Time (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="o_ntrdtimelmt" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Overnight Trade Time Limit (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lines" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Firm (1) (70 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="line" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="calcbasis" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Basis of Calculation (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="dateofpreparation" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Date Of Preparation (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="numofdays" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Number of Days (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="midhightime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Time of Mid High (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="midlowtime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Time of Mid Low (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="unexecvaluebuy" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Value Not Executed Buy Side (28 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="unexecvaluesell" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Value Not Executed Sell Side (28 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="moneyflowvalexec" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Money Flow Value Executed (28 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="offbookmoneyflowvalexec" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Off Book Money Flow Value Executed (28 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="timeofprepration" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Time Of Prepration (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="participantcode" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Participant Code (11 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="buy_sellind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Buy/Sell Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mrktmechanismgrp" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Market Mechanism Group (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ordercode" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Order Code (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mrktmechanismtype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Market Mechanism Type (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="orderprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Order Price (19 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="aggregsize" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Aggregate Size (12 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="dealingcapcty" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Dealing Capacity (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="timevalidity" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Time Validity (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="datevalidity" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Date Validity (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="persnlexpsrinf" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Personal Exposure Information (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="participorderref" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Participant Order Reference (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="clientref" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Client Reference (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="singlefillind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Single Fill Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="participmnemonic" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Participant Mnemonic (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="participtype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Participant Type (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="participname" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Participant Name (30 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="participtel" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Participant Telephone Number (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="participinflastupdtedate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Participant Information Last Update (date) (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="participinflastupdtetime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Participant Information Last Update (time) (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="reducedmmind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Reduced Market Maker Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="participeffdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Participant Effective Date (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="participactivitytype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Activity Type (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="participquoteability" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Ability to Quote (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="participregsuspstatus" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Registration Suspended Status (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="participregstartdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Registration Start Date (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="participregenddate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Registration End Date (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mktmechanisma" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Market Mechanism Type A (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mktmechanismb" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Market Mechanism Type B (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="exectypeallowed" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Execution Type Allowed Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="periodrlsdescr" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Period Description (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="quotecloseind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Quotes Close Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="delallordersind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Delete All Orders Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="uncrossingprocessind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Uncrossing Process Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="closingfrozenind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Closing Prices Frozen Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="participantmsgentryind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Participant Message Entry Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pricemonitoringind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Price Monitoring Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pricemonitoringstatictolerance" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Price Monitoring Static Tolerance (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pricemonitoringperiod" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Price Monitoring Period (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="manualbaseprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Manual Base Price (19 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pricemonitoringdynamictolerance" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Price Monitoring Dynamic Tolerance (19 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="marketmechanismtype" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Market Mechanism Type (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="entryallowedind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Entry Allowed Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="deletion_closeallowedind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Delete /Close Allowed Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="p_eratio" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Price/Earnings Ratio (19 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="aggregatebuysize" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Aggregate Buy Size (12 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="aggregatesellsize" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Aggregate Sell Size (12 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="timeweightdavgspread" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Time Weighted Average Spread (19 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="periodlength" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Period Length (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="counterpartys" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Counterparty 1 (11 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="counterparty" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="bargaincondind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Bargain Condition Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="priceconvind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Converted Price Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="uncrossingpriceind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Uncrossing Price Status Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="vwapautmtrades" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Order Book Trades Cumulative VWAP (19 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="maxtradesize" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Maximum Trade Size (12 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="mintradesize" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Minimum Trade Size (12 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="threemthalpha" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Three Month Alpha (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sixmthalpha" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Six Month Alpha (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="oneyralpha" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>One Year Alpha (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="threeyralpha" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Three Year Alpha (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fiveyralpha" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Five Year Alpha (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="threemthbeta" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Three Month Beta (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sixmthbeta" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Six Month Beta (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="oneyrbeta" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>One Year Beta (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="threeyrbeta" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Three Year Beta (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fiveyrbeta" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Five Year Beta (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="aggrrisktradesvolume" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Aggregate Risk Trades Volume (13 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="threemthreturn" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Three Month Return (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="threemthdripreturn" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Three Month DRIP Return (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sixmthreturn" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Six Month Return (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sixmthdripreturn" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Six Month DRIP Return (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="oneyrreturn" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>One Year Return (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="oneyrdripreturn" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>One Year DRIP Return (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="threeyrreturn" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Three Year Return (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="threeyrdripreturn" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Three Year DRIP Return (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fiveyrreturn" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Five Year Return (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fiveyrdripreturn" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Five Year DRIP Return (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="annualisednetyield" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Annualised Net Yield (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="threemthavgvolume" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Three Month Average Volume (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sixmthavgvolume" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Six Month Average Volume (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="oneyravgvolume" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>One Year Average Volume (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="threeyravgvolume" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Three Year Average Volume (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fiveyravgvolume" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Five Year Average Volume (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="threemthcumvolume" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Three Month Cumulative Volume (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sixmthcumvolume" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Six Month Cumulative Volume (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="oneyrcumvolume" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>One Year Cumulative Volume (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="threeyrcumvolume" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Three Year Cumulative Volume (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fiveyrcumvolume" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Five Year Cumulative Volume (18 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bidmarketordersind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Bid Market Orders Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="askmarketordersind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Ask Market Orders Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bestprcmsgind" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Best Price Message Indicator (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="priceformatcode" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Price Format Code (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ticsymbola" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Tradable Instrument Symbol Code Group A (36 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ticsymbolb" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Tradable Instrument Symbol Code Group B (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="registercountry" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Country of Register (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="exdivenddate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Ex-Marker End Date (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="latvolume" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Automatic trade type cumulative volume (26 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lattrades" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Automatic trade type number of trades (26 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="currentamntshrss" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Current Number of Shares (12 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="currentamntshrs" type="xs:float" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="prevamntshrss" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Previous Number of Shares (12 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="prevamntshrs" type="xs:float" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="sellperc" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Sell percentage (7 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="buyperc" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Buy percentage (7 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="buyvolume" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Buy Volume (12 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sellvolume" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Sell Volume (12 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="bidsituation" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>take-over situation (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lathigh" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Automatic trade type high (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="latlow" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Automatic trade type low (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lathitime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Automatic trade type high time (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="latlotime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Automatic trade type low time (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="displaymnemonic" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Display Mnemonic (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="tradableinstrumentname" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Tradable Instrument Name (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="auxlast" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Auxiliary Last (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="auxsize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Auxiliary Size (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="auxtradeid" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Auxiliary Trade ID (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="auxtradetype" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Auxiliary Trade Type (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="auxtradetime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Auxiliary Trade Time (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lat" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Last automatic trade (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="latsize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Last automatic trade size (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctlat" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Percentage change in the latest automatic trade price from the historical close (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="latchg" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Difference between latest autmatic trading price and the most recent non-zero closing value or settlement price (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="sms" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Standard Market Size (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="assetcls" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Asset Class (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="settlementvenue" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Settlement Venue (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="clsbid" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>closing BID (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="clsask" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>closing ASK (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="deliverydate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="deliveryhours" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="deliveryperiod" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="priceindex" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="oicontractvol" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Open Interest Contract Volume (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="hour" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pricehs" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Price per MWh for hour 0-1 (15 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="priceh" type="xs:float" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="priceh3a" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Price per MWh for hour 2-3 (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="priceh3b" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Price per MWh for hour 2-3 if 25 hours traded (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="volhs" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Volume in MWh for hour 0-1 (15 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="volh" type="xs:float" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="volh3a" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Volume in MWh for hour 2-3 (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="volh3b" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Volume in MWh for hour 2-3 (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="gvtbd" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="weblinks" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="weblink" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="alerttime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Time the last limit alert was broken. (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="alertdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Date the last limit alert was broken. (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="alertvalue" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The value when the last alert was broken (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="alerthighs" minOccurs="0">
				<xs:annotation>
					<xs:documentation>First higher limit of alert (10 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="alerthigh" type="xs:float" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="alertlows" minOccurs="0">
				<xs:annotation>
					<xs:documentation>First lower limit of alert (10 chars)</xs:documentation>
				</xs:annotation>
				<xs:complexType>
					<xs:sequence>
						<xs:element name="alertlow" type="xs:float" minOccurs="0" maxOccurs="unbounded"/>
					</xs:sequence>
				</xs:complexType>
			</xs:element>
			<xs:element name="nf" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>News Flag icon - to indicate if news has arrived on selected sources and whteher it has been read (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="newstime" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="newsdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="icbindustry" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Industry ICB Classification (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="icbsupersector" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Supersector ICB Classification (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="icbsector" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Sector ICB Classification (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="icbsubsector" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>SubSectorv ICB Classification (20 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="change" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Change in the latest trade price or value from the historical close (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="midchange" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Mid Change is the difference between the latest Mid price and the Previous close (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="midyield" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The mid-price between the bid yield and ask yield (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pchange" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The previous day's Change (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="latchange" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Last automatic trade change compared to historical close (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="calccount" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> Number of items used in the calculation (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="alertname" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (14 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="underlyingprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Current price of underlying instrument (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="underlyinginstrument" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Underlying instrument (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="currency" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>The currency description in which the instrument is quoted (32 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="underlyingindex" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Underlying Index (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="clsbidpct" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>closing BID % change (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="clsbidnet" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>closing BID netchange (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="clsaskpct" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>closing ASK % change (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="clsasknet" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>closing ASK netchange (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="transactiondate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Transaction Date (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="action" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Transaction type : PURCHASE, SELL (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="quantity" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Number of shares purchased or sold (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="unitprice" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Unit cost per share (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="extracost" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Any extra cost associated with this transaction (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="extracur" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> Extra cost currency (3 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="notes" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Notes about transaction (12 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="holdingvalue" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Current holding value (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pandl" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Profit or Loss statement (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="pctpandl" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="comment" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation>User comment for an instrument (24 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="objectstate" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (6 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="objectstateval" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="rcvd" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="msgtype" type="xs:unsignedLong" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="psettle" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Previous settlement price. The previous official closing price of a futures or option contract set by the clearing house at the end of the trading day (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="fldlstno" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (8 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="time" type="xs:time" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Local market time (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="newsdateall" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="turnoverm" type="xs:float" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (15 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="productversion" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (6 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="macaddress" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (14 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="listeningport" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (5 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="ipaddress" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="hostname" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="osversion" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (16 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="processornb" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (1 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="processorlevel" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="processorrevision" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="memorytotal" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="memoryavail" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (4 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="started" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="description" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (10 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="yellowstrip" type="xs:string" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (25 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="lastupdate" type="xs:date" minOccurs="0">
				<xs:annotation>
					<xs:documentation> (2 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="peaksize" type="xs:integer" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Order Peak Size (9 chars)</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="logos" type="logos" minOccurs="0">
				<xs:annotation>
					<xs:documentation>company Logos</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="urls" type="urls" minOccurs="0">
				<xs:annotation>
					<xs:documentation>company urls</xs:documentation>
				</xs:annotation>
			</xs:element>
			<xs:element name="flags" type="flags" minOccurs="0">
				<xs:annotation>
					<xs:documentation>Currency country flag</xs:documentation>
				</xs:annotation>
			</xs:element>
      <xs:element name="RCHPrice1" type="xs:float" minOccurs="0">
      </xs:element>
      <xs:element name="RCHPrice2" type="xs:float" minOccurs="0">
      </xs:element>
      <xs:element name="RCHPrice3" type="xs:float" minOccurs="0">
      </xs:element>
      <xs:element name="RCHPrice4" type="xs:float" minOccurs="0">
      </xs:element>
      <xs:element name="RCHPrice5" type="xs:float" minOccurs="0">
      </xs:element>
      <xs:element name="RCHPrice6" type="xs:float" minOccurs="0">
      </xs:element>
      <xs:element name="RCHPrice7" type="xs:float" minOccurs="0">
      </xs:element>
      <xs:element name="RCHPrice8" type="xs:float" minOccurs="0">
      </xs:element>
      <xs:element name="RCHPrice9" type="xs:float" minOccurs="0">
      </xs:element>
      <xs:element name="RCHPrice10" type="xs:float" minOccurs="0">
      </xs:element>
    </xs:all>
		<xs:attribute name="symbol" type="xs:string"/>
		<xs:attribute name="ticker" type="xs:string"/>
		<xs:attribute name="status" type="xs:string"/>
	</xs:complexType>
</xs:schema>