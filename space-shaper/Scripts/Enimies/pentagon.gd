extends CharacterBody2D

const ENEMY_SQUARE = preload("res://Scenes/Enimies/square.tscn")
const MOVE_SPEED = 300.0
var direction = Vector2.ZERO
var pentagon_hp = 2

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
		pentagon_hp = pentagon_hp - 1
		print("pentagon HP is: ")
		print(pentagon_hp)
		if (pentagon_hp == 0):
				print("square")
		var square = ENEMY_SQUARE.instantiate()
		$"../../Squares".add_child(square)
		square.global_position = self.position
		queue_free()
