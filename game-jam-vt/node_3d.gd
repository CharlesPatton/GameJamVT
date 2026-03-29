extends Node3D

func _ready() -> void:
	for i in range(0, get_child_count()):
		get_child(i).freeze = true
