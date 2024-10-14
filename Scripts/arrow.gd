extends Node2D
@onready var Player = get_tree().get_first_node_in_group("Player")
@onready var sword = preload("res://Prefabs/sword.tscn")
@export var speed = 10
var direction = Vector2.ZERO
#movement
func _process(delta):
	position += direction * speed 
	

func _ready():
	AudioManager.play_sound("res://Audio/whoosh-transitions-sfx-01-118227.mp3")

#manages collision with map and player
func _on_area_2d_body_entered(body):
	queue_free()
	if body.name == 'Player' and Cheats.cheats_enabled == false:
		get_tree().change_scene_to_file("res://Prefabs/death_screen.tscn")

#lets sword destroy arrow
func _on_area_2d_area_entered(area):
	if area.name == 'sword':
		queue_free()
