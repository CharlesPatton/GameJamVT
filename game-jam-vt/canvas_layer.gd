extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($fade, "modulate", Color(0,0,0,0), 2)
