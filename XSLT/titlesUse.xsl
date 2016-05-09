<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">
    <xsl:variable name="interviews" select="collection('../interview_xml_files')"/>
<<<<<<< HEAD
=======

>>>>>>> origin/master
    <xsl:variable name="index" select="document('../index.xml')"/>
    <xsl:template match="/">

        <!--    Works with counts across the board with all interviews at once    -->

        <html>
            <head/>

            <body>

<<<<<<< HEAD
                <p><xsl:value-of
                    select="
                        'Total Titles Cited by Interviewees:',
                        count($interviews//distinct-values(title/@ref)),
                        '&#10;'"/></p>
                <hr/>   
=======
                <p>
                    <xsl:value-of
                        select="
                            'Total Titles Cited by Interviewees:',
                            count($interviews//distinct-values(title)),
                            '&#10;'"
                    />
                </p>
                <hr/>

>>>>>>> origin/master
                <xsl:apply-templates select="$interviews//body"/>


            </body>

        </html>

    </xsl:template>


    <!--    Works at the context of individual documents by processing one body at a time.   -->
    <xsl:template match="$interviews//body">

        <xsl:variable name="interviewee" select="//interviewee/@ref"/>

        <xsl:value-of
            select="
            'Count and List of Titles Mentioned by',
            $index//person[@xml:id = $interviewee]/forename,
            $index//person[@xml:id = $interviewee]/surnameEng"
        />
       <!-- <xsl:for-each select="distinct-values(title)"><xsl:apply-templates></xsl:apply-templates></xsl:for-each>-->

        <ul>
<<<<<<< HEAD
            <xsl:value-of select="count(distinct-values(//title/@ref))"/>
            <br/>
            
            <!--<xsl:apply-templates select="distinct-values(//title/@ref)" />-->
            <xsl:for-each select="//title/@ref[not(preceding::title/@ref = .)]">
                <xsl:variable name="ref" select="."/>
                <li><xsl:value-of select="$index//title[@xml:id = $ref]/fullTitle"/></li>
            </xsl:for-each>
=======
            <xsl:value-of select="count(//title)"/>
         
            <br/>

            <xsl:apply-templates select="//title"/>
>>>>>>> origin/master
        </ul>

    </xsl:template>

    <xsl:template match="//title">
        <li>
          <xsl:apply-templates/>
        </li>
    </xsl:template>

</xsl:stylesheet>
