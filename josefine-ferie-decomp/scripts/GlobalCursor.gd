extends Node

# Use the exact paths to your 5 cursor types
@onready var cur_normal = load("res://assets/Shared/hand_normal.png")
@onready var cur_hover  = load("res://assets/Shared/hand_hover.png")
@onready var cur_click  = load("res://assets/Shared/hand_click.png")
@onready var cur_arrow_l = load("res://assets/Shared/arrow_left.png")
@onready var cur_arrow_r = load("res://assets/Shared/arrow_right.png")
@onready var cur_wall_l = load("res://assets/Shared/25_LeftEnd.png")
@onready var cur_wall_r = load("res://assets/Shared/27_RightEnd.png")

enum Priority { CAMERA, INTERACT }
var priority_stack = {}

func set_cursor(shape_type, priority):
	priority_stack[priority] = shape_type
	_apply_cursor()

func clear_cursor(priority):
	priority_stack.erase(priority)
	_apply_cursor()

func _apply_cursor():
	# Decide who wins: INTERACT priority always overrides CAMERA priority
	if priority_stack.has(Priority.INTERACT):
		Input.set_default_cursor_shape(priority_stack[Priority.INTERACT])
	elif priority_stack.has(Priority.CAMERA):
		Input.set_default_cursor_shape(priority_stack[Priority.CAMERA])
	else:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)

func _ready():
	# Register everything once
	Input.set_custom_mouse_cursor(null, Input.CURSOR_ARROW)
	Input.set_custom_mouse_cursor(cur_normal,  Input.CURSOR_POINTING_HAND)
	Input.set_custom_mouse_cursor(cur_arrow_l, Input.CURSOR_BDIAGSIZE)
	Input.set_custom_mouse_cursor(cur_arrow_r, Input.CURSOR_FDIAGSIZE)
	Input.set_custom_mouse_cursor(cur_wall_l,  Input.CURSOR_VSPLIT)
	Input.set_custom_mouse_cursor(cur_wall_r,  Input.CURSOR_HSPLIT)
