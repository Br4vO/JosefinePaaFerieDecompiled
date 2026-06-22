extends Camera2D

@export var scroll_speed = 450.0
@export var edge_margin = 80.0
@export var smooth_speed = 6.0
@export var limit_left_move = 320.0
@export var limit_right_move = 680.0

var target_x = 320.0

func _process(delta):
	var mouse_x = get_viewport().get_mouse_position().x
	var screen_w = get_viewport().get_visible_rect().size.x
	var new_shape = Input.CURSOR_ARROW

	# We only show arrows if we aren't currently clicking
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if mouse_x < edge_margin:
			if target_x > limit_left_move + 1.0:
				new_shape = Input.CURSOR_BDIAGSIZE # Moving Left
				target_x -= scroll_speed * delta
			else:
				new_shape = Input.CURSOR_VSPLIT    # Left Wall
				
		elif mouse_x > screen_w - edge_margin:
			if target_x < limit_right_move - 1.0:
				new_shape = Input.CURSOR_FDIAGSIZE # Moving Right
				target_x += scroll_speed * delta
			else:
				new_shape = Input.CURSOR_HSPLIT    # Right Wall

	# Tell the system which shape to use
	GlobalCursor.set_cursor(new_shape, GlobalCursor.Priority.CAMERA)
	
	# Apply movement
	target_x = clamp(target_x, limit_left_move, limit_right_move)
	position.x = lerp(position.x, target_x, smooth_speed * delta)
