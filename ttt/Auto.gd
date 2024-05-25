extends Node

@onready var apple_bite = $apple_bite
@onready var die = $die
@onready var button = $button

var player_pos : Vector2
var x_x :bool = false
var tap_to_play = false

var score = 0
var Hscore = 0

func _physics_process(delta):
	if score > Hscore:
		Hscore = score

func _apple_bite():
	apple_bite.pitch_scale = randf_range(1.3,1.8)
	apple_bite.play()
func _die():
	die.play()
func _button():
	button.play()
