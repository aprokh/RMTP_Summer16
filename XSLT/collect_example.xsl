<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:variable name="interviews" select="collection('../interview_xml_files')"/>
    
    <xsl:template match="/">

<!--    Works with counts across the board with all interviews at once    -->
        <xsl:value-of select="'Total pronouns:', count($interviews//pron), '&#10;'"/>
        <xsl:value-of select="'Personal pronouns:', count($interviews//pron[@type='pers']), '&#10;'"/>
        <xsl:value-of select="'Possessive pronouns:', count($interviews//pron[@type='poss']), '&#10;'"/>
        
        <xsl:apply-templates select="$interviews//body"/>

    </xsl:template>
<!--    Works at the context of individual documents by processing one body at a time.   -->
    <xsl:template match="$interviews//body">
        <xsl:text>Number of pronouns in </xsl:text>
        <xsl:value-of select="//interviewee/@ref, ':'"/>
<!--    Works with both a local count and then a global count. Note that to do a global count, need to specify 
        again that we are starting at $interviews-->
        <xsl:value-of select="count(//pron) div count($interviews//pron) * 100,  '&#10;'"/>
    </xsl:template>
</xsl:stylesheet>
<!--&#10;  new line
&#09;  tab
-->