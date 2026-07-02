extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var move_speed = 2.5
	position += (direction * move_speed)
	var rotate = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	rotation = 1
