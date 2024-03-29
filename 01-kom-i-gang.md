## Komme i gang

Det første vi skal gjøre er å laste ned Godot og sette opp prosjektet vårt. Godot kan lastes ned gjennom
[deres nettsider](https://godotengine.org/download). Du vil her få opp 2 alternativer *Godot Engine* og
*Godot Engeine - .NET*. Forskjellen mellom disse er kun at den ene legger opp til å kode i GDScript og den andre i C#.
I denne workshopen kommer vi til å bruke GDScript - som et et programmeringsspråk som ligner veldig på python.

Når du starter opp Godot vil du bli møtt av *Project manager*. Vi ønsker her å starte et nytt prosjekt. Vi kan da velge
mellom *Forward+*, *Mobile* og *Compatability*. Her går vi bare for *Forward+*, som skal være standardvalget.

Når du har laget prosjektet vil du bli møtt av en editor med en 3D-visning i midten. Siden vi i førsteomgang skal
lage et 2D spill ønsker vi å bruke 2D-visningen. Trykk på knappen "2D" som du finner øverst i midten på siden for
å endre perspektiv.

![Skjermbilde av hvordan Godot ser ut når man åpner det første gang](./bilder/forste-apning.png)

Skjermbilde består av 4 deler som det er viktig å bli komfortabel med når man bruker Godot. Det første oppe til venstre
er der vi vil kontrollere nodene i spillet vårt. I Godot er alle objekter en node som ligger i et hieraki. En node kan
har gjerne noen properties som kan konfigureres. I tillegg har den gjerne barnenoder. Man kan også knytte script til
en bestemt node. På mange måter en en node et objekt i objekt-orientert programmering. Og typen node vil da være hvilken
klasse den er en instans av.

*Root-node* kalles en *Scene*, og skal være en enkeltstående enhet. Et spill har typisk mange scener som er gjennbrukbare. Under en
scene kan man legge flere noder som tilhører scenen. I eksempelet under har det blitt laget en node for bakgrunnen og
en sprite-node for spilleren. Spilleren har da en undernode som implementerer 2D-fysikk - som igjen har en undernode
som beskriver kollisjonsboksen. Disse 3 tingene til sammen gjør at man har en *Sprite* som kan beveget på, som
bruker enkel fysikk og kan kollidere med andre noder.

Det over ble veldig overordnet, så ikke vær redd om det var litt forvirrende. Vi blir å se mer detaljert på alt utover
i workshopen.

![Bilde av et eksempel-oppsett av noder](./bilder/nodes.png)

Nede til venstre finner du filsystemet. Som egentlig ikke krever ytterligere forklaring. Til høyre finner du *inspector*.
Dette er steder hvor du kan endre konfigurasjonen til et valgt node. Du kan også sette opp *signaler* som er det Godot
kaller det event-drevne systemet sitt. (f.eks. kan du lage et signal for når en kollisjon skjer, eller man trykker på en
knapp).

![Bilde av inspector](./bilder/inspector.png)

Velg "2D Scene" under "Create root node", rename den til "World" og fortsett til [sprites og bevegelse](./02-sprites-og-bevegelse.md).
