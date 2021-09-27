# Mapping av Practitioner og Organization
- Status: åpen
- Dato: 2021-09-27

## Problemstilling
Practitioner og Organization er entiteter med primærkilde i andre registre enn Nilar, med tilhørende id i respektive systemer (HER-ID i adresseregisteret, HPR-NR i personellregisteret). Disse finnes i innkommende meldinger, sammen med navn etc. som bidrar til å identifisere aktøren. Men de ulike lab-systemene gjør dette ulikt, dels pga. feilaktig bruk og delvis fordi de har utdaterte kopier av registrene.

Det som kommer av informasjon i svarmeldingene har varienrende innhold, men har i en del tilfeller informasjon som er nyttig for de systemene som skal bruke Nilar. Dette skaper spørsmål vedrørende hvordan disse systemene skal få tak i informasjonen de trenger og Nilars rolle i å legge til rette.

### Begrensning
Det datagrunnlag vi får inn pr i dag, basert på innhold i et utvalg testmeldinger, gir ikke fullstendig grunnlag for noen av de foreliggende alternativene. De to første alternativene kan implementeres på en rudimentær måte med mangelfull/upresis informasjon.

## Ansett som alternativer
- Ikke mappe disse ressursene, bare bruk info til å lage Identifier i Reference.
- Lage nye ressurser for hver svarrapport - mange duplikater av samme ressurs.
- Lage ressurser basert på id og oppdatere innhold ved hver svarmelding.
- Lage ressurser basert på id, men ikke oppdatere innhold ved hver svarmelding.
- Lage ressurser basert på id, hente data fra aktuelt register.

## Beslutningsresultat
Tentativt er det valgt alternativet med å ikke mappe disse ressursene, bare lage referanser ut fra id og navn. Begrunnelsen er at man da unngår å duplisere og potensielt vedlikeholde data som finnes i andre registre.

### Begrunnelse <! - valgfritt ->
- [f.eks. hvilke fordeler/ulemper ved de ulike alternativene som er vektlagt, ...]
- [andre argumenter som er tilkommet...]

## Beskrivelse av alternativene
### Ikke mappe ressursene Practitioner og Organization
I dette alternativet brukes informasjonen til å bygge opp en Reference til en ressurs i et eksternt system. Denne Reference ligger inni de respektive ressursene som har referansen, de lever med disse ressursene og trenger ingen oppdatering senere.

- Bra, fordi det ikke innebærer duplisering av data.
- Bra, fordi det ikke innebærer oppdatering eller synking mot eksternt register.
- Bra, fordi klientsystem får basisinformasjon og kan vise noe til sluttbruker uten å slå opp i eksternt system.
- Bra, fordi klientsystem får samme basisinformasjon hver gang samme ressurs hentes ut.
- Dårlig, fordi klientsystem ikke får oppdatert basisinformasjon ved endring i eksternt register.
- Dårlig, fordi klientsystem ikke kan styre layout eller innhold uten å slå opp i eksternt system.

### Lage nye ressurser for hver svarrapport
Opprett nye Practitioner og Organization ressurser for hver svarrapport.

- Bra, fordi det ikke innebærer oppdatering eller synking mot eksternt register.
- Bra, fordi klientsystem får basisinformasjon og kan vise noe til sluttbruker uten å slå opp i eksternt system.
- Bra, fordi klientsystem får samme basisinformasjon hver gang samme ressurs hentes ut.
- Bra, fordi klientsystem får strukturert informasjon og kan styre layout eller innhold uten å slå opp i eksternt system.
- Dårlig, fordi det innebærer mange duplikater av samme data.
- Dårlig, fordi klientsystem ikke får oppdatert basisinformasjon ved endring i eksternt register.

### Lage ressurser basert på id og oppdatere innhold ved hver svarmelding
Det opprettes ressurser for Practioner og Organization basert på id i svarmeldingen. Ressursen gjenbrukes i nye svarmeldinger med samme id, men oppdateres med innhold fra siste melding.

- Bra, fordi det bare holdes ett duplikat av hver ressurs.
- Bra, fordi det ikke innebærer oppdatering eller synking mot eksternt register.
- Bra, fordi klientsystem får basisinformasjon og kan vise noe til sluttbruker uten å slå opp i eksternt system.
- Bra, fordi klientsystem får strukturert informasjon og kan styre layout eller innhold uten å slå opp i eksternt system.
- Dårlig, fordi klientsystem ikke får oppdatert basisinformasjon ved endring i eksternt register.
- Dårlig, fordi ressursene stadig blir oppdatert med et utall versjoner.
- Dårlig, fordi klientsystem kan få ulik basisinformasjon hver gang samme ressurs hentes ut.

### Lage ressurser basert på id, men aldri oppdatere
Det opprettes ressurser for Practioner og Organization basert på id i svarmeldingen. Ressursen gjenbrukes i nye svarmeldinger med samme id, med det innholdet den fikk da den ble opprettet.

- Bra, fordi det bare holdes ett duplikat av hver ressurs.
- Bra, fordi det ikke innebærer oppdatering eller synking mot eksternt register.
- Bra, fordi klientsystem får basisinformasjon og kan vise noe til sluttbruker uten å slå opp i eksternt system.
- Bra, fordi klientsystem får samme basisinformasjon hver gang samme ressurs hentes ut.
- Bra, fordi klientsystem får strukturert informasjon og kan styre layout eller innhold uten å slå opp i eksternt system.
- Dårlig, fordi klientsystem ikke får oppdatert basisinformasjon ved endring i eksternt register.
- Dårlig, fordi ressursene stadig blir hengende igjen med utdatert info, også for nye svar.

### Lage ressurser basert på id, hente data fra aktuelt register
Det opprettes ressurser basert på id, men det brukes ikke øvrig info fra meldingen. Istedet hentes info fra ressursens primærregister (adresseregister, helsepersonellregister).

- Bra, fordi det bare holdes ett duplikat av hver ressurs.
- Bra, fordi klientsystem får samme basisinformasjon hver gang samme ressurs hentes ut.
- Bra, fordi klientsystem får oppdatert basisinformasjon ved endring i eksternt register.
- Bra, fordi klientsystem får basisinformasjon og kan vise noe til sluttbruker uten å slå opp i eksternt system.
- Bra, fordi klientsystem får strukturert informasjon og kan styre layout eller innhold uten å slå opp i eksternt system.
- Dårlig, fordi det krever en oppdateringsstrategi mot eksterne registre.
