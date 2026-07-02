extends CharacterBody2D

const ENEMY_HEXAGON = preload("res://Scenes/Enimies/hexagon.tscn")
const MOVE_SPEED = 500.0
var direction = Vector2.ZERO
var octagon_hp = 3

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
		octagon_hp = octagon_hp - 1
		print("octagon HP is: ")
		print(octagon_hp)
		if (octagon_hp == 0):
				print("hexagon")
		var hexagon = ENEMY_HEXAGON.instantiate()
		$"../../Hexagons".add_child(hexagon)
		hexagon.global_position = self.position
		queue_free()
