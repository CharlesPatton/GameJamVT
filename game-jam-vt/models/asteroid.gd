extends Node3D

const EDGE = -17
const RESET = 17
const SPEED = 1.5

const EDGEY = 17
const RESETY = 17

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.move_toward($"../target".global_position, SPEED * delta)
	
	
