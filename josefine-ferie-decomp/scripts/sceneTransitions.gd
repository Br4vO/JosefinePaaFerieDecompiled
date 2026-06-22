extends Area2D

func _on_mouse_entered():
	# Change to your "Pointing Hand"
	GlobalCursor.set_cursor(Input.CURSOR_POINTING_HAND, GlobalCursor.Priority.INTERACT)

func _on_mouse_exited():
	# Change back to the "Arrow"
	GlobalCursor.clear_cursor(GlobalCursor.Priority.INTERACT)

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			match name:
				"FirePit":
					print("Firepit clicked!")
				"Laptop":
					print("Laptop clicked!")
				"Clothes":
					print("Clothes clicked!")
				"Animal":
					print("Animal clicked!")
				"Door":
					print("Door clicked!")
				"Teppe":
					print("Teppe clicked!")
				"Cave":
					print("Cave clicked!")
