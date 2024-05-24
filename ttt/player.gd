extends RigidBody2D

const body = preload("res://ttt/body.tscn")
const apple = preload("res://ttt/apple.tscn")
const blod = preload("res://ttt/blod.tscn")

@onready var move = $move
@onready var spown_body = $spown_body
#@onready var pin_joint_2d = $PinJoint2D

var speed = 25.0
var angular = 5.0

var x_x : bool = false

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
	
	Auto.player_pos = global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	_quit()
	if x_x == false:
		_move()


func _on_hb_area_entered(area):
	if area.get_name() == "apple":
		var nnn = apple.instantiate()
		nnn.global_position = Vector2(randi_range(-563,563),randi_range(-1045,1045))
		get_parent().add_child(nnn)
		speed += 2.5
		Auto.score += 1
		
		var n = blod.instantiate()
		n.global_position = area.global_position
		n.rotation_degrees = randi_range(0,360)
		get_parent().add_child(n)
		
		var nn = body.instantiate()
		nn.global_position = spown_body.global_position
		get_parent().add_child(nn)
		
		area.queue_free()

func _on_hb_body_entered(body):
	if body.get_name() == "TileMap":
		x_x = true
		Auto.x_x = true
