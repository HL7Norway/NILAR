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
| StructuredInfo.Type | CS -> CV | CV har noen flere properties, ekstra nullsjekk? |
| CodedInfo.Code | CS -> CV | CV har noen flere properties, ekstra nullsjekk? Foreløpig ikke i bruk |

### Testing
Testmeldinger mappes med til enhver tid gjeldenede mappingkode og legges inn i test-server. Denne er tilgjengelig og kan testes.

#### Endepunkt
http://51.13.121.9:8080

Ved bruk av Postman eller andre generiske verktøy må man spesifisere at man etterspør FHIR v4 objekter, ellers får man ingen treff. Dett kan gjøres ved å legge en Accept inn i headeren:

Accept : application/fhir+json; charset=utf-8; fhirVersion=4.0

#### Eksempelspørringer (id'er må byttes ut med noe man finner i databasen)
- Generisk: [base]/\<Resource\>
- Alle pasienter: http://51.13.121.9:8080/Patient
- Enkelt pasient: http://51.13.121.9:8080/Patient/cb4dc222-7eda-4e6d-beb4-6060d0738aa6
- Søk etter pasient: http://51.13.121.9:8080/Patient?identifier=13116900216
- Finmasket søk etter hemoglobinmålinger: http://51.13.121.9:8080/Observation?patient=Patient/cb4dc222-7eda-4e6d-beb4-6060d0738aa6&code:text=B-Hemoglobin



## Message
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| Type |  | V=SVAR_LAB | DN=Svarrapport-Laboratoriemedisin |  |  |  | Dekkes av ServReport.MsgDescr |  |
| MIGversion | v1.4 2012-02-15 |  |  |  |  |  | Denne mappes ikke i FHIR  |  |
| GenDate |  | V=2017-09-20T09:05:11 |  |  |  |  | Denne legges inn i ServReport.Comment (extention). *)  | Nei |
| MsgId | 01c59bd0-c6a5-11e6-9598-0800200c9a66 |  |  |  |  | ? | Må med for å kunne brukes til sporing | Nei |

*) GenDate er meldingens dato og samsvarer normalt med ServReport.IssueDate. Men ved endring kan det være at IssueDate har opprinnelig dato; da vil GenDate gi mer info om når endringsmeldingen ble sendt.

