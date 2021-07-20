function ClearBoard(ins) {

	if(n == 0 and GMode != 11) exit

	var i, j

	if(n != 0)
	{
		for(i = 0; i < n; i ++)
		{
		    for(j = LC[i]; j > 0; j--)
		    {
		       board[j] = board[j - 1]
		    }
		}
		board[0] = ZeroRow
	
		if(GMode != 10 and Options[9])
		{
			if !(Options[1] == 16 or Options[1] == 17) audio_play_sound(GSounds[3],10,false)
			else								       audio_play_sound(TGM_LineFall,10,false)
		}
	}

	instance_activate_object(ins)
	instance_destroy(ins)

	    for(i = 15; i <= 39; i++)
	    {
	        for(j = 0; j <= BoardWidth; j++)
	        {
	            XOff = BoardStart + (64 * j)
	            YOff =      -1152 + (64 * i)
	            if(board[i][j] != 0) instance_create_depth(XOff, YOff, -7, ins)
	        }
	    }
}
