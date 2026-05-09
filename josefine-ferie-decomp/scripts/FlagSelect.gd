extends Node2D # or Sprite2D, depending on your root node type

func _on_norway_flag_pressed():
	# 1. Tell Godot to use Norwegian translations
	TranslationServer.set_locale("no")
	
	# 2. (Optional) Play a sound if you have one
	# $AudioPlayer.stream = load("res://assets/audio/welcome_no.wav")
	# $AudioPlayer.play()
	
	# 3. Change to the forest scene
	get_tree().change_scene_to_file("res://scenes/picnic.tscn")

func _on_sweden_flag_pressed():
	# 1. Tell Godot to use Swedish translations
	TranslationServer.set_locale("sv")
	
	# 2. Change to the forest scene
	get_tree().change_scene_to_file("res://scenes/picnic.tscn")
