extends Node2D
@export var speed = 10
signal locust_killed
	
func _process(delta):
	await get_tree().create_timer(3).timeout
	position.x += speed
	if position.x >= 800:
		locust_killed.emit()
		queue_free()


func _on_area_2d_body_entered(body):
	if body.name == 'Player':
		get_tree().change_scene_to_file("res://Prefabs/death_screen.tscn")


func _on_area_2d_area_entered(area):
	if area.name == 'sword':
		locust_killed.emit()
		queue_free()
