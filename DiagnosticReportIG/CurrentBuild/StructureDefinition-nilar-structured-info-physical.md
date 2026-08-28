# Structured Info Physical - v1.6.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Structured Info Physical**

## Extension: Structured Info Physical 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/StructureDefinition/nilar-structured-info-physical | *Version*:1.6.0 |
| Active as of 2026-08-28 | *Computable Name*:StructuredInfoPhysical |

Physical information.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Structured Info](StructureDefinition-nilar-structured-info.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/diagnostic.report.nilar|current/StructureDefinition/StructureDefinition-nilar-structured-info-physical.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nilar-structured-info-physical.csv), [Excel](StructureDefinition-nilar-structured-info-physical.xlsx), [Schematron](StructureDefinition-nilar-structured-info-physical.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nilar-structured-info-physical",
  "url" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-structured-info-physical",
  "version" : "1.6.0",
  "name" : "StructuredInfoPhysical",
  "title" : "Structured Info Physical",
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
  "description" : "Physical information.",
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
      "short" : "Structured Info Physical",
      "definition" : "Physical information."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-structured-info-physical"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "Quantity"
      }]
    }]
  }
}

```
