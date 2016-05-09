<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg" 
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="barwidth" select="20" as="xs:integer"/>
    <xsl:variable name="space" select="10" as="xs:integer"/>
    <xsl:variable name="interviews" select="collection('../interview_xml_files')"/>
    <xsl:variable name="scale" select="5" as="xs:integer"/>
    
    <xsl:template match="/">
        
        <svg>
            
            <g transform="translate(50, 400)">
                
               
                    <line x1="0" y1="0" x2="400" y2="0" stroke="black" stroke-width="2px"/>
                    <line x1="0" y1="0" x2="0" y2="-280" stroke="black" stroke-width="2px"/>  
               
               <xsl:apply-templates select="$interviews//body"/>
                  
            </g>
            </svg>
                
                
          
        </xsl:template>
    
    <xsl:template match="//body">
        <xsl:variable name="possPlur" select="count(.//pron[@type='poss'][@number='plur'])"/>
        <rect
            x="{position()*$barwidth + $space}"
            y="-{$scale*$possPlur}"
            height="{$scale*$possPlur}"
            width="15"
            fill="red"
            />
        
        
        
        
    </xsl:template>
    
    
    
</xsl:stylesheet>