# NilarPractitionerRole - v1.6.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NilarPractitionerRole**

## Resource Profile: NilarPractitionerRole 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/StructureDefinition/nilar-practitioner-role | *Version*:1.6.0 |
| Active as of 2026-08-28 | *Computable Name*:NilarPractitionerRole |

 
PractitionerRole as used in Nilar. Used to combine actors of type Practitioner and Organization. Practitioner and Organization are referenced by their Identifier. 

**Usages:**

* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/diagnostic.report.nilar|current/StructureDefinition/StructureDefinition-nilar-practitioner-role.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nilar-practitioner-role.csv), [Excel](StructureDefinition-nilar-practitioner-role.xlsx), [Schematron](StructureDefinition-nilar-practitioner-role.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nilar-practitioner-role",
  "url" : "http://nhn.no/fhir/nilar/StructureDefinition/nilar-practitioner-role",
  "version" : "1.6.0",
  "name" : "NilarPractitionerRole",
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
  "description" : "PractitionerRole as used in Nilar. Used to combine actors of type Practitioner and Organization. Practitioner and Organization are referenced by their Identifier.",
  "fhirVersion" : "4.0.1",
  "kind" : "resource",
  "abstract" : false,
  "type" : "PractitionerRole",
  "baseDefinition" : "http://hl7.no/fhir/StructureDefinition/no-basis-PractitionerRole",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "PractitionerRole",
      "path" : "PractitionerRole"
    },
    {
      "id" : "PractitionerRole.practitioner",
      "path" : "PractitionerRole.practitioner",
      "definition" : "Reference to Practitioner. May come from a direct mapping from or from a fallback in original message."
    },
    {
      "id" : "PractitionerRole.practitioner.identifier",
      "path" : "PractitionerRole.practitioner.identifier",
      "mustSupport" : true
    },
    {
      "id" : "PractitionerRole.practitioner.identifier.system",
      "path" : "PractitionerRole.practitioner.identifier.system",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/person-id-type-vs"
      }
    },
    {
      "id" : "PractitionerRole.practitioner.identifier.value",
      "path" : "PractitionerRole.practitioner.identifier.value",
      "mustSupport" : true
    },
    {
      "id" : "PractitionerRole.practitioner.display",
      "path" : "PractitionerRole.practitioner.display",
      "mustSupport" : true
    },
    {
      "id" : "PractitionerRole.organization",
      "path" : "PractitionerRole.organization",
      "definition" : "Reference to Organization. May come from a direct mapping or from a fallback in the original message."
    },
    {
      "id" : "PractitionerRole.organization.identifier",
      "path" : "PractitionerRole.organization.identifier",
      "mustSupport" : true
    },
    {
      "id" : "PractitionerRole.organization.identifier.system",
      "path" : "PractitionerRole.organization.identifier.system",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://nhn.no/fhir/nilar/ValueSet/organization-it-type-vs"
      }
    },
    {
      "id" : "PractitionerRole.organization.identifier.value",
      "path" : "PractitionerRole.organization.identifier.value",
      "mustSupport" : true
    },
    {
      "id" : "PractitionerRole.organization.display",
      "path" : "PractitionerRole.organization.display",
      "mustSupport" : true
    },
    {
      "id" : "PractitionerRole.telecom",
      "path" : "PractitionerRole.telecom",
      "definition" : "Contact information from referenced Practitioner or Organization."
    }]
  }
}

```
