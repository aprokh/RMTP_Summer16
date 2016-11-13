<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0"
    xmlns="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" indent="yes"/>
    <!--   NOTE! the index file is used for name outputs int he titleStmt. If the index is moved, variable declaration must be edited -->
    <xsl:variable name="indexFile" select="doc('developmentFiles/Index/index.xml')"/>
    <xsl:variable name="intervieweeRef" select="//interviewee/@ref"/>
    <xsl:variable name="intervieweeName" select="
        concat($indexFile//person[@xml:id = $intervieweeRef]/upper-case(forename), ' ', $indexFile//person[@xml:id = $intervieweeRef]/upper-case(surname), $indexFile//person[@xml:id = $intervieweeRef]/upper-case(surnameEng))"
    />
    <xsl:template match="/">
        <xsl:comment>This comment describes parts that need editing post transformation:
        1) String content of title element in titleStmt element. Full name not found in original file, so made approximation. Renders as lastname; should be full name
        2) </xsl:comment>
        <TEI>
            <xsl:apply-templates/>
        </TEI>
    </xsl:template>
    <xsl:template match="meta">
        <teiHeader>
            <fileDesc>
                <titleStmt>
                    <!--        Function: gets filename, strips path from beginning and .xml extension from end            -->
                    <!--        Note: Full name is not provided in original markup in English, so will need to be added after
                    running transformation to match rmpt_tei_header_TEST.xml template-->
                    <title>Interview with <xsl:value-of
                            select="$intervieweeName"/>:
                        electronic version</title>
                    <xsl:apply-templates select="persons/*"/>
                    <respStmt>
                        <resp>TEI Markup done by </resp>
                        <name ref="nitz">ANDREW NITZ</name>
                        <name ref="prokhorova">ELENA PROKHOROVA</name>
                    </respStmt>
                </titleStmt>
                <publicationStmt>
                    <publisher>College of William and Mary</publisher>
                    <authority>Russian Movie Theater Project <bloc>The Russian Movie Theater Project
                            is an archive and a study of film exhibition in St. Petersburg during
                            the twentieth century: a portrait of film exhibition and movie-going
                            scene in Soviet Leningrad and Post-Soviet St. Petersburg. The project is
                            inspired by Williamsburg Theater Project (led by Professor Arthur
                            Knight) and the international initiative, the History of Moviegoing,
                            Exhibition, and Reception (HOMER) Project. While many Western cinematic
                            traditions are represented in the HOMER project, there is no online
                            archive covering Russian cinema. The RMTP aims to fill that gap. Most
                            histories of Russian and Soviet cinema operate under the assumption that
                            all films released were available to all citizens of Russia Soviet
                            Union. When the films received a limited release for political reasons,
                            researchers provide anecdotal evidence about how these films were
                            distributed. The Russian Movie Theater Project would like to create an
                            empirical portrait of Russians’ movie going habits and film exhibition
                            patterns at different periods of Soviet and Russian history. For
                            example, when and where Soviets were able to see Western films in
                            Stalinist Russia? How did the availability of Italian, Indian, and
                            American films changed after Stalin’s death? How does Soviet-era
                            propaganda and post-Soviet promotion affect film distribution and film
                            attendance? Using computational tools, this Project examines oral
                            history interviews, in which interviewees reconstruct their moviegoing
                            experiences in St. Petersburg, Russia. To see the computational module
                            of the project click here. Specifically, the Project analyzes what
                            moviegoers remember (films, actors, directors), how they evaluate films,
                            actors, characters, how they define themsleves as narrators (I or we),
                            what they hesitate about when they recollect their moviegoing
                            experiences, and how their cinematic experiences shape their identities
                            as Soviets, Russians, and global citizens. </bloc>
                    </authority>
                    <pubPlace>Williamsburg, Virginia</pubPlace>
                    <!-- Date needs some expanding -->
                    <xsl:apply-templates select="date"/>
                    <availability>
                        <p>EDITORIAL POLICY
                            <xsl:comment>We follow TEI Guidelines "16.2.1 Pointing Elsewhere."</xsl:comment></p>
                        <p>The project is approved by Protection of Human Subjects Committee (PHSC)
                            of the College of William and Mary.<ref
                                target="http://www.wm.edu/offices/sponsoredprograms/researchcompliance/guidanceandprocedures/"
                            />
                        </p>
                        <licence> Distributed via permission from interviewee (given in the Deed of
                            Gift to the College of William and Mary) </licence>
                    </availability>
                </publicationStmt>
                <xsl:comment>Information about the source of the interview: an audio or video recording.</xsl:comment>
                <sourceDesc> 
                    <biblFull>
                        <titleStmt><title>INTERVIEW WITH <xsl:value-of
                            select="$intervieweeName"
                        /></title>
                            <author>
                                <name ref="{$intervieweeRef}">
                                    <xsl:value-of select="$intervieweeName"></xsl:value-of>
                                </name>
                            </author>
                            <xsl:for-each select="//interviewer">
                                <xsl:variable name="interviewerRef" select="./@ref"/>
                                <editor role="interviewer">
                                    <name ref="{$interviewerRef}">
                                        <xsl:value-of
                                            select="concat(upper-case($indexFile//person[@xml:id = $interviewerRef]/forename), ' ', upper-case($indexFile//person[@xml:id = $interviewerRef]/surname), upper-case($indexFile//person[@xml:id = $interviewerRef]/surnameEng))"
                                        />
                                    </name>
                                </editor>
                            </xsl:for-each>
                        </titleStmt>
                        <!-- Sasha : we do not need publication statement here right?/-->   
                        <publicationStmt><publisher>College of William and Mary</publisher>
                            <pubPlace>Williamsburg, VA</pubPlace>
                            <!-- This is a date of the interview. -->
                            <xsl:apply-templates select="date"/></publicationStmt>
                        <notesStmt><note>The interview is part of the Russian Movie Theater Project, which examines history of moviegoing expereinces in the USSR and Russia. Michael Roberts has conducted the interview on 4 July, 2008 in St. Petersburg, Russia.</note></notesStmt>
                    </biblFull>
                </sourceDesc>
            </fileDesc>
            <profileDesc>
                <abstract>
                    <p>The interview with <xsl:value-of
                            select="concat($indexFile//person[@xml:id = $intervieweeRef]/forename, ' ', $indexFile//person[@xml:id = $intervieweeRef]/surname, $indexFile//person[@xml:id = $intervieweeRef]/surnameEng)"
                        /> is part of the Russian Movie Theater Project, which examines history of
                        moviegoing expereinces in the USSR and Russia. <xsl:for-each
                            select="//interviewer">
                            <xsl:variable name="interviewerRef" select="./@ref"/>
                            <xsl:if test="preceding-sibling::interviewer"> and </xsl:if>
                            <xsl:value-of
                                select="concat($indexFile//person[@xml:id = $interviewerRef]/forename, ' ', $indexFile//person[@xml:id = $interviewerRef]/surname, $indexFile//person[@xml:id = $interviewerRef]/surnameEng)"
                            />
                        </xsl:for-each> conducted the interview on 4 July, 2008 in St. Petersburg,
                        Russia.</p>
                </abstract>
                <creation>BACKGROUND OF INTERVIEW</creation>
                <langUsage>
                    <language ident="ru">RUSSIAN</language>
                </langUsage>
                <particDesc>
                    <xsl:for-each select="//interviewer">
                        <xsl:variable name="interviewerRef" select="./@ref"/>
                        <person role="interviewer">
                            <persName ref="{$interviewerRef}">
                                <xsl:value-of
                                    select="concat(upper-case($indexFile//person[@xml:id = $interviewerRef]/forename), ' ', upper-case($indexFile//person[@xml:id = $interviewerRef]/surname), upper-case($indexFile//person[@xml:id = $interviewerRef]/surnameEng))"
                                />
                            </persName>
                        </person>
                    </xsl:for-each>
                    <person role="interviewee">
                        <persName ref="{//interviewee/@ref}">
                            <xsl:value-of
                                select="concat(upper-case($indexFile//person[@xml:id = $intervieweeRef]/forename), ' ', upper-case($indexFile//person[@xml:id = $intervieweeRef]/surname), upper-case($indexFile//person[@xml:id = $intervieweeRef]/surnameEng))"
                            />
                        </persName>
                    </person>
                </particDesc>
            </profileDesc>
        </teiHeader>
    </xsl:template>
    <xsl:template match="date">
        <date type="{@milestone}">
            <xsl:apply-templates/>
        </date>
    </xsl:template>
    <xsl:template match="persons/*">
        <xsl:variable name="thisPersRef" select="@ref"/>
        <xsl:choose>
            <xsl:when test="name(.) = 'interviewee'">
                <author>
                    <name ref="{./@ref}">
                        <!--          A little it hacky, but avoid doing another choose block by outputting both surname and surnameEng, because only one will be present per entry              -->
                        <xsl:value-of
                            select="concat(upper-case($indexFile//person[@xml:id = $thisPersRef]/forename), ' ', upper-case($indexFile//person[@xml:id = $thisPersRef]/surname), upper-case($indexFile//person[@xml:id = $thisPersRef]/surnameEng))"
                        />
                    </name>
                </author>
            </xsl:when>
            <xsl:otherwise>
                <editor role="{./node-name()}">
                    <name ref="{./@ref}">
                        <!--          A little it hacky, but avoid doing another choose block by outputting both surname and surnameEng, because only one will be present per entry              -->
                        <xsl:value-of
                            select="concat(upper-case($indexFile//person[@xml:id = $thisPersRef]/forename), ' ', upper-case($indexFile//person[@xml:id = $thisPersRef]/surname), upper-case($indexFile//person[@xml:id = $thisPersRef]/surnameEng))"
                        />
                    </name>
                </editor>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--  Structural tags: body to div, speech to something  -->
    <xsl:template match="body">
        <text>
            <body>
                <xsl:apply-templates/>
            </body>
        </text>
    </xsl:template>
    <xsl:template match="speech">
        <!--<sp xml:id="sp{count(preceding::speech) + 1}">
            <speaker>
                <xsl:value-of select="@speaker"/>
            </speaker>
            
        </sp>-->
        <!--   Switch to <u> with @speaker and give the xml:id     -->
        <u xml:id="sp{count(preceding::speech) + 1}" who='{@speaker}'>
            <xsl:apply-templates/>
        </u>
    </xsl:template>
    <!--  Conversion of references to <rs> tag  -->
    <!--  Conversion of   -->
    
    <xsl:template match="title | person | place | genre | nationalCinema | epit">
        <rs type="{node-name()}" key="{@ref}">
            <xsl:apply-templates/>
        </rs>
    </xsl:template>
    <xsl:template match="pron">
        <rs type="pron" subtype="{@type}{upper-case(substring(@number, 1, 1))}{substring(@number, 2)}">
            <xsl:apply-templates/>
        </rs>
    </xsl:template>
    <xsl:template match="hes">
        <xsl:choose>
            <xsl:when test="@type = 'lex'">
                <span type="lex">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span type="nonlex"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
