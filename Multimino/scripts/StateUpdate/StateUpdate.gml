function StateUpdate(argument0) {
	s = argument0

	image_index += s

	if(image_index < 0) image_index += 4
	if(image_index > 3) image_index -= 4
}
