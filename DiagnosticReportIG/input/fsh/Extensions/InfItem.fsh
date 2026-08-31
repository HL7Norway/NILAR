Extension: InfItem
Id: nilar-inf-item
Title: "Inf Item"
Description: "Used on DiagnosticReport to convey clinical information relevant for correct interpretation of the results in the report."
* value[x] 0..0
* extension contains InfItemType named infitemtype 1..1 MS
* extension contains InfItemDescr named infitemdescr 0..1 MS
* extension contains Comment named comment 0..1 MS
* extension contains InfItemCodedDescr named infitemcodeddescr 0..1 MS
* extension contains InfItemStart named infitemstart 0..1 MS
* extension contains InfItemEnd named infitemend 0..1 MS
* extension contains InfItemOrgTime named infitemorgtime 0..1 MS

Extension: InfItemType
Id: nilar-inf-item-type
Title: "Inf Item Type"
Description: "Type of clinical information"
* value[x] only CodeableConcept
* value[x] 1..1
* valueCodeableConcept from InfItemType_VS

Extension: InfItemDescr
Id: nilar-inf-item-descr
Title: "Inf Item Descr"
Description: "Description of the clinical information."
* value[x] only string
* value[x] 1..1

Extension: InfItemCodedDescr
Id: nilar-inf-item-coded-descr
Title: "Inf Item Coded Descr"
Description: "Coded description of clinical information."
* value[x] only CodeableConcept
* value[x] 1..1
* valueCodeableConcept from InfItemCodedDescr_VS

Extension: InfItemStart
Id: nilar-inf-item-start
Title: "Inf Item Start"
Description: "Start time for clinical information."
* value[x] only dateTime
* value[x] 1..1

Extension: InfItemEnd
Id: nilar-inf-item-end
Title: "Inf Item End"
Description: "End time for clinical information."
* value[x] only dateTime
* value[x] 1..1

Extension: InfItemOrgTime
Id: nilar-inf-item-org-time
Title: "Inf Item Org Time"
Description: "Time of recording the clinical information."
* value[x] only dateTime
* value[x] 1..1
