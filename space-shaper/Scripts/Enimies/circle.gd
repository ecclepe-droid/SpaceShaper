extends CharacterBody2D

const ENEMY_OCTAGON = preload("res://Scenes/Enimies/Octagon.tscn")
const MOVE_SPEED = 600.0
var direction = Vector2.ZERO
var circle_hp = 3

const ENEMY_BULLET_SCENE = preload("res://Scenes/Enimies/enemy_bullet.tscn")

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
		circle_hp = circle_hp - 1
		print("circle HP is: ")
		print(circle_hp)
		var _aim_direction = direction
		var bullet = ENEMY_BULLET_SCENE.instantiate()
		Globals.ENEMY_PROJECTILES_NODE.call_deferred("add_child", bullet)
		bullet.global_position = self.global_position
		if (circle_hp == 0):
			print("octagon")
			var octagon = ENEMY_OCTAGON.instantiate()
			$"../../Circles".add_child(octagon)
			octagon.global_position = self.position
			queue_free()
