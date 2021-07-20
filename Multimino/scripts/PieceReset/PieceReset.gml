function PieceReset(TopOnly, ObjPiece) {
	//var ObjPiece;

	if(!TopOnly)
	{
	    with(ObjPiece){
	        if(CurrentPiece != 0 or GMode != 7)
	        {
	            sprite_index = PieceIndex[other.Queue[0]]
				CurrentPiece = other.Queue[0]
	        }
	        if(!LDAS) LDAS = other.LDASLoad
			if(!RDAS) RDAS = other.RDASLoad
	    }
	    for(i = 0; i < 4; i++) Queue[i]  = Queue[i + 1]
	    Queue[4] = RndPiece()
		
		if(instance_exists(Rec_Play_obj) and (GMode != 6 and GMode != 7 and GMode != 10 and GMode != 11))
		{
			with(Rec_Play_obj)
			{
				if(_isRecording) ds_list_add(_usedpieces, other.Queue[4])
			}
		}
	}
	with(ObjPiece)
	{
		if(GMode == 10)
	    {
	        x = other.BoardStart + 288
	        y = 160
	    }
	    else 
	    {
	        x = 864
	        y = 96
	    }
	    alarm[0]    = -1
	    image_index = other.NState
	    MoveTimer   = 1
	    ML          = 15
	    PlaceTimer  = ResetTime
		//CHD		= false
	    Drop		= false
		Stall	    = 5
		
		//alarm[1] = 5
    
	    BC = 255 - PlaceTimer * 4
	    if((CurrentPiece >= 6 and CurrentPiece < 16) 
		or (CurrentPiece >= 28 and CurrentPiece < 61) 
		or (CurrentPiece >= 80 and CurrentPiece <= 87))
	    {
	        x += 32
	        y += 32 
	    }
		
		if(PieceScale == 2)
		{
			if (CurrentPiece < 6) move_snap(64,64)
			else 
			{
				x += 64
				y += 64 
			}
		}
	    if(ObjPiece == Polyminoe)
	    {
			if(IsLevelUp)
			{
				if(level > 20)
				{
					FallSpeed = 0
					
					if(level == 21) ResetTime = 30
					else		    
					{
						//ResetTime = ceil(30 - logn(1.215,(level - 21) * 1.4))
						switch(QueueMode)
						{
							case 0: ResetTime = floor(30 - 2.4 * power((level - 21)*(level - 21), 1/3)); break;	
							
							case 4:
							case 1: ResetTime = floor(level *(0.00997 * level - 1.1) + 48.31);			 break;
							
							case 6:
							case 2: ResetTime = ceil(30 - power((level - 21)* 8.5, 1/2));				 break;
							
							case 3: ResetTime = ceil( 30 - 2.15 * power((level - 21)*(level - 21), 1/3));break;
							
							case 5: ResetTime = ceil( 30 - power((level - 21) * 4, 1/2));				 break;
							
							default:
								ResetTime = 51 - level; //something went wrong curve
								break;
						}
					}
				
					if(GMode == 8 and (ResetTime <= 13 or level >  40)) ResetTime = 13 
					else if(ResetTime < 15)								ResetTime = 15
				}
				else FallSpeed = power(0.8 - ((level - 1) * 0.007), level - 1) * 60
			}
			
			if(Options[9] 
			and (Options[1] == 16 or Options[1] == 17) 
			and Control.CH 
			and Control.Queue[0] != 0 
			and Control.Queue[0] < array_length(Control.TGMSound))
			{
				audio_play_sound(Control.TGMSound[(Control.Queue[0] - 1)],10,false)
			}
	        
			/*
			var i;
	        Dis = 0
	        for(i = 0; i <= 25; i ++)
	        {
	            if(PieceCollision(x,y + (i * 64)))
	            {
	                DropY = y + ((i - 1) * 64)       
	                break
	            }
	            Dis++
	        }
			*/

	        if(GMode != 9)
	        {
	            if (PieceCollision(x, y)) y -= 64
	            
				if (PieceCollision(x, y)) with(GameMode)
	            {
	                Top  = true
	                Lost = 1
	                P2Count ++
	            }
	            if(!GameMode.Top) GameMode.Insert1 = false
	        }
	        else
	        {
	            if (PieceCollision(x, y)) y -= 64
				
	            if (PieceCollision(x, y)) GameMode.Top = true
	        }
	    }
	    else
	    {
	        if (PieceCollision(x, y)) y -= 64
			
	        if (PieceCollision(x, y)) with(GameMode)
	        {
	            Top  = true
	            Lost = 2
	            P1Count ++
	        }
	        if(!GameMode.Top) GameMode.Insert2 = false
	    }
	}
}
