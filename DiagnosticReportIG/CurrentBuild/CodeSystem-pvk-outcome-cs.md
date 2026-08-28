# Pvk Outcome CS - v1.5.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Pvk Outcome CS**

## CodeSystem: Pvk Outcome CS 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/CodeSystem/pvk-outcome-cs | *Version*:1.5.0 |
| Active as of 2026-08-28 | *Computable Name*:PvkOutcome_CS |

 
A code that indicates how privacy settings (PVK) may have affected the outcome. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [Outcome Details VS](ValueSet-outcome-details-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "pvk-outcome-cs",
  "url" : "http://nhn.no/fhir/nilar/CodeSystem/pvk-outcome-cs",
  "version" : "1.5.0",
  "name" : "PvkOutcome_CS",
  "title" : "Pvk Outcome CS",
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
  "description" : "A code that indicates how privacy settings (PVK) may have affected the outcome.",
  "content" : "complete",
  "count" : 3,
  "concept" : [{
    "code" : "Specific",
    "display" : "SpecificBlock",
    "definition" : "A restriction exist for the actual health care provider, preventing access to all data for the person."
  },
  {
    "code" : "General",
    "display" : "GeneralBlock",
    "definition" : "A restriction exist for all health care providers, preventing access to all data for the person."
  },
  {
    "code" : "Reservation",
    "display" : "Reservation",
    "definition" : "The person has a reservatioan against being recorded and hence no data is available."
  }]
}

```
