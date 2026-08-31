# Public Id Type CS - v1.6.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Public Id Type CS**

## CodeSystem: Public Id Type CS 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/CodeSystem/public-id-type-cs | *Version*:1.6.0 |
| Active as of 2026-08-31 | *Computable Name*:PublicIdType_CS |

 
Id types used to identify patients 

 This Code system is referenced in the content logical definition of the following value sets: 

* [Person Id Type VS](ValueSet-person-id-type-vs.md)
* [PublicIdType_VS](ValueSet-public-it-type-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "public-id-type-cs",
  "url" : "http://nhn.no/fhir/nilar/CodeSystem/public-id-type-cs",
  "version" : "1.6.0",
  "name" : "PublicIdType_CS",
  "title" : "Public Id Type CS",
  "status" : "active",
  "date" : "2026-08-31T14:07:19+00:00",
  "publisher" : "Norsk helsenett - Nilar",
  "contact" : [{
    "name" : "Norsk helsenett - Nilar",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.nhn.no"
    }]
  }],
  "description" : "Id types used to identify patients",
  "content" : "complete",
  "count" : 3,
  "concept" : [{
    "code" : "urn:oid:2.16.578.1.12.4.1.4.1",
    "display" : "FNR",
    "definition" : "Fødselsnummer"
  },
  {
    "code" : "urn:oid:2.16.578.1.12.4.1.4.2",
    "display" : "DNR",
    "definition" : "D-nummer"
  },
  {
    "code" : "urn:oid:2.16.578.1.12.4.1.4.3",
    "display" : "FHNR",
    "definition" : "Felles hjelpenummer"
  }]
}

```
