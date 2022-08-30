# Administrativt
## Kanonisk url og navnekonvenson
Kanonisk url: http://hl7.fhir.no/nilar

Eksempel: http://hl7.no/fhir/**nilar**/StructureDefinition/**Nilar**yObservation, med "dobbel" Nilar-annotering.

Jfr. http://hl7.no/fhir/StructureDefinition/**no-basis**-Patient, hvor "no-basis" er lagt i selve ressursnavnet.

*Avventer svar.*

## Publisering
Hvor skal IG publiseres? Hvordan styre i FSH?

*Henger sammen med kanonisk url. Det settes opp foreløpig publisering fra github.*

# Fhir standard
## Utvide kodeverk for Observation.status?
Observation.status bruker et Fhir-kodeverk. Xml har flere statuser og vi trenger iallfall én ekstra for å støtte måten xml brukes. Vi har laget et VS som inkluderer dette, pluss kode fra eget CS. Er dette i strid med "required"?

**Ja!!! IKKE gjør det!!!**

## Synspunkter på extensions?
Innledende hypotese/føring fra eHelse: Færrest mulig extensions.

Har medført mellomløsninger med "formattert tekst i Annotation, som fungerer dårlig for klientsystem (Kjernejournal).

**Forslag: ca. 20+ extensions for å håndtere xml-data som ikke passer inn i Fhir.**

Alternativer som har vært luftet er å pakke info i XHTML etc., men det framstår som å lage et eget extensionsystem istedet for å bruke det som finnes i Fhir.

*Litt bekymring for "krav" til mottakere, men ingen sterke innvendinger. Undersøk om noen bør være modifier extensions (som man helst ikke vi ha).*

# Verktøy
## Constraints på NamingSystem?
Hvordan bruke NamingSystem som constraint i Identifier? Eksempler? FSH?

*Har fått eksempel.*

# Andre innspill
- Ikke bruk 0..0, beskriv i IG at de ikke brukes.
- Se eksempel for dokumentasjon pr. element og VS for namingsystem.
- Kan dette på noen måte generaliseres? Områdeprofil? Nasjonal profil?
  - Profilen er "100%" styrt av kith-meldingen og er spesifikk for den. Lite egnet til nasjonal eller områdeprofil. Spesifikk Nilar (eller egentlig KITH) profil.