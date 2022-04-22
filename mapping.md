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
- Nilar1: http://51.13.121.9:8080 Første løsning, basert på Vonk/FhirlyServer. Blir ikke lenger oppdatert, men nye meldinger vil komme inn.
  - For endepunkt med støtte for helseID, bruk port 4141 (http://51.13.121.9:4141)).
  - Ved bruk av Postman eller andre generiske verktøy må man spesifisere at man etterspør FHIR v4 objekter, ellers får man ingen treff. Dette kan gjøres ved å legge en Accept inn i headeren:
    -  `Accept : application/fhir+json; charset=utf-8; fhirVersion=4.0`
- Nilar2: http://51.13.121.9:5212 Ny løsning, oppdateres fortløpende.
  - Krever ikke Accept header, men krever derimot header to andre headere:
    - X-Nilar-Patient: pasientens personnummer
    - X-Nilar-Requester: HPR-nummer (brukes for sjekk mot personverninnstillinger)

#### Eksempelspørringer (id'er må byttes ut med noe man finner i databasen)
- Generisk: [base]/\<Resource\>
- Alle pasienter: http://51.13.121.9:8080/Patient
- Enkelt pasient: http://51.13.121.9:8080/Patient/cb4dc222-7eda-4e6d-beb4-6060d0738aa6
- Søk etter pasient: http://51.13.121.9:8080/Patient?identifier=13116900216
- Finmasket søk etter hemoglobinmålinger: http://51.13.121.9:8080/Observation?patient=Patient/cb4dc222-7eda-4e6d-beb4-6060d0738aa6&code:text=B-Hemoglobin

#### Testmeldinger
Det er mulig å sende inne egne testmeldinger, beskrivelse for dette finnes her: https://www.nhn.no/samhandlingsplattform/nilar.

## Oversikt over ressurser som brukes i NILAR

![Diagnostics oversikt](diagnostics.png)

### Sammenheng mellom XML dokument og FHIR ressurser

![Relation mellom ressurser](Visual%20mapping.svg)

## Message
| XML | FHIR | Kommentar | Implementert |
|-|-|-|-|
| Type |  | Dekkes av ServReport.MsgDescr |  |
| MIGversion |  | Denne mappes ikke i FHIR  |  |
| GenDate | DiagnosticReport.Issued |  | Ja |
| MsgId | DiagnosticReport.Identifier (Use = Secondary) | Må med for å kunne brukes til sporing | Ja |

*) GenDate er meldingens dato og samsvarer normalt med ServReport.IssueDate. Men ved endring kan det være at IssueDate har opprinnelig dato; da vil GenDate gi mer info om når endringsmeldingen ble sendt.

