# Requisition Comment VS - v1.5.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Requisition Comment VS**

## ValueSet: Requisition Comment VS 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/ValueSet/requisition-comment-vs | *Version*:1.5.0 |
| Active as of 2026-08-28 | *Computable Name*:RequisitionComment_VS |

 
Codes used in requsition comments. 8234 represents 'heading', 8274 reresents coded text. 

 **References** 

* [NilarServiceRequest](StructureDefinition-nilar-service-request.md)

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
  "id" : "requisition-comment-vs",
  "url" : "http://nhn.no/fhir/nilar/ValueSet/requisition-comment-vs",
  "version" : "1.5.0",
  "name" : "RequisitionComment_VS",
  "title" : "Requisition Comment VS",
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
  "description" : "Codes used in requsition comments. 8234 represents 'heading', 8274 reresents coded text.",
  "compose" : {
    "include" : [{
      "system" : "http://ehelse.no/fhir/CodeSystem/no-kodeverk-8234"
    },
    {
      "system" : "http://ehelse.no/fhir/CodeSystem/no-kodeverk-8274"
    }]
  }
}

```
