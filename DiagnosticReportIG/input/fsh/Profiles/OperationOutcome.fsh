Profile: NilarOperationOutcome
Parent: OperationOutcome
Id: nilar-operation-outcome
Description: "OperationOutcome used to bring feedback to client. It has some particular used for informing about privacy settings that might influence query results."
* issue.diagnostics ^definition = "Short description of the cause of the outcome."
* issue.details from OutcomeDetails_VS
* issue.details ^definition = "Currently only used when outcome is affected by privacy (PVK) settings. In other cases no details or only details.text may be used."