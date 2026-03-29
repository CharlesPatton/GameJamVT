extends Control


func _on_switch_screens_body_entered(body: Node3D) -> void:
	if body.name == "Basic FPS Player":
		var tween = get_tree().create_tween()
		tween.tween_property($Control/CanvasLayer/fade, "modulate", Color(1.0, 1.0, 1.0, 1.0), 2)
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://thefinale.tscn")
