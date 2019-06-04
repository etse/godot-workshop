# Kamera og parallax bakgrunn

## Kamera som følger figuren

Til nå har vi kun kunne laget brett som passer innenfor skjermen - da kameraet
ikke beveger seg og lar oss se det som en utenfor. Dette kan løses ved å lage
et nytt kamera som hører til spillfiguren.

Legg til en ny node av typen "Camera2D", som en barnenode til spillkarakteren
og sørg for at spilleren er sentrert i kameraet. Om ønskelig kan du legge på
smoothing som gjør at kameraet har litt mykere bevegelser - og en limit hvis du
f.eks. ikke ønsker at kameraet ikke skal gå utenfor grensene til brettet.

Hvis du starter spillet nå vil du se at kameraet vil følge bevegelsene til figuren
din. Men du vil også oppleve at mens du beveger deg får du noe "tearing" mellom
tilsene i brettet. Dette skjer fordi kameraet sin posisjon ikke er helt pixel-perfect.
For å fikse dette kan du få inn i project settings -> Rendering -> Quality -> 2D -> Pixel snap.
Problemet skal da være borte.

## Parallax bakgrunn

Parallax-effekt går ut på at ting som er nærmere kameraet beveger seg fortere
når man beveger kameraet. Ved å la ting som er i bakgrunnen bevege seg tregere
en forgrunnen kan man gi en illusjon av dybde i spillet. Spesielt om man bruker
flere "lag" i bakgrunnen, som beveger seg i ulike hastigheter. I workshopen er
det kun lagt opp til å ha 1 bakgrunnsbilde - men om du ønsker kan du fint finne
noen flere bakgrunnsbilder (f.eks. på [Open Pixel project](https://www.openpixelproject.com/)).

For å lage bakgrunnen legger man til en "Parallax background"-node, som blir selve
kontroll-enheten for hele bakgrunnen. Man legger så til 1 eller flere "Parallax layers", 
alt etter hva man ønsker. I vårt eksempel har vi 1 layer. Man legger så bakgrunnen
som child-nodes. F.eks. kan man gjerne bruke en kombinasjon av flere bilder
for å lage 1 layer. Men vi gjør det enkelt i vårt eksempel og bruker kun 1 sprite
med bildet `assets/sky.png` som tekstur.

Om bildet ikke er stort nok til å dekke kartet ditt kan man skru på at man ønsker
mirroring. Den vil da legge kopier av bildet rundt - slik at man dekker en større flate.
Man kan justere hvor fort bakgrunnen skal bevege seg ved å endre på motion->scale i
inspector for parallax layer. Sett denne til et lavt tall, f.eks. noe mallom 0.1 og 0.5.
Prøv deg gjerne frem med ulike verdier, til du finner noe du er fornøyd med.

Til slutt har vi noen forslag til [videre oppgaver man kan gjøre](07-videre-oppgaver.md).