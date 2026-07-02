extends Node2D

const PLAYER_BULLET_SCENE = preload("res://Scenes/Player/player_bullet.tscn")
const ENEMY_TRIANGLE = preload("res://Scenes/Enimies/triangle.tscn")
const ENEMY_SQUARE = preload("res://Scenes/Enimies/square.tscn")
const ENEMY_PENTAGON = preload("res://Scenes/Enimies/pentagon.tscn")
const ENEMY_HEXAGON = preload("res://Scenes/Enimies/hexagon.tscn")
const ENEMY_OCTAGON = preload("res://Scenes/Enimies/Octagon.tscn")
const ENEMY_CIRCLE = preload("res://Scenes/Enimies/circle.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.CIRCLE_ENEMIES_NODE = $Enimies/Circles
	Globals.OCTAGONS_ENEMIES_NODE = $Enimies/Octagons
	Globals.HEXAGONS_ENEMIES_NODE = $Enimies/Hexagons   
	Globals.PENTAGONS_ENEMIES_NODE = $Enimies/Penagons
	Globals.SQUARE_ENEMIES_NODE = $Enimies/Squares
	Globals.TRIANGLE_ENEMIES_NODE = $Enimies/Triangles
	Globals.PLAYER_PROJECTILES_NODE = $PlayerProjectiles
	Globals.ENEMY_PROJECTILES_NODE = $EnemyProjectiles


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_spawn_triangle_timer_timeout():
	print("triangle")
	var triangle = ENEMY_TRIANGLE.instantiate()
	$Enimies/Squares.add_child(triangle)
	triangle.global_position = Vector2(
		randi_range(-2500,2500),
		randi_range(-2500,2500)
	)
	$SpawnTimers/SpawnTriangleTimer.start(randi_range(1, 3))
func _on_spawn_square_timer_timeout():
	print("square")
	var square = ENEMY_SQUARE.instantiate()
	$Enimies/Triangles.add_child(square)
	square.global_position = Vector2(
		randi_range(-2500,2500),
		randi_range(-2500,2500)
	)
	$SpawnTimers/SpawnSquareTimer.start(randi_range(5, 6))
func _on_spawn_pentagon_timer_timeout():
	print("pentagon")
	var pentagon = ENEMY_PENTAGON.instantiate()
	$Enimies/Penagons.add_child(pentagon)
	pentagon.global_position = Vector2(
		randi_range(-2500,2500),
		randi_range(-2500,2500)
	)
	$SpawnTimers/SpawnPentagonTimer.start(randi_range(6, 8))
func _on_spawn_hexagon_timer_timeout():
	print("hexagon")
	var hexagon = ENEMY_HEXAGON.instantiate()
	$Enimies/Hexagons.add_child(hexagon)
	hexagon.global_position = Vector2(
		randi_range(-2500,2500),
		randi_range(-2500,2500)
	)
	$SpawnTimers/SpawnHexagonTimer.start(randi_range(8, 13))
func _on_spawn_octagon_timer_timeout():
	print("octagon")
	var octagon = ENEMY_OCTAGON.instantiate()
	$Enimies/Octagons.add_child(octagon)
	octagon.global_position = Vector2(
		randi_range(-2500,2500),
		randi_range(-2500,2500)
	)
	$SpawnTimers/SpawnOctagonTimer.start(randi_range(15, 10))
func _on_spawn_circle_timer_timeout():
	print("circle")
	var circle = ENEMY_CIRCLE.instantiate()
	$Enimies/Circles.add_child(circle)
	circle.global_position = Vector2(
		randi_range(-2500,2500),
		randi_range(-2500,2500)
	)
	$SpawnTimers/SpawnCircleTimer.start(randi_range(20, 25))



func _on_player_player_shoot(player: CharacterBody2D, dir: Vector2) -> void:
	print(player, "shoot towards", dir)
	var bullet = PLAYER_BULLET_SCENE.instantiate()
	$PlayerProjectiles.add_child(bullet)
	bullet.global_position = player.global_position
	
	bullet.direction = dir
