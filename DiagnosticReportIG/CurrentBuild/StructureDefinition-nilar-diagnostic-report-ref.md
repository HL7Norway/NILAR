# Diagnostic Report Ref - v1.6.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Diagnostic Report Ref**

## Extension: Diagnostic Report Ref 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/StructureDefinition/nilar-diagnostic-report-ref | *Version*:1.6.0 |
| Active as of 2026-08-28 | *Computable Name*:DiagnosticReportRef |

In Nilar the origin of observations is a report. This extension is used to create a reference form each observation back to the report of origin.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NilarObservation](StructureDefinition-nilar-observation.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/diagnostic.report.nilar|current/StructureDefinition/StructureDefinition-nilar-diagnostic-report-ref.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nilar-diagnostic-report-ref.csv), [Excel](StructureDefinition-nilar-diagnostic-report-ref.xlsx), [Schematron](StructureDefinition-nilar-diagnostic-report-ref.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nilar-diagnostic-report-ref",
  "url" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-diagnostic-report-ref",
  "version" : "1.6.0",
  "name" : "DiagnosticReportRef",
  "title" : "Diagnostic Report Ref",
  "status" : "active",
  "date" : "2026-08-28T12:17:39+00:00",
  "publisher" : "Norsk helsenett - Nilar",
  "contact" : [{
    "name" : "Norsk helsenett - Nilar",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.nhn.no"
    }]
  }],
  "description" : "In Nilar the origin of observations is a report. This extension is used to create a reference form each observation back to the report of origin.",
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
      "short" : "Diagnostic Report Ref",
      "definition" : "In Nilar the origin of observations is a report. This extension is used to create a reference form each observation back to the report of origin."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-diagnostic-report-ref"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/DiagnosticReport"]
      }]
    }]
  }
}

```
