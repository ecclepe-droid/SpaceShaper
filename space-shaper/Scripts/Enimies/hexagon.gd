extends CharacterBody2D

const ENEMY_PENTAGON = preload("res://Scenes/Enimies/pentagon.tscn")
const MOVE_SPEED = 500.0
var direction = Vector2.ZERO
var hexagon_hp = 2

func _physics_process(delta):
	var target: CharacterBody2D
	
	target = $"../../../Player"
	
	if target:
		direction = position.direction_to(target.position)
		velocity = direction * MOVE_SPEED
	var collision = move_and_collide(velocity * delta)
	if collision:
		var body = collision.get_collider()
		if body.name == "Player":
				body.take_damage()
func take_damage():
		hexagon_hp = hexagon_hp - 1
		print("octagon HP is: ")
		print(hexagon_hp)
		if (hexagon_hp == 0):
				print("pentagon")
		var pentagon = ENEMY_PENTAGON.instantiate()
		$"../../Penagons".add_child(pentagon)
		pentagon.global_position = self.position
		queue_free()
