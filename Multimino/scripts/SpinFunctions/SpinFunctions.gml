function SpinDetection(ObjPiece, DoubRot) {

	if(DoubRot and (CurrentPiece == 56 or CurrentPiece == 57 or CurrentPiece == 22 or CurrentPiece == 21 or CurrentPiece == 27 or CurrentPiece == 16))
	{
		ObjPiece.Mini  = false
		ObjPiece.Super = false
		
		if(Options[9])
		{
			if(!ObjPiece.PSpin) audio_play_sound(GSounds[4],10,false)
			else				audio_play_sound(GSounds[5],10,false)
		}
		
		exit
	}
	
	if(!ST or CurrentPiece == 0)
	{
	    if(Options[9] and GMode != 12) audio_play_sound(GSounds[7],10,false)
	    exit
	}

	if((!Options[5] or GMode == 10) and !(CurrentPiece == 1 or CurrentPiece == 17 or CurrentPiece == 30 or CurrentPiece == 37) and GMode != 7)
	{
	    if(Options[9]) audio_play_sound(GSounds[4],10,false)
	    ObjPiece.Mini  = false
		ObjPiece.Super = false
		ObjPiece.PSpin = false
	    exit
	}

	var i, XO, YO, PX, PY, index, SpinCount = 0, MiniCount = 0, rSt;

	index = CurrentPiece - 1

	if((CurrentPiece == 6 or CurrentPiece == 25 or CurrentPiece == 26) and OSpin)
	{
		ObjPiece.Mini = false
		
	    if(!place_free(x, y + 64)) SpinCount ++
	    if(!place_free(x, y - 64)) SpinCount ++
	    if(!place_free(x + 64, y)) SpinCount ++
	    if(!place_free(x - 64, y)) SpinCount ++
    
	    if(SpinCount == 4)
	    {
	        if(Options[9]) audio_play_sound(GSounds[5],10,false)
			if(DoubRot) ObjPiece.Super = true
			ObjPiece.PSpin = true
	        exit
	    }
	    
		if(Options[9]) audio_play_sound(GSounds[4],10,false)
		ObjPiece.Super = false
		ObjPiece.PSpin = false
	    exit
	}

	for(i = 0; i < 4; i++)
	{		
		XO = Corners[index, 0 + 2 * i] * 64 * PieceScale
		YO = Corners[index, 1 + 2 * i] * 64 * PieceScale
		
	    if((CurrentPiece >= 7 and CurrentPiece <= 15) 
		or (CurrentPiece >= 28 and CurrentPiece < 61) 
		or (CurrentPiece >= 80 and CurrentPiece < 88))
	    {
	        XO *= 0.5
	        YO *= 0.5
	    }
    
	    rSt = image_index
    
	    if((CurrentPiece == 14 or  CurrentPiece == 59) 
		or (CurrentPiece == 32 or CurrentPiece == 34 or CurrentPiece == 39)
		or (CurrentPiece >= 53 and CurrentPiece <= 55) 
		or (CurrentPiece >= 84 and CurrentPiece <= 88)) 
		{
			rSt = ((rSt * -1) + 4) mod 4
		}
	    
		PX = cos(rSt * pi / 2) * XO - sin(rSt * pi / 2) * YO + x
	    PY = sin(rSt * pi / 2) * XO + cos(rSt * pi / 2) * YO + y
	    if(collision_point(PX,PY,all,true,true) != noone)
	    {
	            SpinCount ++
	            if(i < 2) MiniCount ++
	    }
	}


	if(SpinCount >= 3 and !place_free(x, y + 64))
	{
	    if((MiniCount == 1) 
		and index != 15 and index != 26 
		and index != 20 and index != 21 
		and index != 55 and index != 56)
		{
			ObjPiece.Mini = true
			
			if(CurrentPiece < 7  and LT == 5) ObjPiece.Mini = false
			if(CurrentPiece < 30 and LT == 6) ObjPiece.Mini = false
			if(CurrentPiece < 90 and LT == 7) ObjPiece.Mini = false
		}
		else ObjPiece.Mini = false
    
	    if(Options[9]) audio_play_sound(GSounds[5],10,false)
	    
		if(CurrentPiece == 2 and Spin == 1  and LT >= 4) ObjPiece.Mini = true
		if(CurrentPiece == 3 and Spin == -1 and LT >= 4) ObjPiece.Mini = true
		
		if((DoubRot) 
		and index != 15 and index != 26 
		and index != 20 and index != 21
		and index != 34 and index != 35
		and index != 37 and index != 38
		and LT != 6)
        {
            ObjPiece.Super = true
            ObjPiece.Mini  = false
        }
        else ObjPiece.Super = false
		
		ObjPiece.PSpin = true
		
		exit
		
	}
	else
	{
	    if(Options[9]) audio_play_sound(GSounds[4],10,false)
		ObjPiece.Mini = false
		ObjPiece.Super = false
		ObjPiece.PSpin = false
		exit
	}
}

function DrawDetection()
{

	if(CurrentPiece == 0) exit

	var i, XO, YO, PX, PY, index, rSt;

	index = CurrentPiece - 1

	for(i = 0; i < 4; i++)
	{		
		XO = Corners[index, 0 + 2 * i] * 64 * PieceScale
		YO = Corners[index, 1 + 2 * i] * 64 * PieceScale
		
	    if((CurrentPiece >= 7 and CurrentPiece <= 15) 
		or (CurrentPiece >= 28 and CurrentPiece < 61)
		or (CurrentPiece >= 80 and CurrentPiece < 88))
	    {
	        XO *= 0.5
	        YO *= 0.5
	    }
    
	    rSt = image_index
    
	    if((CurrentPiece == 14 or  CurrentPiece == 59)
		or (CurrentPiece == 32 or CurrentPiece == 34 or CurrentPiece == 39)
		or (CurrentPiece >= 53 and CurrentPiece <= 55)
		or (CurrentPiece >= 84 and CurrentPiece <= 88)) 
		{
			rSt = ((rSt * -1) + 4) mod 4
		}
	    
		PX = cos(rSt * pi / 2) * XO - sin(rSt * pi / 2) * YO + x
	    PY = sin(rSt * pi / 2) * XO + cos(rSt * pi / 2) * YO + y
	    
		if(collision_point(PX,PY,all,true,true) != noone) draw_circle_color(PX, PY, 8, c_green, c_green, false)
		else if(i < 2)									  draw_circle_color(PX, PY, 8, c_red, c_red, false)
		else											  draw_circle_color(PX, PY, 8, c_blue, c_blue, false)
	}
}
