# Inf Item Descr - v1.5.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Inf Item Descr**

## Extension: Inf Item Descr 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-descr | *Version*:1.5.0 |
| Active as of 2026-08-28 | *Computable Name*:InfItemDescr |

Description of the clinical information.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Inf Item](StructureDefinition-nilar-inf-item.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/diagnostic.report.nilar|current/StructureDefinition/StructureDefinition-nilar-inf-item-descr.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nilar-inf-item-descr.csv), [Excel](StructureDefinition-nilar-inf-item-descr.xlsx), [Schematron](StructureDefinition-nilar-inf-item-descr.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nilar-inf-item-descr",
  "url" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-descr",
  "version" : "1.5.0",
  "name" : "InfItemDescr",
  "title" : "Inf Item Descr",
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
  "description" : "Description of the clinical information.",
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
      "short" : "Inf Item Descr",
      "definition" : "Description of the clinical information."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-descr"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
