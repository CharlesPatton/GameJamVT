extends Area3D


func _on_body_entered(body: Node3D) -> void:
	print("hi")
	$"../Basic FPS Player".dashCards = 0
	$"../Basic FPS Player".jumpCards = 0
	if ($"../Basic FPS Player/Control/CardContainer".get_child_count() != 0):
		for i in range(0, $"../Basic FPS Player/Control/CardContainer".get_child_count()):
			$"../Basic FPS Player/Control/CardContainer".get_child(i).queue_free()
			
	if body.name == "Basic FPS Player":
		var deathTransition = body.get_node("DeathTransition")
		deathTransition.visible = true
		var tween = get_tree().create_tween()
		tween.tween_property(deathTransition.get_node("ColorRect").material, "shader_parameter/height", 0.67, 0.5)
		await get_tree().create_timer(0.75).timeout
		$"../Basic FPS Player".position = $RespawnPoint.global_position
		var tween2 = get_tree().create_tween()
		tween2.tween_property(deathTransition.get_node("ColorRect").material, "shader_parameter/height", -1, 0.5)
