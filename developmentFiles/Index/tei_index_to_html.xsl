<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>

        <html>
            <head>
                <title>Index </title>
                <script type="text/javascript" src="analysisParagraphToggle.js">/**/</script>
                <link rel="stylesheet" type="text/css" href="../css/style.css"/>
            </head>

            <body>
                <xsl:comment>#include virtual="/inc/menuSSIInterview.html"</xsl:comment>
                <h1>Index of References</h1>
                <ul>
                    <li>
                        <a href="#metaPersons">Metapersons</a>
                    </li>

                    <li>
                        <a href="#persons">Persons</a>
                    </li>

                    <li>
                        <a href="#titles">Film Titles</a>
                    </li>

                    <li>
                        <a href="#genres">Genres</a>
                    </li>

                    <li>
                        <a href="#places">Places</a>
                    </li>

                    <li>
                        <a href="#nationalCinemas">National Cinemas</a>
                    </li>
                </ul>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <!--  Void template to ignore teiHeader  -->
    <xsl:template match="teiHeader"/>

    <xsl:template match="div">
        <h2 id="{@type}"/>
        <ul id="{@type}Toggle">
            <xsl:apply-templates/>
        </ul>
    </xsl:template>

    <!--  Template for dealing with meta persons  -->

    <xsl:template match="div[@type = 'metaPersons']//person">
        <li>
            <h3>
                <xsl:value-of
                    select="concat(persName[@type = 'eng']/surname, ', ', persName[@type = 'eng']/forename)"
                />
            </h3>
            <ul>
                <li>Gender: <xsl:value-of select="upper-case(@sex)"/></li>
                <xsl:choose>
                    <xsl:when test="@age = 'postSov'">
                        <li>Viewer Age: Post Soviet</li>
                    </xsl:when>
                    <xsl:when test="@age = 'sov'">
                        <li>Viewer Age: Soviet</li>
                    </xsl:when>
                    <xsl:otherwise/>
                </xsl:choose>
                <xsl:if test="not(@age)">
                    <li>Student Interviewer</li>
                </xsl:if>
            </ul>
        </li>
    </xsl:template>

    <!--  Template for dealing with person references  -->
    <xsl:template match="div[@type = 'persons']//person">
        <li><h3>
            <xsl:value-of select="concat(persName/surname, ', ', persName/forename)"/>
        </h3>
        <ul><li>Role: <xsl:value-of
                select="concat(upper-case(substring(@role, 1, 1)), substring(@role, 2))"/></li>
        <li>Gender: <xsl:value-of select="upper-case(@sex)"/></li>
        <li>Nationality: <xsl:value-of select="nationality"/></li></ul></li>
    </xsl:template>

    <!--  template for titles  -->

    <xsl:template match="list[@type = 'titles']/item">
        <li><h3>
            <xsl:apply-templates select="title[@type = 'eng']"/>
        </h3>
        <ul><li>Director: <xsl:value-of select=".//persName"/></li>
        <li>Medium: <xsl:value-of select=".//desc[preceding-sibling::label[. = 'medium']]"/></li>
        <li>Country: <xsl:value-of select="country"/></li>
        <li>Genre: <xsl:value-of select=".//desc[preceding-sibling::label[. = 'genre']]"/></li>
        <li>Year: <xsl:value-of select="date"/></li>
        <li>
            <a href="{link/@target}">IMDB</a>
        </li></ul></li>
    </xsl:template>

<!--  Template for genres -->
    <xsl:template match="list[@type = 'genres']/item">
        <li>
            <xsl:value-of select="@xml:id"/>
        </li>
    </xsl:template>
    
<!--  Template for places  -->
    <xsl:template match="div[@type='places']//place">
        <li>
            <xsl:value-of select="placeName"/>
        </li>
    </xsl:template>

    <!--  template for nationalCinemas  -->


    <xsl:template match="list[@type = 'nationalCinemas']/item">
        <li>
            <xsl:value-of select="@xml:id"/>
        </li>
    </xsl:template>
</xsl:stylesheet>
