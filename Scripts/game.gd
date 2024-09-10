extends Node2D

var wave = 1
var kills = 0
var locust_count = 5

@onready var slime_prefab = preload("res://Prefabs/slime.tscn")
@onready var skeleton_prefab = preload("res://Prefabs/skeleton.tscn")
@onready var locust_prefab = preload("res://Prefabs/locust.tscn")

func _process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _ready():
	_update_ui()
	$sound_track1.play()

func enemy_death():
	kills += 1
	print(kills)
	if kills == 5:
		wave += 1
		_update_ui()
		if wave == 2:
			wave_2()
	elif kills == 7:
		wave += 1
		_update_ui()
		if wave == 3:
			wave_3(locust_count)
	elif kills == 12:
		wave += 1
		_update_ui()
		if wave ==4:
			wave_4()

func wave_2():
	var skeleton = skeleton_prefab.instantiate()
	add_child(skeleton)
	skeleton.connect("skeleton_killed", Callable(self, "skeleton_killed"))
	skeleton.position = Vector2(-220, -86)
	
	skeleton = skeleton_prefab.instantiate()
	add_child(skeleton)
	skeleton.connect("skeleton_killed", Callable(self, "skeleton_killed"))
	skeleton.position = Vector2(773, -86)

func wave_3(count):
	for i in range(count):
		var locust = locust_prefab.instantiate()
		add_child(locust)
		locust.connect("locust_killed", Callable(self, "locust_killed"))
		locust.position = Vector2(-340, randi_range(-150, 400))
	
func wave_4():
	print("wave 4 start")
	get_tree().change_scene_to_file("res://Prefabs/win_screen.tscn")
	

func _on_slime_enemy_killed():
	enemy_death()

func skeleton_killed():
	enemy_death()

func locust_killed():
	enemy_death()

func _update_ui():
	$game_ui/Wave.text = "Wave: " + str(wave)
