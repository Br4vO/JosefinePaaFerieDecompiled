extends Node2D

@onready var camera = $Camera2D

# The horizontal center of your view
var target_x = 320.0 

# Settings you can tweak in the Inspector
var scroll_speed = 400.0   # How fast the "Target" moves
var edge_margin = 100.0    # Distance from edge (in pixels) to trigger slide
var smooth_speed = 5.0     # How "heavy" the camera feel is

func _process(delta):
	# 1. Get the mouse position relative to the game window
	var mouse_x = get_viewport().get_mouse_position().x
	var screen_w = get_viewport().get_visible_rect().size.x
	
	# 2. Check if mouse is on the LEFT edge
	if mouse_x < edge_margin:
		target_x -= scroll_speed * delta
		
	# 3. Check if mouse is on the RIGHT edge
	elif mouse_x > screen_w - edge_margin:
		target_x += scroll_speed * delta
	
	# 4. Clamp the target so it doesn't go into the grey void
	# (Min: Half viewport width, Max: Total art width - Half viewport width)
	target_x = clamp(target_x, 320.0, 680.0)
	
	# 5. Apply the smooth movement
	camera.position.x = lerp(camera.position.x, target_x, smooth_speed * delta)
