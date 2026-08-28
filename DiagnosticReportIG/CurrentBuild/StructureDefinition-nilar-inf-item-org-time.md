# Inf Item Org Time - v1.5.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Inf Item Org Time**

## Extension: Inf Item Org Time 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-org-time | *Version*:1.5.0 |
| Active as of 2026-08-28 | *Computable Name*:InfItemOrgTime |

Time of recording the clinical information.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Inf Item](StructureDefinition-nilar-inf-item.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/diagnostic.report.nilar|current/StructureDefinition/StructureDefinition-nilar-inf-item-org-time.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nilar-inf-item-org-time.csv), [Excel](StructureDefinition-nilar-inf-item-org-time.xlsx), [Schematron](StructureDefinition-nilar-inf-item-org-time.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nilar-inf-item-org-time",
  "url" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-org-time",
  "version" : "1.5.0",
  "name" : "InfItemOrgTime",
  "title" : "Inf Item Org Time",
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
  "description" : "Time of recording the clinical information.",
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
      "short" : "Inf Item Org Time",
      "definition" : "Time of recording the clinical information."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-org-time"
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
