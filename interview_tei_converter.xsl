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
        <teiHeader>
<!--      Need proper tag for project and university      -->
            <xsl:apply-templates select="project"/>
            <xsl:apply-templates select="university"/>
            <list>
                <xsl:apply-templates select="persons/*"/>
            </list>
        </teiHeader>
    </xsl:template>
    <xsl:template match="persons/*">
        <rs type="{node-name()}" key="{@ref}"/>
    </xsl:template>
<!--  Structural tags: body to div, speech to something  -->
    <xsl:template match="body">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="speech">
        <sp xml:id="sp{count(preceding::speech) + 1}">
            <speaker>
                <xsl:value-of select="@speaker"/>
            </speaker>
            <p>
                <xsl:apply-templates/>
            </p>
        </sp>
    </xsl:template>
<!--  Conversion of references to <rs> tag  -->
<!--  Conversion of   -->
    
    <xsl:template match="title | person | place | genre | nationalCinema | epit">
        <rs type="{node-name()}" key="{@ref}"/>
    </xsl:template>
</xsl:stylesheet>