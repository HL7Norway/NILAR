# Payment Category VS - v1.6.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Payment Category VS**

## ValueSet: Payment Category VS 

| | |
| :--- | :--- |
| *Official URL*:http://nhn.no/fhir/nilar/ValueSet/payment-category-vs | *Version*:1.6.0 |
| Active as of 2026-08-28 | *Computable Name*:PaymentCategory_VS |

 
Codes for who will pay for the investigations. 

 **References** 

* [Payment Category](StructureDefinition-nilar-payment-category.md)

### Logical Definition (CLD)

 

### Expansion

No Expansion for this valueset (Unknown Code System)

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "payment-category-vs",
  "url" : "http://nhn.no/fhir/nilar/ValueSet/payment-category-vs",
  "version" : "1.6.0",
  "name" : "PaymentCategory_VS",
  "title" : "Payment Category VS",
  "status" : "active",
  "date" : "2026-08-28T11:20:46+00:00",
  "publisher" : "Norsk helsenett - Nilar",
  "contact" : [{
    "name" : "Norsk helsenett - Nilar",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.nhn.no"
    }]
  }],
  "description" : "Codes for who will pay for the investigations.",
  "compose" : {
    "include" : [{
      "system" : "http://ehelse.no/fhir/CodeSystem/no-kodeverk-4101"
    }]
  }
}

```
