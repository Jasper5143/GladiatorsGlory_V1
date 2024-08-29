extends CanvasLayer
@onready var score_label = %Label
var score = 0

func update_score(value):
	score += value
	
func update_score_label():
	score_label.text = "Wave: " + str(score)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
