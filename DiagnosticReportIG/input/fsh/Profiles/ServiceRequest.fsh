Profile: ServiceRequestNilar
Parent: ServiceRequest
Description: "ServiceRecuest as used in Nilar, referenced from DiagnosticReportNilar."
* instantiatesCanonical 0..0
* instantiatesUri 0..0
* basedOn 0..0
* replaces 0..0
* requisition 0..0
* category 0..0
* priority 0..0
* doNotPerform 0..0
* code 0..0
* orderDetail 0..0
* quantity[x] 0..0
* subject only Reference(Patient)
* encounter 0..0
* occurrence[x] 0..0
* asNeeded[x] 0..0
* requester only Reference(PractitionerRole)
* performerType 0..0
* performer 0..0
* locationCode 0..0
* locationReference 0..0
* reasonCode from RequestReason_VS
* reasonReference 0..0
* insurance 0..0
* supportingInfo 0..0
* specimen 0..0
* bodySite 0..0
* patientInstruction 0..0
* relevantHistory 0..0
* extension contains OtherInfo named otherinfo 0..*