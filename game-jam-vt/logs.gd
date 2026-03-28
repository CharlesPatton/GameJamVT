extends Node3D


var log_list = self.get_children()
const EDGE = 22
const RESET = -17
var velocity_list = [4.5, 8, 6.25]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#var log_location = log_list[i]
	#log_location.global_position.x += velocity_list[i]
	#if log_location == EDGE:
		#log_location -= Vector3(velocity_list[i], 0, 0) 
	#print(log_location.x)
	pass
