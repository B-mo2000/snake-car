extends Node2D

@onready var score = $score
@onready var hscore = $Hscore
@onready var play = $play

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _score():
	score.text = str(Auto.score)
	hscore.text = str(Auto.Hscore)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_score()


func _on_play_pressed():
	Auto.score = 0
	Auto.x_x = false
	Auto._button()
	get_tree().reload_current_scene()
