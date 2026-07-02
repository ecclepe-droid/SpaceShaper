extends CharacterBody2D

const MOVE_SPEED = 200.0
var direction = Vector2.ZERO
var triangle_hp = 1

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
		triangle_hp = triangle_hp - 1
		print("triangle HP is: ")
		print(triangle_hp)
		if (triangle_hp == 0):
			queue_free()
