extends Node3D

var positionsx = []
var positionsy = []
var positionsz = []

func _ready() -> void:
	for i in range(get_child_count()):
		var child = get_child(i)
		positionsx.append(child.position.x)
		positionsy.append(child.position.y)
		positionsz.append(child.position.z)



func _on_killbox_2_body_entered(body: Node3D) -> void:
	if body.name == "Basic FPS Player":
		for i in range(0, get_child_count()):
			get_child(i).freeze = true
		for i in range(0, get_child_count()):
			get_child(i).position.x = positionsx[i]
			get_child(i).position.y = positionsy[i]
			get_child(i).position.z = positionsz[i]


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Basic FPS Player":
		await get_tree().create_timer(10).timeout
		for i in range(0, get_child_count()):
			get_child(i).freeze = false
			
			await get_tree().create_timer(.1).timeout
