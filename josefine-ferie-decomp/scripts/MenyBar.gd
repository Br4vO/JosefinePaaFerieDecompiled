extends TextureRect

# Adjust these based on your game's resolution (640x480)
var hidden_y = 480.0     # Completely below the screen
var shown_y = 430.0      # Slid up (assuming the bar is 60px tall)
var trigger_height = 450.0 # Mouse must be below this Y to trigger

var is_open = false

func _process(_delta):
	# 1. Get the mouse position relative to the game window
	var mouse_y = get_viewport().get_mouse_position().y
	
	# 2. Check if the mouse is in the 'hot zone' at the bottom
	if mouse_y > trigger_height:
		if not is_open:
			slide_to(shown_y)
			is_open = true
	else:
		# If the mouse leaves the bottom area, hide it
		if is_open:
			slide_to(hidden_y)
			is_open = false

func slide_to(target_y: float):
	# Create a new tween for smooth motion
	var tween = create_tween()
	
	# Set the animation style:
	# TRANS_QUAD + EASE_OUT gives it a 'weighted' feel (starts fast, slows down)
	tween.tween_property(self, "position:y", target_y, 0.4)\
		.set_trans(Tween.TRANS_QUAD)\
		.set_ease(Tween.EASE_OUT)


func _on_exit_button_button_down() -> void:
	get_tree().quit()
