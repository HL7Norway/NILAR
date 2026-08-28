Extension: StructuredInfo
Id: nilar-structured-info
Title: "Structured Info"
Description: "Used on Observation to convey additional information."
* value[x] 0..0
* extension contains StructuredInfoType named structuredinfotype 1..1 MS
* extension contains StructuredInfoText named structuredinfotext 0..* MS
* extension contains StructuredInfoInteger named structuredinfointeger 0..* MS
* extension contains StructuredInfoPhysical named structuredinfophysical 0..* MS
* extension contains StructuredInfoCoded named structuredinfocoded 0..* MS
* extension contains StructuredInfoBoolean named structuredinfoboolean 0..* MS

Extension: StructuredInfoType
Id: nilar-structured-info-type
Title: "Structured Info Type"
Description: "Type of information."
* value[x] only CodeableConcept

Extension: StructuredInfoText
Id: nilar-structured-info-text
Title: "Structured Info Text"
Description: "Textual information."
* value[x] only string

Extension: StructuredInfoInteger
Id: nilar-structured-info-integer
Title: "Structured Info Integer"
Description: "Integer information."
* value[x] only integer

Extension: StructuredInfoPhysical
Id: nilar-structured-info-physical
Title: "Structured Info Physical"
Description: "Physical information."
* value[x] only Quantity

Extension: StructuredInfoCoded
Id: nilar-structured-info-coded
Title: "Structured Info Coded"
Description: "Coded information."
* value[x] only CodeableConcept

Extension: StructuredInfoBoolean
Id: nilar-structured-info-boolean
Title: "Structured Info Boolean"
Description: "Boolean information."
* value[x] only boolean
