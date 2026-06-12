extends Node

@onready var player = $VoicePlayer
@onready var idle_timer = $MaseTimer 

var intro_options = ["PI06", "PI07", "PI08", "PI09", "PI10"]

func play_voice(clip_id: String):
	idle_timer.stop()
	
	var lang = TranslationServer.get_locale()
	var path = "res://assets/audio/Picnic/" + clip_id + "_" + lang + ".wav"
	
	if FileAccess.file_exists(path):
		player.stream = load(path)
		player.play()
		
		await player.finished
		idle_timer.start()
	else:
		print("Warning: Voice file not found at ", path)
		idle_timer.start()

func stop_voice():
	player.stop()
	idle_timer.start()
	
func _ready():
	play_voice("Intro")

func _on_timer_timeout() -> void:
	var random_clip = intro_options.pick_random()
	play_voice(random_clip)


func _on_help_button_button_down() -> void:
	play_voice("PIH01")


func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			play_voice("PIH01")
