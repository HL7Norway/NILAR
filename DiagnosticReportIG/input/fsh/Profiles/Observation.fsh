Profile: NilarObservation
Parent: Observation
Id: nilar-observation
Description: "Observation as used in Nilar, referenced from NilarDiagnosticReport."
* identifier ^definition = "External identifiers of the observation. Generally not global, may be internal to a specific report."
  * system MS
  * system from IdentifierSource_VS
  * value MS
* basedOn ^definition = "The service request that instantiated the investigations and results of this observation."
* basedOn only Reference(ServiceRequest)
* basedOn 0..1
* category ^definition = "Expertise (fagområde) for the investigation and value of this observation."
* category from Expertise_VS
* category 0..1
* code ^definition = "The investigations involved in this observation."
* code from InvestigationId_VS
* subject only Reference(Patient)
* subject MS
  * display MS
  * identifier MS
    * system from PublicIdType_VS
    * system MS
    * value MS
* effective[x] ^definition = "The date for which this observation is representative. Typically the collected date of the actual specimen, otherwise an explicit date of investigation (typically radiology). In rare cases no explicit date is available and it is then derived from other dates in the report."
* effective[x] only dateTime
* performer only Reference(PractitionerRole)
* value[x] only Quantity or CodeableConcept or dateTime or Range
* valueCodeableConcept from ObservationResult_VS
* interpretation 0..1
* interpretation from DeviationIndicator_VS
* method from InvestigationSpec_VS
* hasMember ^definition = "Some observations are presented as a hierachical set of observations. In these cases each observation may not contain any useful information in isolation. Such hierachical graphs must be presented and viewed as a whole to convey the full meaning as intended by the producer."
* hasMember only Reference(Observation)
* meta
  * tag ^definition = "Relevant searchable codes are located in various elements (code, value) depending on the type of investigation. They are all collected in tag for easier search. In hierachical sets of observations (hasMember) the codes may also be at various depth in the hierachy. All codes are in such cases collected in this element in the top-level observation. Hence a hit on a code in tag will always return a top-level observation, from which any hierarchy only needs to be nested inwards."
  * tag from AllObservationCodes_VS
* extension contains Accredited named accredited 0..1
* extension contains DiagnosticReportRef named diagnosticreportref 1..1
* extension contains History named history 0..1
* extension contains OtherInfo named otherinfo 0..*
* extension contains InvestigationDate named investigationdate 0..1
* extension contains StatusChangeDate named statuschangedate 0..1
* extension contains CounterSignDate named countersigndate 0..1
* extension contains MedicalValidationDate named medicalvalidationdate 0..1
* extension contains DescriptionDate named descriptiondate 0..1