#!/bin/bash
echo "NPM install fhir r4 core 4.0.1 from package registry"
npm --registry https://packages.simplifier.net install hl7.fhir.r4.core@4.0.1
echo "NPM install fhir no-basis222 from local tgz"
npm install /github/workspace/snapshots/hl7.fhir.no.basis-2.2.2-snapshots.tgz
#echo "List node_modules directory"
#ls -al /github/workspace/node_modules
#echo "List node_modules hl7.fhir.no.basis directory"
#ls -al /github/workspace/node_modules/hl7.fhir.no.basis
echo "Make home publisher .fhir packages no-basis"
mkdir -p /home/publisher/.fhir/packages/hl7.fhir.no.basis#2.2.2/package
ls -al /home/publisher/.fhir/packages/hl7.fhir.no.basis#2.2.2/package
echo "Copy no-basis to /home/publisher/.fhir/packages/hl7.fhir.no.basis#2.2.2/package"
cp -r /github/workspace/node_modules/hl7.fhir.no.basis/* /home/publisher/.fhir/packages/hl7.fhir.no.basis#2.2.2/package
ls -al /home/publisher/.fhir/packages/hl7.fhir.no.basis#2.2.2/package
#echo "Copy a bogus ImplementationGuide resource instance to the package catalog for SUSHI to run (it needs to have the correct version in version element)"
#cp igs/snapshots/ImplementationGuide-hl7.fhir.no.basis.json /home/publisher/.fhir/packages/hl7.fhir.no.basis#2.2.2/package
echo "get latest publisher"
curl -L https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar -o ./input-cache/publisher.jar --create-dirs
echo "Run publisher: java -jar publisher.jar publisher -ig igs/$1/ig.ini"
java -jar ./input-cache/publisher.jar publisher -ig $1/ig.ini