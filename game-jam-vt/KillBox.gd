extends Area3D

func _on_body_entered(body: Node3D) -> void:			
	
	
	if body.name == "Basic FPS Player":	
		var player = $"../Basic FPS Player"
		player.dashCards = 0
		player.jumpCards = 0
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
		player.position = $RespawnPoint.global_position
		var tween2 = get_tree().create_tween()
		tween2.tween_property(deathTransition.get_node("ColorRect").material, "shader_parameter/height", -1, 0.5)
		
		#RESET PLAYER AND HEAD ROTATION AFTER DEATH
		#NOT FOR LEVEL 2 AND 4 SINCE ROTATION MESSED UP
		player.can_look = false 
		player.rotation_target_player = 0.0
		player.rotation_target_head = 0.0
		
		player.quaternion = Quaternion(Vector3.UP, 0.0)
		$"../Basic FPS Player/Head".quaternion = Quaternion(Vector3.RIGHT, 0.0)

		Input.warp_mouse(get_viewport().get_visible_rect().size / 2)
		player.can_look = true
