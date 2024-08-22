extends Node2D

signal enemy_killed

@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
#speed in px per second
@export var speed = 100
#kills player (sends to death screen)

func _process(delta: float) -> void:
	path_follow.progress += speed * delta




func _on_area_2d_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Levels/death_screen.tscn")
	


func _on_area_2d_area_entered(area):
	if area.name == "sword":
		queue_free()
		enemy_killed.emit()
	
