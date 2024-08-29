extends Area2D
signal sword_sound

# Called when the node enters the scene tree for the first time.
func _ready():
	sword_sound.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if scale.x == 1 :
		rotation += 0.15
	elif scale.x == -1:
		rotation += 0.15
	else:
		rotation -= 0.15


func _on_timer_timeout():
		queue_free()






func _on_body_entered(body):
	if body.name == "TileMap":
		
		queue_free()
