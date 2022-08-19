Profile: ObservationNilar
Parent: Observation
Description: "Observation as used in Nilar, referenced from DiagnosticReportNilar."
* basedOn 0..0
* partOf 0..0
* status from ObservationStatus_VS
* category from Expertise_VS
* category 0..1
* code from InvestigationId_VS
* subject only Reference(Patient)
* subject 1..1
* focus 0..0
* encounter 0..0
* effective[x] only dateTime
* performer only Reference(PractitionerRole)
* value[x] only Quantity or CodeableConcept or dateTime or Range
* valueCodeableConcept from ObservationResult_VS
* dataAbsentReason 0..0
* interpretation 0..1
* interpretation from DeviationIndicator_VS
* bodySite 0..0
* method from InvestigationSpec_VS
* device 0..0
* referenceRange
  * type 0..0
  * appliesTo 0..0
  * age 0..0
* hasMember only Reference(Observation)
* derivedFrom 0..0
* component 0..0
* meta
  * versionId 0..0
  * lastUpdated 0..0
  * source 0..0
  * profile 0..0
  * security 0..0
  * tag from AllObservationCodes_VS
* extension contains Accredited named accredited 0..1
* extension contains DiagnosticReportRef named diagnosticreportref 1..1
* extension contains OtherInfo named otherinfo 0..*