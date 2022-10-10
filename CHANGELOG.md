05.10.2022

* Støtte for saksbehandler og verifikasjonspersonell uten HPR-nummer. Krever grunnlag header med relevant kode.
* Requester-Id som Header er DEPRECATED. Identifikator på requester må nå komme som en del av helse-id token.
* Sjekker PVK før sjekk om det ikke er noe data.

10.10.2022

* Rydde opp i url for extensions: http://nhn.no/fhir/nilar/StructureDefinition/nilar-other-info etc.
* Utelat History-extension når de bare er del av en komplett rapport. Tra kun med History-extension når den sendes sammen med oppdatering. (Basert på IdResultItem, kan være en skjør betingelse når IdResultItem mangler).

