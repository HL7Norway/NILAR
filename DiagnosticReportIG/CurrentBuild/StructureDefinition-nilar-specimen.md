# NilarSpecimen - v1.6.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NilarSpecimen**

## Resource Profile: NilarSpecimen 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/StructureDefinition/nilar-specimen | *Version*:1.6.0 |
| Active as of 2026-08-28 | *Computable Name*:NilarSpecimen |

 
Specimen as used in Nilar, referenced from NilarDiagnosticReport and NilarObservation. 

**Usages:**

* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/diagnostic.report.nilar|current/StructureDefinition/StructureDefinition-nilar-specimen.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nilar-specimen.csv), [Excel](StructureDefinition-nilar-specimen.xlsx), [Schematron](StructureDefinition-nilar-specimen.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nilar-specimen",
  "url" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-specimen",
  "version" : "1.6.0",
  "name" : "NilarSpecimen",
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
  "description" : "Specimen as used in Nilar, referenced from NilarDiagnosticReport and NilarObservation.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
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
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Specimen",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Specimen",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Specimen",
      "path" : "Specimen"
    },
    {
      "id" : "Specimen.extension",
      "path" : "Specimen.extension",
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
      "id" : "Specimen.extension:accredited",
      "path" : "Specimen.extension",
      "sliceName" : "accredited",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-accredited"]
      }]
    },
    {
      "id" : "Specimen.extension:pretreatment",
      "path" : "Specimen.extension",
      "sliceName" : "pretreatment",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-pretreatment"]
      }]
    },
    {
      "id" : "Specimen.extension:containercount",
      "path" : "Specimen.extension",
      "sliceName" : "containercount",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-container-count"]
      }]
    },
    {
      "id" : "Specimen.extension:samplehandling",
      "path" : "Specimen.extension",
      "sliceName" : "samplehandling",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-sample-handling"]
      }]
    },
    {
      "id" : "Specimen.identifier",
      "path" : "Specimen.identifier",
      "definition" : "External identifiers of the specimen. Generally not global, may be internal to a specific report or requester."
    },
    {
      "id" : "Specimen.identifier.system",
      "path" : "Specimen.identifier.system",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/identifier-source-vs"
      }
    },
    {
      "id" : "Specimen.identifier.value",
      "path" : "Specimen.identifier.value",
      "mustSupport" : true
    },
    {
      "id" : "Specimen.accessionIdentifier",
      "path" : "Specimen.accessionIdentifier",
      "definition" : "In Nilar this identifier is identical to identifier.IdByServiceProvider.",
      "min" : 1
    },
    {
      "id" : "Specimen.type",
      "path" : "Specimen.type",
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/specimen-type-vs"
      }
    },
    {
      "id" : "Specimen.subject",
      "path" : "Specimen.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Specimen.subject.identifier",
      "path" : "Specimen.subject.identifier",
      "mustSupport" : true
    },
    {
      "id" : "Specimen.subject.identifier.system",
      "path" : "Specimen.subject.identifier.system",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/public-it-type-vs"
      }
    },
    {
      "id" : "Specimen.subject.identifier.value",
      "path" : "Specimen.subject.identifier.value",
      "mustSupport" : true
    },
    {
      "id" : "Specimen.subject.display",
      "path" : "Specimen.subject.display",
      "mustSupport" : true
    },
    {
      "id" : "Specimen.collection",
      "path" : "Specimen.collection",
      "min" : 1
    },
    {
      "id" : "Specimen.collection.extension",
      "path" : "Specimen.collection.extension",
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
      "id" : "Specimen.collection.extension:logistics",
      "path" : "Specimen.collection.extension",
      "sliceName" : "logistics",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-logistics"]
      }]
    },
    {
      "id" : "Specimen.collection.extension:comment",
      "path" : "Specimen.collection.extension",
      "sliceName" : "comment",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-comment"]
      }]
    },
    {
      "id" : "Specimen.collection.extension:comment.value[x]",
      "path" : "Specimen.collection.extension.value[x]",
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
      "id" : "Specimen.collection.extension:comment.value[x]:valueCodeableConcept",
      "path" : "Specimen.collection.extension.value[x]",
      "sliceName" : "valueCodeableConcept",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/collector-comment-vs"
      }
    },
    {
      "id" : "Specimen.collection.extension:studyproducttype",
      "path" : "Specimen.collection.extension",
      "sliceName" : "studyproducttype",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-study-product-type"]
      }]
    },
    {
      "id" : "Specimen.collection.extension:studyproductref",
      "path" : "Specimen.collection.extension",
      "sliceName" : "studyproductref",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://nhn.no/fhir/nilar/StructureDefinition/nilar-study-product-ref"]
      }]
    },
    {
      "id" : "Specimen.collection.collector",
      "path" : "Specimen.collection.collector",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PractitionerRole"]
      }]
    },
    {
      "id" : "Specimen.collection.collected[x]",
      "path" : "Specimen.collection.collected[x]",
      "min" : 1,
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "Specimen.container",
      "path" : "Specimen.container",
      "max" : "1"
    },
    {
      "id" : "Specimen.container.additive[x]",
      "path" : "Specimen.container.additive[x]",
      "definition" : "Material added to the specimen for preservation purposes. Pure text, no codesystem binding.",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    }]
  }
}

```
