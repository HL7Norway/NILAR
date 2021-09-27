# Referenced document
- Status: lukket
- Dato: 2021-09-22

## Problemstilling
Fagmelding (xml) har et element **ServRequest.RefDoc** som kan inneholde dokument (bilde, scannet dokument, pdf etc.). Disse vil (sannsynligvis) inneholde personidentifiserende informasjon.

## Ansett som alternativer
- Ta med RefDoc.
- Ikke ta med RefDoc, men en note om at slike finnes i originalmeldingen.
- Ta med linkede RefDoc, men ikke ta med embedded RefDoc, bare note om at de finnes.


## Beslutningsresultat
Valgt alternativ: "Ikke ta med RefDoc", fordi det er besluttet at personnummer og annen direkte personidentifikasjon ikke skal lagres i Nilar. Dette er det mest konsistente alkternativet som oppfyller dette kravet.

## Beskrivelse av alternativene 
### Ta med RefDoc
Alle RefDoc, lenker og embedded, tas inn i Nilar og legges ved Fhir.

- Bra, fordi RefDoc inneholder vesentlig informasjon vedrørende svarmeldingen.
- Dårlig, fordi personidentifikasjon potensielt blir inkludert i Nilar.
- Dårlig, fordi det krever extension i Fhir

### Ikke ta med RefDoc
RefDoc legges ikke ved, men en note i DiagnosticReport informerer om at slikt finnes i originalmeldingen.

- Bra, fordi man får kontroll på hva som blir med og kan utelukke sensitiv informasjon etter behov.
- Dårlig, fordi vesentlig info ikke blir videreformidlet.

### Ta med linkede RefDoc, men ikke ta med embedded RefDoc
RefDoc som inneholder lenker til dokument tas med som lenker, Refdoc som har embedded innhold tas ikke med, men en note i DiagnosticReport informerer om at slikt finnes i originalmeldingen.

- Bra, fordi lenker til vesentlig informasjon blir videreformidlet.
- Bra, fordi man får kontroll på hva som blir med og kan utelukke sensitiv informasjon etter behov.
- Dårlig, fordi vesentlig info ikke blir videreformidlet.
- Dårlig, fordi det krever extension i Fhir.
- Dårlig, fordi håndteringen av RefDoc blir inkonsistent.
