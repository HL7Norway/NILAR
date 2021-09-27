# Presented form
- Status: lukket
- Dato: 2021-09-22

## Problemstilling
DiagnosticReport (Fhir) har et element **presentedForm** der en kopi av den originale rapporten kan legges, altså hele fagmeldingen som xml. Dette vil potensielt undergrave eventuelle tiltak for å anonymisere data i Nilar-databasen.

## Ansett som alternativer
- Legge ved originalmeldingen
- Ikke legge ved originalmeldingen

## Beslutningsresultat
Valgt alternativ: "Ikke legge ved originalmeldingen", fordi det er besluttet at personnummer og annen direkte personidentifikasjon ikke skal lagres i Nilar.

## Beskrivelse av alternativene 
### Legge ved originalmeldingen
Hele originalmeldingen (xml, fagmelding) legges ved

- Bra, fordi alle data blir med i original form.
- Bra, fordi rapporten kan vises i "kjent" format med kjent innhold.
- Dårlig, fordi alle personidentifikasjon blir inkludert i Nilar.
- Dårlig, fordi den kan invitere til "misbruk" av ustrukturert visning framfor å bruke strukturerte data fra Fhir.

### Ikke legge ved originalmeldingen
Originalmeldingen legges ikke ved, men representeres bare med de elementene som er trekt ut i Fhir ressursene.

- Bra, fordi man får kontroll på hva som blir med og kan utelukke sensitiv informasjon etter behov.
- Dårlig, fordi data kan gå tapt i uttrekket til Nilar
  