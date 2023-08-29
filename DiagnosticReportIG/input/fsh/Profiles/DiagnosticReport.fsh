Profile: NilarDiagnosticReport
Parent: DiagnosticReport
Id: nilar-diagnostic-report
Description: "DiagnosticReport for use in Nilar to accomodate laboratory reports received using http://www.kith.no/xmlstds/labsvar/2012-02-15, v1.3 and v1.4."
* identifier ^definition = "External identifier of the report. Not global but should be unique within a laboratory."
  * system MS
  * system from IdentifierSource_VS
  * value MS
* basedOn ^definition = "The service request that instantiated the investigations and results contained in this report."
* basedOn only Reference(ServiceRequest)
* basedOn 0..1
* category ^definition = "Main expertise (hoved fagområde) for the content of this report."
* category from MainExpertise_VS
* category 1..1 MS
* code ^definition = "Type of report."
* code from TypeDiagnosticReport_VS
* subject only Reference(Patient)
* subject MS
  * display MS
  * identifier MS
    * system from PublicIdType_VS
    * system MS
    * value MS
* effective[x] ^definition = "The date for which the content of the report is representative. Since the report has multiple content this date may not be unique. This date therefore corresponds to the oldes effective found in the result."
* effective[x] only dateTime
* issued ^definition = "The date the report version was issued. Reports from labs has an IssueDate which represents the date of the first version and does not change in subsequent versions. Issued, representing the isse date of the version, is therefore derived from the message itself (GenDate)."
* issued MS
* performer only Reference(PractitionerRole)
* extension contains OtherInfo named otherinfo 0..*
* extension contains Comment named comment 0..*
* extension[comment]
  * valueCodeableConcept from ReportComment_VS
* extension contains ReportDate named reportdate 1..1 MS
* extension contains ApprovalDate named approvaldate 0..1
* extension contains Restriction named restriction 0..*
* extension contains InfItem named infitem 0..*