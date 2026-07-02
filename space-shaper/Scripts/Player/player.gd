extends CharacterBody2D

signal player_shoot(player: CharacterBody2D, dir: Vector2)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
const MAX_MOVE_SPEED = 600
var shooting_rate = 0.5
var reload_speed = 5

var move_speed = 500
var can_shoot = true
var acceleration = 0.75
var max_acceleration = 1.5
var min_acceleration = 0
var acceleration_speed = 0.01
var decceleration_speed = 0.



# move the player
func _process(_delta):
	var _direction = Input.get_vector("move_left","move_right","move_forward","move_backward")
	
	if Input.is_action_pressed("shoot") and can_shoot==true and Globals.clip>0:
		print("pew pew")
		$ShootTimer.start(shooting_rate)
		can_shoot = false
		
		var aim_direction = global_position.direction_to(get_global_mouse_position())
		var aim_angle = rad_to_deg(aim_direction.angle())
		print(aim_angle)
		player_shoot.emit(self, aim_direction)

	if Input.is_action_pressed("reload") and Globals.clip < Globals.max_clip and $ReloadTimer.time_left <= 0:
		reload_speed -= 0.1
		if reload_speed <= 2:
			reload_speed = 2
			print("reload efficiancy increased")
		print("maximum reload speed reached")
		print("reloading now takes")
		print(reload_speed)
		print("seconds")
		reload()
		
	

func get_input():
	look_at(get_global_mouse_position())
	var axis = Input.get_axis("move_backward", "move_forward")
	#print(axis)
	velocity = Vector2(axis * move_speed, 0).rotated(self.rotation)*acceleration
	if Input.is_action_pressed("move_forward"):
		acceleration += acceleration_speed
		if acceleration > max_acceleration:
			acceleration = max_acceleration
	elif Input.is_action_pressed("move_backward"):
		acceleration -= decceleration_speed/2
		if acceleration < min_acceleration:
			acceleration = min_acceleration
	else:
		acceleration -= decceleration_speed
		if acceleration < min_acceleration:
			acceleration = min_acceleration


func _physics_process(delta):
	get_input()
	var collision = move_and_collide(velocity * delta)
	if collision:
		var body = collision.get_collider()
		if (body.name == "Circle" 
		or body.name == "Octagon" 
		or body.name == "Hexagon" 
		or body.name == "Pentagon"
		or body.name == "Square" 
		or body.name == "Triangle"):
			if $InvincibilityTimer.time_left == 0:
				take_damage()

func take_damage():
	var inv_timer: Timer = $InvincibilityTimer
	if inv_timer.time_left == 0:
		inv_timer.start()
		Globals.player_health -= 1
		print("your heath is",Globals.player_health)
		if Globals.player_health <= 0:
			get_tree().quit()

	#Automatic reload when running out of shots and use ammo when shooting
func shoot():
	shooting_rate -= 0.01
	if shooting_rate <= 0.12:
		shooting_rate = 0.12
		print("shooting efficiancy increased.")
	print("Maximum shooting efficiancy reached.")
	print("you shooting rate is now")
	print(shooting_rate)
	if Globals.clip >= 0:
		can_shoot = true
		Globals.clip -= 1
		print("Globals.clip is: ", Globals.clip)
	else:
		reload()

func reload():
	Globals.clip = 0
	print("clip dumped")
	print("reloading...")
	$ReloadTimer.start(reload_speed);


func _on_reload_timer_timeout() -> void:
	Globals.clip = Globals.max_clip
	if Globals.clip < 50:
		print("clip size increased")
		Globals.max_clip += 1
	print("maximum clip size reached.")
	print(Globals.clip)
