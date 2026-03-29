extends StaticBody3D

@export var crumble_delay = 0.5  # time before cracking
@export var shake_strength = 0.05 # optional shaking before falling
@export var shake_speed = 10.0

var crumbling = false
@onready var mesh = $MeshInstance3D
@onready var fragments = $Fragments

func _on_area_3d_body_entered(body):
	if crumbling:
		return
	if body.is_in_group("player"):
		crumbling = true
		# Start crumble process
		await get_tree().create_timer(crumble_delay).timeout
		start_crumble()

func start_crumble():
	# Optional: shake animation
	var shake_time = 0.3
	var timer = 0.0
	while timer < shake_time:
		var offset = Vector3(
			randf_range(-shake_strength, shake_strength),
			0,
			randf_range(-shake_strength, shake_strength)
		)
		mesh.transform.origin = offset
		await get_tree().physics_frame
		timer += get_physics_process_delta_time()
	
	# Hide main mesh
	mesh.visible = false
	
	# Turn fragments into physics bodies
	for frag in fragments.get_children():
		var rb = RigidBody3D.new()
		rb.transform = frag.global_transform
		rb.mass = 1
		if frag.get_child_count() > 0:
			for child in frag.get_children():
				child.get_parent().remove_child(child)
				rb.add_child(child)
		get_parent().add_child(rb)
		rb.apply_impulse(Vector3.ZERO, Vector3(randf_range(-2,2), 5, randf_range(-2,2))) # small scatter
		frag.queue_free()
	
	queue_free() # Remove original tile node
