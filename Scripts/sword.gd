extends Area2D

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	$sword_sfx.play
	rng.randomize()
	var pitch_shift = rng.randfn(-0.1,0.1)
	print(pitch_shift)

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
