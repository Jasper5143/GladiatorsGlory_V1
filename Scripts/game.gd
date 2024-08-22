extends Node2D
var wave = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	_update_ui()
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.




func _process(delta):
	pass

func _update_ui():
	$game_ui/Wave.text = "Wave: " + str(wave)

