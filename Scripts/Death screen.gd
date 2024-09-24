extends Node2D


func _ready():
	$Death_sfx.play


# makes mouse visible in menu
func _process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


#navigates to menus
func _on_button_pressed():
	get_tree().change_scene_to_file("res://Prefabs/game.tscn")
func _on_go_to_menu_pressed():
	get_tree().change_scene_to_file("res://Prefabs/menu.tscn")
