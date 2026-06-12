extends Node2D # or Sprite2D, depending on your root node type

@onready var sfx_player = $SfxPlayer # Or just $AudioStreamPlayer

func change_screen():
	# 1. Play the sound
	sfx_player.play()
	
	# 2. Wait for the sound to finish before moving on
	# This 'await' tells the script: "Pause here until the signal 'finished' happens"
	await sfx_player.finished
	#GlobalCursor.reset_cursor()
	get_tree().change_scene_to_file("res://scenes/picnic.tscn")

func _on_norway_flag_pressed():
	# Tell Godot to use Norwegian translations
	TranslationServer.set_locale("N")
	
	change_screen()

func _on_sweden_flag_pressed():
	# Tell Godot to use Swedish translations
	TranslationServer.set_locale("S")
	
	change_screen()
