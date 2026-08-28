# Artifacts Summary - v1.5.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [NilarDiagnosticReport](StructureDefinition-nilar-diagnostic-report.md) | DiagnosticReport for use in Nilar to accomodate laboratory reports received using http://www.kith.no/xmlstds/labsvar/2012-02-15, v1.3 and v1.4. |
| [NilarObservation](StructureDefinition-nilar-observation.md) | Observation as used in Nilar, referenced from NilarDiagnosticReport. |
| [NilarOperationOutcome](StructureDefinition-nilar-operation-outcome.md) | OperationOutcome used to bring feedback to client. It has some particular used for informing about privacy settings that might influence query results. |
| [NilarPractitionerRole](StructureDefinition-nilar-practitioner-role.md) | PractitionerRole as used in Nilar. Used to combine actors of type Practitioner and Organization. Practitioner and Organization are referenced by their Identifier. |
| [NilarServiceRequest](StructureDefinition-nilar-service-request.md) | ServiceRecuest as used in Nilar, referenced from NilarDiagnosticReport. |
| [NilarSpecimen](StructureDefinition-nilar-specimen.md) | Specimen as used in Nilar, referenced from NilarDiagnosticReport and NilarObservation. |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Accredited](StructureDefinition-nilar-accredited.md) | Used to indicate if the party involved has accreditation for aquiring the specimen or perfoing the analysis in question. |
| [Approval Date](StructureDefinition-nilar-approval-date.md) | Time diagnostic report was approved. |
| [Comment](StructureDefinition-nilar-comment.md) | This extension is intended to add an element similar to 'Note' in resources that do not have Note. |
| [Container Count](StructureDefinition-nilar-container-count.md) | Number of containers or other devices related to a specimen sample. |
| [Counter Sign Date](StructureDefinition-nilar-counter-sign-date.md) | Time the investigation was counter signed. |
| [Description Date](StructureDefinition-nilar-description-date.md) | Time for description of image-based investigation. |
| [Diagnostic Report Ref](StructureDefinition-nilar-diagnostic-report-ref.md) | In Nilar the origin of observations is a report. This extension is used to create a reference form each observation back to the report of origin. |
| [History](StructureDefinition-nilar-history.md) | Indicates if an observation (or possibly awhole report) is 'history', i.e. a copy/repetition af information sent previously. |
| [Inf Item](StructureDefinition-nilar-inf-item.md) | Used on DiagnosticReport to convey clinical information relevant for correct interpretation of the results in the report. |
| [Inf Item Coded Descr](StructureDefinition-nilar-inf-item-coded-descr.md) | Coded description of clinical information. |
| [Inf Item Descr](StructureDefinition-nilar-inf-item-descr.md) | Description of the clinical information. |
| [Inf Item End](StructureDefinition-nilar-inf-item-end.md) | End time for clinical information. |
| [Inf Item Org Time](StructureDefinition-nilar-inf-item-org-time.md) | Time of recording the clinical information. |
| [Inf Item Start](StructureDefinition-nilar-inf-item-start.md) | Start time for clinical information. |
| [Inf Item Type](StructureDefinition-nilar-inf-item-type.md) | Type of clinical information |
| [Investigation Date](StructureDefinition-nilar-investigation-date.md) | Time the investigation was performed. |
| [Logistics](StructureDefinition-nilar-logistics.md) | How the sample is being sent. |
| [Medical Validation Date](StructureDefinition-nilar-medical-validation-date.md) | Time of medical validation of the investigation. |
| [Payment Category](StructureDefinition-nilar-payment-category.md) | Who pays for these investigations. |
| [Pretreatment](StructureDefinition-nilar-pretreatment.md) | Specifies pretreatment of patient from which specimen is sampled. |
| [Receipt Date](StructureDefinition-nilar-receipt-date.md) | Time the request was received. |
| [Related Observation](StructureDefinition-nilar-related-observation.md) | Reference to related Observation. |
| [Report Date](StructureDefinition-nilar-report-date.md) | Time this report was first published (first version). |
| [Reservation](StructureDefinition-nilar-reservation.md) | Reservations the patient might have, regarding registration etc. |
| [Sample Handling](StructureDefinition-nilar-sample-handling.md) | Precausions or warnings regarding handling of the specimen sample. |
| [Specification](StructureDefinition-nilar-specification.md) | This extension is used to convey further specification about an object. |
| [Status Changed Date](StructureDefinition-nilar-status-change-date.md) | Time of last state change. |
| [Study Product Ref](StructureDefinition-nilar-study-product-ref.md) | Reference to product being studied. |
| [Study Product Type](StructureDefinition-nilar-study-product-type.md) | Type of studied product. |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [All Observation Codes VS](ValueSet-all-observation-codes-vs.md) | All codes found in investigation or result. Used in Observation.meta.tag where all codes are accumulated for easy search. |
| [Collector Comment VS](ValueSet-collector-comment-vs.md) | Coded comments from collector of sample. |
| [Deviation Indicator VS](ValueSet-deviation-indicator-vs.md) | Indicates if a numeric observation value is ouside reference boundaries. |
| [Document Restriction VS](ValueSet-document-restriction-vs.md) | Codes with furtehr information about a document restriction. |
| [Expertise ValueSet](ValueSet-expertise-vs.md) | Expertise of investigation used in producing an Observation. |
| [Identifier Source VS](ValueSet-identifier-source-vs.md) | Various resources has one or two identifiers, provided by requester or service provider. These are the naming systems used to identify the origin of the identifiers. |
| [Inf Item Coded Descr VS](ValueSet-inf-item-coded-descr-vs.md) | Value set for coded description of clinical information. |
| [Inf Item Type VS](ValueSet-inf-item-type-vs.md) | Codes for type of clinical information. |
| [Investigation Id VS](ValueSet-investigation-id-vs.md) | Codes used to identify individual investigations leading up to an observation. |
| [Investigation Method VS](ValueSet-investigation-method-vs.md) | Codes used to specify method used in investigation. |
| [Investigation Spec VS](ValueSet-investigation-spec-vs.md) | Codes used to specify supplementary information about investigations. |
| [Main Expertise VS](ValueSet-main-expertise-vs.md) | The main type of labaratory expertise expressed in a DiagnosticReport. |
| [Observation Result VS](ValueSet-observation-result-vs.md) | Codes used to convey textual result values. |
| [Organization It Type VS](ValueSet-organization-it-type-vs.md) | Id types for organizations involved in DiagnosticReport/Observation |
| [Outcome Details VS](ValueSet-outcome-details-vs.md) | A code that gives more details to the outcome, such as privacy settings. |
| [Payment Category VS](ValueSet-payment-category-vs.md) | Codes for who will pay for the investigations. |
| [Person Id Type VS](ValueSet-person-id-type-vs.md) | Id types used to identify persons involved, other than the patient. |
| [Pretreatment-VS](ValueSet-pretreatment-vs.md) | Codes for pretreatment of patient from which specimen is sampled. |
| [PublicIdType_VS](ValueSet-public-it-type-vs.md) | Id types used to identify patients |
| [Report Comment VS](ValueSet-report-comment-vs.md) | Codes used for comments in diagnostic report. |
| [Request Reason VS](ValueSet-request-reason-vs.md) | Type of text reply, indicates reason for request. |
| [Requisition Comment VS](ValueSet-requisition-comment-vs.md) | Codes used in requsition comments. 8234 represents 'heading', 8274 reresents coded text. |
| [Reservation Codes](ValueSet-reservation-codes-vs.md) | Reservations the patient might have, regarding registration etc. |
| [Specimen Type VS](ValueSet-specimen-type-vs.md) | Type og material in specimen. |
| [Type of diagnostic report](ValueSet-typeof-diagnostic-report-vs.md) | Type of diagnostic report, indication the kind of tests/procedures performed in a DiagnosticReport. |
| [Units of measure VS](ValueSet-units-of-measure-vs.md) | Unified Code for Units of Measure (UCUM). |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Identifier Source CS](CodeSystem-identifier-source-cs.md) | Various resources has one or two identifiers, provided by requester or service provider. These are naming systems used to identify the origin of the identifiers. |
| [Organization Id Type CS](CodeSystem-organization-id-type-cs.md) | Id types used to identify organizations. |
| [Person Id Type CS](CodeSystem-person-id-type-cs.md) | Id types used to identify persons involved, other than the patient. |
| [Public Id Type CS](CodeSystem-public-id-type-cs.md) | Id types used to identify patients |
| [Pvk Outcome CS](CodeSystem-pvk-outcome-cs.md) | A code that indicates how privacy settings (PVK) may have affected the outcome. |

