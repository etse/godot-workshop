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

Beskrive hvordan få en parallax bakgrunn med potensielt flere layers.

Til slutt har vi noen forslag til [videre oppgaver man kan gjøre](07-videre-oppgaver.md).