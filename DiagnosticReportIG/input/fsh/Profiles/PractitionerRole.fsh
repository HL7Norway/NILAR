Profile: NilarPractitionerRole
Parent: PractitionerRole
Id: nilar-practitioner-role
Description: "PractitionerRole as used in Nilar. Used to combine actors of type Practitioner and Organization. Practitioner and Organization are referenced by their Identifier."
* practitioner ^definition = "Reference to Practitioner. May come from a direct mapping from or from a fallback in original message."
  * display MS
  * identifier MS
    * system from PersonIdType_VS
    * system MS
    * value MS
* organization ^definition = "Reference to Organization. May come from a direct mapping or from a fallback in the original message."
  * display MS
  * identifier MS
    * system from OrganizationItType_VS
    * system MS
    * value MS
* telecom ^definition = "Contact information from referenced Practitioner or Organization."
