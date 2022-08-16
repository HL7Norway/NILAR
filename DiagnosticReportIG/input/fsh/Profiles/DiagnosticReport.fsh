Profile: DiagnosticReportNilar
Parent: DiagnosticReport
Description: "DiagnosticReport for use in Nilar to accomodate laboratory reports received using http://www.kith.no/xmlstds/labsvar/2012-02-15, v1.3 and v1.4."
* basedOn only Reference(ServiceRequest)
* basedOn 0..1
* category from MainExpertise_VS
* category 1..1
* code from TypeDiagnosticReport_VS
* subject only Reference(Patient)
* subject 1..1
* encounter 0..0
* effective[x] only dateTime
* issued 1..1
* performer only Reference(PractitionerRole)
* resultsInterpreter 0..0
* imagingStudy 0..0
* media 0..0
* conclusion 0..0
* conclusionCode 0..0
* presentedForm 0..0
* extension contains OtherInfo named otherinfo 0..*
* extension contains Comment named comment 0..*