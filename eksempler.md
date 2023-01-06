<h1>Eksempler på kall mot NILAR API (TEST-miljøer)</h1>
Denne siden viser eksempler på API kall mot NILAR.<br />
Forebehold om at NILAR er under utvikling og eksemplene ikke nødvendigvis er up-to-date.<br />
<br />
NOTE: Dette er et **utvalg av eksempelspørringer** for å understøtte utviklere i oppstartsfasen. Se Nilar sin FHIR profil på [HL7 Github](https://hl7norway.github.io/NILAR/DiagnosticReportIG/CurrentBuild/toc.html).

Sist oppdatert 06.01.2023

<h2>Basic</h2>

<h4>BaseURL</h4>

Nilar eksponerer **to endepunkter for test** slik at det er mulig å implementere mot løsningen uten Helse-ID token.<br />
I produksjon er kun **endepunkt 2** tilgjengelig.

<p>Endepunkt 1 (forbigå proxy - uten Helse-ID) - https://test.nilar.nhn.no/fhir/
<p>Endepunkt 2 - https://test.nilar.nhn.no/

<h4>Headers for Endepunkt 1</h4>

<p>NOTE: Headers gjelder ikke for <code>/metadata</code>.</p>

<p>Nilar (forbigå proxy) headers <br /> 
  <code>x-nilar-patient</code> med pasient sitt fnr
  <code>x-nilar-requester</code> med requester sitt fnr/hpr,<br />
  <code>x-nilar-reason</code> med samtykkekode - default 0, <br />
  <code>x-nilar-correlation-Id</code> - helst guid, <br /></p>

<h4>Headers for Endepunkt 2</h4>
<p>Nilar (via proxy) krever headers <br />
  <code>person-id</code> med pasient sitt fnr, <br />
  <code>Authorization</code> med helse-id token<br />
  <code>Grunnlag</code> med samtykkekode - default 0, <br /></p>
  
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

[G. DiagnosticReport med tilhørende ServiceRequest](https://github.com/HL7Norway/NILAR/blob/main/eksempler.md#g-diagnosticreport-med-tilhørende-servicerequest)

[H. PractitionerRole for DiagnosticReport](https://github.com/HL7Norway/NILAR/blob/main/eksempler.md#h-practitionerrole-for-diagnosticreport)

<h3>A. RessursType</h3>

<h4>A.1. Format</h4>
POST {baseUrl}/{resourceType}/_search
<p>body <code>tom</code></p>

<h4>A.1.1. Eksempel Endepunkt 1 - Alle DiagnosticReport for Gry Telokk utenfor proxy</h4>
POST https://test.nilar.nhn.no/fhir/DiagnosticReport/_search
<p>header <code>X-Nilar-Patient: 12057900499</code> </p>
<p>body <code>tom</code></p>

<h4>A.1.2. Eksempel Endepunkt 2 - Alle Observation for Gry Telokk via proxy</h4>
POST https://test.nilar.nhn.no/Observation/_search
<p>header <code>Person-Id: 12057900499</code> </p>
<p>header <code>Authorization: Bearer token </code> </p>
<p>body <code>tom</code></p>

<h3>B. Spesifikk ressurs</h3>

<h4>B.1. Format</h4>
POST {baseUrl}/{resourceType}/_search
<p>body <code>_id: {guid}</code></p>

<h4>B.1.1. Eksempel Endepunkt 1 - Spesifikk Specimen for Gry Telokk utenfor proxy</h4>
POST https://test.nilar.nhn.no/fhir/Specimen_search
<p>header <code>X-Nilar-Patient: 12057900499</code> </p>
<p>body <code>_id: guid</code></p>

<h4>B.1.2. Eksempel Endepunkt 2 - Spesifikk DiagnosticReport for Gry Telokk via proxy</h4>
POST https://test.nilar.nhn.no/DiagnosticReport/_search
<p>header <code>Person-Id: 12057900499</code> </p>
<p>header <code>Requester-Id: hpr-nummer eller string </code> </p>
<p>header <code>Authorization: Bearer token </code> </p>
<p>body <code>_id: guid</code></p>

<h3>C. Skip og count</h3>

<h4>C.1. Format</h4>
POST {baseUrl}/{resourceType}/_search
<p>body <code>_count: {count}</code> + <code>_skip: {skip}</code></p>

<h4>C.1.1. Eksempel Endepunkt 1 - Hopp over 50 DiagnosticReport og vis 10 for Gry Telokk utenfor proxy</h4>
POST https://test.nilar.nhn.no/fhir/DiagnosticReport/_search
<p>header <code>X-Nilar-Patient: 12057900499</code> </p>
<p>body <code>_count: 10</code> + <code>_skip: 50</code></p>

NOTE: "Total" vil fortsatt vise totalt antall DN for Gry Telokk. "Link>Self" vil reflektere spørringen. "Link" kan brukes til å navigere gjennom ressursene.

<h3>D. Include med relaterte ressurser</h3>

<h4>D.1. Format</h4>
POST {baseUrl}/{resourceType}/_search
<p>body <code>_include: {relation}</code></p>

<h4>D.1.1. Eksempel Endepunkt 1 - Alle DN for Gry Telokk med tilhørende Specimen utenfor proxy</h4>
POST https://test.nilar.nhn.no/fhir/DiagnosticReport/_search
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

<h4>E.2.1 Eksempel Endepunt 1 - Alle Observations for Gry Telokk i en fem dagers periode i 2017</h4>
POST https://test.nilar.nhn.no/fhir/Observation/_search
<p>header <code>X-Nilar-Patient: 12057900499</code> </p>
<p>body <code>date: gt2017-09-20</code> + <code>date: lt2017-09-24</code></p>

<h3>F. Søk på Meta Tag</h3>

<h4>F.1. Format</h4>
POST {baseUrl}/{resourceType}/_search
<p>body <code>_tag: {code}</code></p>

<h4>F.1.1 Eksempel Endepunkt 1 - Søk på Observasjoner for Gry Telokk som inneholde Meta Tag "Funn og undersøkelsesresultater"</h4>
POST https://test.nilar.nhn.no/fhir/Observation/_search
<p>header <code>X-Nilar-Patient: 12057900499</code> </p>
<p>body <code>_tag: FU</code></p>

<h3>G. DiagnosticReport med tilhørende ServiceRequest</h3>

<h4>G.1. Format</h4>
POST {baseUrl}/DiagnosticReport/_search
<p>body <code>_id : guid</code></p>
<p>body <code>_include : DiagnosticReport:based-on</code></p>

<h3>H. PractitionerRole for DiagnosticReport</h3>

<h4>H.1. Format</h4>
POST {baseUrl}/DiagnosticReport/_search
<p>body <code>_id : guid</code></p>
<p>body <code>_include : DiagnosticReport:based-on</code></p>
<p>body <code>_include:iterate : ServiceRequest:requester</code></p>
