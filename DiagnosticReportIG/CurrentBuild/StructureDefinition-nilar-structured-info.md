# Structured Info - v1.6.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Structured Info**

## Extension: Structured Info 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/StructureDefinition/nilar-structured-info | *Version*:1.6.0 |
| Active as of 2026-08-31 | *Computable Name*:StructuredInfo |

Used on Observation to convey additional information.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NilarObservation](StructureDefinition-nilar-observation.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/diagnostic.report.nilar|current/StructureDefinition/StructureDefinition-nilar-structured-info.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nilar-structured-info.csv), [Excel](StructureDefinition-nilar-structured-info.xlsx), [Schematron](StructureDefinition-nilar-structured-info.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nilar-structured-info",
  "url" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-structured-info",
  "version" : "1.6.0",
  "name" : "StructuredInfo",
  "title" : "Structured Info",
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
  "description" : "Used on Observation to convey additional information.",
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
      "short" : "Structured Info",
      "definition" : "Used on Observation to convey additional information."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "min" : 1
    },
    {
      "id" : "Extension.extension:structuredinfotype",
      "path" : "Extension.extension",
      "sliceName" : "structuredinfotype",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-structured-info-type"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:structuredinfotext",
      "path" : "Extension.extension",
      "sliceName" : "structuredinfotext",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-structured-info-text"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:structuredinfointeger",
      "path" : "Extension.extension",
      "sliceName" : "structuredinfointeger",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-structured-info-integer"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:structuredinfophysical",
      "path" : "Extension.extension",
      "sliceName" : "structuredinfophysical",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-structured-info-physical"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:structuredinfocoded",
      "path" : "Extension.extension",
      "sliceName" : "structuredinfocoded",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-structured-info-coded"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:structuredinfoboolean",
      "path" : "Extension.extension",
      "sliceName" : "structuredinfoboolean",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-structured-info-boolean"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-structured-info"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
