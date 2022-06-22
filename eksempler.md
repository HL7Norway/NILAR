<h1>Eksempler på kall mot NILAR API (TEST-miljøer)</h1>
Denne siden viser eksempler på API kall mot NILAR.
Forebehold om at NILAR er under utvikling og eksemplene ikke nødvendigvis er up-to-date.

Sist oppdatert 07.06.2022

<h2>Basic</h2>

<h4>BaseURL</h4>
<p>Endepunkt Azure (forbigå proxy) - http://51.13.121.9:5212/fhir/ (deprecated)</p> 
<p>Endepunkt Azure - http://51.13.121.9:4141/proxy/ (deprecated)</p>
<p> <i> OBS! Azure vil fases ut! </i> </p>


<p>Endepunkt privat sky (forbigå proxy) - https://test.nilar.nhn.no/fhir/ - i eksemplene omtalt som <b>BaseUrlFhir</b></p>
<p>Endepunkt privat sky - https://test.nilar.nhn.no/ - i eksemplene omtalt som <b>BaseUrlProxy</b></p>

<h4>Headers</h4>
<p>Nilar (forbigå proxy) krever header <br /> <code>x-nilar-patient</code> med pasient sitt fnr</p>
<p>Nilar (via proxy) krever header <br />
  <code>person-id</code> med pasient sitt fnr, <br />
  <code>requester-id</code> med hpr-nummer <b>dersom det ikke angis i token under 'helseid://claims/hpr/hpr_number'</b>, og <br />
  <code>Authorization</code> med helse-id token</p>
NOTE: Headers gjelder ikke for <code>/metadata</code> der man får info om fhir-støtte som er implementert i APIet.

<h4>Body</h4>
x-www-form-urlencoded

<h2>Metadata</h2>
GET BaseURL/metadata
<p>body <code>tom</code></p>

<h2>Eksempler</h2>

