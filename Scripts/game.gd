extends Node2D
var wave = 0
var kills = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	_update_ui()
	$sound_track1.play
	

# Called every frame. 'delta' is the elapsed time since the previous frame.




func _on_slime_enemy_killed():
	kills += 1
	if kills == 5:
		wave += 1
		_update_ui()
	if wave == 1:
		print("bones")
		print("test")
		
		
func _process(delta):
	pass

func _update_ui():
	$game_ui/Wave.text = "Wave: " + str(wave)

