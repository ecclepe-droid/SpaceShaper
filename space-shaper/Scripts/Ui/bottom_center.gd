extends Panel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Globals.clip <= 0:
		show()
		await wait(0.5)
		hide()
		await wait(0.5)

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
