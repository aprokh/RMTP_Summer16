<?xml version="1.0" encoding="UTF-8"?>

<!--

To convert old RMTP custom markup to TEI markup. Currently just
looking to convert each element from an RMTP custom name to a TEI 
conformant element. 

-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0"
    xmlns="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <TEI><xsl:apply-templates/></TEI>
    </xsl:template>
    
<!--  Convert metadata section to TEI header  -->
    <xsl:template match="meta">
        
        <!--
            What needs filled in:
            
            titleStmt/title : description of title
            publicationStmt/p : description of where to be published
            sourceDesc/p : link to where transcripts are located / gathered
            
        -->
        <teiHeader>
            <fileDesc>
                <titleStmt>
<!--        Function: gets filename, strips path from beginning and .xml extension from end            -->
<!--        Note: Full name is not provided in original markup in English, so will need to be added after
                    running transformation to match rmpt_tei_header_TEST.xml template-->
                    <title>Interview with <xsl:value-of select="substring-before(substring-after(base-uri(), 'xml/'), '.')"/>: electronic version</title>
                    <xsl:apply-templates select="persons/*"/>
                    <respStmt>
                        <resp>TEI Markup done by </resp>
                        <name ref="nitz">ANDREW NITZ</name>
                        <name ref="prokhorova">ELENA PROKHOROVA</name>
                    </respStmt>
                </titleStmt>
                <publicationStmt>
                    <publisher>College of William and Mary</publisher>
                    <pubPlace>Williamsburg, Virginia</pubPlace>
                    <date type="interview"></date>
                    <p>To be published on the RMTP website at http://rmtp.obdurodon.org</p>
                </publicationStmt>
                <sourceDesc>
                    <p>Original transcriptions gathered by {fill in}</p>
                </sourceDesc>
            </fileDesc>
            <!--<encodingDesc/>
            <profileDesc/>
            <xenoData/>-->
            <revisionDesc>
                <change>This will need much more elaborate description</change>
            </revisionDesc>
        </teiHeader>
    </xsl:template>
    
    <!-- Rule to handle persons inside titleStmt tag. Note: full names are not
    available in source .xml as they are specified in rmpt_tei_header_TEST.xml.
    Will either need to be added post-transformation, or taken from index file.-->
    
    <xsl:template match="persons/*">
        <xsl:choose>
            <xsl:when test="name(.) = 'interviewee'">
                <author>
                    <name ref="{./@ref}">NAME</name>
                </author>
            </xsl:when>
            <xsl:otherwise>
                <editor role="{./node-name()}">
                    <name ref="{./@ref}">NAME</name>
                </editor>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
<!--  Structural tags: body to div, speech to something  -->
    <xsl:template match="body">
        <text>
            <body>
                <xsl:apply-templates/>
            </body>
        </text>
    </xsl:template>
    <xsl:template match="speech">
        <!--<sp xml:id="sp{count(preceding::speech) + 1}">
            <speaker>
                <xsl:value-of select="@speaker"/>
            </speaker>
            
        </sp>-->
<!--   Switch to <u> with @speaker and give the xml:id     -->
        <u xml:id="sp{count(preceding::speech) + 1}" who='{@speaker}'>
                <xsl:apply-templates/>
        </u>
    </xsl:template>
<!--  Conversion of references to <rs> tag  -->
<!--  Conversion of   -->
    
    <xsl:template match="title | person | place | genre | nationalCinema | epit">
        <rs type="{node-name()}" key="{@ref}">
            <xsl:apply-templates/>
        </rs>
        
    </xsl:template>
</xsl:stylesheet>