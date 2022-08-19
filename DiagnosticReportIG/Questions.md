## Constraints på NamingSystem?
Hvordan bruke NamingSystem som constraint i Identifier? Eksempler? FSH?

## Utvide kodeverk for Observation.status?
Observation.status bruker et Fhir-kodeverk. Xml har flere statuser og vi trenger iallfall én ekstra for å støtte måten xml brukes. Vi har laget et VS som inkluderer dette, pluss kode fra eget CS. Er dette i strid med "required"?

## Synspunkter på extensions?
Innledende hypotese: Færrest mulig extensions. Har medført mellomløsninger med "formattert tekst i Annotation, som fungerer dårlig for klientsystem (Kjernejournal).
Forslag: 22 extension for å håndtere xml-datat som ikke passer inn i Fhir.

## Kanonisk url og navnekonvenson
Kanonisk url: http://hl7.fhir.no/nilar

Eksempel: http://hl7.no/fhir/**nilar**/StructureDefinition/Observation**Nilar**, med "dobbel" Nilar-annotering.

Jfr. http://hl7.no/fhir/StructureDefinition/**no-basis**-Patient, hvor "no-basis" er lagt i selve ressursnavnet.
