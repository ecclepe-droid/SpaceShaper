extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Globals.player_health <= 0:
		show()


func _on_retry_button_pressed() -> void:
	pass # Replace with function body.
