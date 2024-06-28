Profile: NilarServiceRequest
Parent: ServiceRequest
Id: nilar-service-request
Description: "ServiceRecuest as used in Nilar, referenced from NilarDiagnosticReport."
* identifier ^definition = "External identifiers of the request. Generally not global, may be internal to a specific report or requester."
  * system MS
  * system from IdentifierSource_VS
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
* extension contains ReceiptDate named receiptdate 0..1
* extension contains PaymentCategory named paymentcategory 0..1
* extension contains Comment named comment 0..*
* extension[comment]
  * ^definition = "Each comment may have two codes. System '8234' represents a 'heading', any other code the actual comment as a coded text."
  * valueCodeableConcept from RequisitionComment_VS
* extension contains Reservation named reservation 0..*