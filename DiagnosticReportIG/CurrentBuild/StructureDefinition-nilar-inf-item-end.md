# Inf Item End - v1.6.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Inf Item End**

## Extension: Inf Item End 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-end | *Version*:1.6.0 |
| Active as of 2026-08-28 | *Computable Name*:InfItemEnd |

End time for clinical information.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Inf Item](StructureDefinition-nilar-inf-item.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/diagnostic.report.nilar|current/StructureDefinition/StructureDefinition-nilar-inf-item-end.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nilar-inf-item-end.csv), [Excel](StructureDefinition-nilar-inf-item-end.xlsx), [Schematron](StructureDefinition-nilar-inf-item-end.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nilar-inf-item-end",
  "url" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-end",
  "version" : "1.6.0",
  "name" : "InfItemEnd",
  "title" : "Inf Item End",
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
  "description" : "End time for clinical information.",
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
      "short" : "Inf Item End",
      "definition" : "End time for clinical information."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-end"
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
