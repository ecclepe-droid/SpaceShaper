extends Area2D

var direction = Vector2.ZERO
var bullet_speed = 2000
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += (direction * bullet_speed * delta)
	rotation = direction.angle()

func _on_body_entered(body: Node2D) -> void:
	#don't damage the player
	if not(body.name == "Player"):
		#damage things
		if body.has_method("take_damage"):
			body.take_damage()
		#delete the bullet when it hits somthing
		queue_free()
