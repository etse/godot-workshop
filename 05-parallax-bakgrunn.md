# Kamera og parallax bakgrunn

## Kamera som følger figuren

Til nå har vi kun kunne laget brett som passer innenfor skjermen - da kameraet
ikke beveger seg og lar oss se det som en utenfor. Dette kan løses ved å lage
et nytt kamera som hører til spillfiguren.

Legg til en ny node av typen "Camera2D", som en barnenode til spillkarakteren
og sørg for at spilleren er sentrert i kameraet. Om ønskelig kan du legge på
smoothing som gjør at kameraet har litt mykere bevegelser - og en limit hvis du
f.eks. ikke ønsker at kameraet ikke skal gå utenfor grensene til brettet.


## Parallax bakgrunn

Parallax-effekt går ut på at ting som er nærmere kameraet beveger seg fortere
når man beveger kameraet. Ved å la ting som er i bakgrunnen bevege seg tregere
en forgrunnen kan man gi en illusjon av dybde i spillet. Spesielt om man bruker
flere "lag" i bakgrunnen, som beveger seg i ulike hastigheter. I workshopen er
det kun lagt opp til å ha 1 bakgrunnsbilde - men om du ønsker kan du fint finne
noen flere bakgrunnsbilder.

For å lage bakgrunnen legger man til en "Parallax background"-node, som blir selve
kontroll-enheten for hele bakgrunnen. Man legger så til 1 eller flere "Parallax layers", 
alt etter hva man ønsker. I vårt eksempel har vi 1 layer. Man legger så bakgrunnen
som child-nodes. F.eks. kan man gjerne bruke en kombinasjon av flere bilder
for å lage 1 layer. Men vi gjør det enkelt i vårt eksempel og bruker kun 1 sprite
med bildet `assets/sky.png` som tekstur.

Om bildet ikke er stort nok til å dekke kartet ditt kan man skru på at man ønsker
mirroring. Den vil da legge 2 instanser av bildet og bruke det for å gi effekten
av infinite scroll. Viktig å huske på at den kun lager 2 instanser, så bildet må
stort nok til at man alltid kan dekke hele kameraet med kun 2 instanser av bildet.

Man kan justere hvor fort bakgrunnen skal bevege seg ved å endre på motion->scale i
inspector for parallax layer. Sett denne til et lavt tall, f.eks. noe mallom 0.1 og 0.5.
Prøv deg gjerne frem med ulike verdier, til du finner noe du er fornøyd med.

Vi skal så legge til [noen collectables](05-collectables.md).