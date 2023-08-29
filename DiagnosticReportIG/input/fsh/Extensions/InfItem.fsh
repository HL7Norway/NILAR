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