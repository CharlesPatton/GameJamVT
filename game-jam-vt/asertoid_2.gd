extends Node3D

const EDGE = -17
const RESET = 17
const SPEED = 1.5

const EDGEY = 17
const RESETY = 17

var ON_AS = false
var player = null

@onready var oldGlobal = self.global_position
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = global_position.move_toward($"../target".global_position, SPEED * delta)
	if ON_AS:
		player.global_position = player.global_position.move_toward($"../target".global_position, SPEED * delta)

func _on_area_3d_body_entered(body: Node3D) -> void:
	global_position = oldGlobal


func _on_asteroid_area_body_entered(body):
	if body.name == "Basic FPS Player":
		player = body
		ON_AS = true


func _on_asteroid_area_body_exited(body):
	ON_AS = false
