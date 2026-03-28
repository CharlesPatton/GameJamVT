extends Area3D


func _on_body_entered(body: Node3D) -> void:
	if body.name == "Basic FPS Player":
		var deathTransition = body.get_node("DeathTransition")
		deathTransition.visible = true
		var tween = get_tree().create_tween()
		tween.tween_property(deathTransition.get_node("ColorRect").material, "shader_parameter/height", 0.67, 0.5)
		await get_tree().create_timer(0.75).timeout
		get_tree().change_scene_to_file("res://level2.tscn")
		var tween2 = get_tree().create_tween()
		tween2.tween_property(deathTransition.get_node("ColorRect").material, "shader_parameter/height", -1, 0.5)
