extends Node2D

@export var shoot_cooldown = 1.2
@onready var Player = get_tree().get_first_node_in_group("Player")
@onready var shoot_timer = $ShootTimer
var arrow_scene = preload("res://Prefabs/arrow.tscn")
signal enemy_killed

func _ready():
	if Player == null:
		print("Player not found!")
	else:
		shoot_timer.start()

func _process(delta):
	if shoot_timer.is_stopped():
		shoot()
		shoot_timer.start(shoot_cooldown)

func shoot():
	var arrow = arrow_scene.instantiate()
	arrow.position = position
	get_parent().add_child(arrow)
	
	# Calculate the direction to the player
	var direction_to_player = global_position.direction_to(Player.global_position)
	arrow.direction = direction_to_player.normalized()
	arrow.rotation = direction_to_player.angle()  
	


func _on_area_2d_area_entered(area):
	if area.name == "sword":
		queue_free()
		enemy_killed.emit()
