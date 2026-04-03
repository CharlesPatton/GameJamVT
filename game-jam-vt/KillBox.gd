extends Area3D
signal show_cards()

func _on_body_entered(body: Node3D) -> void:			
	
	
	if body.name == "Basic FPS Player":	
		$"../Basic FPS Player".dashCards = 0
		$"../Basic FPS Player".jumpCards = 0
		if ($"../Basic FPS Player/Control/CardContainer".get_child_count() != 0):
			for i in range(0, $"../Basic FPS Player/Control/CardContainer".get_child_count()):
				$"../Basic FPS Player/Control/CardContainer".get_child(i).queue_free()
		for i in range(3, self.get_child_count()):
			var node = self.get_child(i)
			if node.name.contains("log"):
				node = node.get_child(2)
			node.get_child(0).set_deferred("disabled", false)
			node.get_child(1).visible = true
		var deathTransition = body.get_node("DeathTransition")
		deathTransition.visible = true
		var tween = get_tree().create_tween()
		tween.tween_property(deathTransition.get_node("ColorRect").material, "shader_parameter/height", 0.67, 0.5)
		await get_tree().create_timer(0.75).timeout
		$"../Basic FPS Player".position = $RespawnPoint.global_position
		#RESET PLAYER AND HEAD ROTATION AFTER DEATH
		$"../Basic FPS Player/Head".rotation = Vector3(0, 0, 0)
		$"../Basic FPS Player".rotation = Vector3(0, 0, 0)
		var tween2 = get_tree().create_tween()
		tween2.tween_property(deathTransition.get_node("ColorRect").material, "shader_parameter/height", -1, 0.5)
