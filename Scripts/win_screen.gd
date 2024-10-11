extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	AudioManager.play_sound("res://Audio/mixkit-medieval-show-fanfare-announcement-226.wav")

func _process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)



func _on_play_pressed():
	AudioManager.play_sound("res://Audio/menu-button-88360.mp3")
	get_tree().change_scene_to_file("res://Prefabs/menu.tscn")


