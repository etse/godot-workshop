extends Area2D

@export_file var next_level: String

func _on_body_entered(body):
	get_tree().change_scene_to_file(next_level)
