extends Node2D
@onready var Player = get_tree().get_first_node_in_group("Player")
@onready var sword = preload("res://Prefabs/sword.tscn")
@export var speed = 10
var direction = Vector2.ZERO

func _process(delta):
	position += direction * speed 
	




func _on_area_2d_body_entered(body):
	queue_free()
	if body.name == 'Player':
		get_tree().change_scene_to_file("res://Prefabs/death_screen.tscn")


func _on_area_2d_area_entered(area):
	if area.name == 'sword':
		queue_free()
