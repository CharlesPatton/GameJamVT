extends Area3D



func _on_body_entered(body: Node3D) -> void:
	if body.name == "Basic FPS Player":
		var tween = get_tree().create_tween()
		tween.tween_property($Control/Label, "visible_ratio", 1, 0.5)


func _on_body_exited(body: Node3D) -> void:
	if body.name == "Basic FPS Player":
		var tween = get_tree().create_tween()
		tween.tween_property($Control/Label, "visible_ratio", 0, 0.5)
