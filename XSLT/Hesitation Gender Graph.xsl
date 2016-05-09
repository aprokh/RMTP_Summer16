<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg" version="2.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:variable name="interviews" select="collection('../interview_xml_files')"/>
    <xsl:variable name="index" select="document('../index.xml')"/>
    <xsl:variable name="scale" select="3" as="xs:integer"/>

    <xsl:template match="/">


        <svg>
            <g transform="translate(80, 400)">


                <line x1="0" y1="0" x2="500" y2="0" stroke="black" stroke-width="2px"/>

                <line x1="0" y1="0" x2="0" y2="-200" stroke="black" stroke-width="2px"/>

                <!-- tick marks for the y axis-->
                <xsl:for-each select="1 to 10">
                    <xsl:variable name="yPosition" select=". * -10"/>

                    <line x1="-3" y1="{$yPosition}" x2="3" y2="{$yPosition}" stroke="black"
                        stroke-width="2"/>
                    <!--    create the label-->

                </xsl:for-each>

                <text x="-50" y="-100" stroke="black" stroke-width="1" font-family="arial"
                     font-weight="normal" fill="black"> 100% </text>

                <!-- Text for the graph               -->
                <text x="30" y="-250" stroke="black" stroke-width="1" font-family="arial"
                     font-weight="bold" fill="black"> Use of Hesitation Marks in
                    Interviews by Gender (%) </text>

                <text x="30" y="-230" stroke="black" stroke-width="1" font-family="arial"
                     font-weight="normal" fill="black"> Red represents female
                    interviewees and blue represents male interviewees. </text>
                <text x="30" y="-210" stroke="black" stroke-width="1" font-family="arial"
                     font-weight="normal" fill="black"> Interviews are weighted. </text>
                
                <!-- the x axis text: -->
                <text
                    x="45"
                    y="35" stroke="black" stroke-width="1" font-family="arial"  font-weight="normal" fill="black"
                    >
                    Total
                </text>
                
                <!--  labels for the calculated percentage: Total: Use of all hes marks by women and men            -->
                
                <text
                    x="30"
                    y="-110" stroke="black" stroke-width="1" font-family="arial"  font-weight="normal" fill="black"
                    >
                    F:59%/M:41%
                </text>
            
                <!--  labels for the calculated percentage: Lex hes marks           -->
                <text
                    x="170"
                    y="35" stroke="black" stroke-width="1" font-family="arial" font-weight="normal" fill="black"
                    >
                    Lexical hes marks
                </text>
                
          
                <text
                    x="190"
                    y="-110" stroke="black" stroke-width="1" font-family="arial"  font-weight="normal" fill="black"
                    >
                    F:52%/M:48%
                </text>
             
                <!--  labels for the calculated percentage: Non lex marks          -->  
                <text
                    x="330"
                    y="35" stroke="black" stroke-width="1" font-family="arial"  font-weight="normal" fill="black"
                    >
                    Non-lexical hes marks
                </text>
                  
                <text
                    x="350"
                    y="-110" stroke="black" stroke-width="1" font-family="arial"  font-weight="normal" fill="black"
                    >
                    F:66%/M:34%
                </text>
                

                <!--             Use of all hes marks by women-->
                <rect x="30" y="-100" height="100" width="90" fill="red" stroke="black"
                    stroke-width="1"/>

                <!--             Use of all hes marks by men-->
                <rect x="30"
                    y="-{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//hes) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//hes))*200}"
                    height="{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//hes) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//hes))*200}"
                    width="90" fill="blue"/>

                <!--             Use of all hes lex marks by women-->
                <rect x="190" y="-100" height="100" width="90" fill="red" stroke="black"
                    stroke-width="1"/>

                <!--             Use of all hes lex marks by men-->
                <rect x="190"
                    y="-{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//hes[@type='lex']) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//hes[@type='lex']))*200}"
                    height="{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//hes[@type='lex']) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//hes[@type='lex']))*200}"
                    width="90" fill="blue"/>

                <!--             Use of all hes non-lex marks by women-->
                <rect x="350" y="-100" height="100" width="90" fill="red" stroke="black"
                    stroke-width="1"/>

                <!--             Use of all hes non-lex marks by men-->
                <rect x="350"
                    y="-{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//hes[@type='nonlex']) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//hes[@type='nonlex']))*200}"
                    height="{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//hes[@type='nonlex']) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//hes[@type='nonlex']))*200}"
                    width="90" fill="blue"/>




            </g>
        </svg>

    </xsl:template>
</xsl:stylesheet>
