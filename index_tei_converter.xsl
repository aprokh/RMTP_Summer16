<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0"
    xmlns="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <TEI>
            <teiHeader>
                <fileDesc>
<!--       Everything in here should be looked over to assure 
           correctly given-->
                    <titleStmt>
                        <title>
                            Site Index of Named Entities in Russian Movie Theater Project Archive
                        </title>
                        <author>
                            Elena Prokhorova
                        </author>
                        <author>
                            Alexander Prokhorov
                        </author>
                        <author>
                            Thomas Elvins
                        </author>
                        <editor>Elena Prokhorova</editor>
                        <sponsor>
                            <orgName>
                                Russian Movie Theater Project
                            </orgName>
                        </sponsor>
                        <sponsor>
                            College of William and Mary 
                        </sponsor>
                        <principal>Elena Prokhorova</principal>
                        <principal>Alexander Prokhorova</principal>
                    </titleStmt>
<!--       Needed: description as you'd like it to appear             -->
                    <editionStmt>
                        <edition>
                            Desired description of edition
                        </edition>
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
                            <licence>
                                Distributed via permission from interviewee (given in the Deed of Gift to the College of William and Mary)
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
    
    <xsl:template match="metaPersons">
        <div type="metaPersons">
            <xsl:apply-templates mode="metaPersons"/>
        </div>
    </xsl:template>
    
    
    <xsl:template match="persons">
        <div type="persons">
            <xsl:apply-templates mode="persons"/>
        </div>
    </xsl:template>
<!--  Modal template for converting meta persons
      Note: gender and viewerAge fit as attributes in the TEI schema, whereas they were tags in our previous 
    system. Will effect processing.-->
    <xsl:template match="person" mode="metaPersons">
        <listPerson>
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
        </listPerson>
    </xsl:template>
    
<!--  Modal template for converting referenced persons.
    Note: gender fits as an attribute in the TEI schema, whereas it was a tag in our previous 
    system. Will effect processing-->
    
    <xsl:template match="person" mode="persons">
        <listPerson>
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
        </listPerson>
    </xsl:template>
    
<!--  Templates for converting titles  -->
   
    <xsl:template match="titles"></xsl:template>
    
<!--  Templates for converting genres  -->
    
    <xsl:template match="genres"></xsl:template>
    
<!--  Templates for converting placs  -->
    
    <xsl:template match="places">
       <div type="places">
           <xsl:apply-templates/>
       </div> 
    </xsl:template>
    
    <xsl:template match="place">
        <listPlace>
            <place xml:id="{@xml:id}" type="{placeType}">
                <placeName>
                    <xsl:apply-templates select="fullName"/>
                </placeName>
            </place>
        </listPlace>
    </xsl:template>
    
<!--  Templates for converting nationalCinema  -->
</xsl:stylesheet>