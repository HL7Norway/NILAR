# Identifier Source CS - v1.6.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Identifier Source CS**

## CodeSystem: Identifier Source CS 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/CodeSystem/identifier-source-cs | *Version*:1.6.0 |
| Active as of 2026-08-31 | *Computable Name*:IdentifierSource_CS |

 
Various resources has one or two identifiers, provided by requester or service provider. These are naming systems used to identify the origin of the identifiers. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [Identifier Source VS](ValueSet-identifier-source-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "identifier-source-cs",
  "url" : "http://nhn.no/fhir/nilar/CodeSystem/identifier-source-cs",
  "version" : "1.6.0",
  "name" : "IdentifierSource_CS",
  "title" : "Identifier Source CS",
  "status" : "active",
  "date" : "2026-08-31T14:07:19+00:00",
  "publisher" : "Norsk helsenett - Nilar",
  "contact" : [{
    "name" : "Norsk helsenett - Nilar",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.nhn.no"
    }]
  }],
  "description" : "Various resources has one or two identifiers, provided by requester or service provider. These are naming systems used to identify the origin of the identifiers.",
  "content" : "complete",
  "count" : 7,
  "concept" : [{
    "code" : "MsgId",
    "display" : "MessageId",
    "definition" : "Id for the message ('envelope') used to convey the report. Useful in some tracing scenarios."
  },
  {
    "code" : "ServReqId",
    "display" : "ServiceRequestId",
    "definition" : "Id of the service request, given by the requester."
  },
  {
    "code" : "ServReqIdByServProvider",
    "display" : "ServiceRequestIdByServiceProvider",
    "definition" : "Id of the service request, given by the service provider."
  },
  {
    "code" : "AnalysedSubjectId",
    "display" : "AnalysedSubjectId",
    "definition" : "Id of the analysed subbject (Spesimen), given by the requester."
  },
  {
    "code" : "AnalysedSubjectIdByRequester",
    "display" : "AnalysedSubjectIdByServiceProvider",
    "definition" : "Id of the analysed subbject (Spesimen), given by the service provider."
  },
  {
    "code" : "ServReportId",
    "display" : "ServiceReportId",
    "definition" : "Id of the ServReport (DiagnosticReport), always given by service provider."
  },
  {
    "code" : "ResultItemId",
    "display" : "ResultItemId",
    "definition" : "Id of the ServReport (DiagnosticReport), always given by service provider."
  }]
}

```