## ServReport (Diagnostic Report)
| XML | FHIR | Kommentar | Implementert |
|-|-|-|-|
| ServReport.ServType | Styrer flyt ved mapping, mappes ikke AA: Dette er feil. Den mappes sammen med ServReport.Status|  |  |
| ServReport.IssueDate |  | Dato for opprettelse av rapporten. Beholdes selv om det kommer oppdateringer. Bruker derfor Message.GenDate for å få dato på endringer. |  |
| ServReport.ApprDate |  | Ikke relevant |  AA: Mappes til AdditinalInfo med ledetekst Godkjenningstidspunkt:|
| ServReport.Status | DiagnosticReport.status [(detaljer her)](#headReportStatus) |AA: Må oppdateres  | Ja |
| ServReport.CancellationCode |  | Brukes ikke | |
| ServReport.Ack |  | NA | |
| ServReport.MsgDescr | DiagnosticReport.category | Nytt kodeverk "Hovedinndeling fagområde" AA: Stemmer dette? Eller benyttes verdier fra 8202? Hovedinndeling fagområde er vel egentlig på Message/type | Ja |
| ServReport.ServProvId | Identifier |  | Ja |
| ServReport.Comment | Extention |  | Ja |
| ServReport.CodedComment |  | Extension | Ja |
| ServReport.RefDoc |  | Kan inneholde identifiserende informasjon |  |
| ServReport.Animal |  | NA |  |
| ServReport.Material |  | NA |  |
| ServReport.PaymentResponsible |  | NA |  |

## ServReq (ServiceRequest)
| XML | FHIR | Kommentar | Implementert |
|-|-|-|-|
| ServReport.ServReq.IssueDate | ServiceRequest.authoredOn |  | Ja |
| ServReport.ServReq.Id | DiagnosticReport.basedon, link til servicerequest, ServiceRequest.requisition |  | Ja |
| ServReport.ServReq.ReasonAsText.Heading | Volven=8231, ServiceRequest.reasonCode -> code |  | Ja |
| ServReport.ServReq.ReasonAsText.TextResultValue | ServiceRequest.reasonCode -> text |  | Ja |
| ServReport.ServReq.ReasonAsText.TextCode |  | Ikke i bruk |  | |
| ServReport.ServReq.PaymentCat | | Skal ikke mappes AA: Bør mappes i samlefelt hvis det ligger info her|  |
| ServReport.ServReq.ReqComment | ServiceRequest.Note |  | Ja |
| ServReport.ServReq.Ack |  | NA |  |
| ServReport.ServReq.MsgDescr |  | NA, samme som i ServReport |  |
| ServReport.ServReq.RequestedPrioReport |  | NA AA: Må mappes i samlefelt hvis det ligger info her|  |
| ServReport.ServReq.ReceiptDate |  | NA: AA: Må mappes i samlefelt hvis det ligger info her |  |
| ServReport.ServReq.IdByServProvider |  | Ikke relevant AA: Må mappes i samlefelt hvis det ligger info her|  |
| ServReport.ServReq.Reservation | ServiceRequest.Note AA: Her menes det vel samlefelt? | | Ja |
| ServReport.ServReq.Comment | ServiceRequest.Note |  | Ja |

## Patient (Patient)
| XML | FHIR | Kommentar | Implementert |
|-|-|-|-|
| ServReport.Patient.BasisForHealthServices | | Mappes ikke | |
| ServReport.Patient.Sex | | Mappes ikke |  |
| ServReport.Patient.DateOfBirth | | Mappes ikke |  |
| ServReport.Patient.DateOfDeath | | Mappes ikke |  |
| ServReport.Patient.Name |  | Mappes ikke | |
| ServReport.Patient.IdByServProvider | | Mappes ikke | |
| ServReport.Patient.IdByRequester | | Mappes ikke |  |
| ServReport.Patient.OffId |  | I egen "guid db" | Ja |
| ServReport.Patient.TypeOffId |  | I guid db | Ja |
| ServReport.Patient.Address | |Mappes ikke||
| ServReport.Patient.Relation | | Mappes ikke |  |
| ServReport.Patient.ResponsibleHcp | | Se [mapping av roller](#headActors) | Ja |
| ServReport.Patient.AdmLocation | | Mappes ikke |  |
| ServReport.Patient.AdditionalId | | Mappes ikke |  |
| ServReport.Patient.Address | | Mappes ikke |  |
| ServReport.Patient.InfItem | DiagnosticReport.Extension.AdditionalInfo | Avventer svar fra sektor | Nei |
| ServReport.Patient.Patient | | Mappes ikke |  |

## AnalysedSubject (Specimen)
| XML | FHIR | Kommentar | Implementert |
|-|-|-|-|
| ServReport.Patient.AnalysedSubject.CollectedSample.CollectedDate | Specimen.Collection.collectedDateTime. |  | Ja |
| -------------------"------------------ | Observation.Effective |  | Ja |
| -------------------"------------------ | DiagnosticReport.Effective (tidligste Observation.Effective) |  | Ja |
| ServReport.Patient.AnalysedSubject.CollectedSample.CollectorComment | Specimen.Note |  | Ja |
| ServReport.Patient.AnalysedSubject.CollectedSample.CollectorCommentCoded | Specimen.Note |  | Ja |
| ServReport.Patient.AnalysedSubject.CollectedSample.Logistics | Specimen.Extension.AdditionalInfo |  | Ja |
| ServReport.Patient.AnalysedSubject.CollectedStudyProduct.Type | Specimen.Extension.AdditionalInfo |  | Ja |
| ServReport.Patient.AnalysedSubject.CollectedStudyProduct.ProducedDate | Specimen.Collection.collectedDateTime |  | Ja |
| ServReport.Patient.AnalysedSubject.CollectedStudyProduct.RefRelatedProd | Specimen.Extension.AdditionalInfo |  | Ja |
| ServReport.Patient.AnalysedSubject.Type | Specimen.Type | | Ja |
| ServReport.Patient.AnalysedSubject.TypeCoded | Specimen.Type | Ikke alltid oppgitt. Implisitt med NLK-koder | Ja |
| ServReport.Patient.AnalysedSubject.Number | specimen.Extension.AdditionalInfo | Kan vurdere å bruke container. Sjekk om dette skal overføre strukturert, eller legges i note når info ligger i meldingen | Ja |
| ServReport.Patient.AnalysedSubject.AnatomicalOrigin | Specimen.Collection.BodySite |  | Ja |
| ServReport.Patient.AnalysedSubject.IdByRequester | Specimen.Identifier |  | Ja |
| ServReport.Patient.AnalysedSubject.IdByServProvider | Specimen.AccessionIdentifier | | Ja |
| ServReport.Patient.AnalysedSubject.Comment | Specimen.Note |  | Ja |
| ServReport.Patient.AnalysedSubject.PreservMaterial | Specimen.Container.Additive |  | Ja |
| ServReport.Patient.AnalysedSubject.SampleCollInd | NA |  |  |
| ServReport.Patient.AnalysedSubject.SampleCollProc | Specimen.Collection.Method |  | Ja |
| ServReport.Patient.AnalysedSubject.SampleHandling | Specimen.Extension.AdditionalInfo |  | Ja |
| ServReport.Patient.AnalysedSubject.Accredited | Extension  | (midlertidig duplisert, skal bort fra Note) | Ja |
| ServReport.Patient.AnalysedSubject.AnalysedSubject | Nøstede prøver, ikke i bruk? |  |  |
| ServReport.Patient.AnalysedSubject.Pretreatment | Specimen.Extension.AdditionalInfo | Inneholder bla. faste/diett | Ja |
| ServReport.Patient.AnalysedSubject.RelServProv | Specimen.Collection.Collector? |  | Ja |

## ResultItem (Observation)
| XML | FHIR | Kommentar | Implementert |
|-|-|-|-|
| ServReport.Patient.ResultiItem.Comment | Observation.Note |  | Ja |
| ServReport.Patient.ResultItem.NumResult |  |  | Ja |
| ServReport.Patient.ResultItem.NumResult.NumResultValue | Observation.Value | Quantity | Ja |
| ServReport.Patient.ResultItem.TextResultResult | Observation.Value | CodeableConcept | Ja |
| ServReport.Patient.ResultItem.TextResult.Heading | Observation.Value | CodeableConcept.Code | Ja |
| ServReport.Patient.ResultItem.TextResult.TextResultValue | Observation.Value | CodeableConcept.Text, muligens kompleks verdi, leses inn som XmlNode | Ja |
| ServReport.Patient.ResultItem.TextResult.TextCode | Observation.Value | CodeableValue.Code | Ja |
| ServReport.Patient.ResultItem.Interval | Observation.Value | Range | Ja |
| ServReport.Patient.ResultItem.DateResult | Observation.Value | dateTime | Ja |
| ServReport.Patient.ResultItem.StructuredInfo.Type | Observation.Extension.AdditionalInfo |  | Ja |
| ServReport.Patient.ResultItem.StructuredInfo.CodedInfo | Observation.Extension.AdditionalInfo | Gjelder alle innholdtypene | Ja |
| ServReport.Patient.ResultItem.ServType |  | Styrer flyt ved mapping, mappes ikke |  |
| ServReport.Patient.ResultItem.RefInterval.Descr | Observation.ReferenceRange.Text |  | Ja |
| ServReport.Patient.ResultItem.Investigation.Id | Observation.Code | Sprikende bruk av DN og OT | Ja |
| ----------------"------------------ | Observation.Category | Mapping basert på kode og kodeverk | Ja |
| ServReport.Patient.ResultItem.Investigation.Spec | Observation.Method | Må kunne skilles fra Id i Code | Ja |
| ServReport.Patient.ResultItem.Investigation.Comment | Observation.Note |  | Ja |
| ServReport.Patient.ResultItem.InvDate | Observation.Effective ved radiologi |  | Ja |
| ----------------"-------------------- | DiagnosticReport.Effective ved radiologi (tidligste Observation.Effective) |  | Ja |
| ----------------"-------------------- | Observation.Extension.AdditionalInfo |  | Ja |
| ServReport.Patient.ResultItem.DevResultInd | Observation.Interpretation |  | Ja |
| ServReport.Patient.ResultItem.IdResultItem | Observation.Identifier | Denne må vi se mer på! Denne er ikke unik. Brukes også til intern kobling av resultater. | Ja |
| ServReport.Patient.ResultItem.RefIdResultItem | Observation.hasMember |  | Ja |
| ServReport.Patient.ResultItem.StatusInvestigation | Observation.Status [(detaljer her)](#headObservationStatus)  |  | Ja |
| ServReport.Patient.ResultItem.StatusChangeDate | Observation.Extension.AdditionalInfo |  | Ja |
| ServReport.Patient.ResultItem.DescrDate | Observation.Extension.AdditionalInfo |  | Ja |
| ServReport.Patient.ResultItem.CounterSignDate | Observation.Extension.AdditionalInfo |  | Ja |
| ServReport.Patient.ResultItem.MedicalValidationDate | Observation.Extension.AdditionalInfo |  | Ja |
| ServReport.Patient.ResultItem.RefAnalysedSubject | Observation.Specimen | RefAnalysedSubject kan i følge standard inneholde referanser til flere AnalysedSubjects, men vi tror at dette ikke brukes i praksis. Vi vil derfor bare referere til ett AnalysedSubject.  | Ja |
| ServReport.Patient.ResultItem.Accredited | Extension | (midlertidig duplisert, skal bort fra Note) | Ja |
| ServReport.Patient.ResultItem.ResultItem | Observation.hasMember? Observation.derivedFrom? Observation.component? | Nøstet ResultItem | Ja |
| ServReport.Patient.ResultItem.RelServProv | Observation.Performer. Hentes fra ServReport.RelServProv om den ikke finnes |  | Ja |
| ServReport.Patient.ResultItem.DiagComment | Observation.Extension.AdditionalInfo | Kandidat for å bli værende i Note? Avklares | Nei |

*) Når DN og OT har ulik verdi vises "OT (DN)", ellers OT eller DN etter hvilken som har innhold.

## <a name="headActors"></a>Aktører knyttet til en melding
Der er flere aktører i meldingen, med ulike roller. Disse mappes ikke som ressurser, men trekkes ut og brukes til å lage ResourceReference's, som brukes relevante steder.

### Roller
| Rolle | Bruk i Fhir | Kommantar | Implementert |
|-|-|-|-|
| ResponsibleHcp ("Rekvirent") | ServiceRequest.Requester |  | Ja |
| ServProvider ("Avsender") | Brukes som Performer om RelServProv mangler |  | Ja |
| Requester ("Mottaker") | ServiceRequest.Requester | Dersom ResponsibleHcp mangler | Ja |
| RelServProv ("Utfører/Ansvarlig") | DiagnosticReport.Performer, Observation.Performer |  | Ja |
| CopyDest ("Kopimottaker") | NA |  |  |

### Mapping
Aktører kan ha mange ulike konstallasjoner. De mappes til Practitioner eller Organization. I noen tilfeller blir det en av hver da xml gjerne oppgir person knyttet til virksomhet.
| XML | FHIR | Kommentar | Implementert |
|-|-|-|-|
| HCP.Inst | ResourceReference(**Organization**) |  | Ja |
| HCP.Inst.Name | ResourceReference(Organization).Identifier.Display |  | Ja |
| HCP.Inst.Id | ResourceReference(Organization).Identifier.Value |  | Ja |
| HCP.Inst.TypeId | ResourceReference(Organization).Identifier.System |  | Ja |
| HCP.Inst.HCPerson | ResourceReference(**Practitioner**) |  | Ja |
| HCP.Inst.HCPerson.Name | ResourceReference(Practitioner).Identifier.Display |  | Ja |
| HCP.Inst.HCPerson.Id | ResourceReference(Practitioner).identifier.value |  | Ja |
| HCP.Inst.HCPerson.TypeId| ResourceReference(Practitioner).identifier.system |  | Ja |
| HCP.HCProf | ResourceReference(**Practitioner**) |  | Ja |
| HCP.HCProf.Type | Practitioner.Qualification) + ResourceReference(Practitioner).Identifier.Display |  | Ja |
| HCP.HCProf.Name | ResourceReference(Practitioner).Identifier.Display |  | Ja |
| HCP.HCProf.Id | ResourceReference(Practitioner).Identifier.identifier.Value |  | Ja |
| HCP.HCProf.TypeId | ResourceReference(Practitioner).Identifier.System |  | Ja |
| HCP.Address |  | NA |  |
| HCP.Address.Type |  | NA |  |
| HCP.Address.TeleAddress | Practitioner.Telecom, Organization.TeleCom |  | Ja |


## <a name="headReportStatus"></a>DiagnosticReport.Status
DiagnosticReport.Status skal være en standard Fhir kode. Denne matcher godt med kodeverk 7306 "Status for rapport-S1".
AA: Denne må oppdateres med riktig tabell, og settes sammen med opplysninger fra ServType

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

## Observation.Meta
Søkbare koder ligger litt spredt forskjellige steder i svarrapportene:
- Delvis ligger de på ulike nivåer i nøstede ResultItems
- Delvis ligger de i ulike elementer inni hvert ResultItem (Investigation og TextResult)

For å forenkle søk og finne tilhørende "moder"-observation samles en kopi alle koder funnet i et nøstet sett av ResultItems/Observations i moder-observations Meta.Tags.

## Extensions
Det arbeides ut fra et ønske om å holde bruken av Fhir extensiosn på et minimum. Det er likevel avdekket noen tilfeller der det ikke er plass i relevant Fhir ressurs for informasjon som anses viktig i fagmeldingen (xml). I tillegg er det en del strukturert informasjon i xml, der det ikke finnes noen passende Fhir-element, som har fått en foreløpig/tentativ mapping inn i diverse note-elementer i Fhir. For (noen av) disse er det rimelig å anta at det vil komme behov for extensions i stedet.

### DiagnosticReport.Note
- ServReport.Comment
- ServReport.CodedComment
- ServReport.RefDoc (note om utelatt dokument)

### XXX.Accredited
- ServReport.Accredited
- AnalysedSubject.Accredited

### Observation.DiagnosticReportRef
Referanse tilbake til inneholdende DiagnosticReport.

## Fagområde - tillegg til utvalgte koder
- NLK: hente fagområde fra kodeverksdefinisjon
  - https://www.ehelse.no/kodeverk/laboratoriekodeverket
- NCRP: hente fagområde fra posisjon i kode
  - Sjette tegn angir modalitet, alle nukleærmedisinske har T i første tegn
  - https://www.ehelse.no/kodeverk/regler-og-veiledning-for-kliniske-kodeverk-i-spesialisthelsetjenesten-icd-10-ncsp-ncmp-og-ncrp/_/attachment/download/d876a76e-1f67-4211-8f68-e3c05a37fc0e:6ee71e82b4ce8f542d583fca6ee7d002ec39a1e6/Kodeveiledning%202021.18.12.2020.pdf
