extends Area3D


func _on_body_entered(body: Node3D) -> void:
	if body.name == "Basic FPS Player":
		var deathTransition = body.get_node("DeathTransition")
		deathTransition.visible = true
		var tween = get_tree().create_tween()
		tween.tween_property(deathTransition.get_node("ColorRect").material, "shader_parameter/height", 0.67, 0.5)
		await get_tree().create_timer(0.75).timeout
		
		var level = $"../"
		if level.name == "Tutorial":
			get_tree().change_scene_to_file("res://level2.tscn")
		elif level.name == "level2":
			get_tree().change_scene_to_file("res://level3.tscn")
		elif level.name == "level3":
			get_tree().change_scene_to_file("res://level4.tscn")
		elif level.name == "level4":
			get_tree().change_scene_to_file("res://level5.tscn")
		elif level.name == "level5":
			get_tree().change_scene_to_file("res://thefinale.tscn")
		elif level.name == "finale":
			get_tree().change_scene_to_file("res://ending_screen.tscn")
			
