05.10.2022

* Støtte for saksbehandler og verifikasjonspersonell uten HPR-nummer. Krever grunnlag header med relevant kode.
* Requester-Id som Header er DEPRECATED. Identifikator på requester må nå komme som en del av helse-id token.
* Sjekker PVK før sjekk om det ikke er noe data.

10.10.2022

* Rydde opp i url for extensions: http://nhn.no/fhir/nilar/StructureDefinition/nilar-other-info etc.
* Utelat History-extension når de bare er del av en komplett rapport. Tra kun med History-extension når den sendes sammen med oppdatering. (Basert på IdResultItem, kan være en skjør betingelse når IdResultItem mangler).

11.10.2022

* Timeout mot PVK-API satt ned fra 60s til 5s.
* Ytelsesforbedrelse (ca 200ms-600ms per request)

14.10.2022

* API krever organisasjon for requester som del av helse-id token.

18.10.2022

* API krever ikke organisasjon for requester som del av token da det ikke støttes i produksjon av helse-id
* QA og Prod kjører på helsenettet

20.10.2022
* Bugfix (#46471): Datofeil på kansellering. Lagt inn fallback til servReport.IssueDate dersom det ikke finnes Observations å hente dato fra.
* Bugfix (#46517): Datofeil på endringsmelding uten klokkeslett eller nær midnatt. Ble gjort om til GMT, som i slike tilfeller endrer dato.

24.11.2022
* Ytelsesforberedelser ved stort volum/antall spørringer gjennom forbedringer i mongodb kommunikasjon.

08.12.2022
* NLK-kodeverk oppdateres automatisk til siste versjon.
* Ny mekanisme for oppslag i PVK.
* Justering i tokenvalidering. Presisering fra HelseId - berører ikke etablert bruk fra KJ.

20.12.2022
* OperationOutcome.IssueType endres fra "Value" til "NotFound" dersom det ikke returneres noe data.
