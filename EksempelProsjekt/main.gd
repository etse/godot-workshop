extends Node2D

@export var fade: float = 0.0

const levels = [
	preload("res://world.tscn"),
	preload("res://world2.tscn")
]

var nextLevelIndex = 0
var currentLevel = null

func _ready():
	startNextLevel()
	
func on_level_completed():
	startNextLevel()
	
func startNextLevel():
	if currentLevel != null:
		currentLevel.queue_free()
	currentLevel = levels[nextLevelIndex].instantiate()
	nextLevelIndex = (nextLevelIndex + 1) % levels.size()
	add_child(currentLevel)
	currentLevel.get_node("GoalBalloon").level_completed.connect(on_level_completed)
