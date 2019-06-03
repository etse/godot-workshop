# Sprites og bevegelse

Vi har nå satt opp prosjektet vårt. Og det første vi vil gjøre er å legge til
spillkarakteren, og lage et brett den kan bevege seg på. Vi kommer til å bruke noen
ferdige bilder for dette, disse ligger i `assets`-mappen. Så det første vi gjør er å
kopiere denne mappen inn i prosjektet vårt.

## Lage spillkarakteren

Som nevnt tidligere er alt i GoDot noder, dette betyr at også spillkarakteren vår
vil være en node i godot. Men en typisk sprite i godot består også gjerne av flere
deler. En spillkarakter består gjerne av 1 fysikk-kropp som er noden for karakteren,
og styrer alt av bevegelse og annen fysikk. I tillegg har man gjerne en form for
sprite som barnenode, som styrer visualiseringen - og gjerne en collision-box for
å fange opp kollisjoner. 

La oss starte med å opprette noden for karakteren. Dette kan man gjøre enten ved å klikke
på plusstegnet i scene-manager, eller ved å høyreklikke på "World"-noden og velge
`Add child-node`. Du vil da få opp en oversikt over alle de ulike nodene man har i GoDot.
Vi ønsker en 2D-fysikk-kropp. Ved å søke opp `PhysicsBody2D` vil alt utenom det vi er interessert
i være filtrert vekk.

For 2D-fysikk er det 3 standard-kropper man kan velge mellom. `KinematicBody2D` som er et
enkelt objekt som kan beveges og har en del ferdige implementasjoner for fysikk allerede
implementert. `RigidBody2D` som er kontrollert av fysikk-motoren i spillet. Dette betyr
at den vil være påvirket av ting som gravitasjon. Det siste er `StaticBody2D`, som bare
er et statisk objekt. Mye brukt til f.eks. å lage spillbrettet.

Vi starter med å bruke `KinematicBody2D`, så velg denne og gi den et navn som
indentifiserer at dette er spilleren. Vi ønsker også at spilleren skal være synlig
så vi må legge til en sprite som visualisering. Dette gjør vi ved å lage en node av
typen `Sprite` som barnenode til fysikk-noden. Vi må i tillegg gi spriten en tekstur, dette
gjør vi ved å fra ønsket bildefil over i "Texture"-feltet som man finner i inspector på
høyre side når sprite-noden er valgt.

![Bilde av inspector med tekstur](./bilder/add-texture.png)

Vi ønsker å flytte karakteren vår litt inn på spillbrettet. En viktig ting å være klar
over er at posisjonen til barnenoder, er relativt til foreldrenoden. Dette betyr at det
er fysikk-kroppen til spilleren vi vil flytte, og ikke selve spriten, da den vil flytte
seg sammen med kroppen. Ved å huke av for at man ikke skal kunne velge barnenodene 