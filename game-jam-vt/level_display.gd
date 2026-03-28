extends CanvasLayer

@export var LEVEL_TEXT = ""
var start_fading = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = LEVEL_TEXT
	$start_fading.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start_fading:
		$Label.modulate.a -= 0.005



func _on_timer_timeout():
	start_fading = true
