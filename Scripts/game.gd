extends Node2D
var wave = 1
var kills = 0

@onready var skeleton_prefab = preload("res://Prefabs/skeleton.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	_update_ui()
	$sound_track1.play
	

# Called every frame. 'delta' is the elapsed time since the previous frame.


func enemy_death():
	kills += 1
	print(kills)
	if kills == 5:
		wave += 1
		_update_ui()
	if wave == 2 and kills ==5:
		var skeleton = skeleton_prefab.instantiate()
		add_child(skeleton)
		skeleton.connect("skeleton_enemy_killed", Callable(self, "_on_skeleton_enemy_killed"))
		skeleton.position = Vector2(-220,-86)
		skeleton = skeleton_prefab.instantiate()
		add_child(skeleton)
		skeleton.connect("skeleton_enemy_killed", Callable(self, "_on_skeletonenemy_killed"))
		skeleton.position = Vector2(773,-86)

func _on_slime_enemy_killed():
	enemy_death()
		


func _update_ui():
	$game_ui/Wave.text = "Wave: " + str(wave)


func _on_skeleton_enemy_killed():
	enemy_death()
