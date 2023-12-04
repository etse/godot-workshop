# Animasjoner

Ting begynner nå å se en del bedre ut, men karakteren vår er fortsatt ganske
kjedelig uten animasjoner. I tillegg ser det veldig rart ut at han ser samme
vei uavhengig av hvilken vei vi beveger oss.

## Få karakteren til å snu seg

For å snu karakteren vår når vi beveger oss til venstre når vi "flippe"
spriten vår når vi beveger oss i den retningen. Dette kan gjøres ved å
sette feltet `flip_h` på spriten til true. Men for å få til dette må vi klare
å akksessere spriten vår fra koden. 

Spriten vår er en barnenode, og for å akksessere barnenoder har GDScript
spesialtegnet `$`. Hvis man f.eks. ønsker å akksessere en barnenode med navnet
`Sprite2D` kan man da skrive `$Sprite2D`. Med andre ord kan vi flippe spriten ved
å skrive `$Sprite2D.flip_h = true`.

Bruk dette til å få karakteren til å se i riktig retning når man beveger den.

## Løpe og idle animasjoner

Det neste er å få til en løpe-animasjon på figuren. For å få til dette må vi
endre bra å bruke en vanlig Sprite til å bruke AnimatedSprite. Høyreklikk på
spriten til spilleren og velg "Change Type", og bytt den til en AnimatedSprite.

Når du har valgt "AnimatedSprite" må du legge til "SpriteFrames" i inspector.
Du skal du få opp en visning nederst hvor du kan redigere animasjonene til denne
spriten. Vi ønsker her å i første omgang legge til `idle` og `run` som animasjoner. 
Når du har valgt en animasjon kan du legge til "frames" ved å dra bildene inn
i seksjonen "Animation frames". Velg en FPS som du synes der bra ut, min anbefaling er
cirka 10 FPS for løpe-animasjonen. For idle har vi kun 1 frame, så der har ikke FPS noe å si.

Når vi nå har laget animasjonene må vi også sørge for at de blir aktivert på riktig
tid. For å gjøre dette kan vi bruke `play`-funksjonen, som tar inn som argument
hvilken animasjon den skal spille av. 

F.eks. kan vi skrive `$Sprite2D.play("run")` for å spille av løpe-animasjonen. 

Sørg for at figuren nå spiller løpe-animasjonen når man beveger seg, og går tilbake
til idle når man står stille.

## Enkel hoppe- og falle-animasjon

Det neste er å få til en enkel animasjon for når man hopper. I motsetning til
løpe-animasjonen er dette en animasjon som man gjerne ikke ønsker at loopes. 
I eksempel-implementasjonen som ligger ved prosjektet er hoppe animasjonen delt
i to: først en del for selve hoppet, og en annen del for når man faller ned
igjen. Den siste animasjonen gjenbrukes også når man faller ned fra plattformer.

Prøv deg litt frem og lag en hoppeanimasjon du er fornøyd med. Når dette er gjort
kan du gå videre til [kamera og parallax bakgrunn](05-parallax-bakgrunn.md).
