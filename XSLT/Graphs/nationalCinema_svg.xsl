<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="interviews" select="collection('../interview_xml_files')"/>
    <xsl:variable name="index" select="document('../index.xml')"/>
 <!--   <xsl:variable name="scale" select="3" as="xs:integer"/>-->
    
    <xsl:template match="/">
        
        
        <svg>
            <g transform="translate(160, 550)">
                <!--Below is the x axis-->
                <line x1="0" y1="0" x2="800" y2="0" stroke="black" stroke-width="2px"/>
                <!--                the y axis-->
                <line x1="0" y1="0" x2="0" y2="-450" stroke="black" stroke-width="2px"/>
                
                <!-- tick marks for the y axis-->
                <xsl:for-each select="1 to 25">
                    <xsl:variable name="xPosition" select=". * 30"/>
                    
                    <line y1="-3" x1="{$xPosition}" y2="3" x2="{$xPosition}" stroke="black"
                        stroke-width="2"/>
                    <!--    create the lable-->
                    </xsl:for-each>   
                
             <!--   <rect 
                    x="30"
                    y= "-100"
                    height= "100"
                    width="400" 
                    fill="red"
                    stroke="black"
                    stroke-width="1"/>-->
                
      
                
                <rect 
                    x="0"
                    y="-430"
                    height="20"
                    width="{(count($interviews//nationalCinema[@ref='americanCinema']) div count($interviews//nationalCinema))*3000}" 
                    fill="blue"/>
                
                <rect 
                    x="0"
                    y="-390"
                    height="20"
                    width="{(count($interviews//nationalCinema[@ref='sovietCinema']) div count($interviews//nationalCinema))*3000}" 
                    fill="red"/>
                
                <rect 
                    x="0"
                    y="-350"
                    height="20"
                    width="{(count($interviews//nationalCinema[@ref='russianCinema']) div count($interviews//nationalCinema))*3000}" 
                    fill="pink"/>
                
                <rect 
                    x="0"
                    y="-310"
                    height="20"
                    width="{(count($interviews//nationalCinema[@ref='ourCinema']) div count($interviews//nationalCinema))*3000}" 
                    fill="crimson"/>
                
                <rect 
                    x="0"
                    y="-270"
                    height="20"
                    width="{(count($interviews//nationalCinema[@ref='frenchCinema']) div count($interviews//nationalCinema))*3000}" 
                    fill="purple"/>
                
                <rect 
                    x="0"
                    y="-230"
                    height="20"
                    width="{(count($interviews//nationalCinema[@ref='italianCinema']) div count($interviews//nationalCinema))*3000}" 
                    fill="green"/>
           
                
                <rect 
                    x="0"
                    y="-190"
                    height="20"
                    width="{(count($interviews//nationalCinema[@ref='europeanCinema']) div count($interviews//nationalCinema))*3000}" 
                    fill="#adcbe3"/>
                
                <rect 
                    x="0"
                    y="-150"
                    height="20"
                    width="{(count($interviews//nationalCinema[@ref='indianCinema']) div count($interviews//nationalCinema))*3000}" 
                    fill="orange"/>
                
                <rect 
                    x="0"
                    y="-110"
                    height="20"
                    width="{(count($interviews//nationalCinema[@ref='germanCinema']) div count($interviews//nationalCinema))*3000}" 
                    fill="#c39797"/>
                
              <!--  <rect 
                    x="0"
                    y="-70"
                    height="20"
                    width="{(count($interviews//nationalCinema[@ref='koreanCinema']) div count($interviews//nationalCinema))*1000}" 
                    fill="#00ced1"/>-->
                
                <rect 
                    x="0"
                    y="-70"
                    height="20"
                    width="{(count($interviews//nationalCinema[@ref='foreignCinema']) div count($interviews//nationalCinema))*3000}" 
                    fill="#00ced1"/>
                
              <!--  <rect 
                    x="0"
                    y="-30"
                    height="20"
                    width="{(count($interviews//nationalCinema[@ref='japaneseCinema']) div count($interviews//nationalCinema))*1000}" 
                    fill="#adcbe3"/>-->
                
                <rect 
                    x="0"
                    y="-30"
                    height="20"
                    width="170" 
                    fill="#8b7d6b"/>
                
                <text
                    x="-100"
                    y="-420"
                    stroke="black"
                    stroke-width="1px">American</text>
                
                <text
                    x="-100"
                    y="-380"
                    stroke="black"
                    stroke-width="1px">Soviet</text>
                
                <text
                    x="-100"
                    y="-340"
                    stroke="black"
                    stroke-width="1px">Russian</text>
                
                
                <text
                    x="-100"
                    y="-300"
                    stroke="black"
                    stroke-width="1px">"Our"/Sov/Rus</text>
                
                <text
                    x="-100"
                    y="-260"
                    stroke="black"
                    stroke-width="1px">French</text>
                
                <text
                    x="-100"
                    y="-220"
                    stroke="black"
                    stroke-width="1px">Italian</text>
                
                <text
                    x="-100"
                    y="-180"
                    stroke="black"
                    stroke-width="1px">European</text>
                
                <text
                    x="-100"
                    y="-140"
                    stroke="black"
                    stroke-width="1px">Indian</text>
                
                <text
                    x="-100"
                    y="-100"
                    stroke="black"
                    stroke-width="1px">German</text>
                
                <text
                    x="-100"
                    y="-60"
                    stroke="black"
                    stroke-width="1px">Foreign</text>
                
                
                <text
                    x="-100"
                    y="-20"
                    stroke="black"
                    stroke-width="1px">Other</text>
                
                <text
                    x="700"
                    y="-420"
                    stroke="black"
                    stroke-width="1px">
                    20%
                </text>
                
                <text
                    x="700"
                    y="-390"
                    stroke="black"
                    stroke-width="1px">
                    11%
                </text>
                
                <text
                    x="700"
                    y="-350"
                    stroke="black"
                    stroke-width="1px">
                    9%
                </text>
                
                <text
                    x="700"
                    y="-310"
                    stroke="black"
                    stroke-width="1px">
                    1,5%
                </text>
                
                <text
                    x="700"
                    y="-270"
                    stroke="black"
                    stroke-width="1px">
                    12%
                </text>
                
                <text
                    x="700"
                    y="-230"
                    stroke="black"
                    stroke-width="1px">
                    7%
                </text>
                
                <text
                    x="700"
                    y="-190"
                    stroke="black"
                    stroke-width="1px">
                    6%
                </text>
                
                <text
                    x="700"
                    y="-150"
                    stroke="black"
                    stroke-width="1px">
                    3%
                </text>
                
                <text
                    x="700"
                    y="-110"
                    stroke="black"
                    stroke-width="1px">
                    3%
                </text>
                
                <text
                    x="700"
                    y="-70"
                    stroke="black"
                    stroke-width="1px">
                    10%
                </text>
                
                <text
                    x="700"
                    y="-30"
                    stroke="black"
                    stroke-width="1px">
                    17,5%
                </text>
                
                <text
                    x="200"
                    y="-490"
                    stroke="black"
                    stroke-width="1px">
                    References to National Cinemas in Interviews: Percent of Total References
                </text>
                
                
                
                
                
                
                
              
                
            </g>
            
            
        </svg>
        
        
    </xsl:template>
    
</xsl:stylesheet>
