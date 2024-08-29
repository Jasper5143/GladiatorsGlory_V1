extends Node2D
var wave = 1
var kills = 0
var rng = RandomNumberGenerator.new()
@onready var skeleton_prefab = preload("res://Prefabs/skeleton.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	_update_ui()
	$sound_track1.play
	

# Called every frame. 'delta' is the elapsed time since the previous frame.




func _dead_enemy_():
	kills += 1
	print(str(kills))
	if kills == 5:
		wave += 1
		_update_ui()
	if wave == 2 and kills == 5:
		var skeleton = skeleton_prefab.instantiate()
		skeleton.position = Vector2(-217,-88)
		add_child(skeleton)
		skeleton = skeleton_prefab.instantiate()
		skeleton.position = Vector2(756,-87)
		add_child(skeleton)
	if kills == 7:
		wave += 1
		_update_ui()
	if wave == 3 and kills == 7:
		print("locust time")
		
func _process(delta):
	pass

func _update_ui():
	$game_ui/Wave.text = "Wave: " + str(wave)




func _on_slime_enemy_killed():
	_dead_enemy_()


func _on_skeleton_enemy_killed():
	print('gottem')
	_dead_enemy_()


func _on_sword_sword_sound():
	pass
