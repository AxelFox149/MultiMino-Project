function IsClosedCheck(PLACEPIECE) {
	with(PLACEPIECE)
	{
		var BRD;
		if(object_index == Placed) with(Control) BRD = board
		else					 with(EnControl) BRD = board
		
	        if(!Flash)
	        {
	            var Closed = 0;
    
	            if(BRD[max(Posy - 1, 0), Posx] != 0) Closed ++ 
	            if(BRD[min(Posy + 1,39), Posx] != 0) Closed ++
	            if(BRD[Posy, min(Posx + 1, 9)] != 0) Closed ++
	            if(BRD[Posy, max(Posx - 1, 0)] != 0) Closed ++
            
	            if(Closed == 4) instance_deactivate_object(self)
	        }
	}
}
