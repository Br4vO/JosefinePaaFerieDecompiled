extends Node # Or Node2D, etc.

func decompress_bitd(pixel_data: PackedByteArray):
	var img = Image.create(16, 32, false, Image.FORMAT_RGBA8)
	var current_pixel = 0
	var data_index = 0
	
	while data_index < pixel_data.size() and current_pixel < 512:
		var command = pixel_data[data_index]
		# Interpret command as a signed 8-bit integer
		if command > 127:
			command -= 256
		data_index += 1
		
		if command < 0: # Run
			# We add 1 to the absolute value of the command
			var run_length = abs(command) + 1 
			var pixel_value = pixel_data[data_index]
			data_index += 1
			for i in range(run_length):
				if current_pixel < 256:
					paint_pixel(img, current_pixel, pixel_value)
					current_pixel += 1
		else: # Literal
			# We add 1 to the command itself
			var literal_length = command + 1
			for i in range(literal_length):
				if data_index < pixel_data.size() and current_pixel < 256:
					var pixel_value = pixel_data[data_index]
					data_index += 1
					paint_pixel(img, current_pixel, pixel_value)
					current_pixel += 1
					
	print("Final pixel count: ", current_pixel)
	return img

func paint_pixel(img, index, value):
	var x = index % 16
	var y = index / 16
	var color = Color.BLACK if value > 0 else Color.TRANSPARENT
	img.set_pixel(x, y, color)

func _ready():
	var file_path = "res://assets/INTRO.dxr" 
	var offset = 175954
	var length = 97

	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		file.seek(offset)
		var bytes = file.get_buffer(length)
		print("Successfully read ", bytes.size(), " bytes.")
		print("Hex start: ", bytes.slice(0, 8).hex_encode())
		decompress_bitd(bytes)
	else:
		print("Failed to open file! Check your path and filename.")
		
