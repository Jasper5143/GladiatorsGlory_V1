extends Node2D

signal enemy_killed

@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
#speed in px per second
@export var speed = 100
#kills player (sends to death screen)
@onready var slime_anim: AnimatedSprite2D = $Path2D/PathFollow2D/Area2D/AnimatedSprite2D


func _process(delta: float) -> void:
	path_follow.progress += speed * delta
	if path_follow.progress >= 178.35:
		slime_anim.flip_h = true
	if path_follow.progress <= 178.35:
		slime_anim.flip_h = false



func _on_area_2d_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Prefabs/death_screen.tscn")
	


func _on_area_2d_area_entered(area):
	if area.name == "sword":
		queue_free()
		enemy_killed.emit()
	
