extends Node3D

const EDGE = 22
const RESET = -17
const SPEED = 2.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.x += SPEED * delta
	if self.position.x >= EDGE:
		self.position.x = RESET
