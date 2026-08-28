# NilarOperationOutcome - v1.5.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NilarOperationOutcome**

## Resource Profile: NilarOperationOutcome 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/StructureDefinition/nilar-operation-outcome | *Version*:1.5.0 |
| Active as of 2026-08-28 | *Computable Name*:NilarOperationOutcome |

 
OperationOutcome used to bring feedback to client. It has some particular used for informing about privacy settings that might influence query results. 

**Usages:**

* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/diagnostic.report.nilar|current/StructureDefinition/StructureDefinition-nilar-operation-outcome.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nilar-operation-outcome.csv), [Excel](StructureDefinition-nilar-operation-outcome.xlsx), [Schematron](StructureDefinition-nilar-operation-outcome.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nilar-operation-outcome",
  "url" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-operation-outcome",
  "version" : "1.5.0",
  "name" : "NilarOperationOutcome",
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
  "description" : "OperationOutcome used to bring feedback to client. It has some particular used for informing about privacy settings that might influence query results.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "OperationOutcome",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/OperationOutcome",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "OperationOutcome",
      "path" : "OperationOutcome"
    },
    {
      "id" : "OperationOutcome.issue.details",
      "path" : "OperationOutcome.issue.details",
      "definition" : "Currently only used when outcome is affected by privacy (PVK) settings. In other cases no details or only details.text may be used.",
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/outcome-details-vs"
      }
    },
    {
      "id" : "OperationOutcome.issue.diagnostics",
      "path" : "OperationOutcome.issue.diagnostics",
      "definition" : "Short description of the cause of the outcome."
    }]
  }
}

```
