# Status Changed Date - v1.6.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Status Changed Date**

## Extension: Status Changed Date 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/StructureDefinition/nilar-status-change-date | *Version*:1.6.0 |
| Active as of 2026-08-28 | *Computable Name*:StatusChangeDate |

Time of last state change.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NilarObservation](StructureDefinition-nilar-observation.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/diagnostic.report.nilar|current/StructureDefinition/StructureDefinition-nilar-status-change-date.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nilar-status-change-date.csv), [Excel](StructureDefinition-nilar-status-change-date.xlsx), [Schematron](StructureDefinition-nilar-status-change-date.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nilar-status-change-date",
  "url" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-status-change-date",
  "version" : "1.6.0",
  "name" : "StatusChangeDate",
  "title" : "Status Changed Date",
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
  "description" : "Time of last state change.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Element"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Status Changed Date",
      "definition" : "Time of last state change."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-status-change-date"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "dateTime"
      }]
    }]
  }
}

```
