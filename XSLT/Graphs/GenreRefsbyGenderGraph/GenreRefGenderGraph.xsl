<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg" version="2.0">
    <xsl:output method="xml" indent="yes"/>

<!--    REFERENCES TO GENRES in 'M' vs. 'F' Interviews-->

    <xsl:template match="/">


        <svg>
            <g transform="translate(80, 400)">

                <!--AXES and TICK MARKS-->
                <!--Below is the x axis-->
                <line x1="0" y1="0" x2="800" y2="0" stroke="black" stroke-width="2px"/>
                <!--                the y axis-->
                <line x1="0" y1="0" x2="0" y2="-200" stroke="black" stroke-width="2px"/>


                <xsl:for-each select="1 to 2">
                    <xsl:variable name="yPosition" select=". * -50"/>

                    <line x1="-3" y1="{$yPosition}" x2="3" y2="{$yPosition}" stroke="black"
                        stroke-width="2"/>

                </xsl:for-each>
                <text x="-40" y="-100">100%</text>


                <!--                RECTANGLES-->

                <!--% of male interviewees refering to art cinema-->
                <rect x="20" y="-100" height="100" width="50" stroke="black" stroke-width="2"
                    fill="white"/>

                <rect x="20" y="-{(2 div 3)*100}" height="{(2 div 3)*100}" width="50" stroke="black"
                    stroke-width="2" fill="blue"/>

                <!-- % of male interviewees refering to adult cinema               -->
                <rect x="90" y="-100" height="100" width="50" stroke="black" stroke-width="2"
                    fill="white"/>

                <rect x="90" y="-{(2 div 3)*100}" height="{(2 div 3)*100}" width="50" stroke="black"
                    stroke-width="2" fill="blue"/>

                <!--                % of male interviewees refering to action films-->
                <rect x="160" y="-100" height="100" width="50" stroke="black" stroke-width="2"
                    fill="white"/>

                <rect x="160" y="-{(2 div 3)*100}" height="{(2 div 3)*100}" width="50"
                    stroke="black" stroke-width="2" fill="blue"/>

                <!--                % of male interviewees refering to comedy-->
                <rect x="230" y="-100" height="100" width="50" stroke="black" stroke-width="2"
                    fill="white"/>

                <rect x="230" y="-{(2 div 3)*100}" height="{(2 div 3)*100}" width="50"
                    stroke="black" stroke-width="2" fill="blue"/>

                <!--                % of female interviewees refering to comedy-->
                <rect x="280" y="-100" height="100" width="50" stroke="black" stroke-width="2"
                    fill="white"/>

                <rect x="280" y="-{(5 div 6)*100}" height="{(5 div 6)*100}" width="50"
                    stroke="black" stroke-width="2" fill="red"/>

                <!--                % of female interviewees refering to  fairy tale films-->
                <rect x="350" y="-100" height="100" width="50" stroke="black" stroke-width="2"
                    fill="white"/>

                <rect x="350" y="-{(5 div 6)*100}" height="{(5 div 6)*100}" width="50"
                    stroke="black" stroke-width="2" fill="red"/>
                <!--                % of female interviewees refering to  war films-->
                <rect x="420" y="-100" height="100" width="50" stroke="black" stroke-width="2"
                    fill="white"/>

                <rect x="420" y="-{(3 div 6)*100}" height="{(3 div 6)*100}" width="50"
                    stroke="black" stroke-width="2" fill="red"/>

                <!--                % of female interviewees refering to  romcom-->
                <rect x="490" y="-100" height="100" width="50" stroke="black" stroke-width="2"
                    fill="white"/>

                <rect x="490" y="-{(2 div 6)*100}" height="{(2 div 6)*100}" width="50"
                    stroke="black" stroke-width="2" fill="red"/>

                <!--                % of female interviewees refering to  horror-->
                <rect x="560" y="-100" height="100" width="50" stroke="black" stroke-width="2"
                    fill="white"/>

                <rect x="560" y="-{(2 div 6)*100}" height="{(2 div 6)*100}" width="50"
                    stroke="black" stroke-width="2" fill="red"/>

                <!--                % of female interviewees refering to  films for children-->
                <rect x="630" y="-100" height="100" width="50" stroke="black" stroke-width="2"
                    fill="white"/>

                <rect x="630" y="-{(2 div 6)*100}" height="{(2 div 6)*100}" width="50"
                    stroke="black" stroke-width="2" fill="red"/>

                <!--                % of female interviewees refering to  silent cinema-->
                <rect x="700" y="-100" height="100" width="50" stroke="black" stroke-width="2"
                    fill="white"/>

                <rect x="700" y="-{(2 div 6)*100}" height="{(2 div 6)*100}" width="50"
                    stroke="black" stroke-width="2" fill="red"/>

                <text y="-120" x="20" font-family="arial" text-anchor="end" font-weight="bold"
                    fill="blue" transform="rotate(-55 30 -180)">art</text>

                <text y="-120" x="90" font-family="arial" text-anchor="end" font-weight="bold"
                    fill="blue" transform="rotate(-55 85 -185)">adult</text>

                <text y="-120" x="160" font-family="arial" text-anchor="end" font-weight="bold"
                    fill="blue" transform="rotate(-55 150 -190)">action</text>

                <text y="-120" x="230" font-family="arial" text-anchor="end" font-weight="bold"
                    fill="purple" transform="rotate(-55 220 -220)">comedy</text>

                <text y="-120" x="270" font-family="arial" text-anchor="end" font-weight="bold"
                    fill="red" transform="rotate(-55 270 -290)">wonder tale</text>

                <text y="-120" x="285" font-family="arial" text-anchor="end" font-weight="bold"
                    fill="red" transform="rotate(-55 330 -330)">war film</text>

                <text y="-110" x="330" font-family="arial" text-anchor="end" font-weight="bold"
                    fill="red" transform="rotate(-55 380 -350)">romcom</text>

                <text y="-110" x="360" font-family="arial" text-anchor="end" font-weight="bold"
                    fill="red" transform="rotate(-55 430 -370)">horror</text>

                <text y="-110" x="475" font-family="arial" text-anchor="end" font-weight="bold"
                    fill="red" transform="rotate(-55 485 -390)">films for children</text>

                <text y="-110" x="480" font-family="arial" text-anchor="end" font-weight="bold"
                    fill="red" transform="rotate(-55 540 -410)">silent films</text>

                <text x="70" y="-300" font-family="arial" font-weight="bold" fill="purple">
                    References to film genres (% by gender) <tspan x="70" y="-280">red = female
                        viewers, blue = male viewers</tspan>
                    <tspan x="70" y="-260">100% = all interviews by 'f' or 'm'</tspan>
                </text>

                <text x="50" y="20" text-anchor="middle" font-family="arial" font-weight="bold"
                    fill="black">67%</text>

                <text x="120" y="20" text-anchor="middle" font-family="arial" font-weight="bold"
                    fill="black">67%</text>

                <text x="190" y="20" text-anchor="middle" font-family="arial" font-weight="bold"
                    fill="black">67%</text>

                <text x="260" y="20" text-anchor="middle" font-family="arial" font-weight="bold"
                    fill="black">67%</text>

                <text x="310" y="20" text-anchor="middle" font-family="arial" font-weight="bold"
                    fill="black">83%</text>

                <text x="380" y="20" text-anchor="middle" font-family="arial" font-weight="bold"
                    fill="black">83%</text>

                <text x="450" y="20" text-anchor="middle" font-family="arial" font-weight="bold"
                    fill="black">50%</text>

                <text x="520" y="20" text-anchor="middle" font-family="arial" font-weight="bold"
                    fill="black">33%</text>

                <text x="590" y="20" text-anchor="middle" font-family="arial" font-weight="bold"
                    fill="black">33%</text>

                <text x="660" y="20" text-anchor="middle" font-family="arial" font-weight="bold"
                    fill="black">33%</text>

                <text x="730" y="20" text-anchor="middle" font-family="arial" font-weight="bold"
                    fill="black">33%</text>


            </g>


        </svg>


    </xsl:template>

</xsl:stylesheet>
