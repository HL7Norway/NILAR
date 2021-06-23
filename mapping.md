# Mapping fra XML til FHIR (R4)

### Hvordan lese dokumentet
I overskrift finner du objektnavn fra XML. I parantes har vi lagt navnet til FHIR ressurs som det i hovedsak mappes til (noen attributter hentes på tvers av XML dokument).
I noen av overskriftene har vi lag til en rolle som gir et hint om hvilken rolle ressursen har inn i FHIR ressursene. Et eksemple kan være rekvirent som brukes i Service Request.
Kolonnen "implementert" sier om vi har implementert dette i FHIR ressurser. "Delvis" betyr at det finnes en verdi, men at den ikke trenger å være endelig.
Vi oppdaterer dette etterhvert som vi får ting på plass i endepunktene.

Kolonnene value og attributes inneholder eksempelverdier fra en [svarmelding](https://www.github.com/hl7norway/NILAR/svarmelding.xml "svarmelding"). 

### Hvordan komme med tilbakemeldinger på dokumentet
Tilbakemeldinger på dokumentet kan sendes til nilar@nhn.no.

### Levetid på dokumentet
Dette dokumentet gjelder frem til vi får på plass profilering av FHIR ressursene. Vi antar at det vil være på plass i løpet av Q4 2021.


## ServReport (Diagnostic Report)
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| Type |  | V=SVAR_LAB | DN=Svarrapport-Laboratoriemedisin |  |  | DN=DiagnosticReport.category, V=DiagnosticReport.code | Volven=8279, Begynner med SVAR_... | Nei |
| MIGversion | v1.4 2012-02-15 |  |  |  |  |  |  |
| GenDate |  | V=2017-09-20T09:05:11 |  |  |  |  |  |
| MsgId | 01c59bd0-c6a5-11e6-9598-0800200c9a66 |  |  |  |  |  |  |
| ServReport |  |  |  |  |  |  |  |
| ServReport.ServType |  | V=N | DN=Ny |  |  | DiagnosticReport.status |  | Ja |
| ServReport.IssueDate |  | V=2017-09-20T09:04:10 |  |  |  |  |  |
| ServReport.Status |  | V=F | DN=Endelig rapport |  |  |  |  |
| ServReport.MsgDescr |  | V=CLIN | DN=Medisinsk biokjemi |  |  | DiagnosticReport.category | Volven=8202 | Ja, delvis |
| ServReport.ServProvId | 55b6344fc-a61d-4a67-95fe-7276613785ab |  |  |  |  | Denne+ServReport.ServProvider.HCP.Inst.Dept.Id |  | Nei |
| ServReport.Comment | Kontroll |  |  |  |  | Her må vi inn med en extention | Denne venter vi med | Nei (extention?) |

## ServReq (ServiceRequest)
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| ServReport.ServReq.IssueDate |  | V=2017-09-20 |  |  |  | ServiceRequest.authoredOn |  | Ja |
| ServReport.ServReq.Id | e312fde3-66aa-40da-bec7-26abf4d29e82 |  |  |  |  | DiagnosticReport.basedon, link til servicerequest, ServiceRequest.requisition |  | Ja |
| ServReport.ServReq.ReasonAsText |  |  |  |  |  |  |  |
| ServReport.ServReq.ReasonAsText.Heading |  | V="PROB" | DN="Aktuell problemstilling" |  |  | Volven=8231, ServiceRequest.reasonCode -> code |  | Nei |
| ServReport.ServReq.ReasonAsText.TextResultValue |  |  |  |  |  | ServiceRequest.reasonCode -> text |  | Nei |
| ServReport.ServReq.PaymentCat |  |  |  |  |  |  |  |

## Patient (Patient)
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| ServReport.Patient.Name | Hansen, Mats |  |  |  |  |  |  |
| ServReport.Patient.IdByServProvider | 10682609 |  |  |  |  |  |  |
| ServReport.Patient.OffId | 2412790228 |  |  |  |  |  |  |
| ServReport.Patient.TypeOffId |  | V=FNR | DN=Fødselsnummer |  |  |  |  |
| ServReport.Patient.ResponsibleHcp |  |  |  |  |  |  |  |
| ServReport.Patient.ResponsibleHcp.Relation |  | V=REK | DN=Rekvirent |  |  | ServiceRequest.requester |  | Nei |

## ResponsibleHcp (Practitionar, Rolle = 'rekvirent')
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| ServReport.Patient.ResponsibleHcp.HCP.Inst |  |  |  |  |  |  |  |
| ServReport.Patient.ResponsibleHcp.HCP.Inst.Name | Kattskinnet legesenter |  |  |  |  | Practitioner.name |  | Nei |
| ServReport.Patient.ResponsibleHcp.HCP.Inst.HCPerson |  |  |  |  |  |  |  |
| ServReport.Patient.ResponsibleHcp.HCP.Inst.HCPerson.Name | Magnar Koman, LIS1 |  |  |  |  | Practitioner.name |  | Nei |
| ServReport.Patient.ResponsibleHcp.HCP.Inst.HCPerson.Id | 9144889 |  |  |  |  | Practitioner.identification.value |  | Nei |
| ServReport.Patient.ResponsibleHcp.HCP.Inst.HCPerson.TypeId |  | V=HPR | DN=HPR-nummer |  |  | Practitioner.identification.system |  | Nei |

## AnalysedSubject (Specimen)
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| ServReport.Patient.AnalysedSubject.CollectedSample |  |  |  |  |  |  |  |
| ServReport.Patient.AnalysedSubject.CollectedSample.CollectedDate |  | V=2017-09-20T07:57:00 |  |  |  | DiagnostigReport.Effective.Period? | Må se påp hvordan dette oppgis. Viktig søkeparameter | Nei |
| ServReport.Patient.AnalysedSubject.TypeCoded |  | S=2.16.578.1.12.4.1.1.8351 | V=P | DN=Plasma |  | Spescimen.type | Ikke alltid oppgitt. Implisitt med NLK-koder | Nei |
| ServReport.Patient.AnalysedSubject.Number | 1 |  |  |  |  | specimen.note | Kan vurdere å bruke container. Sjekk om dette skal overføre sstrukturert, eller legges i note når info ligger i meldingen | Ja |
| ServReport.Patient.AnalysedSubject.IdByServProvider | 1 |  |  |  |  |  |  |

## ResultItem (Observation)
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| ServReport.Patient.ResultItem |  |  |  |  |  |  | Numerisk resultat eller tekstlig |
| ServReport.Patient.ResultiItem.Comment |  |  |  |  |  | Observation.note |  |
| ServReport.Patient.ResultItem.NumResult |  |  |  |  |  |  |  |
| ServReport.Patient.ResultItem.NumResult.NumResultValue |  | V=11 | U=pmol/L |  |  | Observation.Value | Kan presiseres at det er quantity | Ja |
| ServReport.Patient.ResultItem.ServType |  | V=N | DN=Ny |  |  | Observation.Status | Volven | Ja, delvis |
| ServReport.Patient.ResultItem.RefInterval |  |  |  |  |  |  |  |
| ServReport.Patient.ResultItem.RefInterval.Descr | 10 - 22 |  |  |  |  | Observation.RefRange.Text |  | Ja |
| ServReport.Patient.ResultItem.Investigation |  |  |  |  |  |  |  |
| ServReport.Patient.ResultItem.Investigation.Id |  | V=NOR05863 | S=2.16.578.1.12.4.1.1.7280 | DN=Us-FT4 |  | Observation.Category | OT kommer når S="2.16.578.1.12.4.1.1.8212" | Ja, delvis |
| ServReport.Patient.ResultItem.IdResultItem | 118891130 |  |  |  |  | Observation.Identifier | Denne må vi se mer på! Denne er ikke unik. Brukes også til intern kobling av resultater. | Ja, delvis |
| ServReport.Patient.ResultItem.StatusInvestigation |  | V=3 | DN=Endelig |  |  |  | Usikker på denne. Mulig den må kombineres med andre statusverdier. | Nei |
| ServReport.Patient.ResultItem.RefAnalysedSubject | 1 |  |  |  |  | Observation.Specimen |  | Ja, delvis |
| ServReport.Patient.ResultItem.Accredited |  | V=false |  |  |  | Observation.note | Legger denne inn med ledetekst. Denne brukes som en godkjennelse. Viktig for lab. | Nei |

## ServProvider (Organization, Rolle = 'lab')
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| ServReport.ServProvider.HCP |  |  |  |  |  | Performer? |  | Nei |
| ServReport.ServProvider.HCP.Inst |  |  |  |  |  |  |  |
| ServReport.ServProvider.HCP.Inst.Name | ST OLAVS HOSPITAL HF |  |  |  |  |  |  |
| ServReport.ServProvider.HCP.Inst.Id | 59 |  |  |  |  |  |  |
| ServReport.ServProvider.HCP.Inst.TypeId |  | V=HER | DN=HER-id |  |  |  |  |
| ServReport.ServProvider.HCP.Inst.Dept |  |  |  |  |  |  |  |
| ServReport.ServProvider.HCP.Inst.Dept.Name | Medisinsk mikrobiologi |  |  |  |  |  |  |
| ServReport.ServProvider.HCP.Inst.Dept.Id | 91126 |  |  |  |  |  |  |
| ServReport.ServProvider.HCP.Inst.Dept.TypeId |  | V=HER | DN=HER-id |  |  |  |  |

## Requester (Organization, rolle = 'legekontor')
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| ServReport.Requester |  |  |  |  |  | Mottaker |  |
| ServReport.Requester.ComMethod |  | V=EDI | DN=EDI |  |  |  |  |
| ServReport.Requester.HCP |  |  |  |  |  |  |  |
| ServReport.Requester.HCP.Inst |  |  |  |  |  |  |  |
| ServReport.Requester.HCP.Inst.Name | Kattskinnet legesenter |  |  |  |  |  |  |
| ServReport.Requester.HCP.Inst.Id | 56704 |  |  |  |  |  |  |
| ServReport.Requester.HCP.Inst.TypeId |  | V=HER | DN=HER-id |  |  |  |  |
| ServReport.Requester.HCP.Inst.HCPerson |  |  |  |  |  |  |  |
| ServReport.Requester.HCP.Inst.HCPerson.Name | Rita Lin |  |  |  |  |  |  |
| ServReport.Requester.HCP.Inst.HCPerson.Id | 258521 |  |  |  |  |  |  |
| ServReport.Requester.HCP.Inst.HCPerson.TypeId |  | V=HER | DN=HER-id |  |  |  |  |

## RelServProv (Practitionar, rolle = 'lab')
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| ServReport.RelServProv.Relation |  | V=AHP | DN=Ansvarlig helsepersonell |  |  | Observation.performer -> practitioner |  | Nei |
| ServReport.RelServProv.HCP |  |  |  |  |  |  |  |
| ServReport.RelServProv.HCP.HCProf |  |  |  |  |  |  |  |
| ServReport.RelServProv.HCP.HCProf.Type |  | V=BI | DN=Bioingeniør |  |  |  |  |
| ServReport.RelServProv.HCP.HCProf.Name | Mykke Plasme |  |  |  |  |  |  |
| ServReport.RelServProv.HCP.HCProf.Id | 9876511 |  |  |  |  | Practitionar.Identifier |  | Nei |
| ServReport.RelServProv.HCP.HCProf.TypeId |  | V=HPR | DN=HPR-nummer |  |  |  |  |
| ServReport.RelServProv.HCP.Address |  |  |  |  |  |  |  |
| ServReport.RelServProv.HCP.Address.Type |  | V=WP | DN=Arbeidsadresse |  |  |  |  |
| ServReport.RelServProv.HCP.Address.TeleAddress |  | V=tel:73112233 |  |  |  |  |  |