## ServReport (Diagnostic Report)
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| ServReport.ServType |  | V=N | DN=Ny | Ny+Endelig rapport=Final, Ny+Foreløpig=Prelimenary, ... |  | Styrer flyt ved mapping, mappes ikke |  |  |
| ServReport.IssueDate |  | V=2017-09-20T09:04:10 |  |  |  | DiagnosticReport.issued | | Ja |
| ServReport.ApprDate |  |  |  |  |  |  | Ikke relevant |  |
| ServReport.Status |  | V=F | DN=Endelig rapport |  |  | DiagnosticReport.status [(detaljer her)](#headReportStatus) |  | Ja |
| ServReport.CancellationCode |  |  |  |  |  |  | Brukes ikke | |
| ServReport.Ack |  |  |  |  |  |  | NA | |
| ServReport.MsgDescr |  | V=CLIN | DN=Medisinsk biokjemi |  |  | DiagnosticReport.category, Observation.category | Volven=8202 | Ja |
| ServReport.ServProvId | 55b6344fc-a61d-4a67-95fe-7276613785ab |  |  |  |  | Denne+ServReport.ServProvider.HCP.Inst.Dept.Id | ? (AA) | Ja, ufullstendig |
| ServReport.Comment | Kontroll |  |  |  |  | Her må vi inn med en extention | Denne venter vi med | Nei (extention?) |
| ServReport.CodedComment |  |  |  |  |  | Samme som Comment | Denne venter vi med | Nei (extention?) |
| ServReport.RefDoc |  |  |  |  |  |  | Kan inneholde identifiserende informasjon |  |
| ServReport.Animal |  |  |  |  |  |  | NA |  |
| ServReport.Material |  |  |  |  |  |  | NA |  |
| ServReport.PaymentResponsible |  |  |  |  |  |  | NA |  |
|  |  |  |  |  |  | DiagnosticReport.Effective | Tidligste Observation.Effective | Nei |

## ServReq (ServiceRequest)
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| ServReport.ServReq.IssueDate |  | V=2017-09-20 |  |  |  | ServiceRequest.authoredOn |  | Ja |
| ServReport.ServReq.Id | e312fde3-66aa-40da-bec7-26abf4d29e82 |  |  |  |  | DiagnosticReport.basedon, link til servicerequest, ServiceRequest.requisition |  | Ja |
| ServReport.ServReq.ReasonAsText.Heading |  | V="PROB" | DN="Aktuell problemstilling" |  |  | Volven=8231, ServiceRequest.reasonCode -> code |  | Ja |
| ServReport.ServReq.ReasonAsText.TextResultValue |  |  |  |  |  | ServiceRequest.reasonCode -> text |  | Ja |
| ServReport.ServReq.ReasonAsText.TextCode |  |  |  |  |  |  | Ikke i bruk |  | 
| ServReport.ServReq.PaymentCat |  |  |  |  |  | | Skal ikke mappes |  |
| ServReport.ServReq.ReqComment |  |  |  |  |  | ServiceRequest.Note |  | Ja |
| ServReport.ServReq.Ack |  |  |  |  |  |  | NA |  |
| ServReport.ServReq.MsgDescr |  |  |  |  |  |  | NA, samme som i ServReport |  |
| ServReport.ServReq.RequestedPrioReport |  |  |  |  |  |  | NA |  |
| ServReport.ServReq.ReceiptDate |  |  |  |  |  |  | NA |  |
| ServReport.ServReq.IdByServProvider |  |  |  |  |  |  | Ikke relevant |  |
| ServReport.ServReq.Reservation |  |  |  |  |  | ServiceRequest.Note | | Ja |
| ServReport.ServReq.Comment |  |  |  |  |  | ServiceRequest.Note |  | Ja |

## Patient (Patient)
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| ServReport.Patient.Name | Hansen, Mats |  |  |  |  | Patient.Name | | Ja
| ServReport.Patient.IdByServProvider | 10682609 |  |  |  |  |  | NA ||
| ServReport.Patient.OffId | 2412790228 |  |  |  |  | Patient.Identifier |  | Ja |
| ServReport.Patient.TypeOffId |  | V=FNR | DN=Fødselsnummer |  |  | Patient.Identifier | Kombineres med OffId | Ja |
| ServReport.Patient.Address |||||||Mappes ikke||

## AnalysedSubject (Specimen)
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| ServReport.Patient.AnalysedSubject.CollectedSample.CollectedDate |  | V=2017-09-20T07:57:00 |  |  |  | Specimen.Collection.collectedDateTime |  | Ja |
| ServReport.Patient.AnalysedSubject.CollectedSample.CollectorComment |  |  |  |  |  | Specimen.Note |  | Ja |
| ServReport.Patient.AnalysedSubject.CollectedSample.CollectorCommentCoded |  |  |  |  |  | Specimen.Note |  | Ja |
| ServReport.Patient.AnalysedSubject.CollectedSample.Logistics |  |  |  |  |  | Specimen.Note |  | Ja |
| ServReport.Patient.AnalysedSubject.CollectedStudyProduct.Type |  |  |  |  |  | Specimen.Note |  | Ja |
| ServReport.Patient.AnalysedSubject.CollectedStudyProduct.ProducedDate |  |  |  |  |  | Specimen.Collection.collectedDateTime |  | Ja |
| ServReport.Patient.AnalysedSubject.CollectedStudyProduct.RefRelatedProd |  |  |  |  |  | Specimen.Note |  | Ja |
| ServReport.Patient.AnalysedSubject.Type | Biopsi |  |  |  |  | Specimen.Type | | Ja |
| ServReport.Patient.AnalysedSubject.TypeCoded |  | S=2.16.578.1.12.4.1.1.8351 | V=P | DN=Plasma |  | Specimen.Type | Ikke alltid oppgitt. Implisitt med NLK-koder | Ja |
| ServReport.Patient.AnalysedSubject.Number | 1 |  |  |  |  | specimen.note | Kan vurdere å bruke container. Sjekk om dette skal overføre sstrukturert, eller legges i note når info ligger i meldingen | Ja, forløpig |
| ServReport.Patient.AnalysedSubject.AnatomicalOrigin | Aorta |  |  |  |  | Specimen.Collection.BodySite |  | Ja |
| ServReport.Patient.AnalysedSubject.IdByRequester |  |  |  |  |  | Specimen.Identifier |  | Ja, ufullstendig |
| ServReport.Patient.AnalysedSubject.IdByServProvider | 1 |  |  |  |  | Specimen.AccessionIdentifier | | Ja, ufullstendig |
| ServReport.Patient.AnalysedSubject.Comment | Ett av funnene... |  |  |  |  | Specimen.Note |  | Ja |
| ServReport.Patient.AnalysedSubject.PreservMaterial |  |  |  |  |  | Specimen.Container.Additive |  | Ja |
| ServReport.Patient.AnalysedSubject.SampleCollInd |  |  |  |  |  | NA |  |  |
| ServReport.Patient.AnalysedSubject.SampleCollProc |  |  |  |  |  | Specimen.Collection.Method |  | Ja |
| ServReport.Patient.AnalysedSubject.SampleHandling |  |  |  |  |  | Specimen.Note |  | Ja |
| ServReport.Patient.AnalysedSubject.Accredited |  |  |  |  |  | extension |  | Nei |
| ServReport.Patient.AnalysedSubject.AnalysedSubject |  |  |  |  |  | Nøstede prøver, ikke i bruk? |  |  |
| ServReport.Patient.AnalysedSubject.Pretreatment |  |  |  |  |  | Specimen.Note | Inneholder bla. faste/diett | Nei |
| ServReport.Patient.AnalysedSubject.RelServProv |  |  |  |  |  | Specimen.Collection.Collector? |  | Ja |

## ResultItem (Observation)
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| ServReport.Patient.ResultiItem.Comment |  |  |  |  |  | Observation.note |  | Ja |
| ServReport.Patient.ResultItem.NumResult |  |  |  |  |  |  |  | Ja |
| ServReport.Patient.ResultItem.NumResult.NumResultValue |  | V=11 | U=pmol/L |  |  | Observation.Value | Quantity | Ja |
| ServReport.Patient.ResultItem.TextResultResult |  |  |  |  |  | Observation.Value | CodeableConcept | Ja |
| ServReport.Patient.ResultItem.TextResult.Heading | | V=VU | | | | Observation.Value | CodeableConcept.Code | Ja |
| ServReport.Patient.ResultItem.TextResult.TextResultValue | Enkelte kolonier | | | | | Observation.Value | CodeableConcept.Text, muligens kompleks verdi, leses inn som XmlNode | Ja |
| ServReport.Patient.ResultItem.TextResult.TextCode | | V=T 80100 | S=2.16.578.1.12.4.1.1.7010 | DN=vulva UNS | | Observation.Value | CodeableValue.Code | Ja |
| ServReport.Patient.ResultItem.Interval | | | | | | Observation.Value | Range | Ja |
| ServReport.Patient.ResultItem.DateResult |  | | | | | Observation.Value | dateTime | Ja |
| ServReport.Patient.ResultItem.StructuredInfo.Type | | V=1911.2 | DN=Operasjonstype | | | Observation.Note |  | Ja |
| ServReport.Patient.ResultItem.StructuredInfo.CodedInfo | | V=1 | DN=Høyresidig hemikolektomi | | | Observation.Note | Gjelder alle innholdtypene | Ja |
| ServReport.Patient.ResultItem.ServType |  | V=N | DN=Ny |  |  |  | Styrer flyt ved mapping, mappes ikke |  |
| ServReport.Patient.ResultItem.RefInterval.Descr | 10 - 22 |  |  |  |  | Observation.ReferenceRange.Text |  | Ja |
| ServReport.Patient.ResultItem.Investigation.Id |  | V=NOR05863 | S=2.16.578.1.12.4.1.1.7280 | DN=Us-FT4 |  | Observation.Code | Sprikende bruk av DN og OT | Ja *) |
| ServReport.Patient.ResultItem.Investigation.Spec |  |  |  |  |  | Observation.Code | Skal denne til method? | Ja, men må avklares |
| ServReport.Patient.ResultItem.Investigation.Comment |  |  |  |  |  | Observation.Note? |  | Ja |
| ServReport.Patient.ResultItem.InvDate |||||| Observation.Note, Observation.Effective ved radiologi || Ja, men mangelfull |
| ServReport.Patient.ResultItem.DevResultInd |||||| Observation.Interpretation || Ja |
| ServReport.Patient.ResultItem.IdResultItem | 118891130 |  |  |  |  | Observation.Identifier | Denne må vi se mer på! Denne er ikke unik. Brukes også til intern kobling av resultater. | Ja, delvis |
| ServReport.Patient.ResultItem.RefIdResultItem |  |  |  |  |  | Observation.hasMember |  | Ja |
| ServReport.Patient.ResultItem.StatusInvestigation |  | V=3 | DN=Endelig |  |  | Observation.Status [(detaljer her)](#headObservationStatus)  |  | Ja |
| ServReport.Patient.ResultItem.StatusChangeDate | ||||| Observation.Note |  | Ja |
| ServReport.Patient.ResultItem.DescrDate | ||||| Observation.Note || Ja |
| ServReport.Patient.ResultItem.CounterSignDate | ||||| Observation.Note || Ja |
| ServReport.Patient.ResultItem.MedicalValidationDate | ||||| Observation.Note || Ja |
| ServReport.Patient.ResultItem.RefAnalysedSubject | 1 |  |  |  |  | Observation.Specimen | RefAnalysedSubject kan i følge standard inneholde referanser til flere AnalysedSubjects, men vi tror at dette ikke brukes i praksis. Vi vil derfor bare referere til et AnalysedSubject.  | Ja, delvis |
| ServReport.Patient.ResultItem.Accredited |  | V=false |  |  |  | Observation.note | Legger denne inn med ledetekst. Denne brukes som en godkjennelse. Viktig for lab. | Ja |
| ServReport.Patient.ResultItem.ResultItem |  |  |  |  |  | Observation.hasMember? Observation.derivedFrom? Observation.component? | Nøstet ResultItem | Ja |
| ServReport.Patient.ResultItem.RelServProv |||||||| Ja |
| ServReport.Patient.ResultItem.DiagComment |||||| Observation.Note|| Ja |
|  |  |  |  |  |  | Observation.Note| Specimen.CollectedDate -> ResultItem.InvDate for radiologi | Nei |

*) Når DN og OT har ulik verdi vises "OT (DN)", ellers OT eller DN etter hvilken som har innhold.

