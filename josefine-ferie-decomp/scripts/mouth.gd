extends Sprite2D 

@export var audio_player: AudioStreamPlayer2D
var timer = 0.0
var FLAP_INTERVAL = 0.1 

func _process(delta):
	# Only try to animate if the audio is actually playing
	if audio_player.playing:
		# Check volume level (dB). -60 is basically silence.
		# This gets the current volume level of the audio bus.
		var volume = AudioServer.get_bus_peak_volume_left_db(0, 0)
		
		# If the sound is "loud" enough, animate!
		if volume > -30: 
			timer += delta
			if timer >= FLAP_INTERVAL:
				visible = !visible
				timer = 0.0
		else:
			# Silence detected - stop the animation immediately
			visible = false
			timer = 0.0
	else:
		# Audio stopped entirely
		visible = false
