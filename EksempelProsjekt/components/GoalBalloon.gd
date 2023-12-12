extends Area2D

signal level_completed

func _on_body_entered(body):
	level_completed.emit()
	
