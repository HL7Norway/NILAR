# Mapping fra XML til FHIR (R4)

### Hvordan lese dokumentet
I overskrift finner du objektnavn fra XML. I parantes har vi lagt navnet til FHIR ressurs som det i hovedsak mappes til (noen attributter hentes på tvers av XML dokument).
I noen av overskriftene har vi lag til en rolle som gir et hint om hvilken rolle ressursen har inn i FHIR ressursene. Et eksemple kan være rekvirent som brukes i Service Request.
Kolonnen "implementert" sier om vi har implementert dette i FHIR ressurser. "Delvis" betyr at det finnes en verdi, men at den ikke trenger å være endelig.
Vi oppdaterer dette etterhvert som vi får ting på plass i endepunktene.

Kolonnene value og attributes inneholder eksempelverdier fra en [svarmelding](svarmelding.xml "svarmelding"). 

### Hvordan komme med tilbakemeldinger på dokumentet
Tilbakemeldinger på dokumentet kan sendes til nilar@nhn.no.

### Levetid på dokumentet
Dette dokumentet gjelder frem til vi får på plass profilering av FHIR ressursene. Vi antar at det vil være på plass i løpet av Q4 2021.

### Svarrapport 1.3 og 1.4
Mappingen er basert på svarrapport 1.4. Det er svært små endringer fra 1.3 til 1.4 og det legges til grunn at disse ikke er relevante for oppsettet nedenfor. I koden for mapping forventes de å være enkle å håndtere, men foreløpig er det ikke funnet eksempler der endringene er relevante.

|Element|Endring 1.3 -> 1.4|Konsekvens|
|-|-|-|
| Message.ServReport | Kardinalitet 1..n -> 0..1 | Array -> Nullable single, må håndtere eventuelle multipler som egne svar |
| ServReport.ServProvId | Kardinalitet 1 -> 0..1 | Triviell, nullable single |
| ServReq.Permission | Fjernet | Triviell, ignoreres |
| StructuredInfo.Type | CS -> CV | CV har noen flere properties, ekstra nullsjekk? Foreløpig ikke i bruk |
| CodedInfo.Code | CS -> CV | CV har noen flere properties, ekstra nullsjekk? Foreløpig ikke i bruk |


### Diskusjoner
#### Presented form
Vi må vurdere om vi skal legge med hele XML dokumentet for å gjøre felter som ikke blir mappet tilgjengelig. Dette kan ha konsekvenser for Personvernkomponent.


## ServReport (Diagnostic Report)
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| Type |  | V=SVAR_LAB | DN=Svarrapport-Laboratoriemedisin |  |  | DN=DiagnosticReport.category, V=DiagnosticReport.code | Volven=8279, Begynner med SVAR_... | Nei |
| MIGversion | v1.4 2012-02-15 |  |  |  |  |  | Denne mappes ikke i FHIR  | Nei |
| GenDate |  | V=2017-09-20T09:05:11 |  |  |  |  | Denne legges inn i ServReport.Comment (extention).  | Nei |
| MsgId | 01c59bd0-c6a5-11e6-9598-0800200c9a66 |  |  |  |  |  |  |
| ServReport.ServType |  | V=N | DN=Ny | Ny+Endelig rapport=Final, Ny+Foreløpig=Prelimenary, ... |  | DiagnosticReport.status |  | Ja |
| ServReport.IssueDate |  | V=2017-09-20T09:04:10 |  |  |  | DiagnosticReport.issued | | Nei |
| ServReport.Status |  | V=F | DN=Endelig rapport |  |  | DiagnosticReport.status | I kombinasjon med ServType | Nei |
| ServReport.MsgDescr |  | V=CLIN | DN=Medisinsk biokjemi |  |  | DiagnosticReport.category | Volven=8202 | Ja, delvis |
| ServReport.ServProvId | 55b6344fc-a61d-4a67-95fe-7276613785ab |  |  |  |  | Denne+ServReport.ServProvider.HCP.Inst.Dept.Id | ? (AA) | Nei |
| ServReport.Comment | Kontroll |  |  |  |  | Her må vi inn med en extention | Denne venter vi med | Nei (extention?) |

## ServReq (ServiceRequest)
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| ServReport.ServReq.IssueDate |  | V=2017-09-20 |  |  |  | ServiceRequest.authoredOn |  | Ja |
| ServReport.ServReq.Id | e312fde3-66aa-40da-bec7-26abf4d29e82 |  |  |  |  | DiagnosticReport.basedon, link til servicerequest, ServiceRequest.requisition |  | Ja |
| ServReport.ServReq.ReasonAsText.Heading |  | V="PROB" | DN="Aktuell problemstilling" |  |  | Volven=8231, ServiceRequest.reasonCode -> code |  | Nei |
| ServReport.ServReq.ReasonAsText.TextResultValue |  |  |  |  |  | ServiceRequest.reasonCode -> text |  | Nei |
| ServReport.ServReq.PaymentCat |  |  |  |  |  | | Skal ikke mappes |  |

