extends Area2D

var pickedUp = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")

func _on_body_entered(body):
	if pickedUp == false:
		pickedUp = true
		Score.add_score(5)
		$AudioStreamPlayer.play()
		$AnimatedSprite2D.visible = false


func _on_audio_stream_player_finished():
	self.queue_free()
