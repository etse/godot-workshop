# Fysikk og kollisjoner

Det er ikke et fullverdig plattformspill før man har utfordringer å hoppe
mellom. Altås trenger vi å få lagt inn noen plattformer man kan hoppe på. I vårt
første utkast kommer vi til å bruke godot-logoen tom texture på plattformen
vår. Men i neste steg vil vi se på det å bruke tilemaps for å lage et penere
brett bestående av sprites som passer fint sammen.

## Lage en plattform

Å lage en plattform er i stor grad det samme som å lage selve spillkarakteren
den eneste store forskjellen er at vi nå ønsker å bruke `StaticBody2D` i stede 
for `KinematicBody2D` siden plattformene skal være statiske. Lag derfor
en enkel StaticBody2D med en sprite som du legger Godot-logoen som tekstur,
og plasser den litt under spillkarakteren. Husk at vi ønsker å flytte
fysikk-kroppen og ikke spriten.

For å lett kunne plassere ting "pixel-perfect" anbefaler jeg å skru på grid-snap. 
(Knappen med ikonet som ser ut som en magnet forran et rutenett). Sett grid-snap
til størrelsen på plattformene (knappen med 3 prikker -> configure snap).

## Legge til gravitasjon

Vi har nå et par plattformer, og ønsker at karakteren vår skal falle ned på disse.
Dette betyr at vi må implementere en form for enkel fysikk i spillet vårt.  Det
er mulig å bruke den innebygde fysikk-motoren i spillet, men siden vi ikke skal ha
så avansert fysikk velger vi her å implementere den selv. 

Vi kommer til å kjøre en naiv implementasjon hvor vi ved hver fysikk-oppdatering
øker farten nedover. Dette betyr at vi må huske hastigheten vi har, og så øke
den gjevnlig. Vi går derfor tilbake til scriptet vi koblet til karakteren vår
og gjør noen små endringer:

```
const GRAVITY = 20
const SPEED = 200
var motion = Vector2(0 ,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	motion.y += GRAVITY
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:
		motion.x = 0
		
	move_and_slide(motion)
```

Hvis vi kjører spillet nå så vil vi se at karakteren vår begynner å falle, men vi
stopper ikke når vi treffer plattformene. Dette kommer av at vi ikke har
lagt til collision-detection enda. Vi trenger derfor å legge til en collision-box
på både spillkarakteren og plattformen.

## Implementere kollisjon

Å legge til kollisjon er som alt annet i GoDot, en node. Start med å legge til
en ny barnenode til spillkarakteren av typen `CollisionShape2D`. I inspector
setter man shape til "Rectangle", og sørger for at den passer veldig bra rundt
figuren vår. Gjør tilsvarende for plattformen du har laget.

Om du starter spillet på nytt nå vil du se at karakteren stopper på plattformen,
uten at vi trengte å skrive noe kode.

## Fikse merkelig fysikk (vi faller for fort?)

En ting man kan observere nå er at om man står stille på plattformen en stund og så
faller utenfor, så ser man at starthastigheten er alt for rask. Årsaken til dette
er at hastigheten i Y-retning fortsetter å øke selv når vi står stille. Vi har
altså ikke tatt høyde for at vi står på bakken.

Om man ser på dokumentasjonen av [move_and_slide](https://docs.godotengine.org/en/3.1/classes/class_kinematicbody2d.html#class-kinematicbody2d-method-move-and-slide)
ser man at denne funksjonen returnerer en vektor som representerer bevegelsen
som faktisk skjedde. Altså kan man ved å bare endre til `motion = move_and_slide(motion)`
få fikset dette problemet. 

## Legge til hopping

Uten hopping blir det ikke et ordentlig plattform-spill, og er det neste vi skal
implementere. Et av kravene for hopping er at man kun kan hoppe om man allerede
står på bakken. Funksjonen `is_on_floor()` kan her brukes som hjelpemetode. 
Men for at denne metoden skal funke må spillet vite hva som er bakke, og hva
som er vegger. Om man leser på dokumentasjonen til
[is_on_floor()](https://docs.godotengine.org/en/3.1/classes/class_kinematicbody2d.html#class-kinematicbody2d-method-is-on-floor)
ser man at den oppdateres når vi kaller `move_and_slide`.

Den andre parameteren til move_and_slide er en vetor som beskriver ha som er opp.
Denne brukes av funksjonen for å bestemme hva som er gulv og tak. Når vi ikke sender
inn noe blir alt antatt å være vegger. Vi må derfor endre til
`motion = move_and_slide(motion, Vector2(0, -1))` for at denne funksjonen skal fungere.

Forsøk å implementere en enkel variant av hopping, og finn en høyde på hoppet du
synes passer bra i spillet ditt. Et tips kan enten være å bruke knappen "ui_up"
eller definere en egen hoppe-knapp i input-mapping.

Når du er fornøyd med hoppingen kan du fortsette til [tilemaps og tilesets](./04-tilemaps-og-tilesets.md).
