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

<!--Below is the x axis-->
                <line x1="0" y1="0" x2="500" y2="0" stroke="black" stroke-width="2px"/>
<!--                the y axis-->
                <line x1="0" y1="0" x2="0" y2="-200" stroke="black" stroke-width="2px"/>

<!-- tick marks for the y axis-->
                <xsl:for-each select="1 to 10">
                    <xsl:variable name="yPosition" select=". * -10"/>
                    
                    <line x1="-3" y1="{$yPosition}" x2="3" y2="{$yPosition}" stroke="black"
                        stroke-width="2"/>
                    <!--    create the lable-->
                    
                </xsl:for-each>
                
                <text
                    x="-50"
                    y="-100" stroke="black" stroke-width="1"
                    >
                    100%
                </text>
                
                
                
<!-- BAR GRAPHS              -->

<!--Use of pronouns by female interviewees.-->
                <rect 
                    x="30"
                    y= "-100"
                    height= "100"
                    width="150" 
                    fill="red"
                    stroke="black"
                    stroke-width="1"/>

<!--  Use of pronouns by male interviewees. Weighted by 200              -->
                <rect 
                    x="30"
                    y="-{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//collective) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//collective))*200}"
                    height="{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//collective) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//collective))*200}"
                    width="150" 
                    fill="blue"/>
 

                
                
<!-- Text for the graph               -->
                <text
                    x="30"
                    y="-250" stroke="black" stroke-width="1"
                    >
                    Use of References to Community as a National Community in Interviews by Gender (%)
                    
                </text>
                
                <text
                    x="30"
                    y="-230" stroke="black" stroke-width="1"
                    >
                    Red represents female interviewees and blue represents male interviewees.
                    Interviews are weighted.
                </text>
 
<!-- the x axis text: -->
                <text
                x="30"
                y="40" stroke="black" stroke-width="1"
                >
                    Total
                </text>
 
<!--  labels for the calculated percentage: Total            -->
                
                <text
                    x="30"
                    y="-110" stroke="black" stroke-width="1"
                    >
                    F:76%/M:24%
                </text>
                

    
            
                            

            </g>


        </svg>


    </xsl:template>

</xsl:stylesheet>
