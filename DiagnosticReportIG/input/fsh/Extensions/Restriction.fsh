Extension: Restriction
Id: nilar-restriction
Title: "Restriction"
Description: "Used on DiagnisticReport and Observation to convey a restriction. Not applicable for restrictions that apply to the requesting person, such restrictions results in the datat not being provided at all."
* value[x] 0..0
* extension contains RestrictUntil named restrictuntil 1..1 MS
* extension contains RestrictionCode named restrictioncode 1..1 MS