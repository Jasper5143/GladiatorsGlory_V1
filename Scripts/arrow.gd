extends Node2D

@export var speed = 10
var direction = Vector2.ZERO

func _process(delta):
	position += direction * speed 
	
