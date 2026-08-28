# Document Restriction VS - v1.6.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Document Restriction VS**

## ValueSet: Document Restriction VS 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/ValueSet/document-restriction-vs | *Version*:1.6.0 |
| Active as of 2026-08-28 | *Computable Name*:DocumentRestriction_VS |

 
Codes with furtehr information about a document restriction. 

 **References** 

This value set is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

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
  "id" : "document-restriction-vs",
  "url" : "http://nhn.no/fhir/nilar/ValueSet/document-restriction-vs",
  "version" : "1.6.0",
  "name" : "DocumentRestriction_VS",
  "title" : "Document Restriction VS",
  "status" : "active",
  "date" : "2026-08-28T11:20:46+00:00",
  "publisher" : "Norsk helsenett - Nilar",
  "contact" : [{
    "name" : "Norsk helsenett - Nilar",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.nhn.no"
    }]
  }],
  "description" : "Codes with furtehr information about a document restriction.",
  "compose" : {
    "include" : [{
      "system" : "http://ehelse.no/fhir/CodeSystem/no-kodeverk-9603"
    }]
  }
}

```
