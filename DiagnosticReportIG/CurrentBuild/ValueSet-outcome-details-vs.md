# Outcome Details VS - v1.6.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Outcome Details VS**

## ValueSet: Outcome Details VS 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/ValueSet/outcome-details-vs | *Version*:1.6.0 |
| Active as of 2026-08-31 | *Computable Name*:OutcomeDetails_VS |

 
A code that gives more details to the outcome, such as privacy settings. 

 **References** 

* [NilarOperationOutcome](StructureDefinition-nilar-operation-outcome.md)

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
  "id" : "outcome-details-vs",
  "url" : "http://nhn.no/fhir/nilar/ValueSet/outcome-details-vs",
  "version" : "1.6.0",
  "name" : "OutcomeDetails_VS",
  "title" : "Outcome Details VS",
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
  "description" : "A code that gives more details to the outcome, such as privacy settings.",
  "compose" : {
    "include" : [{
      "system" : "http://nhn.no/fhir/nilar/CodeSystem/pvk-outcome-cs"
    }]
  }
}

```
