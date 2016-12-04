<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0"
    xmlns="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" indent="yes"/>
    
    
<!--  Ok, slight issue with viewerAge (when doesn't exist it creates an issue),
    Also a problem with title; the person tag in there has a few weird points. should probably just add this into the metapersons section in any case, would make for a clean reference. -->
    
    <xsl:template match="/">
        <TEI>
            <teiHeader>
                <fileDesc>
<!--       Everything in here should be looked over to assure 
           correctly given-->
                    <titleStmt>
                        <title>Site Index of Named Entities in Russian Movie Theater Project Archive</title>
                        <author>Elena Prokhorova</author>
                        <author>Alexander Prokhorov</author>
                        <author>Thomas Elvins</author>
                        <editor>Elena Prokhorova</editor>
                        <sponsor>
                            <orgName>Russian Movie Theater Project</orgName>
                        </sponsor>
                        <sponsor>College of William and Mary</sponsor>
                        <principal>Elena Prokhorova</principal>
                        <principal>Alexander Prokhorova</principal>
                    </titleStmt>
<!--       Needed: description as you'd like it to appear             -->
                    <editionStmt>
                        <edition>Desired description of edition</edition>
                    </editionStmt>
                    <publicationStmt>
                        <publisher>College of William and Mary</publisher>
                        <pubPlace>Williamsburg, Virginia</pubPlace>
<!--      Needs filled in with Creative Commons information                  -->
                        <date/>
                        <availability>
                            <p>EDITORIAL POLICY
                                <!--We follow TEI Guidelines "16.2.1 Pointing Elsewhere." --></p>
                            <p>The project is approved by Protection of Human Subjects Committee (PHSC) of the College of William and Mary.<ref target="http://www.wm.edu/offices/sponsoredprograms/researchcompliance/guidanceandprocedures/"></ref>
                            </p> 
                            <licence>Distributed via permission from interviewee (given in the Deed of Gift to the College of William and Mary)
                                <!-- SASHA'S QUESTION Should I add Creative Commons attribution?  Ask Swem Library copyright specialist. -->
                            </licence>
                        </availability>
                    </publicationStmt>
<!--       More detailed description needed             -->
                    <sourceDesc>
                        <p>Original transcriptions gathered by {fill in}</p>
                    </sourceDesc>

                </fileDesc>
            </teiHeader>
            
<!--      Splits main body off for structure      -->
            <text>
                <body>
                    <xsl:apply-templates/>
                </body>
            </text>
        </TEI>
    </xsl:template>
<!--   Main structural divides -->
    <xsl:template match="metaPersons">
        <div type="metaPersons">
            <listPerson><xsl:apply-templates mode="metaPersons"/></listPerson>
        </div>
    </xsl:template>
    
    
    <xsl:template match="persons">
        <div type="persons">
            <listPerson>
                <xsl:apply-templates mode="persons"/>
            </listPerson>
        </div>
    </xsl:template>
    
    <xsl:template match="titles">
        <div type="titles">
            <list type="titles">
                <xsl:apply-templates/>
            </list>
        </div>
    </xsl:template>
    
    <xsl:template match="genres">
        <list type="genres">
            <xsl:apply-templates/>
        </list>
    </xsl:template>
    
    <xsl:template match="places">
        <div type="places">
            <listPlace><xsl:apply-templates/></listPlace>
        </div> 
    </xsl:template>
    
    <xsl:template match="nationalCinemas">
        <list type="nationalCinemas">
            <xsl:apply-templates/>
        </list>
    </xsl:template>
<!--  Modal template for converting meta persons
      Note: gender and viewerAge fit as attributes in the TEI schema, whereas they were tags in our previous 
    system. Will effect processing.-->
    <xsl:template match="person" mode="metaPersons">
            <xsl:choose>
                <xsl:when test="viewerAge">
                    <person xml:id="{@xml:id}" sex="{gender}" age="{viewerAge}">
                        <persName type="eng">
                            <surname>
                                <xsl:apply-templates select="surnameEng"/>
                            </surname>
                            <forename>
                                <xsl:apply-templates select="forename"/>
                            </forename>
                        </persName>
                        <persName type="rus">
                            <surname>
                                <xsl:apply-templates select="surnameRus"/>
                            </surname>
                        </persName>
                    </person>
                </xsl:when>
                <xsl:otherwise>
                    <person xml:id="{@xml:id}" sex="{gender}">
                        <persName type="eng">
                            <surname>
                                <xsl:apply-templates select="surnameEng"/>
                            </surname>
                            <forename>
                                <xsl:apply-templates select="forename"/>
                            </forename>
                        </persName>
                        <persName type="rus">
                            <surname>
                                <xsl:apply-templates select="surnameRus"/>
                            </surname>
                        </persName>
                    </person>
                </xsl:otherwise>
            </xsl:choose>
        
    </xsl:template>
    
<!--  Modal template for converting referenced persons.
    Note: gender fits as an attribute in the TEI schema, whereas it was a tag in our previous 
    system. Will effect processing-->
    
    <xsl:template match="person" mode="persons">
        
            <person xml:id="{@xml:id}" sex="{gender}" role="{role}">
                <persName>
                    <surname>
                        <xsl:apply-templates select="surname"/>
                    </surname>
                    <forename>
                        <xsl:apply-templates select="forename"/>
                    </forename>
                </persName>
                <nationality>
                    <xsl:apply-templates select="nationality"></xsl:apply-templates>
                </nationality>
            </person>
        
    </xsl:template>
    
<!--  Templates for converting titles  -->
   
    <xsl:template match="title">
        <item xml:id="{@xml:id}">
            <title type="eng">
                <xsl:apply-templates select="fullTitleEng"/>
            </title>
            <title type="russ">
                <xsl:apply-templates select="fullTitleRus"/>
            </title>
            <country>
                <xsl:apply-templates select="country"/>
            </country>
            <person type="director">
                <xsl:apply-templates select="director"/>
            </person>
            <date>
                <xsl:apply-templates select="year"/>
            </date>
            <link type="imdb">
                <xsl:apply-templates select="imdb"/>
            </link>
            <trait>
                <label>genre</label>
                <desc><xsl:apply-templates select="genre" mode="title"/></desc>
            </trait>
            <trait>
                <label>medium</label>
                <desc><xsl:apply-templates select="medium"/></desc>
            </trait>
        </item>
    </xsl:template>
    
    <xsl:template match="genre" mode="title">
        <xsl:apply-templates/>
    </xsl:template>
<!--  Templates for converting genres  -->
    
    <xsl:template match="genre">
        <item xml:id="{@xml:id}"/>
    </xsl:template>
    
<!--  Templates for converting placs  -->
    
    
    <xsl:template match="place">
            <place xml:id="{@xml:id}" type="{placeType}">
                <placeName>
                    <xsl:apply-templates select="fullName"/>
                </placeName>
            </place>
    </xsl:template>
    
<!--  Templates for converting nationalCinema  -->
    
    <xsl:template match="nationalCinema">
        <item xml:id="{@xml:id}"/>
    </xsl:template>
</xsl:stylesheet>