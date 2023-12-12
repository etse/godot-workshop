extends Area2D

signal level_completed

func _on_body_entered(body):
	$CollisionShape2D.queue_free()
	level_completed.emit()
	
