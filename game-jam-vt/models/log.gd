extends Node3D

const EDGE = 22
const RESET = -17
const SPEED = 1.5

var ON_LOG = false
var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.global_position.x += SPEED * delta
	if self.global_position.x >= EDGE:
		self.global_position.x = RESET
	if ON_LOG:
		player.global_position.x += SPEED * delta


func _on_area_3d_body_entered(body):
	if body.name == "Basic FPS Player":
		player = body
		ON_LOG = true
		#while ON_LOG:
			#body.position.x += 0.15
			#await get_tree().create_timer(0.1).timeout


func _on_area_3d_body_exited(body):
	ON_LOG = false
