# Flere brett

Det neste vi skal gjøre er å lage flere brett. For dette er det det et par komponenter som
gjerne skal gjenbrukes så vi ønsker å gjøre disse til scenes som kan importeres flere steder i
stede for å kopiere de. Som med annen kode gjør dette det lettere å forvalte spillet, siden man
kun trenger å endre 1 plass om man ønsker å endre noe.

Vi kan start med å gjøre "head up display" og spillerkarakteren til egne scenes som kan gjenbrukes.
(høyreklikk og velg "Save branch as scene")

Det neste vi skal gjøre er å lage en ny 2D-scene for det neste brettet, og gi den et beskrivende navn.
Legg så inn spilleren og heads-up-displayet som noder på det nye brettet. Du kan også kopiere TileMap-et
fra det forrige brettet for å lage et nytt brett med samme tiles. Viktig at man da kopierer den og ikke
gjør den til egen scene. (Gjør du det sistnevnte til brettene ha samme plassering av tiles).

Tegn opp brettet slik du ønsker og plasser ut mynter på ønskede plasseringer. Og du har nå et nytt brett.
Det kan jo være greit å gjøre det neste brettet hakket mer vanskelig enn det forrige for å gjøre det litt
utfordrende for spilleren.


## Legge til et mål og bytte brett

Det neste vi må gjøre er å legge til en "mål" som spilleren skal nå for å komme til neste brett. Du kan f.eks.
bruke luftballongen som ligger i assets-mappen og gjøre målet til å være å komme til luftballongen, tegne noe eget
eller finne noe som passer ditt spill. Husk at målet må ha en collision-box og at vi ønsker å bruke samme signal
som vi bruker for å plukke opp mynter for å få med oss at spilleret når målet bare at nå ønsker vi å bruke det
til å sørge for at vi går til neste brett.

For å bytte brett kan vi bruke funksjonen `get_tree().change_scene_to_file()`. Den tar inn pathen til scenen man
ønsker å bytte til på formatet `res://world2.tscn`. Siden vi ønsker å gjøre denne til en gjenbrukbar scene kan det
være kjipt å hardkode hvilket brett den skal bytte til. En god måte å få dette konfigurert på er å bruke en
variabel som blir tilgjengelig i inspector. F.eks. om man legger `@export var next_level: String` i scriptet så vil
man ser at man får et tekstfelt hvor man kan skrive inn hvilken level den skal bytte til. Enda bedre vil være å
bruke `@export_file` som lar deg velge en fil.


## Main scene som styrer hvulket brett spilles

Når man etterhvert får mange brett, og kanskje legger til flere ulike sener for ting som ulike menyen og "game over"
kan dette for bli uoversiktlig. Et vanlig pattern er derfor å i stede for å la brettene selv bytte til neste sene
heller la spillet ha en egen "main-scene" som styrer hvilkene scene som vises og bytte mellom disse basert på
hva som skjer og signaler som sendes. 

Vi starter med å lage en ny scene som skal være vår "main scene" som styrer hvilket brett man er på. På
denne scenen legger vi til et script som skal styre logikken. Vi starter med å sette opp så denne scenen
bare starter opp første brett. For å få dettep å plass på man først laste inn scenen via `preload`, 
instansiere en instans av den og legge den til som en node på main-scenen vår.

```
const levels = [
	preload("res://world.tscn"),
	preload("res://world2.tscn")
]

func _ready():
    var level = levels[currentLevel].instantiate()
    add_child(level)
```


### Bytte scene via koden i main-scene

Det neste vi trenger å gjøre er at i stede for at scenen selv bytter brett ønsker vi at den heller bare
sender et signal om "level completed" og så lytter main-scenen på dette eventet og bytter scene når
vi dette signalet blir sendt. For å få til dette starter vi med å endre så scriptet for målet vårt
ikke bytter sene men heller "emitter" et signal. For få til dette starter man med å definere signaler
scriptet kan sende ved å legge til `signal SIGNAL_NAME` nær toppen av scriptet. Man kan da kalle
`SIGNAL_NAME.emit()` for å sende signalet til de som lytter på det.

Vi må nå lytte til et signal, ved å koble til signet via kode. Det finnes en god forklaring av hvordan
man gjør dette på den [offisielle dokumentasjonen](https://docs.godotengine.org/en/stable/getting_started/step_by_step/signals.html#connecting-a-signal-via-code).
Kort fortalt er det vi må gjøre å definere en ny funksjon, f.eks. `func on_level_completed()` og så bruke `connect`
for å koble funksjonen til eventet. F.eks. om "målet" er en node som heter "GoalBalloon", og signalet
heter `level_completed` kan man bruke `level.get_node("GoalBalloon").level_completed.connect(on_level_completed)`.

Sørg så for at denne funksjonen fjerner det gamle brettet via `queue_free` og instansierer neste brettet.

Etter dette er du egentlig ferdig med hoveddelen av workshopen og kan gå videre til å leke deg litt med 
[videre oppgaver](./08-videre-oppgaver.md).
