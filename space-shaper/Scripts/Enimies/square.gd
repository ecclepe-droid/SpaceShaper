extends CharacterBody2D

const ENEMY_TRIANGLE = preload("res://Scenes/Enimies/triangle.tscn")
const MOVE_SPEED = 300.0
var direction = Vector2.ZERO
var square_hp = 1

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
		square_hp = square_hp - 1
		print("square HP is: ")
		print(square_hp)
		if (square_hp == 0):
			print("triangle")
		var triangle = ENEMY_TRIANGLE.instantiate()
		$"../../Squares".add_child(triangle)
		triangle.global_position = self.position
		queue_free()