## Patient (Patient)
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| ServReport.Patient.Name | Hansen, Mats |  |  |  |  |  |  |
| ServReport.Patient.IdByServProvider | 10682609 |  |  |  |  |  |  |
| ServReport.Patient.OffId | 2412790228 |  |  |  |  |  |  |
| ServReport.Patient.TypeOffId |  | V=FNR | DN=Fødselsnummer |  |  |  |  |
| ServReport.Patient.ResponsibleHcp |  |  |  |  |  |  |  |
| ServReport.Patient.ResponsibleHcp.Relation |  | V=REK | DN=Rekvirent |  |  | ServiceRequest.requester |  | Nei |

## ResponsibleHcp (Practitioner, Rolle = 'ResponsibleHcp')
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| ServReport.Patient.ResponsibleHcp.HCP.Inst |  |  |  |  |  |  |  |
| ServReport.Patient.ResponsibleHcp.HCP.Inst.Name | Kattskinnet legesenter |  |  |  |  |  |  |  |
| ServReport.Patient.ResponsibleHcp.HCP.Inst.HCPerson |  |  |  |  |  |  |  |
| ServReport.Patient.ResponsibleHcp.HCP.Inst.HCPerson.Name | Magnar Koman, LIS1 |  |  |  |  | Practitioner.name |  | Ja |
| ServReport.Patient.ResponsibleHcp.HCP.Inst.HCPerson.Id | 9144889 |  |  |  |  | Practitioner.identifier.value |  | Ja |
| ServReport.Patient.ResponsibleHcp.HCP.Inst.HCPerson.TypeId |  | V=HPR | DN=HPR-nummer |  |  | Practitioner.identifier.system |  | Ja, foreløpig |

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
| ServReport.Patient.ResultiItem.Comment |  |  |  |  |  | Observation.note |  | Ja |
| ServReport.Patient.ResultItem.NumResult |  |  |  |  |  |  |  |
| ServReport.Patient.ResultItem.(Item as NumResult).NumResultValue |  | V=11 | U=pmol/L |  |  | Observation.Value | Quantity | Ja |
| ServReport.Patient.ResultItem.(Item as TextResult).Heading | | V=VU | | | | Observation.Value | CodeableValue.Code | Nei |
| ServReport.Patient.ResultItem.(Item as TextResult).TextResultValue | Enkelte kolonier | | | | | Observation.Value | CodeableValue.Text, muligens kompleks verdi, leses inn som XmlNode | Nei |
| ServReport.Patient.ResultItem.(Item as TextResult).TextCode | | V=T 80100 | S=2.16.578.1.12.4.1.1.7010 | DN=vulva UNS | | Observation.Value | CodeableValue.Code | Nei |
| ServReport.Patient.ResultItem.(Item as TextResult).Unit | 10#9/L | | | | | Observation.Value | CodeableValue.Text | Nei |
| ServReport.Patient.ResultItem.ServType |  | V=N | DN=Ny |  |  | Observation.Status | Volven | Ja, delvis |
| ServReport.Patient.ResultItem.RefInterval |  |  |  |  |  |  |  |
| ServReport.Patient.ResultItem.RefInterval.Descr | 10 - 22 |  |  |  |  | Observation.RefRange.Text |  | Ja |
| ServReport.Patient.ResultItem.Investigation.Id |  | V=NOR05863 | S=2.16.578.1.12.4.1.1.7280 | DN=Us-FT4 |  | Observation.Category | OT kommer når S="2.16.578.1.12.4.1.1.8212" | Ja, delvis |
| ServReport.Patient.ResultItem.IdResultItem | 118891130 |  |  |  |  | Observation.Identifier | Denne må vi se mer på! Denne er ikke unik. Brukes også til intern kobling av resultater. | Ja, delvis |
| ServReport.Patient.ResultItem.StatusInvestigation |  | V=3 | DN=Endelig |  |  |  | Usikker på denne. Mulig den må kombineres med andre statusverdier. | Nei |
| ServReport.Patient.ResultItem.RefAnalysedSubject | 1 |  |  |  |  | Observation.Specimen |  | Ja, delvis |
| ServReport.Patient.ResultItem.Accredited |  | V=false |  |  |  | Observation.note | Legger denne inn med ledetekst. Denne brukes som en godkjennelse. Viktig for lab. | Ja |
| ServReport.Patient.ResultItem.ResultItem |  |  |  |  |  | Observation.hasMember? Observation.derivedFrom? Observation.component? | Nøstet ResultItem | Nei |

