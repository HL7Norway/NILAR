<h1>Eksempler på kall mot NILAR API</h1>
Denne siden viser eksempler på API kall mot NILAR.
Forebehold om at NILAR er under utvikling og eksemplene ikke nødvendigvis er up-to-date.
Sist oppdatert 19.04.2022

<h2>Basic</h2>

<h4>BaseURL</h4>
<p>Endepunkt Azure (forbigå proxy) - http://51.13.121.9:5212/fhir/</p>
<p>Endepunkt Azure - http://51.13.121.9:4141/fhir/</p>
<p>Endepunkt privat sky (forbigå proxy) - https://nilar-test.trd1-team-nilar-test.sky.nhn.no/fhir/</p>
<p>Endepunkt privat sky - https://nilar-test.trd1-team-nilar-test.sky.nhn.no/proxy/</p>
<p>NOTE: Azure fases ut, urler for priv sky vil endres</p>

<h4>Headers</h4>
<p>Nilar (forbigå proxy) krever header <code>x-nilar-patient</code> med pasient sitt fnr</p>
<p>Nilar (via proxy) krever header <code>person-id</code> med pasient sitt fnr og <code>Authorization</code> med helse-id token</p>
NOTE: Gjelder ikke for <code>/metadata</code>

<h2>Metadata</h2>
GET BaseURL/metadata
<p>header <code>tom</code></p>
<p>body <code>tom</code></p>

<h2>DiagnosticReport</h2>

<h4>1. Eksempel - Alle DN for Gry Telokk</h4>
POST BaseURL/DiagnosticReport/_search
<p>header <code>X-Nilar-Patient: 12057900499</code> </p>
<p>body <code>tom</code></p>

<h4>2. Eksempel - Spesifikk DN for Gry Telokk</h4>
POST BaseURL/DiagnosticReport/_search
<p>header <code>X-Nilar-Patient: 12057900499</code> </p>
<p>body <code>_id: guid</code></p>
  
<h4>3. Eksempel - Hopp over de første 50 DN og vis de neste 10 DN for Gry Telokk</h4>
POST BaseURL/DiagnosticReport/_search
<p>header <code>X-Nilar-Patient: 12057900499</code> </p>
<p>body <code>_count: 10</code> + <code>_skip: 50</code></p>

NOTE: "Total" vil fortsatt vise totalt antall DN for Gry Telokk. "Link>Self" vil reflektere spørringen. "Link" kan brukes til å navigere gjennom ressursene.

<h4>4. Eksempel - Alle DN for Gry Telokk med tilhørende Specimen</h4>
POST BaseURL/DiagnosticReport/_search
<p>header <code>X-Nilar-Patient: 12057900499</code> </p>
<p>body <code>_include: DiagnosticReport:specimen</code></p>

<h2>Observation</h2>

<h4>1. Eksempel - Alle Observation for Gry Telokk</h4>
POST BaseURL/Observation/_search
<p>header <code>X-Nilar-Patient: 12057900499</code> </p>
<p>body <code>tom</code></p>

<h4>2. Eksempel - Alle Observation for Gry Telokk som inneholder en Mikroskopisk undersøkelse</h4>
POST BaseURL/Observation/_search
<p>header <code>X-Nilar-Patient: 12057900499</code> </p>
<p>body <code>_tag: Mikroskopisk undersøkelse</code></p>
