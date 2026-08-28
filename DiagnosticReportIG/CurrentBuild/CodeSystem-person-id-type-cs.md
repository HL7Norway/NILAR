# Person Id Type CS - v1.6.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Person Id Type CS**

## CodeSystem: Person Id Type CS 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/CodeSystem/person-id-type-cs | *Version*:1.6.0 |
| Active as of 2026-08-28 | *Computable Name*:PersonIdType_CS |

 
Id types used to identify persons involved, other than the patient. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [Person Id Type VS](ValueSet-person-id-type-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "person-id-type-cs",
  "url" : "http://nhn.no/fhir/nilar/CodeSystem/person-id-type-cs",
  "version" : "1.6.0",
  "name" : "PersonIdType_CS",
  "title" : "Person Id Type CS",
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
  "description" : "Id types used to identify persons involved, other than the patient.",
  "content" : "complete",
  "count" : 3,
  "concept" : [{
    "code" : "urn:oid:2.16.578.1.12.4.1.4.4",
    "display" : "HPR",
    "definition" : "Helsepersonell-nummer"
  },
  {
    "code" : "urn:oid:2.16.578.1.12.4.1.2",
    "display" : "HER",
    "definition" : "HER-id"
  },
  {
    "code" : "urn:oid:2.16.578.1.12.4.1.4.5",
    "display" : "DUF",
    "definition" : "DUF-nummer"
  }]
}

```
