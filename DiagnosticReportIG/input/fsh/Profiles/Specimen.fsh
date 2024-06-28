Profile: NilarSpecimen
Parent: Specimen
Id: nilar-specimen
Description: "Specimen as used in Nilar, referenced from NilarDiagnosticReport and NilarObservation."
* identifier ^definition = "External identifiers of the specimen. Generally not global, may be internal to a specific report or requester."
  * system MS
  * system from IdentifierSource_VS
  * value MS
* accessionIdentifier ^definition = "In Nilar this identifier is identical to identifier.IdByServiceProvider."
* accessionIdentifier 1..1
* type from SpecimenType_VS
* subject only Reference(Patient)
* subject MS
  * display MS
  * identifier MS
    * system from PublicIdType_VS
    * system MS
    * value MS
* collection 1..1
  * collector only Reference(PractitionerRole)
  * collected[x] only dateTime
  * collected[x] 1..1
  * extension contains Logistics named logistics 0..1
  * extension contains Comment named comment 0..*
  * extension[comment]
    * valueCodeableConcept from CollectorComment_VS
  * extension contains StudyProductType named studyproducttype 0..1
  * extension contains StudyProductRef named studyproductref 0..1
* container 0..1
  * additive[x] ^definition = "Material added to the specimen for preservation purposes. Pure text, no codesystem binding."
  * additive[x] only CodeableConcept
* extension contains Accredited named accredited 0..1
* extension contains Pretreatment named pretreatment 0..1
* extension contains ContainerCount named containercount 0..1
* extension contains SampleHandling named samplehandling 0..*