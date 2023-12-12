extends Node2D

const levels = [
	preload("res://world.tscn"),
	preload("res://world2.tscn")
]

var canSwitchLevels = true

var nextLevelIndex = 0
var currentLevel = null

func _ready():
	startNextLevel()
	
func on_level_completed():
	if canSwitchLevels == true:
		canSwitchLevels = false
		$AnimationPlayer.play("fade_out")
	
func startNextLevel():
	if currentLevel != null:
		currentLevel.queue_free()
	currentLevel = levels[nextLevelIndex].instantiate()
	nextLevelIndex = (nextLevelIndex + 1) % levels.size()
	add_child(currentLevel)
	currentLevel.get_node("GoalBalloon").level_completed.connect(on_level_completed)


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_out":
		startNextLevel()
		$AnimationPlayer.play("fade_in")
	if anim_name == "fade_in":
		canSwitchLevels = true
