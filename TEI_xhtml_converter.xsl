<?xml version="1.0" encoding="UTF-8"?>


<!-- Mostly finished but need to deal with pronouns and also with references from index
 (namespace issue)  -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="index" select="document('developmentFiles/Index/index.xml')"/>
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
<!--  This isn't working at the moment because index.xml is not in TEI namespace  -->
    <xsl:template match="teiHeader">
        <xsl:variable name="interviewee" select="(//titleStmt)[1]/author/name/@ref"/>
       
        <h1>
            <xsl:value-of
                select="
                'Interview with',
                $index//*:person[@xml:id = $interviewee]/*:forename,
                $index//*:person[@xml:id = $interviewee]/*:surnameEng"
            />
        </h1>
        <ul>
            
            
            <li>
                <xsl:choose>
                    <xsl:when test="count(//editor[@role='interviewer']) gt 1">
                        <xsl:value-of select="'Interviewers: '"></xsl:value-of>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'Interviewer:'"></xsl:value-of>
                    </xsl:otherwise>
                </xsl:choose>
                
                <xsl:for-each select="(//titleStmt)[1]/editor[@role='interviewer']">
                    <xsl:if test="preceding-sibling::editor[@role]">
                        <xsl:value-of select="', '"/>
                    </xsl:if>
                    <xsl:variable name="interviewer" select="name/@ref"/>
                    
                        <xsl:value-of
                            select="
                            $index//*:person[@xml:id = $interviewer]/*:forename,
                            $index//*:person[@xml:id = $interviewer]/*:surnameEng"
                        />
                    
            </xsl:for-each>
            </li>
            
            
<!--      NOT EVEN REACHED HERE got some shit to do yet      -->
            <li>
                <a href="http://mtp.blogs.wm.edu">
                    Russian Movie Theater Project (RMTP)
                </a>
            </li>
            <li>
                <a href="https://www.wm.edu">
                    College of William and Mary
                </a>
            </li>
            <!--     We'll also want to link to the XML file       -->
            <li>
                <xsl:text>Interview Date: </xsl:text>
                <xsl:apply-templates select="//date[@type = 'interview']"/>
            </li>
            <li>
                <xsl:text>Transcription and Translation Date: </xsl:text>
                <xsl:apply-templates select="//date[@type = 'translation']"/>
            </li>
            
        </ul>
        
        <hr/>
    </xsl:template>
    
    
    <!-- This is also not working-->
    <xsl:template match="u">
        <xsl:variable name="this" select="."/>
        <h3>
            <xsl:value-of select="$index//*:person[@xml:id = $this/@who]/*:surnameEng"/>
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
    
    <!--   Need to deal with hesitation still   -->
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
    
    <xsl:template match="rs">
        <span class="{@type}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>  
</xsl:stylesheet>