function GOSecuence() {
	gameover = true
	alarm[0] = 60

	Warning = false
	depth = -15
	
	audio_stop_sound(CurrentMusic)

	with(Placed)
	{
	        Flash = true
	        alpha = 0.6
	        CColor = ColorPal[90]
	        image_blend = CColor
	}

	if(instance_exists(Polyminoe)){
	    LX = Polyminoe.x
	    LY = Polyminoe.y
	    LS = Polyminoe.CurrentPiece
	    LP = Polyminoe.image_index
    
	    if(GMode != 10)instance_deactivate_object(Polyminoe)
	}
	
	
	if(instance_exists(Rec_Play_obj))
	{
		with(Rec_Play_obj)
		{
			if(_isRecording) _kRecord = 1
			if(_isPlaying)	 _kPlay   = 1
			
			_pulse = true
		}
	}
}
