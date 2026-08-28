# NilarObservation - v1.5.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NilarObservation**

## Resource Profile: NilarObservation 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/StructureDefinition/nilar-observation | *Version*:1.5.0 |
| Active as of 2026-08-28 | *Computable Name*:NilarObservation |

 
Observation as used in Nilar, referenced from NilarDiagnosticReport. 

**Usages:**

* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/diagnostic.report.nilar|current/StructureDefinition/StructureDefinition-nilar-observation.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nilar-observation.csv), [Excel](StructureDefinition-nilar-observation.xlsx), [Schematron](StructureDefinition-nilar-observation.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nilar-observation",
  "url" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-observation",
  "version" : "1.5.0",
  "name" : "NilarObservation",
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
  "description" : "Observation as used in Nilar, referenced from NilarDiagnosticReport.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "sct-concept",
    "uri" : "http://snomed.info/conceptdomain",
    "name" : "SNOMED CT Concept Domain Binding"
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
    "identity" : "sct-attr",
    "uri" : "http://snomed.org/attributebinding",
    "name" : "SNOMED CT Attribute Binding"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Observation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.meta.tag",
      "path" : "Observation.meta.tag",
      "definition" : "Relevant searchable codes are located in various elements (code, value) depending on the type of investigation. They are all collected in tag for easier search. In hierachical sets of observations (hasMember) the codes may also be at various depth in the hierachy. All codes are in such cases collected in this element in the top-level observation. Hence a hit on a code in tag will always return a top-level observation, from which any hierarchy only needs to be nested inwards.",
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/all-observation-codes-vs"
      }
    },
    {
      "id" : "Observation.extension",
      "path" : "Observation.extension",
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
      "id" : "Observation.extension:accredited",
      "path" : "Observation.extension",
      "sliceName" : "accredited",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-accredited"]
      }]
    },
    {
      "id" : "Observation.extension:diagnosticreportref",
      "path" : "Observation.extension",
      "sliceName" : "diagnosticreportref",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-diagnostic-report-ref"]
      }]
    },
    {
      "id" : "Observation.extension:history",
      "path" : "Observation.extension",
      "sliceName" : "history",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-history"]
      }]
    },
    {
      "id" : "Observation.extension:investigationdate",
      "path" : "Observation.extension",
      "sliceName" : "investigationdate",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-investigation-date"]
      }]
    },
    {
      "id" : "Observation.extension:statuschangedate",
      "path" : "Observation.extension",
      "sliceName" : "statuschangedate",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-status-change-date"]
      }]
    },
    {
      "id" : "Observation.extension:countersigndate",
      "path" : "Observation.extension",
      "sliceName" : "countersigndate",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-counter-sign-date"]
      }]
    },
    {
      "id" : "Observation.extension:medicalvalidationdate",
      "path" : "Observation.extension",
      "sliceName" : "medicalvalidationdate",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-medical-validation-date"]
      }]
    },
    {
      "id" : "Observation.extension:descriptiondate",
      "path" : "Observation.extension",
      "sliceName" : "descriptiondate",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-description-date"]
      }]
    },
    {
      "id" : "Observation.extension:specification",
      "path" : "Observation.extension",
      "sliceName" : "specification",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-specification"]
      }]
    },
    {
      "id" : "Observation.extension:relatedobservation",
      "path" : "Observation.extension",
      "sliceName" : "relatedobservation",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-related-observation"]
      }]
    },
    {
      "id" : "Observation.identifier",
      "path" : "Observation.identifier",
      "definition" : "External identifiers of the observation. Generally not global, may be internal to a specific report."
    },
    {
      "id" : "Observation.identifier.system",
      "path" : "Observation.identifier.system",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/identifier-source-vs"
      }
    },
    {
      "id" : "Observation.identifier.value",
      "path" : "Observation.identifier.value",
      "mustSupport" : true
    },
    {
      "id" : "Observation.basedOn",
      "path" : "Observation.basedOn",
      "definition" : "The service request that instantiated the investigations and results of this observation.",
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/ServiceRequest"]
      }]
    },
    {
      "id" : "Observation.category",
      "path" : "Observation.category",
      "definition" : "Expertise (fagområde) for the investigation and value of this observation.",
      "max" : "1",
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/expertise-vs"
      }
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "definition" : "The investigations involved in this observation.",
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/investigation-id-vs"
      }
    },
    {
      "id" : "Observation.subject",
      "path" : "Observation.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.subject.identifier",
      "path" : "Observation.subject.identifier",
      "mustSupport" : true
    },
    {
      "id" : "Observation.subject.identifier.system",
      "path" : "Observation.subject.identifier.system",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/public-it-type-vs"
      }
    },
    {
      "id" : "Observation.subject.identifier.value",
      "path" : "Observation.subject.identifier.value",
      "mustSupport" : true
    },
    {
      "id" : "Observation.subject.display",
      "path" : "Observation.subject.display",
      "mustSupport" : true
    },
    {
      "id" : "Observation.effective[x]",
      "path" : "Observation.effective[x]",
      "definition" : "The date for which this observation is representative. Typically the collected date of the actual specimen, otherwise an explicit date of investigation (typically radiology). In rare cases no explicit date is available and it is then derived from other dates in the report.",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "Observation.performer",
      "path" : "Observation.performer",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }]
    },
    {
      "id" : "Observation.value[x]",
      "path" : "Observation.value[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      },
      "type" : [{
        "code" : "Quantity"
      },
      {
        "code" : "CodeableConcept"
      },
      {
        "code" : "Range"
      },
      {
        "code" : "dateTime"
      }]
    },
    {
      "id" : "Observation.value[x]:valueCodeableConcept",
      "path" : "Observation.value[x]",
      "sliceName" : "valueCodeableConcept",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/observation-result-vs"
      }
    },
    {
      "id" : "Observation.value[x]:valueQuantity",
      "path" : "Observation.value[x]",
      "sliceName" : "valueQuantity",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "Observation.value[x]:valueQuantity.code",
      "path" : "Observation.value[x].code",
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/units-of-measure-vs"
      }
    },
    {
      "id" : "Observation.interpretation",
      "path" : "Observation.interpretation",
      "max" : "1",
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/deviation-indicator-vs"
      }
    },
    {
      "id" : "Observation.method",
      "path" : "Observation.method",
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/investigation-spec-vs"
      }
    },
    {
      "id" : "Observation.hasMember",
      "path" : "Observation.hasMember",
      "definition" : "Some observations are presented as a hierachical set of observations. In these cases each observation may not contain any useful information in isolation. Such hierachical graphs must be presented and viewed as a whole to convey the full meaning as intended by the producer.",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Observation"]
      }]
    }]
  }
}

```
