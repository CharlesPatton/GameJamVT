extends Control

var dashCardTexture = load("res://imgs/dashcard.png")
var jumpCardTexture = load("res://imgs/jumpcard.png")
var dashCardAmount: int = 0
var jumpCardAmount: int = 0



var numCards = dashCardAmount + jumpCardAmount

func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($fade, "modulate", Color(0,0,0,0), 2)

func cardPickedUp() -> void:
	print("TESTING")
	for i in range(0, dashCardAmount):
		var card = TextureRect.new()
		card.texture = dashCardTexture
		card.name = "dash_card" + str(i)
		var children = $CardContainer.get_children()
		var has_child = false
		for child in children:
			if child.name == "dash_card" + str(i):
				has_child = true
				break
		if not has_child:
			card.size = Vector2(20, 20)
			card.expand_mode = 3
			$CardContainer.add_child(card)
		dashCardAmount -= 1

	for i in range(0, jumpCardAmount):
		var card = TextureRect.new()
		card.texture = jumpCardTexture
		card.name = "jump_card" + str(i)
		var children = $CardContainer.get_children()
		var has_child = false
		for child in children:
			if child.name == "jump_card" + str(i):
				has_child = true
				break
		if not has_child:
			card.size = Vector2(20, 20)
			card.expand_mode = 3
			$CardContainer.add_child(card)
		jumpCardAmount -= 1
	
	jumpCardAmount = 0
	dashCardAmount = 0


func _on_basic_fps_player_kill_card(card) -> void:
	var card_type = ""
	if card == 0:
		card_type = "dash_card"
	else:
		card_type = "jump_card"
	
	var num_children = $CardContainer.get_children()
	for i in range(num_children.size() - 1, -1, -1):
		if num_children[i].name.contains(card_type):
			$CardContainer.remove_child(num_children[i])
			break
