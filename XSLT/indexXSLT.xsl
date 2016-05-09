<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <xsl:variable name="interviews" select="collection('../interview_xml_files')"/>


        <html>
            <head> Index </head>

            <body>
                <h1>Index of References</h1>

                <xsl:for-each select="//index/*/*">
                    <xsl:variable name="thisid" select="@xml:id"/>
                    <h2 id="{@xml:id}">
                        <xsl:value-of select="@xml:id"/>
                    </h2>
                    <ul>
                        <xsl:for-each select="./*">
                            <li>
                                <!--   <xsl:value-of select="tokenize(./string(node-name()), '[A-Z]'), ': '"></xsl:value-of>-->

                                <xsl:choose>
                                    <xsl:when test="string(./node-name()) = 'imdb'">
                                        <a href="{.}">
                                            <xsl:value-of select="."/>
                                        </a>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="."/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </li>
                        </xsl:for-each>

                    </ul>
                   <p> <xsl:for-each select="$interviews//epit[@ref = $thisid]">
                       
                            <a href="{document-uri(root(.)) }"> <xsl:value-of select="., ' '"/></a>
                        
                    </xsl:for-each></p>
                </xsl:for-each>


            </body>
        </html>
    </xsl:template>







</xsl:stylesheet>
