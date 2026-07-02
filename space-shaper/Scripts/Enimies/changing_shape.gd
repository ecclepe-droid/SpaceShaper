extends CharacterBody2D

const MOVE_SPEED = 200.0
var direction = Vector2.ZERO
var triangle_hp = 1
var shape
var rng = RandomNumberGenerator.new()

func _ready():
	# Define an array of local coordinates for your new shape
	var shape_choice = rng.randf_range(0.0, 6.0)
	print(shape_choice)
	if shape_choice >= 0:
		print("1")
		shape = "triangle"
	if shape_choice >= 1:
		print("2")
		shape = "square"
	if shape_choice >= 2:
		print("3")
		shape = "pentagon"
	if shape_choice >= 3:
		print("4")
		shape = "hexagon"
	if shape_choice >= 4:
		print("5")
		shape = "octagon"
	if shape_choice >= 5:
		print("6")
		shape = "circle"
		
	if shape == "triangle":
		var new_points = PackedVector2Array([
		Vector2(0, -110),
		Vector2(-150, 165),
		Vector2(150, 165),
		])
	if shape == "square":
		var new_points = PackedVector2Array([
		Vector2(0, -110),
		Vector2(-150, 165),
		Vector2(150, 165),
		Vector2(150, 165),
		])
	if shape == "pentagon":
		var new_points = PackedVector2Array([
		Vector2(0, -110),
		Vector2(-150, 165),
		Vector2(150, 165),
		Vector2(150, 165),
		Vector2(150, 165),
		])
	if shape == "hexagon":
		var new_points = PackedVector2Array([
		Vector2(0, -110),
		Vector2(-150, 165),
		Vector2(150, 165),
		Vector2(0, -110),
		Vector2(-150, 165),
		Vector2(150, 165),
		])
	if shape == "octagon":
		var new_points = PackedVector2Array([
		Vector2(0, -110),
		Vector2(-150, 165),
		Vector2(150, 165),
		Vector2(0, -110),
		Vector2(-150, 165),
		Vector2(150, 165),
		Vector2(-150, 165),
		Vector2(150, 165),
		])
	if shape == "circle":
		var new_points = PackedVector2Array([
		Vector2(0, -110),
		Vector2(-150, 165),
		Vector2(150, 165),
		Vector2(0, -110),
		Vector2(-150, 165),
		Vector2(150, 165),
		Vector2(-150, 165),
		Vector2(150, 165),
		Vector2(0, -110),
		Vector2(-150, 165),
		Vector2(150, 165),
		Vector2(0, -110),
		Vector2(-150, 165),
		Vector2(150, 165),
		Vector2(-150, 165),
		Vector2(150, 165),
		])
	
	# Apply the new points to the collision polygon
		$Collisions.polygon = new_points
func _process(delta: float) -> void:
	pass


func _physics_process(delta):
	var target: CharacterBody2D
	
	target = $"../../../Player"
	
	if target:
		direction = position.direction_to(target.position)
		velocity = direction * MOVE_SPEED
		
		move_and_collide(velocity * delta)
func take_damage():
		triangle_hp = triangle_hp - 1
		print("triangle HP is: ")
		print(triangle_hp)
		if (triangle_hp == 0):
			queue_free()
