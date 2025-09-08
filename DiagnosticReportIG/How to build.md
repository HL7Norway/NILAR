# Generelt

Implementasjonsguide for DiagnosticReport bruker FHIR Shorthand notasjon - FSH (uttales fish).

## Noen relevante ressurser
- FSH i standarden: https://hl7.org/fhir/uv/shorthand/
- FSH online - verktøy for konvertering fram og tilbake: https://fshonline.fshschool.org/
- FSH intro: https://www.devdays.com/wp-content/uploads/2023/08/230606_MarkKramer_Learn_to_FSH.pdf

## Bygging
FSH er en kort notasjon som må "kompileres" over til "ekte" Fhir ressurser.

### Relevante verktøy
- sushi: kompilator som genererer komplette FHIR-ressurser som json. Denne kan kjøres lokalt og man får feilmeldinger om ulike typer feil, f.ek. syntaks, referanser etc.
- ig-publisher: bygger ressursene med sushi og lager en komplett nettside med alle relevante ressurser. Denne brukes typisk i en bygge-pipeline på f.eks. github.

# Oppsette for lokal bygging med sushi

## Forutsetninger
- nodejs installert på lokal maskin

# Installasjon av sushi
```
npm install -g fsh-sushi
```

Etter dette skal man kunne kjøre kommandoen sushi inni DiagnosticReportIG-mappen (uten parametre). Man får output som viser at det bygges og man får opp en oppsummering av resultatet. 

Ved første kjøring vil man p.t. (2025) få feil på én av ressursene. Det som skjer bak kulissene er at sushi vil finne referanser til avhengigheter i sushi-config og laste dem ned til mappen **/home/.fhir**. Den ene som lastes ned er no-basis, altså baseressurser for bruk i Norge. Den som lastes ned av sushi er dessverre ikke komplett.

---
**_NOTE:_** Alle ressurser som brukes av sushi runtime kommer fra /home/.fhir. Eventuelle ressurser som lagres eller oppstår lokalt i f.eks. ./node_modules har ingen effekt og er bare arbeidsområde for manualle operasjoner.
---

## Manuell nedlasting av no-basis
Last ned snapshots fra https://simplifier.net/packages/hl7.fhir.no.basis manuelt. Eventuelt https://simplifier.net/packages/hl7.fhir.no.basis/2.1.2-beta etc. om en spesifikke version trengs. Versjon som hentes bør (må?) stemme med versjon i sushi-config.

Pakk filen ut manuelt med kommandoen
```
 npm-install hl7.fhir.no.basis-2.2.0-snapshots.tgz
 ```

 (oppgi filnavn som ble lastet ned, eventuelt med path).
 Output havner i en undermapper ./node_modules/hl7.fhir.no.basis. Denne ouptput'en må kopieres til og overskrive det som ble lastet ned i /home/.fhir/

 ```
 copy ./node_modules/hl7.fhir.no.basis/* /home/.fhir/packages/hl7.fhir.no.basis#2.2.0/package
 ```

 Målmappen bør antakelig slettes først. Merk også strukturen i målmappen.

 Etter dette vil sushi bruke de alleredene nedlastede pakkene i /home/.sushi og en kjøring av sushi i kildemappen bør nå gå gjennom uten feil.

 ### Opprydning
 Hvis snapshots ble lastet ned i prosjektmappen og pakket ut i node_modules i prosjektmappen, kan disse nå slettes. De gjør ingen skade (eller nytte), men om man ønsker å beholde dem bør de legges inn i .gitignore.

 ### Fiks av no-basis
 Det pågår arbeid med å skrive om publiseringen av no-basis slik at disse manuelle stegene skal bli unødvendige. Men enn så lenge er dette framgangsmåten.