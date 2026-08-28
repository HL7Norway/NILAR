# PublicIdType_VS - v1.6.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PublicIdType_VS**

## ValueSet: PublicIdType_VS 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/ValueSet/public-it-type-vs | *Version*:1.6.0 |
| Active as of 2026-08-28 | *Computable Name*:PublicIdType_VS |

 
Id types used to identify patients 

 **References** 

* [NilarDiagnosticReport](StructureDefinition-nilar-diagnostic-report.md)
* [NilarObservation](StructureDefinition-nilar-observation.md)
* [NilarServiceRequest](StructureDefinition-nilar-service-request.md)
* [NilarSpecimen](StructureDefinition-nilar-specimen.md)

### Logical Definition (CLD)

 

### Expansion

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
  "id" : "public-it-type-vs",
  "url" : "http://nhn.no/fhir/nilar/ValueSet/public-it-type-vs",
  "version" : "1.6.0",
  "name" : "PublicIdType_VS",
  "title" : "PublicIdType_VS",
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
  "description" : "Id types used to identify patients",
  "compose" : {
    "include" : [{
      "system" : "http://nhn.no/fhir/nilar/CodeSystem/public-id-type-cs"
    }]
  }
}

```
