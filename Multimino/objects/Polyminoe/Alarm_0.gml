if(!pause and !gameover){
    y += 64
    if(PieceCollision(x, y))
	{
		y -= 64
		if(GMode == 12 and PieceCollision(x, y + 64))
		{
			Control.update = true
	        if(Options[9]) audio_play_sound(GSounds[3],10,false)
			ComboArt.VerVel = -10
		}
	}
    else
    {
        if(Down) score += 1
		with(Control)
		{
			Mini  = false
			PSpin = false
		}
    }
}

