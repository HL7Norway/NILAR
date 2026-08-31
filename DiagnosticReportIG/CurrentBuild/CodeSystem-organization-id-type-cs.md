# Organization Id Type CS - v1.6.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Organization Id Type CS**

## CodeSystem: Organization Id Type CS 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/CodeSystem/organization-id-type-cs | *Version*:1.6.0 |
| Active as of 2026-08-31 | *Computable Name*:OrganizationIdType_CS |

 
Id types used to identify organizations. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [Organization It Type VS](ValueSet-organization-it-type-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "organization-id-type-cs",
  "url" : "http://nhn.no/fhir/nilar/CodeSystem/organization-id-type-cs",
  "version" : "1.6.0",
  "name" : "OrganizationIdType_CS",
  "title" : "Organization Id Type CS",
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
  "description" : "Id types used to identify organizations.",
  "content" : "complete",
  "count" : 4,
  "concept" : [{
    "code" : "urn:oid:2.16.578.1.12.4.1.2",
    "display" : "HER",
    "definition" : "HER-id"
  },
  {
    "code" : "urn:oid:2.16.578.1.12.4.1.4.101",
    "display" : "ENH",
    "definition" : "Enhetsregisteret - Brønnøysund"
  },
  {
    "code" : "urn:oid:2.16.578.1.12.4.1.4.102",
    "display" : "RESH",
    "definition" : "enheter i spesialisthelsetjenesten"
  },
  {
    "code" : "urn:oid:2.16.578.1.12.4.1.4.107",
    "display" : "AKO",
    "definition" : "Apotekenes konsesjonsnummer"
  }]
}

```
