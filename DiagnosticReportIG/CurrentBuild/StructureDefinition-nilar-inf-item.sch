<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile Extension
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Extension</sch:title>
    <sch:rule context="f:Extension">
      <sch:assert test="count(f:extension[@url = 'http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-type']) &gt;= 1">extension with URL = 'http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-type': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-type']) &lt;= 1">extension with URL = 'http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-type': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-descr']) &lt;= 1">extension with URL = 'http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-descr': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://nhn.no/fhir/nilar/StructureDefinition/nilar-comment']) &lt;= 1">extension with URL = 'http://nhn.no/fhir/nilar/StructureDefinition/nilar-comment': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-coded-descr']) &lt;= 1">extension with URL = 'http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-coded-descr': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-start']) &lt;= 1">extension with URL = 'http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-start': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-end']) &lt;= 1">extension with URL = 'http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-end': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-org-time']) &lt;= 1">extension with URL = 'http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-org-time': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
