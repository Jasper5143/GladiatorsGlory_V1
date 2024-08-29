extends Node2D

signal enemy_killed
@export var shoot_cooldown = 1.2
@onready var Player = get_tree().get_first_node_in_group("Player")

@onready var shoot_timer = $shoot_timer
var arrow = load("res://Prefabs/arrow.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	shoot_timer.start(shoot_cooldown)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shoot_timer.is_stopped():
		shoot()
		shoot_timer.start(shoot_cooldown)

func shoot():
	var arrow = arrow.instantiate()
	arrow.position = position
	get_parent().add_child(arrow)
	var direction_to_player = global_position.direction_to(Player.global_position)
	arrow.direction = direction_to_player.normalized()
	arrow.rotation = direction_to_player.angle()


func _on_area_2d_area_entered(area):
	if area.name == "sword":
		queue_free()
		enemy_killed.emit()
