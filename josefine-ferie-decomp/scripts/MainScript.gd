extends Node2D

@onready var camera = $Camera2D

# --- Configuration ---
var target_x = 320.0       # Starting horizontal center
var scroll_speed = 450.0   # Speed of the target movement
var edge_margin = 80.0     # Pixels from edge to trigger scroll
var smooth_speed = 6.0     # Camera weight (higher = snappier)

# --- Cursor Assets ---
@onready var cur_normal = load("res://assets/Shared/hand_normal.png")
@onready var cur_hover  = load("res://assets/Shared/hand_hover.png")
@onready var cur_click  = load("res://assets/Shared/hand_click.png")
@onready var cur_arrow_l   = load("res://assets/Shared/arrow_left.png")
@onready var cur_arrow_r  = load("res://assets/Shared/arrow_right.png")
@onready var cur_arrow_l_end = load("res://assets/Shared/25_LeftEnd.png")
@onready var cur_arrow_r_end = load("res://assets/Shared/27_RightEnd.png")

func _ready():
	# 1. Setup Camera initial position
	camera.position = Vector2(320, 240)
	
	# 2. Register Cursors to Godot's internal shape names
	# (0,0) is the hotspot (top-left tip of the finger)
	Input.set_custom_mouse_cursor(cur_normal, Input.CURSOR_ARROW, Vector2(0, 0))
	Input.set_custom_mouse_cursor(cur_hover,  Input.CURSOR_POINTING_HAND, Vector2(0, 0))
	
	# We use CURSOR_BDIAGSIZE and CURSOR_FDIAGSIZE as placeholders
	Input.set_custom_mouse_cursor(cur_arrow_l, Input.CURSOR_BDIAGSIZE, Vector2(0, 0))
	Input.set_custom_mouse_cursor(cur_arrow_r, Input.CURSOR_FDIAGSIZE, Vector2(0, 0))
	
	# Register the "Wall" arrows
	Input.set_custom_mouse_cursor(cur_arrow_l_end, Input.CURSOR_VSPLIT, Vector2(0,0))
	Input.set_custom_mouse_cursor(cur_arrow_r_end, Input.CURSOR_HSPLIT, Vector2(0, 0))

# Add this variable at the very top of your script with the others
var was_mouse_pressed = false

func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	var mouse_x = mouse_pos.x
	var screen_w = get_viewport().get_visible_rect().size.x
	
	var is_currently_pressed = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)
	var new_shape = Input.CURSOR_ARROW
	
	# --- 1. Texture Swap (ONLY on change) ---
	if is_currently_pressed != was_mouse_pressed:
		if is_currently_pressed:
			Input.set_custom_mouse_cursor(cur_click, Input.CURSOR_ARROW, Vector2(0,0))
		else:
			Input.set_custom_mouse_cursor(cur_normal, Input.CURSOR_ARROW, Vector2(0,0))
		was_mouse_pressed = is_currently_pressed

	# --- 2. Handle Edge Scrolling & "Wall" Cursors ---
	if not is_currently_pressed:
		# LEFT MARGIN
		if mouse_x < edge_margin:
			if target_x > 321.0:
				new_shape = Input.CURSOR_BDIAGSIZE # Moving Arrow
				target_x -= scroll_speed * delta
			else:
				new_shape = Input.CURSOR_VSPLIT    # "Wall" Arrow (Left)
				
		# RIGHT MARGIN
		elif mouse_x > screen_w - edge_margin:
			if target_x < 679.0:
				new_shape = Input.CURSOR_FDIAGSIZE # Moving Arrow
				target_x += scroll_speed * delta
			else:
				new_shape = Input.CURSOR_HSPLIT    # "Wall" Arrow (Right)

	# --- 3. Apply Shape & Physics ---
	Input.set_default_cursor_shape(new_shape)
	target_x = clamp(target_x, 320.0, 680.0)
	camera.position.x = lerp(camera.position.x, target_x, smooth_speed * delta)
