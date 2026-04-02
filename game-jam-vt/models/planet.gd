extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.global_position = get_tree().current_scene.get_node("Basic FPS Player").global_position
	global_position.x -= 100
	global_position.y += 15
	global_position.z -= 100
