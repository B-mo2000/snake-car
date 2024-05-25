extends RigidBody2D

@onready var move = $move
@onready var snake_body = $SnakeBody
@onready var collision_shape_2d = $CollisionShape2D

var speed = 0001.0

# Called when the node enters the scene tree for the first time.
func _ready():
	#pin_joint_2d.node_b
	pass # Replace with function body.

func _move():
	look_at(Auto.player_pos)
	var dir : Vector2 = (move.global_position - global_position).normalized()
	apply_impulse(dir * speed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Auto.x_x == false:
		_move()
		if snake_body.scale.x > .4:
			snake_body.scale -= Vector2(.002,.002)
			collision_shape_2d.scale -= Vector2(.002,.002)
	else :
		snake_body.scale = Vector2(1,1)
		collision_shape_2d.scale = Vector2(1,1)
