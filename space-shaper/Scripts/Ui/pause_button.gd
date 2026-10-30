extends Button


var pause = load("res://Resources/Sprites/Buttons/Big Pause Button.png")
var play = load("res://Resources/Sprites/Buttons/Big Play Button.png")

func _ready() -> void:
	$"../../TextureRect".hide()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause Game"):
		toggle_pause()

func _on_pressed() -> void:
	toggle_pause()

func toggle_pause():
	if Globals.pause == 0:
		Globals.pause = 1
		self.icon = pause
		$"../../TextureRect".hide()
	elif Globals.pause == 1:
		Globals.pause = 0
		self.icon = play
		$"../../TextureRect".show()
