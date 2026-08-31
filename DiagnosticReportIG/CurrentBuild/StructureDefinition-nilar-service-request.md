# NilarServiceRequest - v1.6.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NilarServiceRequest**

## Resource Profile: NilarServiceRequest 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/StructureDefinition/nilar-service-request | *Version*:1.6.0 |
| Active as of 2026-08-31 | *Computable Name*:NilarServiceRequest |

 
ServiceRecuest as used in Nilar, referenced from NilarDiagnosticReport. 

**Usages:**

* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/diagnostic.report.nilar|current/StructureDefinition/StructureDefinition-nilar-service-request.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nilar-service-request.csv), [Excel](StructureDefinition-nilar-service-request.xlsx), [Schematron](StructureDefinition-nilar-service-request.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nilar-service-request",
  "url" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-service-request",
  "version" : "1.6.0",
  "name" : "NilarServiceRequest",
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
  "description" : "ServiceRecuest as used in Nilar, referenced from NilarDiagnosticReport.",
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
  },
  {
    "identity" : "quick",
    "uri" : "http://siframework.org/cqf",
    "name" : "Quality Improvement and Clinical Knowledge (QUICK)"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "ServiceRequest",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/ServiceRequest",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "ServiceRequest",
      "path" : "ServiceRequest"
    },
    {
      "id" : "ServiceRequest.extension",
      "path" : "ServiceRequest.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "ServiceRequest.extension:receiptdate",
      "path" : "ServiceRequest.extension",
      "sliceName" : "receiptdate",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-receipt-date"]
      }]
    },
    {
      "id" : "ServiceRequest.extension:paymentcategory",
      "path" : "ServiceRequest.extension",
      "sliceName" : "paymentcategory",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-payment-category"]
      }]
    },
    {
      "id" : "ServiceRequest.extension:comment",
      "path" : "ServiceRequest.extension",
      "sliceName" : "comment",
      "definition" : "Each comment may have two codes. System '8234' represents a 'heading', any other code the actual comment as a coded text.",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-comment"]
      }]
    },
    {
      "id" : "ServiceRequest.extension:comment.value[x]",
      "path" : "ServiceRequest.extension.value[x]",
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
      "id" : "ServiceRequest.extension:comment.value[x]:valueCodeableConcept",
      "path" : "ServiceRequest.extension.value[x]",
      "sliceName" : "valueCodeableConcept",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/requisition-comment-vs"
      }
    },
    {
      "id" : "ServiceRequest.extension:reservation",
      "path" : "ServiceRequest.extension",
      "sliceName" : "reservation",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-reservation"]
      }]
    },
    {
      "id" : "ServiceRequest.identifier",
      "path" : "ServiceRequest.identifier",
      "definition" : "External identifiers of the request. Generally not global, may be internal to a specific report or requester."
    },
    {
      "id" : "ServiceRequest.identifier.system",
      "path" : "ServiceRequest.identifier.system",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/identifier-source-vs"
      }
    },
    {
      "id" : "ServiceRequest.identifier.value",
      "path" : "ServiceRequest.identifier.value",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.subject",
      "path" : "ServiceRequest.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.subject.identifier",
      "path" : "ServiceRequest.subject.identifier",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.subject.identifier.system",
      "path" : "ServiceRequest.subject.identifier.system",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/public-it-type-vs"
      }
    },
    {
      "id" : "ServiceRequest.subject.identifier.value",
      "path" : "ServiceRequest.subject.identifier.value",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.subject.display",
      "path" : "ServiceRequest.subject.display",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.requester",
      "path" : "ServiceRequest.requester",
      "definition" : "The person and/or organization responsible for the request. Typically the doctor in charge of the patient (e.g. fastlege).",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }]
    },
    {
      "id" : "ServiceRequest.reasonCode",
      "path" : "ServiceRequest.reasonCode",
      "definition" : "Codes and/or text ientifying the reason for making the request.",
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/request-reason-vs"
      }
    },
    {
      "id" : "ServiceRequest.specimen",
      "path" : "ServiceRequest.specimen",
      "definition" : "The specimens appended to the request."
    }]
  }
}

```
