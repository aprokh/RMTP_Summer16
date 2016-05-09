<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">
    <xsl:variable name="interviews" select="collection('../interview_xml_files')"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Use of Pronouns in the Interviews</title>
                
            </head>
            <body>
                <h2>Use of Pronouns in the Interviews</h2>
                <h2>Use of Elements Referring to a Community of a Nation</h2>
                <ul>
                    <li>
                        <xsl:value-of
                            select="
                                'Total pronouns:',
                                count($interviews//pron),
                                '&#10;'"
                        />
                    </li>
                    <li>
                        <xsl:value-of
                            select="
                                'Personal pronouns:',
                                count($interviews//pron[@type = 'pers']),
                                '&#10;'"
                        />
                    </li>
                    <li>
                        <xsl:value-of
                            select="
                                'Possessive pronouns:',
                                count($interviews//pron[@type = 'poss']),
                                '&#10;'"
                        />
                    </li>
                    <li>
                        <xsl:value-of
                            select="
                                'Possessive pronouns singular:',
                                count($interviews//pron[@type = 'poss'][@number = 'sing']),
                                '&#10;'"
                        />
                    </li>
                    <li>
                        <xsl:value-of
                            select="
                                'Personal pronouns singular:',
                                count($interviews//pron[@type = 'pers'][@number = 'sing']),
                                '&#10;'"
                        />
                    </li>
                    <li>
                        <xsl:value-of
                            select="
                                'Possessive pronouns plural:',
                                count($interviews//pron[@type = 'poss'][@number = 'plur']),
                                '&#10;'"
                        />
                    </li>
                    <li>
                        <xsl:value-of
                            select="
                                'Personal pronouns plural:',
                                count($interviews//pron[@type = 'pers'][@number = 'plur']),
                                '&#10;'"
                        />
                    </li>
                </ul>
                <xsl:apply-templates select="$interviews//body"/>

            </body>
        </html>
    </xsl:template>


    <xsl:template match="$interviews//body">
        <ul>
            <xsl:text>Number of pronouns in </xsl:text>
            <xsl:value-of select="
                    //interviewee/@ref,
                    ':'"/>
            <xsl:value-of select="
                    count(//pron),
                    '&#10;'"/>
            <li>
                <xsl:text>Possessive Plural: </xsl:text>
                <xsl:value-of
                    select="
                        count(//pron[@type = 'poss'][@number = 'plur']),
                        '&#10;'"
                />
            </li>
            <li>
                <xsl:text>Personal Plural: </xsl:text>
                <xsl:value-of
                    select="
                        count(//pron[@type = 'pers'][@number = 'plur']),
                        '&#10;'"
                />
            </li>
            <li>
                <xsl:text>Possessive Singular: </xsl:text>
                <xsl:value-of
                    select="
                    count(//pron[@type = 'poss'][@number = 'sing']),
                    '&#10;'"
                />
            </li>
            <li>
                <xsl:text>Personal Singular: </xsl:text>
                <xsl:value-of
                    select="
                    count(//pron[@type = 'pers'][@number = 'sing']),
                    '&#10;'"
                />
            </li>
            
            <li>
                <xsl:text>Elements Referring to a Community of a Nation: </xsl:text>
                <xsl:value-of
                    select="
                    count(//collective),
                    '&#10;'"
                />
            </li>
        </ul>

    </xsl:template>



</xsl:stylesheet>