[A. RessursType](https://github.com/HL7Norway/NILAR/blob/main/eksempler.md#a-ressurstype)

[B. Spesifikk ressurs](https://github.com/HL7Norway/NILAR/blob/main/eksempler.md#b-spesifikk-ressurs)

[C. Skip og count](https://github.com/HL7Norway/NILAR/blob/main/eksempler.md#c-skip-og-count)

[D. Include med relaterte ressurser](https://github.com/HL7Norway/NILAR/blob/main/eksempler.md#d-include-med-relaterte-ressurser)

[E. Dato og datointervall](https://github.com/HL7Norway/NILAR/blob/main/eksempler.md#e-dato-og-datointervall)

[F. Søk på Meta Tag](https://github.com/HL7Norway/NILAR/blob/main/eksempler.md#f-søk-på-meta-tag)

<h3>A. RessursType</h3>

<h4>A.1. Format</h4>
POST {baseUrl}/{resourceType}/_search
<p>body <code>tom</code></p>

<h4>A.1.1. Eksempel - Alle DiagnosticReport for Gry Telokk utenfor proxy</h4>
POST <b>BaseUrlFhir</b>/DiagnosticReport/_search
<p>header <code>X-Nilar-Patient: 12057900499</code> </p>
<p>body <code>tom</code></p>

<h4>A.1.2. Eksempel - Alle Observation for Gry Telokk via proxy</h4>
POST <b>BaseUrlProxy</b>/Observation/_search
<p>header <code>Person-Id: 12057900499</code> </p>
<p>header <code>Requester-Id: hpr-nummer eller string </code> </p>
<p>header <code>Authorization: Bearer token </code> </p>
<p>body <code>tom</code></p>

<h3>B. Spesifikk ressurs</h3>

<h4>B.1. Format</h4>
POST {baseUrl}/{resourceType}/_search
<p>body <code>_id: {guid}</code></p>

<h4>B.1.1. Eksempel - Spesifikk Specimen for Gry Telokk utenfor proxy</h4>
POST <b>BaseUrlFhir</b>/Specimen_search
<p>header <code>X-Nilar-Patient: 12057900499</code> </p>
<p>body <code>_id: guid</code></p>

<h4>B.1.2. Eksempel - Spesifikk DiagnosticReport for Gry Telokk via proxy</h4>
POST <b>BaseUrlProxy</b>/DiagnosticReport/_search
<p>header <code>Person-Id: 12057900499</code> </p>
<p>header <code>Requester-Id: hpr-nummer eller string </code> </p>
<p>header <code>Authorization: Bearer token </code> </p>
<p>body <code>_id: guid</code></p>

<h3>C. Skip og count</h3>

<h4>C.1. Format</h4>
POST {baseUrl}/{resourceType}/_search
<p>body <code>_count: {count}</code> + <code>_skip: {skip}</code></p>

<h4>C.1.1. Eksempel - Hopp over 50 DiagnosticReport og vis 10 for Gry Telokk utenfor proxy</h4>
POST <b>BaseUrlFhir</b>/DiagnosticReport/_search
<p>header <code>X-Nilar-Patient: 12057900499</code> </p>
<p>body <code>_count: 10</code> + <code>_skip: 50</code></p>

NOTE: "Total" vil fortsatt vise totalt antall DN for Gry Telokk. "Link>Self" vil reflektere spørringen. "Link" kan brukes til å navigere gjennom ressursene.

<h3>D. Include med relaterte ressurser</h3>

<h4>D.1. Format</h4>
POST {baseUrl}/{resourceType}/_search
<p>body <code>_include: {relation}</code></p>

<h4>D.1.1. Eksempel - Alle DN for Gry Telokk med tilhørende Specimen utenfor proxy</h4>
POST <b>BaseUrlFhir</b>/DiagnosticReport/_search
<p>header <code>X-Nilar-Patient: 12057900499</code> </p>
<p>body <code>_include: DiagnosticReport:specimen</code></p>

<h3>E. Dato og datointervall</h3>
Støtter modifiers <code>eq</code>, <code>lt</code> og <code>gt</code>, se: https://www.hl7.org/fhir/search.html#modifiers

<h4>E.1. Format Dato</h4>
POST {baseUrl}/{resourceType}/_search
<p>body <code>date: {modifier}{dato}</code></p>

<h4>E.2. Format Datointervall</h4>
POST {baseUrl}/{resourceType}/_search
<p>body <code>date: gt{dato}</code> + <code>date: lt{dato}</code></p>

<h4>E.2.1 Eksempel - Alle Observations for Gry Telokk i en fem dagers periode i 2017</h4>
POST <b>BaseUrlFhir</b>/Observation/_search
<p>header <code>X-Nilar-Patient: 12057900499</code> </p>
<p>body <code>date: gt2017-09-20</code> + <code>date: lt2017-09-24</code></p>

<h3>F. Søk på Meta Tag</h3>

<h4>F.1. Format</h4>
POST {baseUrl}/{resourceType}/_search
<p>body <code>_tag: {code}</code></p>

<h4>F.1.1 Eksempel - Søk på Observasjoner for Gry Telokk som inneholde Meta Tag "Funn og undersøkelsesresultater"</h4>
POST <b>BaseUrlFhir</b>/Observation/_search
<p>header <code>X-Nilar-Patient: 12057900499</code> </p>
<p>body <code>_tag: FU</code></p>

<h3> DiagnosticReport med tilhørende ServiceRequest </h3>

<h4>F.1. Format</h4>
POST {baseUrl}/DiagnosticReport/_search
<p>body <code>_id : <guid></code></p>
<p>body <code>_include : DiagnosticReport:based-on</code></p>

<h3> PractitionerRole for DiagnosticReport </h3>

<h4>F.1. Format</h4>
POST {baseUrl}/DiagnosticReport/_search
<p>body <code>_id : <guid></code></p>
<p>body <code>_include : DiagnosticReport:based-on</code></p>
<p>body <code>_include:iterate : ServiceRequest:requester</code></p>
