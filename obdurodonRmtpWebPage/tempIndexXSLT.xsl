<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">

    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="interviews" select="collection('xml_nonTEI')"/>
    <xsl:template match="/">
        


        <html>
            <head><title>Index of References</title>
                <script type="text/javascript" src="analysisParagraphToggle.js">/**/</script>
                <link rel="stylesheet" type="text/css" href="/css/style.css" /></head>

            <body>
                <xsl:comment>#include virtual="/inc/menuSSI.xhtml"</xsl:comment>
                <h1>Index of References</h1>
                <ul>
                    <li><a href="#metapersons">Metapersons</a></li>
                    <li><a href="#persons">Persons</a></li>
                    <li><a href="#titles">Film Titles</a></li>
                    <li><a href="#genres">Genres</a></li>
                    <li><a href="#places">Places</a></li>
                    <li><a href="#nationalCinemas">National Cinemas</a></li>
                </ul>
                <xsl:for-each select="index/*">
                    <h2 id="{node-name()}"><xsl:value-of select="node-name()"/></h2> 
                    <ul id="{node-name()}Toggle">
                        <xsl:apply-templates select="*"/>
                    </ul>
                </xsl:for-each>


            </body>
        </html>
    </xsl:template>

    <xsl:template match="person|place|title|genre|nationalCinema">
            <xsl:variable name="thisid" select="@xml:id"/>
            <li><h3 id="{@xml:id}">
                <xsl:value-of select="@xml:id"/>
            </h3>
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
<!--                       wild function soup to take node name, capitalize first letter, split on spaces         -->
                                <xsl:variable name="name" select="concat(upper-case(substring(string(node-name()), 1 , 1)), string-join(replace(substring(string(node-name()), 2), '([A-Z])', ' $1')))"/>
                                <xsl:value-of select="concat($name, ':'), ."/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </li>
                </xsl:for-each>
                
            </ul>
            <p>
                <xsl:for-each select="$interviews//epit[@ref = $thisid]">
                    <a href="/xhtml/interviews/{tokenize(tokenize(document-uri(root(.)), 'xml_nonTEI/')[2], '.xml')[1]}.xhtml">
                        <xsl:value-of
                            select="
                            normalize-space(.),
                            ''"
                        />
                    </a>
                </xsl:for-each>
            </p></li>
        
        
    </xsl:template>






</xsl:stylesheet>
