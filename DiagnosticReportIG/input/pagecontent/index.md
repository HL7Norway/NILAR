# DiagnosticReportIG

Implementationguide for bruk av data fra Nilar. Data inn til Nilar leveres med KITH-meldingen svarrapport, v1.4 (og 1.3), som xml. Skjemadefinisjonen, sammen med observert variasjon i innholdet i disse meldingene, legger føringene som kommer til uttrykk i denne IG.

Denne IG skal IKKE brukes for å sende INN data til Nilar, til det er den for tett knyttet til gammel meldingsstandard. Den er kun ment som en beskrivels av hva man kan forvente UT fra Nilar, gitt at datagrunnlaget er meldinger mottatt på kith meldingsstandard.

Svarmeldingene oppstår i laboratoriene og det er ingen kobling til denne IG ved opprettelse av svarmeldingene. Videre mapping til Fhir tar utgangspunkt i innholdet i xml. Det er er derfor ingen bruk av denne IG ved opprettelse av den informasjon som leveres ut fra Nilar. IG'en er en ren dokumentasjon for mottakere av data fra Niler.

Nilar vil bestrebe seg på å levere data ihht. denne IG, men variasjon som legges inn i svarmeldingene der de oppstår gjør at det kan forekomme data som ikke oppfyller alle krav i denne IG. I den grad slike varianter er kjent er de tatt hensyn til i guiden.

## Struktur
I Fhir er de ulike ressursene "selvstendige", med mulige referanser til andre ressurser. I kith-meldingene som mottas fra laboratoriene har de en struktur der noen ressurser eksisterer inni en annen ressurs. Mappingen løser opp i dette, men bruker informasjon i strukturer til å hente enkelt verdier fra foreldre-elementer i strukturen. Resultatet er Fhir-ressurser som er så selvstendige som de skal være, men der man i varierende grad finner spor av den opprinnelige strukturen. Mest uttalt er dette ved resistensbestemmelse, der et hierarki av ResultItems/Observations brukes til å sammenstille ulike aspekter ved undersøkelsen. Dette hierarkiet, og nødvendigheten av å se hele sammenstillingen for å få et meningsfullt totalbilde, er bevart i Fhir-ressursene.

| Kith | Fhir |
|-|-|
|Message||
| - ServReport | -> DiagnosticReport|
| -- ServReq | -> ServiceRequest|
| -- Patient | -> Reference(Patient)|
| --- AnalysedSubject| -> Specimen |
| --- ResultItem | -> Observation |
| -- HCP | -> PractitionerRole |
| --- Inst/Dept | -> Reference(Organization) |
| --- HCPerson/HCProf | -> Reference(Practitioner) |