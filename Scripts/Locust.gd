extends Node2D
signal locust_killed

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
var rng = RandomNumberGenerator.new()
var speed = rng.randi_range(28,32)


func _ready():
	AudioManager.play_sound("res://Audio/cockroach-noise-sound-effect-from-google-232923.mp3")
	await get_tree().create_timer(2.3).timeout
	AudioManager.play_sound("res://Audio/whoosh-breaks-out-243088.mp3")
#Locust movement and destruction when out of bounds
func _process(delta):
	await get_tree().create_timer(3).timeout
	anim.play("flying")
	position.x += speed
	if position.x >= 800:
		locust_killed.emit()
		queue_free()

#manages player death
func _on_area_2d_body_entered(body):
	if body.name == 'Player' and Cheats.cheats_enabled == false:
		get_tree().change_scene_to_file("res://Prefabs/death_screen.tscn")

#manages locust death
func _on_area_2d_area_entered(area):
	if area.name == 'sword':
		locust_killed.emit()
		queue_free()
