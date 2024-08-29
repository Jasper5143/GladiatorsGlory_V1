extends Node2D


@export var speed = 1
var direction = Vector2.ZERO
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction*speed


func _on_area_2d_body_entered(body):
		queue_free()
		if body.name == "Player":
			pass
			get_tree().change_scene_to_file("res://Levels/death_screen.tscn")