## Aktører knyttet til en melding
Der er flere aktører i meldingen, med ulike roller. Disse mappes ikke som ressurser, men trekkes ut og brukes til å lage ResourceReference's, som brukes relevante steder.

### Roller
| Rolle | Bruk i Fhir | Kommantar | Implementert |
|-|-|-|-|
| ResponsibleHcp ("Rekvirent") | ServiceRequest.Requester |  | Ja |
| ServProvider ("Avsender") | NA |  |  |
| Requester ("Mottaker") | ServiceRequest.Requester | Dersom ResponsibleHcp mangler | Nei |
| RelServProv ("Utfører/Ansvarlig") | DiagnosticReport.Performer, Observation.Performer |  | Ja |
| CopyDest ("Kopimottaker") | NA |  |  |

### Mapping
Aktører kan ha mange ulike konstallasjoner. De mappes til Practitioner eller Organization. I noen tilfeller blir det en av hver da xml gjerne oppgir person knyttet til virksomhet.
| Path | Value | Attributes |  |  |  | Mapping | Kommentar | Implementert |
|-|-|-|-|-|-|-|-|-|
| HCP.Inst |  |  |  |  |  | ResourceReference(**Organization**) |  | Ja |
| HCP.Inst.Name | Kattskinnet legesenter |  |  |  |  | ResourceReference(Organization).Identifier.Display |  | Ja |
| HCP.Inst.Id | 59 |  |  |  |  | ResourceReference(Organization).Identifier.Value |  | Ja |
| HCP.Inst.TypeId |  | V=HER | DN=HER-id |  |  | ResourceReference(Organization).Identifier.System |  | Ja, foreløpig |
|  |  |  |  |  |  |  |  |  |
| HCP.Inst.HCPerson |  |  |  |  |  | ResourceReference(**Practitioner**) |  | Ja |
| HCP.Inst.HCPerson.Name | Magnar Koman, LIS1 |  |  |  |  | ResourceReference(Practitioner).Identifier.Display |  | Ja |
| HCP.Inst.HCPerson.Id | 9144889 |  |  |  |  | ResourceReference(Practitioner).identifier.value |  | Ja |
| HCP.Inst.HCPerson.TypeId |  | V=HPR | DN=HPR-nummer |  |  | ResourceReference(Practitioner).identifier.system |  | Ja, foreløpig |
|  |  |  |  |  |  |  |  |  |
| HCP.HCProf |  |  |  |  |  | ResourceReference(**Practitioner**) |  | Ja |
| HCP.HCProf.Type |  | V=BI | DN=Bioingeniør |  |  | ResourceReference(Practitioner).Identifier.Display |  | Nei |
| HCP.HCProf.Name | Mykke Plasme |  |  |  |  | ResourceReference(Practitioner).Identifier.Display |  | Ja |
| HCP.HCProf.Id | 9876511 |  |  |  |  | ResourceReference(Practitioner).Identifier.identifier.Value |  | Ja |
| HCP.HCProf.TypeId |  | V=HPR | DN=HPR-nummer |  |  | ResourceReference(Practitioner).Identifier.System |  | Ja, foreløpig |
|  |  |  |  |  |  |  |  |  |
| HCP.Address |  |  |  |  |  |  | NA |  |
| HCP.Address.Type |  | V=WP | DN=Arbeidsadresse |  |  |  | NA |  |
| HCP.Address.TeleAddress |  | V=tel:73112233 |  |  |  |  | NA |  |


