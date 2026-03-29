extends Area3D

@export var jump_cards : int = 0
@export var dash_cards : int = 0

@export var cardPick = Area3D

func _on_body_entered(body: Node3D) -> void:
	if body.name == "Basic FPS Player":
		#$pickup_sound_effect.play() #DELETE/COMMENT OUT FOR SOUND
		self.get_child(0).set_deferred("disabled", true)
		self.get_child(1).visible = false
		body.jumpCards += jump_cards
		body.dashCards += dash_cards
		body.get_child(6).dashCardAmount = body.dashCards
		body.get_child(6).jumpCardAmount = body.jumpCards
		body.get_node("Control").cardPickedUp()
