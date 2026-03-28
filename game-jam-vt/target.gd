extends Node3D

const EDGE = -17
const RESET = 17
const SPEED = 1.5

const EDGEY = 17
const RESETY = 17

var oldGlobal = self.get_child(1).global_position
# Called when the node enters the scene tree for the first time.


func _on_area_3d_body_entered(body: Node3D) -> void:
	self.get_child(1).global_position = oldGlobal
