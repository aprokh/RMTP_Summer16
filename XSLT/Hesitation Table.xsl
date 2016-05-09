<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">
    
    <xsl:variable name="interviews" select="collection('../interview_xml_files')"/>
    
    <xsl:template match="/">
        
        <html>
            <head>hesitation</head>
            
            <body>
                <h2> Hesitation Count</h2>
                
                <table border="1" style="width:100%">
                    <th>Interviewee</th>
                    <th>Lexical</th>
                    <th>Ellipsis</th>
                    <th>Total</th>
                    
                    <xsl:apply-templates select="//$interviews//body"/>
                </table>
                <br></br>
             
            </body>
        </html>
        
    </xsl:template>
    <xsl:template match="$interviews//body">
    
    <tr>
        <td><xsl:value-of select="
            //interviewee/@ref"/></td>
        <td><xsl:value-of select="
            count(//hes[@type = 'lex'])"/></td>
        <td><xsl:value-of
            select="
            count(//hes[@type = 'nonlex'])
            "/></td>
        <td>  <xsl:value-of
            select="
            count(//hes)"/></td>
    </tr>
    
    </xsl:template>
   
    
</xsl:stylesheet>