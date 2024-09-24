extends CanvasLayer
#displays current wave
class_name UI
@onready var score_label = %Label
var score = 0

func update_score(value):
	score += value
	
func update_score_label():
	score_label.text = "Wave: " + str(score)
