extends Area2D

var rng = RandomNumberGenerator.new()

# plays sword sfx and enables/disables cheats
func _ready():
	$sword_sfx.play
	rng.randomize()
	var pitch_shift = rng.randfn(-0.1,0.1)


# sword movement
func _process(_delta):
	if scale.x == 1 :
		rotation += 0.15
	elif scale.x == -1:
		rotation += 0.15
	else:
		rotation -= 0.15

#removes sword after time
func _on_timer_timeout():
	queue_free()






func _on_body_entered(body):
	if body.name == "TileMap" and Cheats.cheats_enabled == false:
		
		queue_free()