## <a name="headReportStatus"></a>DiagnosticReport.Status
DiagnosticReport.Status skal være en standard Fhir kode. Denne matcher godt med kodeverk 7306 "Status for rapport-S1".

| Volven 7306 |  | Fhir |
|-|-|-|
| F | Endelig rapport | Final |
| S | Planlagt | Registered |
| P | Foreløpig rapport | Preliminary |
| A | Tillegg til rapport | Appended |
| Andre |  | Unknown |

## <a name="headObservationStatus"></a>Observation.Status
Observation.Status skal være en standard Fhir kode. Denne matcher ikke helt kodeverk 8245 "Status for resultat i svarrapportering
av medisinske tjenester". Noen koder kombineres og noen blir unknown:
| Volven 8245 |  | Fhir |
|-|-|- 
| 1 | Revidert | Corrected |
| 2 | Foreløpig | Preliminary |
| 3 | Endelig | Final |
| 4 | Tillegg | Amended |
| 5 | Henvisning registrert | Registered |
| 6 | Prosedyrer registrert/planlagt | Registered |
| 12 | Korrigert | Corrected |
| 14 | Undersøkelse slettet | Cancelled |
| Andre |  | Unknown |


## Extensions
Det arbeides ut fra et ønske om å holde bruken av Fhir extensiosn på et minimum. Det er likevel avdekket noen tilfeller der det ikke er plass i relevant Fhir ressurs for informasjon som anses viktig i fagmeldingen (xml). I tillegg er det en del strukturert informasjon i xml, der det ikke finnes noen passende Fhir-element, som har fått en foreløpig/tentativ mapping inn i diverse note-elementer i Fhir. For (noen av) disse er det rimelig å anta at det vil komme behov for extensions i stedet.

### DiagnosticReport.Note
- ServReport.Comment
- ServReport.CodedComment
- ServReport.RefDoc (note om utelatt dokument)

### XXX.Accredited
- ServReport.Accredited
- AnalysedSubject.Accredited
- ...

## Fagområde - tillegg til utvalgte koder
- NLK: hente fagområde fra kodeverksdefinisjon
  - https://www.ehelse.no/kodeverk/laboratoriekodeverket
- NCRP: hente fagområde fra posisjon i kode
  - Sjette tegn angir modalitet, alle nukleærmedisinske har T i første tegn
  - https://www.ehelse.no/kodeverk/regler-og-veiledning-for-kliniske-kodeverk-i-spesialisthelsetjenesten-icd-10-ncsp-ncmp-og-ncrp/_/attachment/download/d876a76e-1f67-4211-8f68-e3c05a37fc0e:6ee71e82b4ce8f542d583fca6ee7d002ec39a1e6/Kodeveiledning%202021.18.12.2020.pdf