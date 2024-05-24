extends Node

var player_pos : Vector2
var x_x :bool = false

var score = 0
var Hscore = 0

func _physics_process(delta):
	if score > Hscore:
		Hscore = score
