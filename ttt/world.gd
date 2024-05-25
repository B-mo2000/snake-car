extends Node2D

@onready var score = $score
@onready var hscore = $Hscore
@onready var tap = $tap
@onready var tap_to_play = $tap_to_play
@onready var tap_to_restart = $tap_to_restart
@onready var restart = $restart

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _score():
	score.text = str(Auto.score)
	hscore.text = str(Auto.Hscore)

func _tap():
	if Input.is_action_just_pressed("tap"):
		Auto.tap_to_play = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_score()
	if Auto.tap_to_play == false:
		_tap()
	if Auto.tap_to_play == true:
		tap.hide()
		tap_to_play.hide()
	if Auto.tap_to_play == false:
		tap.show()
		tap_to_play.show()
	if Auto.x_x == true:
		tap_to_restart.show()
		restart.show()
		if Input.is_action_just_pressed("r"):
			Auto.score = 0
			Auto.x_x = false
			Auto._button()
			Auto.tap_to_play = false
			get_tree().reload_current_scene()
	if Auto.x_x == false:
		tap_to_restart.hide()
		restart.hide()


