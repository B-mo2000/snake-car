extends RigidBody2D

@onready var move = $move

var speed = 25.0
var angular = 5.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _quit():
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func _move():
	var dir : Vector2 = (move.global_position - global_position).normalized()
	apply_impulse(dir * speed)

	if Input.is_action_pressed("a"):
		angular_velocity = lerp(angular_velocity,-angular,.2)
	if Input.is_action_pressed("d"):
		angular_velocity = lerp(angular_velocity,angular,.2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	_quit()
	_move()
