function ReadBoard(Gray, InCont) {
	var i, j, inst, XOff, YOff, BRDST, BRDWD;
	
	with(InCont)
	{
		BRDWD = BoardWidth
		BRDST = BoardStart
	}
	
	for(i = 0; i <= 39; i++)
	{
	    for(j = 0; j <= BRDWD; j++)
	    {
	        XOff = BRDST + (64 * j)
	        YOff = -1152 + (64 * i)
        
	        if(InCont == Control)inst = instance_place(XOff, YOff, Placed)
	        else				 inst = instance_place(XOff, YOff, EnPlaced)
	        
			if(inst != noone)
	        {
	            if(Gray)
				{
					with(inst)   CColor		 = 90
					with(InCont) board[i][j] = 90
				}
	            else with(inst) InCont.board[i][j] = CColor
	        }
	        else with(InCont) board[i][j] = 0
	    }
	}
}