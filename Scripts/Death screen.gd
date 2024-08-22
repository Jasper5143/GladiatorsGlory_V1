extends Node2D





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pressed():
	get_tree().change_scene_to_file("res://Prefabs/game.tscn")



func _on_go_to_menu_pressed():
	get_tree().change_scene_to_file("res://Prefabs/menu.tscn")
