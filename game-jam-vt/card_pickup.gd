extends Area3D

@export var jump_cards : int = 0
@export var dash_cards : int = 0


func _on_body_entered(body: Node3D) -> void:
	$CollisionShape3D.set_deferred("disabled", true)
	self.visible = false
	if body.name == "Basic FPS Player":
		body.jumpCards += jump_cards
		body.dashCards += dash_cards
		body.get_child(6).dashCardAmount = body.dashCards
		body.get_child(6).jumpCardAmount = body.jumpCards
		body.get_node("Control").cardPickedUp()



func _on_killbox_2_body_entered(body: Node3D) -> void:
	if body.name == "Basic FPS Player":
		self.visible = true
		$CollisionShape3D.set_deferred("disabled", false)
		self.visible = true
