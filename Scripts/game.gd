extends Node2D

var wave = 1
var kills = 0
var locust_count = 5

@onready var slime_prefab = preload("res://Prefabs/slime.tscn")
@onready var skeleton_prefab = preload("res://Prefabs/skeleton.tscn")
@onready var locust_prefab = preload("res://Prefabs/locust.tscn")

#hides mouse when game is active
func _process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

#Keeps the UI updated and plays the game's music
func _ready():
	_update_ui()
	$sound_track1.play()
	$Wave_Transition.visible = false
	$shade.visible = false
	await get_tree().create_timer(98.51).timeout
	$sound_track1.play()

#Manages all enemy deaths - updates UI and Waves
func enemy_death():
	kills += 1
	print(kills)
	if kills == 5:
		wave += 1
		_update_ui()
		if wave == 2:
			wave_transition()
			await get_tree().create_timer(2).timeout
			wave_2()
	elif kills == 7:
		wave += 1
		_update_ui()
		if wave == 3:
			wave_transition()
			await get_tree().create_timer(2).timeout
			wave_3(locust_count)
	elif kills == 12:
		wave += 1
		_update_ui()
		if wave ==4:
			wave_transition()
			await get_tree().create_timer(2).timeout
			wave_4()
	elif kills == 16:
		wave += 1
		_update_ui()
		if wave == 5:
			wave_transition()
			await get_tree().create_timer(2).timeout
			wave_5()
	elif kills == 26:
		game_complete()

#spawns skeletons
func wave_2():
	var skeleton = skeleton_prefab.instantiate()
	add_child(skeleton)
	skeleton.connect("skeleton_killed", Callable(self, "skeleton_killed"))
	skeleton.position = Vector2(-200, -86)
	
	skeleton = skeleton_prefab.instantiate()
	add_child(skeleton)
	skeleton.connect("skeleton_killed", Callable(self, "skeleton_killed"))
	skeleton.position = Vector2(754, -86)

#spawns locusts
func wave_3(count):
	for i in range(count):
		var locust = locust_prefab.instantiate()
		add_child(locust)
		locust.connect("locust_killed", Callable(self, "locust_killed"))
		locust.position = Vector2(-340, randi_range(-150, 400))
	
#Player wins
func wave_4():
	var skeleton = skeleton_prefab.instantiate()
	add_child(skeleton)
	skeleton.connect("skeleton_killed", Callable(self, "skeleton_killed"))
	skeleton.position = Vector2(-200, -86)
	
	skeleton = skeleton_prefab.instantiate()
	add_child(skeleton)
	skeleton.connect("skeleton_killed", Callable(self, "skeleton_killed"))
	skeleton.position = Vector2(754, -86)
	skeleton = skeleton_prefab.instantiate()
	add_child(skeleton)
	skeleton.connect("skeleton_killed", Callable(self, "skeleton_killed"))
	skeleton.position = Vector2(-324, 360)
	
	skeleton = skeleton_prefab.instantiate()
	add_child(skeleton)
	skeleton.connect("skeleton_killed", Callable(self, "skeleton_killed"))
	skeleton.position = Vector2(866, 360)

func wave_5():
	print("wave 5 start")
	var skeleton = skeleton_prefab.instantiate()
	add_child(skeleton)
	skeleton.connect("skeleton_killed", Callable(self, "skeleton_killed"))
	skeleton.position = Vector2(273, 103)
	
	skeleton = skeleton_prefab.instantiate()
	add_child(skeleton)
	skeleton.connect("skeleton_killed", Callable(self, "skeleton_killed"))
	skeleton.position = Vector2(775, 73)
	
	skeleton = skeleton_prefab.instantiate()
	add_child(skeleton)
	skeleton.connect("skeleton_killed", Callable(self, "skeleton_killed"))
	skeleton.position = Vector2(-221, 74)
	
	skeleton = skeleton_prefab.instantiate()
	add_child(skeleton)
	skeleton.connect("skeleton_killed", Callable(self, "skeleton_killed"))
	skeleton.position = Vector2(-200, -87)
	
	skeleton = skeleton_prefab.instantiate()
	add_child(skeleton)
	skeleton.connect("skeleton_killed", Callable(self, "skeleton_killed"))
	skeleton.position = Vector2(754, -87)

	var slime = slime_prefab.instantiate()
	add_child(slime)
	slime.connect("enemy_killed", Callable(self, "_on_slime_enemy_killed"))
	slime.position = Vector2(180, 400)
	
	slime = slime_prefab.instantiate()
	add_child(slime)
	slime.connect("enemy_killed", Callable(self, "_on_slime_enemy_killed"))
	slime.position = Vector2(-49, 273)
	
	slime = slime_prefab.instantiate()
	add_child(slime)
	slime.connect("enemy_killed", Callable(self, "_on_slime_enemy_killed"))
	slime.position = Vector2(427, 273)
	
	slime = slime_prefab.instantiate()
	add_child(slime)
	slime.connect("enemy_killed", Callable(self, "_on_slime_enemy_killed"))
	slime.position = Vector2(-36, -47)
	
	slime = slime_prefab.instantiate()
	add_child(slime)
	slime.connect("enemy_killed", Callable(self, "_on_slime_enemy_killed"))
	slime.position = Vector2(403, -47)







func game_complete():
	print("win")
	get_tree().change_scene_to_file("res://Prefabs/win_screen.tscn")







func _on_slime_enemy_killed():
	enemy_death()

func skeleton_killed():
	enemy_death()

func locust_killed():
	enemy_death()

#tells UI what to display
func _update_ui():
	$game_ui/Wave.text = "Wave: " + str(wave)

func wave_transition():
	$shade.visible = true
	$Wave_Transition.visible = true
	$Wave_Transition.text = "Wave " + str(wave -1) + " Complete! Wave " + str(wave) + " start."
	await get_tree().create_timer(2).timeout
	$Wave_Transition.visible = false
	$shade.visible = false
