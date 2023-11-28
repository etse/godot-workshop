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
Vi ønsker en 2D-fysikk-kropp.

For 2D-fysikk er det 3 standard-kropper man kan velge mellom. `CharacterBody2D` som er et
enkelt objekt som kan beveges og har en del ferdige implementasjoner for fysikk allerede
implementert. `RigidBody2D` som er kontrollert av fysikk-motoren i spillet. Dette betyr
at den vil være påvirket av ting som gravitasjon. Det siste er `StaticBody2D`, som bare
er et statisk objekt. Mye brukt til f.eks. å lage spillbrettet. For å finne en bestemt node
kan man enten søke den opp om man kjenner til navnet eller lete litt i treet av ulike noder.

Vi starter med å bruke `CharacterBody2D`, så velg denne og gi den et navn som
indentifiserer at dette er spilleren. Vi ønsker også at spilleren skal være synlig
så vi må legge til en sprite som visualisering. Dette gjør vi ved å lage en node av
typen `Sprite2D` som barnenode til fysikk-noden. Vi må i tillegg gi spriten en tekstur, dette
gjør vi ved å dra ønsket bildefil over i "Texture"-feltet som man finner i inspector på
høyre side når sprite-noden er valgt.

![Bilde av inspector med tekstur](./bilder/add-texture.png)

Vi ønsker å flytte karakteren vår litt inn på spillbrettet. En viktig ting å være klar
over er at posisjonen til barnenoder, er relativt til foreldrenoden. Dette betyr at det
er fysikk-kroppen til spilleren vi vil flytte, og ikke selve spriten, da den vil flytte
seg sammen med kroppen. Dette kan man skru ved å bruke knappen vist i bildet under.

![Bilde av knappen for å skru av mulighet for å velge barnenoder](./bilder/not-select-child.png)


### Få karakteren til å bevege seg

For å få karakteren vår til å bevege seg må vi til med noe kode. Vi må derfor starte
med å koble et script til karakteren vår. Dette kan man gjøre ved å høyreklikke på
fysikk-kroppen til spillkarakteren og velge `Attach script`. Når filen er opprettet
vil den komme med en tom `_ready`-funksjon. Denne funksjonen kan sammenlignes med
`componentDidMount` om man er vant med å skrive react-kode. Siden vi ønker å skrive
kode som blir kjørt som en del av main-loopen i spillet vårt er det ikke denne vi skal
bruke. I stedet ønsker vi å lage en ny funksjon `func _process(delta)`.
Denne funksjonen blir kalt ved hver fysikk-oppdatering, og delta er tiden siden forrige
gang denne funksjonen ble kalt.

I denne funksjonen ønsker vi å sjekke om du trykker til høyre eller venstre - og i så fall
bevege deg den retningen du ønsker. For å hjelpe med dette har vi et `Input`-objekt som
har metoden [Input.is_action_pressed(inputName: string)](https://docs.godotengine.org/en/3.1/tutorials/inputs/inputevent.html#actions).

Vi ønsker å gjøre noe tilsvarende: 
```
func _process(delta):
    if Input.is_action_pressed("ui_right"):
        # Move right
```

Ui_right er her navnet på knappen vi ønsker å sjekke at er trykket. Dette kommer av at
GoDot kommer ferdig med egen key-mapper. Ui_right er en av default-knappene som er satt
opp, og er pil-høyre eller numpad-høyre om man ikke har endret noe. Om man ønsker å legge
til flere knapper, eller endre konfigureringen kan dette gjøres under Input Mapping i
project settings.

Vi ønsker nå å flytte selve karakteren vår. For dette finnes det allerde en god del
metoder på [KinematicBody2D](https://docs.godotengine.org/en/3.1/classes/class_kinematicbody2d.html)
som vi kan bruke. Spesielt metoden [move_and_slide](https://docs.godotengine.org/en/3.1/classes/class_kinematicbody2d.html#class-kinematicbody2d-method-move-and-slide)
vil være nyttig for oss. Denne metoden tar inn en vektor2 for retningen man ønsker å flytte.
Vi kan derfor flytte karakteren vår ved å gjøre noe tilsvarende `move_and_slide(Vector2(200, 0))`

Implementer slik at karakteren kan flyttes til både høyre og venstre, og gå så
videre til [fysikk og kollisjoner](./03-fysikk-og-kollisjoner.md).
