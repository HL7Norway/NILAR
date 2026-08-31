# Inf Item - v1.6.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Inf Item**

## Extension: Inf Item 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item | *Version*:1.6.0 |
| Active as of 2026-08-31 | *Computable Name*:InfItem |

Used on DiagnosticReport to convey clinical information relevant for correct interpretation of the results in the report.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NilarDiagnosticReport](StructureDefinition-nilar-diagnostic-report.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/diagnostic.report.nilar|current/StructureDefinition/StructureDefinition-nilar-inf-item.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nilar-inf-item.csv), [Excel](StructureDefinition-nilar-inf-item.xlsx), [Schematron](StructureDefinition-nilar-inf-item.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nilar-inf-item",
  "url" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item",
  "version" : "1.6.0",
  "name" : "InfItem",
  "title" : "Inf Item",
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
  "description" : "Used on DiagnosticReport to convey clinical information relevant for correct interpretation of the results in the report.",
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
      "short" : "Inf Item",
      "definition" : "Used on DiagnosticReport to convey clinical information relevant for correct interpretation of the results in the report."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "min" : 1
    },
    {
      "id" : "Extension.extension:infitemtype",
      "path" : "Extension.extension",
      "sliceName" : "infitemtype",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-type"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:infitemdescr",
      "path" : "Extension.extension",
      "sliceName" : "infitemdescr",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-descr"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:comment",
      "path" : "Extension.extension",
      "sliceName" : "comment",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-comment"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:infitemcodeddescr",
      "path" : "Extension.extension",
      "sliceName" : "infitemcodeddescr",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-coded-descr"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:infitemstart",
      "path" : "Extension.extension",
      "sliceName" : "infitemstart",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-start"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:infitemend",
      "path" : "Extension.extension",
      "sliceName" : "infitemend",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-end"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:infitemorgtime",
      "path" : "Extension.extension",
      "sliceName" : "infitemorgtime",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item-org-time"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
