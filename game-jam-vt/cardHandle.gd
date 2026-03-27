extends Control

var dashCard = load("res://imgs/dashcard.png")
var jumpCard = load("res://imgs/jumpcard.png")

var dashCardAmount : int = 0
var jumpCardAmount : int  = 0

var numCards = dashCardAmount + jumpCardAmount


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if numCards > 100:
		var card = TextureRect.new()
		card.texture = dashCard
		add_child(card)
	pass
	
	
func cardPickedUp():
	print(numCards)
	if not numCards == 0:
		$GridContainer.columns = numCards
	for i in dashCardAmount:
		for o in jumpCardAmount: 
			var card = TextureRect.new()
			card.texture = jumpCard
			$GridContainer.add_child(card)
		var card = TextureRect.new()
		card.texture = dashCard
		$GridContainer.add_child(card)
