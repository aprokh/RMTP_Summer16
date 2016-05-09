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
                <line x1="0" y1="0" x2="1000" y2="0" stroke="black" stroke-width="2px"/>
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
                    width="90" 
                    fill="red"
                    stroke="black"
                    stroke-width="1"/>

<!--  Use of pronouns by male interviewees. Weighted by 200              -->
                <rect 
                    x="30"
                    y="-{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//pron) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//pron))*200}"
                    height="{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//pron) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//pron))*200}"
                    width="90" 
                    fill="blue"/>
 
<!--Use of plural pronouns by female interviewees.-->
                <rect 
                    x="200"
                    y= "-100"
                    height= "100"
                    width="90" 
                    fill="red"
                    stroke="black"
                    stroke-width="1"/>
 
    <!--  Use of plural pronouns by male interviewees. Weighted by 200              -->
                <rect 
                    x="200"
                    y="-{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//pron[@number='plur']) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//pron[@number='plur']))*200}"
                    height="{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//pron[@number='plur']) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//pron[@number='plur']))*200}"
                    width="90" 
                    fill="blue"/>
                
                
                <rect 
                    x="370"
                    y= "-100"
                    height= "100"
                    width="90" 
                    fill="red"
                    stroke="black"
                    stroke-width="1"/>
                
                <rect 
                    x="370"
                    y="-{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//pron[@number='plur'][@type='poss']) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//pron[@number='plur'][@type='poss']))*200}"
                    height="{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//pron[@number='plur'][@type='poss']) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//pron[@number='plur'][@type='poss']))*200}"
                    width="90" 
                    fill="blue"/>
    
<!--    Below: Use of plural personal pronouns by gender-->
                <rect 
                    x="540"
                    y= "-100"
                    height= "100"
                    width="90" 
                    fill="red"
                    stroke="black"
                    stroke-width="1"/>
                
                <rect 
                    x="540"
                    y="-{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//pron[@number='plur'][@type='pers']) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//pron[@number='plur'][@type='pers']))*200}"
                    height="{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//pron[@number='plur'][@type='pers']) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//pron[@number='plur'][@type='pers']))*200}"
                    width="90" 
                    fill="blue"/>
                
                <rect
                    x="710"
                    y= "-100"
                    height= "100"
                    width="90" 
                    fill="red"
                    stroke="black"
                    stroke-width="1"/>
                    
                <rect 
                    x="710"
                    y="-{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//pron[@number='sing'][@type='poss']) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//pron[@number='sing'][@type='poss']))*200}"
                    height="{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//pron[@number='sing'][@type='poss']) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//pron[@number='sing'][@type='poss']))*200}"
                    width="90" 
                    fill="blue"/>
                
                <rect
                    x="880"
                    y= "-100"
                    height= "100"
                    width="90" 
                    fill="red"
                    stroke="black"
                    stroke-width="1"/>
                
               <rect 
                    x="880"
                    y="-{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//pron[@number='sing'][@type='pers']) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//pron[@number='sing'][@type='pers']))*200}"
                    height="{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//pron[@number='sing'][@type='pers']) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//pron[@number='sing'][@type='pers']))*200}"
                    width="90" 
                    fill="blue"/>
                
                
                
<!-- Text for the graph               -->
                <text
                    x="30"
                    y="-250" stroke="black" stroke-width="1"
                    >
                    Use of Pronouns in Interviews by Gender (%)
                    
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
                    F:62%/M:38%
                </text>
                

                <text
                    x="200"
                    y="40" stroke="black" stroke-width="1"
                    >
                    Plural
                </text>

<!--  labels for the calculated percentage: Plural           -->
                <text
                    x="200"
                    y="-110" stroke="black" stroke-width="1"
                    >
                    F:73%/M:27%
                </text>
                
                
                <text
                    x="370"
                    y="40" stroke="black" stroke-width="1"
                    >
                    Plur, Poss
                </text>
    
<!--  labels for the calculated percentage: Plural, Possessive          -->    
                
                <text
                    x="370"
                    y="-110" stroke="black" stroke-width="1"
                    >
                    F:71%/M:29%
                </text>
                
                
                
                <text
                    x="540"
                    y="40" stroke="black" stroke-width="1"
                    >
                    Plur, Pers
                </text>
                
<!--  labels for the calculated percentage: Plural, Personal          --> 
   
                <text
                    x="540"
                    y="-110" stroke="black" stroke-width="1"
                    >
                    F:73%/M:27%
                </text>
   

                <text
                    x="710"
                    y="40" stroke="black" stroke-width="1"
                    >
                    Sing, Poss
                </text>

<!--  labels for the calculated percentage: Singular, Possessive          -->   
                <text
                    x="710"
                    y="-110" stroke="black" stroke-width="1"
                    >
                    F:52%/M:48%
                </text>
                
                
                <text
                    x="880"
                    y="40" stroke="black" stroke-width="1"
                    >
                    Sing, Pers
                </text>

 
 <!--  labels for the calculated percentage: Singular, Personal          -->
                <text
                    x="880"
                    y="-110" stroke="black" stroke-width="1"
                    >
                    F:58%/M:42%
                </text>             
               
                    

            </g>


        </svg>


    </xsl:template>

</xsl:stylesheet>
