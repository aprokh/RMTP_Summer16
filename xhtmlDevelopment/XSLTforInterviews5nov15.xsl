<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">

    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="index" select="document('../index.xml')"/>
    <xsl:template match="/">

        <html>
            <head>
                <title>Cinema and Memory</title>
                <link rel="stylesheet" type="text/css" href="/css/interview.css"/>
                <link rel="stylesheet" type="text/css" href="/css/style.css"/>
                <script type="text/javascript" src="/javascript/interview.js"/>
            </head>
            <body>
                <xsl:comment>#include virtual="/inc/menuSSIInterview.xhtml"</xsl:comment>
                <div id="boxes">

                    <label for="person">Person<input type="radio" id="person" name="selector"
                        /></label>
                    <label for="title">Title<input type="radio" id="title" name="selector"/></label>
                    <label for="genre">Genre<input type="radio" id="genre" name="selector"/></label>
                    <label for="nationalCinema">National Cinema<input type="radio"
                            id="nationalCinema" name="selector"/></label>
                    <label for="place">Place<input type="radio" id="place" name="selector"/></label>
                    <label for="epit">Epithet<input type="radio" id="epit" name="selector"/></label>
                    <label for="persSing">Personal Singular<input type="radio" id="persSing"
                            name="selector"/></label>
                    <label for="persPlur">Personal Plural<input type="radio" id="persPlur"
                            name="selector"/></label>
                    <label for="possSing">Possessive Singular<input type="radio" id="possSing"
                            name="selector"/></label>
                    <label for="possPlur">Possessive Plural<input type="radio" id="possPlur"
                            name="selector"/></label>
                    <label for="collective">Collective <input type="radio" id="collective"
                            name="selector"/>
                    </label>
                    <label for="lex">Lexical Hesitation<input type="radio" id="lex"
                            name="selector"/></label>
                    <label for="nonLex">Nonlexical Hesitation<input type="radio" id="nonLex"
                            name="selector"/></label>



                </div>
                <div id="rightPanel"/>
                <div id="centerPanel">
                    <xsl:apply-templates/>
                </div>
            </body>
        </html>

    </xsl:template>

    <xsl:template match="meta">
        <xsl:variable name="interviewee" select="//interviewee/@ref"/>
        <xsl:variable name="interviewer" select="//interviewer[1]/@ref"/>
        <h1>
            <xsl:value-of
                select="
                    'Interview with',
                    $index//person[@xml:id = $interviewee]/forename,
                    $index//person[@xml:id = $interviewee]/surnameEng"
            />
        </h1>
        <ul>

            <li>
                <xsl:value-of
                    select="
                        'Interviewer:',
                        $index//person[@xml:id = $interviewer]/forename,
                        $index//person[@xml:id = $interviewer]/surnameEng"
                />
            </li>
            <li>
                <a href="http://mtp.blogs.wm.edu">
                    <xsl:apply-templates select="project"/>
                </a>
            </li>
            <li>
                <a href="https://www.wm.edu">
                    <xsl:apply-templates select="university"/>
                </a>
            </li>
            <!--     We'll also want to link to the XML file       -->
            <li>
                <xsl:text>Interview Date: </xsl:text>
                <xsl:apply-templates select="date[1]"/>
            </li>
            <li>
                <xsl:text>Transcription and Translation Date: </xsl:text>
                <xsl:apply-templates select="date[2]"/>
            </li>

        </ul>

        <hr/>
    </xsl:template>

    <xsl:template match="speech">
        <xsl:variable name="speaker" select="@speaker"/>

        <h3>
            <xsl:if test="@speechtype = 'q'">
                <xsl:value-of select="$index//person[@xml:id = $speaker]/surnameEng"/>
            </xsl:if>

            <xsl:value-of select="$index//person[@xml:id = $speaker]/surnameRus"/>
            <xsl:text>: </xsl:text>

        </h3>

        <p>


            <xsl:apply-templates/>
        </p>


    </xsl:template>

    <!--    Below is a template for pronouns: personal and possessive, singular and plural.-->
    <xsl:template match="pron">
        <span class="{@type}{upper-case(substring(@number, 1,1))}{substring(@number, 2)}">

            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <!--   Below is a template for hesitation marks: lexical and non-lexical-->
    <xsl:template match="hes">
        <!--        <span class="lex">        
            <xsl:apply-templates/>
        </span>-->



        <!--<xsl:if test="@type='nonlex'">
             <strong><xsl:value-of>...</xsl:value-of></strong>  
            </xsl:if>-->
        <xsl:choose>
            <xsl:when test="@type = 'nonlex'">
                <span class="nonLex">
                    <xsl:text>...</xsl:text>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="lex">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <xsl:template match="collective">
        <span class="collective">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="epit">
        <span class="epit">
            <xsl:apply-templates/>
        </span>
    </xsl:template>


    <xsl:template match="person">
        <span class="person">
            <xsl:apply-templates/>
        </span>
    </xsl:template>


    <xsl:template match="title">
        <span class="title">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="genre">
        <span class="genre">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="nationalCinema">
        <span class="nationalCinema">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="place">
        <span class="place">
            <xsl:apply-templates/>
        </span>
    </xsl:template>





</xsl:stylesheet>
