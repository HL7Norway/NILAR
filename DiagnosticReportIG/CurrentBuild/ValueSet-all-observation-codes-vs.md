# All Observation Codes VS - v1.6.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **All Observation Codes VS**

## ValueSet: All Observation Codes VS 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/ValueSet/all-observation-codes-vs | *Version*:1.6.0 |
| Active as of 2026-08-28 | *Computable Name*:AllObservationCodes_VS |

 
All codes found in investigation or result. Used in Observation.meta.tag where all codes are accumulated for easy search. 

 **References** 

* [NilarObservation](StructureDefinition-nilar-observation.md)

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
  "id" : "all-observation-codes-vs",
  "url" : "http://nhn.no/fhir/nilar/ValueSet/all-observation-codes-vs",
  "version" : "1.6.0",
  "name" : "AllObservationCodes_VS",
  "title" : "All Observation Codes VS",
  "status" : "active",
  "date" : "2026-08-28T12:17:39+00:00",
  "publisher" : "Norsk helsenett - Nilar",
  "contact" : [{
    "name" : "Norsk helsenett - Nilar",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.nhn.no"
    }]
  }],
  "description" : "All codes found in investigation or result. Used in Observation.meta.tag where all codes are accumulated for easy search.",
  "compose" : {
    "include" : [{
      "valueSet" : ["http://nhn.no/fhir/nilar/ValueSet/investigation-id-vs"]
    },
    {
      "valueSet" : ["http://nhn.no/fhir/nilar/ValueSet/observation-result-vs"]
    }]
  }
}

```