## ServProvider (Organization, Rolle = 'ServProvider')
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| ServReport.ServProvider.HCP |  |  |  |  |  | Observation.performer -> practitioner? |  | Nei |
| ServReport.ServProvider.HCP.Inst |  |  |  |  |  |  |  |
| ServReport.ServProvider.HCP.Inst.Name | ST OLAVS HOSPITAL HF |  |  |  |  | Organization.name | Sammen med Dept.Name | Ja |
| ServReport.ServProvider.HCP.Inst.Id | 59 |  |  |  |  |  |  |
| ServReport.ServProvider.HCP.Inst.TypeId |  | V=HER | DN=HER-id |  |  |  |  |
| ServReport.ServProvider.HCP.Inst.Dept |  |  |  |  |  |  |  |
| ServReport.ServProvider.HCP.Inst.Dept.Name | Medisinsk mikrobiologi |  |  |  |  | Organization.name | Sammen med Inst.Name | Ja |
| ServReport.ServProvider.HCP.Inst.Dept.Id | 91126 |  |  |  |  | Organization.identifier.value |  | Ja |
| ServReport.ServProvider.HCP.Inst.Dept.TypeId |  | V=HER | DN=HER-id |  |  | Organization.identifier.system |  | Ja, foreløpig |

## Requester (Organization og Practitioner, rolle = 'Requester')
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| ServReport.Requester |  |  |  |  |  | DiagnosticReport.resultsInterpreter? | ??? | Nei |
| ServReport.Requester.ComMethod |  | V=EDI | DN=EDI |  |  |  |  |
| ServReport.Requester.HCP |  |  |  |  |  |  |  |
| ServReport.Requester.HCP.Inst |  |  |  |  |  |  |  |
| ServReport.Requester.HCP.Inst.Name | Kattskinnet legesenter |  |  |  |  | Organization.name |  | Ja |
| ServReport.Requester.HCP.Inst.Id | 56704 |  |  |  |  | Organization.identifier.value |  | Ja |
| ServReport.Requester.HCP.Inst.TypeId |  | V=HER | DN=HER-id |  |  | Organization.identifier.system |  | Ja, foreløpig |
| ServReport.Requester.HCP.Inst.HCPerson |  |  |  |  |  |  |  |
| ServReport.Requester.HCP.Inst.HCPerson.Name | Rita Lin |  |  |  |  | Practitioner.name |  | Ja |
| ServReport.Requester.HCP.Inst.HCPerson.Id | 258521 |  |  |  |  | Practitioner.identifier.value |  | Ja |
| ServReport.Requester.HCP.Inst.HCPerson.TypeId |  | V=HER | DN=HER-id |  |  | Practitioner.identifier.system |  | Ja, foreløpig |

## RelServProv (Practitioner, rolle = 'RelServProv')
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| ServReport.RelServProv.Relation |  | V=AHP | DN=Ansvarlig helsepersonell |  |  | Observation.performer -> practitioner |  | Nei |
| ServReport.RelServProv.HCP |  |  |  |  |  |  |  |
| ServReport.RelServProv.HCP.HCProf |  |  |  |  |  |  |  |
| ServReport.RelServProv.HCP.HCProf.Type |  | V=BI | DN=Bioingeniør |  |  | Practitioner.qualification |  | Ja |
| ServReport.RelServProv.HCP.HCProf.Name | Mykke Plasme |  |  |  |  | Practitioner.name |  | Ja |
| ServReport.RelServProv.HCP.HCProf.Id | 9876511 |  |  |  |  | Practitioner.identifier.value |  | Ja |
| ServReport.RelServProv.HCP.HCProf.TypeId |  | V=HPR | DN=HPR-nummer |  |  | Practitioner.identifier.system |  | Ja, foreløpig |
| ServReport.RelServProv.HCP.Address |  |  |  |  |  |  |  |
| ServReport.RelServProv.HCP.Address.Type |  | V=WP | DN=Arbeidsadresse |  |  |  |  |
| ServReport.RelServProv.HCP.Address.TeleAddress |  | V=tel:73112233 |  |  |  |  |  |

## Avklaringspunkter
### Kodeverk
Må avklare hvordan vi bruker System og Code. Svært varierende hva som ligger i innkommende meldinger.

### TextResult
Svært varierende i innkommende meldinger, fra ren tekstverdi uten koder til bare heading uten textsverdi.

### Nøstede resultitem
Både svarmelding og FHIR har mekansismer for å nøste observasjoner/verdier. Det er ikke angitt noen semantikk for dette i svarmelding, mens FHIR har flere måter å gruppere data.

#### ResultItem
- Kan inneholde en liste med ResultItem
- Ingen indikasjon på semantikk
- Innkommende meldinger viser variasjon i semantikk

#### FHIR Observation
To (tre) nøstingsmodeller med ulik semantikk
- hasMember
  - Ren gruppering av observasjoner, uten spesifikk semantikk
- derivedFrom
  - Viser til andre (selvstendige) observasjoner som danner grunnlaget for denne observasjonen
- Component
  - Verdier som til sammen utgjør én måling, f.eks. blodtrykk
  - Ikke egentlig nøsting

#### Hypotese for mapping
Nøstede ResultItem mappes som hasMember, altså generisk gruppering uten spesifikk semantikk
- Ingen info i xml som tilsier spesifikk semantikk


