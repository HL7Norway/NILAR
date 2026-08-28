# Type of diagnostic report - v1.5.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Type of diagnostic report**

## ValueSet: Type of diagnostic report 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/ValueSet/typeof-diagnostic-report-vs | *Version*:1.5.0 |
| Active as of 2026-08-28 | *Computable Name*:TypeDiagnosticReport_VS |

 
Type of diagnostic report, indication the kind of tests/procedures performed in a DiagnosticReport. 

 **References** 

* [NilarDiagnosticReport](StructureDefinition-nilar-diagnostic-report.md)

### Logical Definition (CLD)

 

### Expansion

No Expansion for this valueset (Unknown Code System)

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "typeof-diagnostic-report-vs",
  "url" : "http://nhn.no/fhir/nilar/ValueSet/typeof-diagnostic-report-vs",
  "version" : "1.5.0",
  "name" : "TypeDiagnosticReport_VS",
  "title" : "Type of diagnostic report",
  "status" : "active",
  "date" : "2026-08-28T12:05:03+00:00",
  "publisher" : "Norsk helsenett - Nilar",
  "contact" : [{
    "name" : "Norsk helsenett - Nilar",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.nhn.no"
    }]
  }],
  "description" : "Type of diagnostic report, indication the kind of tests/procedures performed in a DiagnosticReport.",
  "compose" : {
    "include" : [{
      "system" : "http://ehelse.no/fhir/CodeSystem/no-kodeverk-8202"
    }]
  }
}

```
