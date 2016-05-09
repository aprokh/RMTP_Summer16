<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    
    
    <pattern>
        <let name="metaPersons" value="doc('index.xml')//metaPersons/person/@xml:id"/>
        <rule context="meta/persons/*/@ref">
            <assert test=". = $metaPersons">All meta persons references must correspond to a title in the index.</assert>
        </rule>
    </pattern>
    <pattern>
        <let name="persons" value="doc('index.xml')//persons/person/@xml:id"/>
        <rule context="body//person/@ref">
            <assert test=". = $persons">All person references must correspond to a person in the index.</assert>
        </rule>
    </pattern>
    <pattern>
        <let name="titles" value="doc('index.xml')//title/@xml:id"/>
        <rule context="title/@ref">
            <assert test=". = $titles">All title references must correspond to a title in the index.</assert>
        </rule>
    </pattern>
    <pattern>
        <let name="genres" value="doc('index.xml')//genre/@xml:id"/>
        <rule context="genre/@ref">
            <assert test=". = $genres">All genre references must correspond to a person in the index.</assert>
        </rule>
    </pattern>
    <pattern>
        <let name="places" value="doc('index.xml')//place/@xml:id"/>
        <rule context="place/@ref">
            <assert test=". = $places">All place references must correspond to a title in the index.</assert>
        </rule>
    </pattern>
    <pattern>
        <let name="nationalCinemas" value="doc('index.xml')//nationalCinema/@xml:id"/>
        <rule context="nationalCinema/@ref">
            <assert test=". = $nationalCinemas">All natCinema references must correspond to a title in the index.</assert>
        </rule>
    </pattern>
<!--  Do we need more specific constraints for these references?
    -->
    <pattern>
        <let name="epit" value="doc('index.xml')//*/@xml:id"/>
        <rule context="nationalCinema/@ref">
            <assert test=". = $epit">All natCinema references must correspond to a title in the index.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="speech/@speaker">
            <assert test=". = (//interviewer/@ref, //interviewee/@ref)">The speaker must match either the interviewer or interviewee.</assert>
        </rule>
    </pattern>
</sch:schema>