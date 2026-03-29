extends Node3D

var positionsx = []
var positionsy = []
var positionsz = []

func _ready() -> void:	
	$"../AudioStreamPlayer3D2".play()
	$"../AudioStreamPlayer3D2".get_stream_playback()
	var material2 = load("res://level5.tscn::StandardMaterial3D_8cgwd")
	for i in range(get_child_count()):
		var child = get_child(i)
		$"../CSGBox3D".material = material2
		get_child(i).get_child(0).material = material2
		positionsx.append(child.position.x)
		positionsy.append(child.position.y)
		positionsz.append(child.position.z)
	
	await get_tree().create_timer(10).timeout



func _on_killbox_2_body_entered(body: Node3D) -> void:
	if body.name == "Basic FPS Player":
		$"../AudioStreamPlayer3D2".stop()
		$"../AudioStreamPlayer3D2".play()
		for i in range(0, get_child_count()):
			get_child(i).freeze = true
		for i in range(0, get_child_count()):
			get_child(i).position.x = positionsx[i]
			get_child(i).position.y = positionsy[i]
			get_child(i).position.z = positionsz[i]

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Basic FPS Player":
		$"../AudioStreamPlayer3D".play()
		await get_tree().create_timer(10).timeout
		$"../AudioStreamPlayer3D2".play(13.8)
		for i in range(0, get_child_count()):
			get_child(i).freeze = false
			
			await get_tree().create_timer(.15).timeout


func _on_area_3d_body_entered2(body: Node3D) -> void:
	$"../AudioStreamPlayer3D".stop()
	pass # Replace with function body.
