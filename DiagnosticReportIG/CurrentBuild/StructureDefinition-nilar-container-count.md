# Container Count - v1.6.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Container Count**

## Extension: Container Count 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/StructureDefinition/nilar-container-count | *Version*:1.6.0 |
| Active as of 2026-08-28 | *Computable Name*:ContainerCount |

Number of containers or other devices related to a specimen sample.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NilarSpecimen](StructureDefinition-nilar-specimen.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/diagnostic.report.nilar|current/StructureDefinition/StructureDefinition-nilar-container-count.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nilar-container-count.csv), [Excel](StructureDefinition-nilar-container-count.xlsx), [Schematron](StructureDefinition-nilar-container-count.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nilar-container-count",
  "url" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-container-count",
  "version" : "1.6.0",
  "name" : "ContainerCount",
  "title" : "Container Count",
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
  "description" : "Number of containers or other devices related to a specimen sample.",
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
      "short" : "Container Count",
      "definition" : "Number of containers or other devices related to a specimen sample."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-container-count"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "integer"
      }]
    }]
  }
}

```
