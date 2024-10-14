extends Node2D

signal enemy_killed
var rng = RandomNumberGenerator.new()
@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
#speed in px per second
@export var speed = 100
#kills player (sends to death screen)
@onready var slime_anim: AnimatedSprite2D = $Path2D/PathFollow2D/Area2D/AnimatedSprite2D

func _ready():
	rng.randomize()
	path_follow.progress = rng.randfn(0,100)


#flips sprite when direction changes
func _process(delta: float) -> void:
	path_follow.progress += speed * delta
	if path_follow.progress >= 178.35:
		slime_anim.flip_h = true
	if path_follow.progress <= 178.35:
		slime_anim.flip_h = false


#manages player death
func _on_area_2d_body_entered(body):
	if body.name == "Player" and Cheats.cheats_enabled == false:
		get_tree().change_scene_to_file("res://Prefabs/death_screen.tscn")
	

#manages slime death
func _on_area_2d_area_entered(area):
	if area.name == "sword":
		AudioManager.play_sound("res://Audio/cartoon-splat-6086.mp3")
		queue_free()
		enemy_killed.emit()
	
