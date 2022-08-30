Profile: NilarServiceRequest
Parent: ServiceRequest
Description: "ServiceRecuest as used in Nilar, referenced from NilarDiagnosticReport."
* identifier ^definition = "External identifiers of the request. Generally not global, may be internal to a specific report or requester."
  * system MS
  * system from IdProvider_VS
  * value MS
* subject only Reference(Patient)
* subject MS
  * display MS
  * identifier MS
    * system from PublicIdType_VS
    * system MS
    * value MS
* requester ^definition = "The person and/or organization responsible for the request. Typically the doctor in charge of the patient (e.g. fastlege)."
* requester only Reference(PractitionerRole)
* reasonCode ^definition = "Codes and/or text ientifying the reason for making the request."
* reasonCode from RequestReason_VS
* specimen ^definition = "The specimens appended to the request."
* extension contains OtherInfo named otherinfo 0..*