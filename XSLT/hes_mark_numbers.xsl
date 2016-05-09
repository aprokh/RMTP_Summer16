<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">

    <xsl:variable name="interviews" select="collection('../interview_xml_files')"/>

    <xsl:template match="/">

        <html>
            <head>hesitation</head>

            <body>
               <h2> Use of Hesitation in the Interviews</h2>
                <ul>
                    <li>
                        <xsl:value-of
                            select="
                                
                                'Total hesitation:',
                                count($interviews//hes),
                                '&#10;'"
                        />
                    </li>
                    <li>
                        <xsl:value-of
                            select="
                                'Lexical hesitation:',
                                count($interviews//hes[@type = 'lex']),
                                '&#10;'"
                        />
                    </li>
                    <li>
                        <xsl:value-of
                            select="
                                'Ellipsis:',
                                count($interviews//hes[@type = 'nonlex']),
                                '&#10;'"
                        />
                    </li>
                </ul>

                <xsl:apply-templates select="$interviews//body"/>
            </body>
        </html>

    </xsl:template>


    <xsl:template match="$interviews//body">
        <xsl:text>Hesitation in </xsl:text>
        <xsl:value-of select="
                //interviewee/@ref,
                ':'"/>
        <xsl:value-of select="count(//hes)"/>
        <ul>

            <li>
                <xsl:text>lexical: </xsl:text>
                <xsl:value-of
                    select="
                        count(//hes[@type = 'lex']),
                        '&#10;'"/>

            </li>

            <li>
                <xsl:text>ellipsis: </xsl:text>
                <xsl:value-of
                    select="
                        count(//hes[@type = 'nonlex']),
                        '&#10;'"/>

            </li>
        </ul>

    </xsl:template>

</xsl:stylesheet>
<!--&#10;  new line
&#09;  tab
-->
