extends Area3D

@export var jump_cards : int = 0
@export var dash_cards : int = 0

func _on_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:
	if body.name == "Basic FPS Player":
		body.jumpCards += jump_cards
		body.dashCards += dash_cards
		body.get_child(6).dashCardAmount = body.dashCards
		body.get_child(6).jumpCardAmount = body.jumpCards
		body.get_node("Control").cardPickedUp()
