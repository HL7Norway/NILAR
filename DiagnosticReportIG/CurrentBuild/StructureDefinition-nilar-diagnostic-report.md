# NilarDiagnosticReport - v1.6.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NilarDiagnosticReport**

## Resource Profile: NilarDiagnosticReport 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/StructureDefinition/nilar-diagnostic-report | *Version*:1.6.0 |
| Active as of 2026-08-28 | *Computable Name*:NilarDiagnosticReport |

 
DiagnosticReport for use in Nilar to accomodate laboratory reports received using http://www.kith.no/xmlstds/labsvar/2012-02-15, v1.3 and v1.4. 

**Usages:**

* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/diagnostic.report.nilar|current/StructureDefinition/StructureDefinition-nilar-diagnostic-report.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nilar-diagnostic-report.csv), [Excel](StructureDefinition-nilar-diagnostic-report.xlsx), [Schematron](StructureDefinition-nilar-diagnostic-report.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nilar-diagnostic-report",
  "url" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-diagnostic-report",
  "version" : "1.6.0",
  "name" : "NilarDiagnosticReport",
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
  "description" : "DiagnosticReport for use in Nilar to accomodate laboratory reports received using http://www.kith.no/xmlstds/labsvar/2012-02-15, v1.3 and v1.4.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "DiagnosticReport",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/DiagnosticReport",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "DiagnosticReport",
      "path" : "DiagnosticReport"
    },
    {
      "id" : "DiagnosticReport.extension",
      "path" : "DiagnosticReport.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "DiagnosticReport.extension:comment",
      "path" : "DiagnosticReport.extension",
      "sliceName" : "comment",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-comment"]
      }]
    },
    {
      "id" : "DiagnosticReport.extension:comment.value[x]",
      "path" : "DiagnosticReport.extension.value[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "DiagnosticReport.extension:comment.value[x]:valueCodeableConcept",
      "path" : "DiagnosticReport.extension.value[x]",
      "sliceName" : "valueCodeableConcept",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/report-comment-vs"
      }
    },
    {
      "id" : "DiagnosticReport.extension:reportdate",
      "path" : "DiagnosticReport.extension",
      "sliceName" : "reportdate",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-report-date"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.extension:approvaldate",
      "path" : "DiagnosticReport.extension",
      "sliceName" : "approvaldate",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-approval-date"]
      }]
    },
    {
      "id" : "DiagnosticReport.extension:infitem",
      "path" : "DiagnosticReport.extension",
      "sliceName" : "infitem",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-inf-item"]
      }]
    },
    {
      "id" : "DiagnosticReport.identifier",
      "path" : "DiagnosticReport.identifier",
      "definition" : "External identifier of the report. Not global but should be unique within a laboratory."
    },
    {
      "id" : "DiagnosticReport.identifier.system",
      "path" : "DiagnosticReport.identifier.system",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/identifier-source-vs"
      }
    },
    {
      "id" : "DiagnosticReport.identifier.value",
      "path" : "DiagnosticReport.identifier.value",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.basedOn",
      "path" : "DiagnosticReport.basedOn",
      "definition" : "The service request that instantiated the investigations and results contained in this report.",
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/ServiceRequest"]
      }]
    },
    {
      "id" : "DiagnosticReport.category",
      "path" : "DiagnosticReport.category",
      "definition" : "Main expertise (hoved fagområde) for the content of this report.",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/main-expertise-vs"
      }
    },
    {
      "id" : "DiagnosticReport.code",
      "path" : "DiagnosticReport.code",
      "definition" : "Type of report.",
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/typeof-diagnostic-report-vs"
      }
    },
    {
      "id" : "DiagnosticReport.subject",
      "path" : "DiagnosticReport.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.subject.identifier",
      "path" : "DiagnosticReport.subject.identifier",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.subject.identifier.system",
      "path" : "DiagnosticReport.subject.identifier.system",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/public-it-type-vs"
      }
    },
    {
      "id" : "DiagnosticReport.subject.identifier.value",
      "path" : "DiagnosticReport.subject.identifier.value",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.subject.display",
      "path" : "DiagnosticReport.subject.display",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.effective[x]",
      "path" : "DiagnosticReport.effective[x]",
      "definition" : "The date for which the content of the report is representative. Since the report has multiple content this date may not be unique. This date therefore corresponds to the oldes effective found in the result.",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "DiagnosticReport.issued",
      "path" : "DiagnosticReport.issued",
      "definition" : "The date the report version was issued. Reports from labs has an IssueDate which represents the date of the first version and does not change in subsequent versions. Issued, representing the isse date of the version, is therefore derived from the message itself (GenDate).",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.performer",
      "path" : "DiagnosticReport.performer",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }]
    }]
  }
}

```
