Profile: SpecimenNilar
Parent: Specimen
Description: "Specimen as used in Nilar, referenced from DiagnosticReportNilar and ObservationNilar."
* accessionIdentifier 1..1
* status 0..0
* type 
* subject only Reference(Patient)
* subject 1..1
* receivedTime 0..0
* parent 0..0
* request 0..0
* collection 1..1
  * collector only Reference(PractitionerRole)
  * collected[x] only dateTime
  * collected[x] 1..1
  * fastingStatus[x] 0..0
* processing 0..0
* container 0..1
  * identifier 0..0
  * description 0..0
  * type 0..0
  * capacity 0..0
  * specimenQuantity 0..0
  * additive[x] only CodeableConcept
* condition 0..0
* extension contains Accredited named accredited 0..1
* extension contains OtherInfo named otherinfo 0..*