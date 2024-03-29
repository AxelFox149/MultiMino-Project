function CheckBVal(State, ToCheck) {

	if(State >= 4
	or (State > PieceMaxState[CurrentPiece])) exit

	var OrInd = CurrentPiece, OrX,OrY,OrState = image_index;

	OrX = x
	OrY = y

	sprite_index = PieceIndex[ToCheck]
	CurrentPiece = ToCheck
	
	var ORBOARD = EnControl.board
	var NBOARD  = ORBOARD
	var TempB   = 0
	var SumH	= 0
	var PX,PY;
	var TY;
	var i, j;
	var line;
	var W1, W2, W3, W4;
	var Bump = array_create(10, 40), TempB = 0, maxP = 0, minP = 0;
	var Reset = Bump
	
	while(Step != 10)
	    {
			NBOARD  = ORBOARD
	        Holes   = 0
	        y = 96
	        x = 1056 + (64 * Step)
			
			if((CurrentPiece >= 6  and CurrentPiece <= 15) 
			or (CurrentPiece >= 28 and CurrentPiece <  61) 
			or (CurrentPiece >= 80 and CurrentPiece <  89))
	        {
	            y-= 32
	            x-= 32
	        }
        
	        image_index = State
			
	        while(PieceCollision(x, y))
	        {
	            if(Step < 5)
				{
					x += 64
					Step ++
				}
	            else
	            {
	                x -= 64
	                Step = 9
	                break
	            }
	        }
	        TY = y;
        
	        //Find lowest point
	        for(i = 0; i <= 25; i ++)
	        {
	            y = TY + 64 * i
	            if(PieceCollision(x, y))
				{
	                y -= 64
	                break
	            }
	        }
			
			#region old code
			/*
	        //Hole Count
        
	        
			//
			var StartY, FinalY, i,j, OffX,OffY;
			
			StartY = (bbox_top + 1152) / 64
			FinalY = StartY + 7
			
			FinalY = min(39, FinalY)
			
			
			for(i = StartY; i <= FinalY; i++)
			{
				for(j = 0; j <= 9; j++)
				{
					OffX = EnControl.BoardStart + (64 * j) + 32
					OffY =				  -1152 + (64 * i) + 32
					
					if(EnControl.board[i,j] == 0 and (EnControl.board[i - 1,j] == 0 or collision_point(OffX,OffY, Enemy, true, false))) Holes++
					
				}
			}
			//
			var Posy = 0, Posx = 0, i,j, OffX,OffY;
	        Posy = floor((y + 1152) / 64)
	        Posx = floor((x - EnControl.BoardStart) / 64)
	        if(CurrentPiece < 6 or (CurrentPiece >= 16 and CurrentPiece <= 27))
	        {
	            for(i = 0; i < 3; i++)
	            {           
	                for(j = 0; j < 3; j++)
	                {
	                    OffX = (Posx - 1) + (1 * i)
	                    OffY = (Posy)     + (1 * j)
                    
	                    if(OffY > 39) break
	                    if(OffX < 0 or OffX > 9) break
	                    if(collision_point(EnControl.BoardStart + (64 * OffX) + 32,-1152 + (64 * OffY) + 32,Enemy,true,false)) continue
                    
	                    if(EnControl.board[OffY, OffX] == 0 and collision_point(EnControl.BoardStart + (64 * OffX) + 32,-1152 + (64 * OffY) - 32,Enemy,true,false)) Holes++
	                }
	            }
	        }
	        else if(CurrentPiece == 6 or CurrentPiece == 14 or CurrentPiece == 15)
	        {
	            for(i = 0; i < 2; i++)
	            {
	                OffX = (Posx - 1) + (1 * i)
	                OffY = (Posy + 1)
                    
	                if(OffY > 39) break
	                if(OffX < 0 or OffX > 9) break
                
	                if(EnControl.board[OffY, OffX] == 0) Holes ++
	                //if(!collision_point(x - 64 + (64 * i),y + 96,all,false,false)) Holes++
	            }
            
	        }
	        else if(CurrentPiece == 7)
	        {
	            var offset = 0;
	            if(State == 2) offset = 1
            
            
	            for(i = 0; i < 4; i++)
	            {
	                OffX = (Posx - 2) + (1 * i)
	                OffY = (Posy + offset)
                    
	                if(OffY > 39) break
	                if(OffX < 0 or OffX > 9) break
                
	                if(EnControl.board[OffY, OffX] == 0) Holes ++
                
	                //if(!collision_point(x - 96 + (64 * i),y + 32 + (64 * offset),all,true,false)) Holes++
	            }
	        }
			else if(CurrentPiece > 7 and CurrentPiece <= 13)
	        {
	            for(i = 0; i < 5; i++)
	            {           
	                for(j = 0; j < 5; j++)
	                {
	                    OffX = (Posx - 1) + (1 * i)
	                    OffY = (Posy)     + (1 * j)
                    
	                    if(OffY > 39) break
	                    if(OffX < 0 or OffX > 9) break
						
	                    if(collision_point(EnControl.BoardStart + (64 * OffX), -1152 + (64 * OffY),Enemy,true,false)) continue
                    
	                    if(EnControl.board[OffY, OffX] == 0 and collision_point(EnControl.BoardStart + (64 * OffX) + 32,-1152 + (64 * OffY) - 32,Enemy,true,false)) Holes++
	                }
	            }
	        }


	        //lines cleared
        
	        var line;
	        Cleared = 0
	        for(i = 16; i <= 39; i++)
	        {
	            line = true
	            for(j = 0; j <= EnControl.BoardWidth; j++)
	            {
	                XOff = EnControl.BoardStart + (64 * j)
	                YOff =                -1152 + (64 * i)
               
	                if(EnControl.board[i,j] == 0)
	                {
	                    if(!collision_point(XOff, YOff, Enemy, true, false))
	                    {
	                        line = false
	                        break
	                    }
	                }
	            }
	            if(line) Cleared ++
	        }
	        //Calculate Bumpiness
	        var Bump = array_create(10), TempB = 0, maxP = 0, minP = 0;
        
	        for(i = 0; i < 10; i++)
	        {
	            for(j = 0;j < 23;j++)
	            {
	                if(collision_point((EnControl.BoardStart + 32) + (i * 64),0 + (64 * j),all,true,false))
	                {
	                    Bump[i] = j
	                    if(minP < j) minP = j
	                    if(maxP > j) maxP = j
	                    break
	                }
	            }
	        }
        
	        for(i = 0; i < 9; i++) Bump[i] = abs(Bump[i] - Bump[i + 1])
	        for(i = 0; i < 9; i++) TempB  += Bump[i]
        
	        TempB = TempB / 9
			*/
			#endregion
			
			
			#region new code
			
			var l, SPR, ANG;
			
			SPR = CurrentPiece - 1
			ANG = image_index
	
			if(SPR == -1) exit
			else if(SPR == 13 
				or (SPR == 31 or  SPR == 33 or SPR == 38) 
				or (SPR >= 52 and SPR <= 54) 
				or (SPR == 56 or  SPR == 58) 
				or (SPR >= 83 and SPR <= 87))
				{
					ANG *= -1
					ANG = (ANG + 4) mod 4
					image_index = ANG
				}
	
			if(SPR >= 29)					l = 6
			else if(SPR < 7)                l = 4
			else if(SPR > 6 and SPR < 25)   l = 5
			else if(SPR == 25)              l = 1
			else if(SPR == 26 or SPR == 28) l = 3
			else if(SPR == 27)              l = 2
			
			for(i = 0; i < l; i++)
			{
				PX = Block[image_index,SPR][0 + (2 * i)] * 64
				PY = Block[image_index,SPR][1 + (2 * i)] * 64
		
				if((SPR >= 5  and SPR <= 14) 
				or (SPR >= 27 and SPR <  60) 
				or (SPR >= 79 and SPR <  87))
			    {
			        PX = PX >> 1
					PY = PY >> 1
			    }
				
				PX += x
				PY += y
				
				PY = (PY + 1152) >> 6
				PX = (PX - 1024) >> 6
				
				NBOARD[PY][PX] = 1
			}
			
			//show_debug_message("Ind: " + string(image_index) + " - Pos: " + string(Step))
			//for(i = 20; i < 40; i++) show_debug_message(NBOARD[i])
			
			Cleared = 0
			Bump  = Reset
			TempB = 0 
			maxP  = 0
			minP  = 0
			
			for(i = 15; i < 40; i++)
			{
				line = true
				for(j = 0; j < 10; j++)
				{
					//Hole Count
					if(NBOARD[i][j] == 0)
					{
						line = false
						if(NBOARD[i - 1][j] != 0) Holes ++
					}
					else
					{
						if(Bump[j] == 40) //Bumpiness
						{
							Bump[j] = i
		                    if(minP < i) minP = i
		                    if(maxP > i) maxP = i
						}
					}
				}
				if(line) Cleared ++ //Cleared Lines
			}
			
			//show_debug_message("Heights: ")
			//show_debug_message(Bump)
			
			//Calculate Bumpiness
			
			TempB = 0
			SumH  = 0
			
	        for(i = 0; i < 9; i++)
			{
				//TempB  += abs(Bump[i] - Bump[i + 1])
				//SumH   += Bump[i]
				
				Bump[i] = abs(Bump[i] - Bump[i + 1])
				TempB  += Bump[i]
			}
			//SumH	+= Bump[9]
			
			#endregion
			
	        //Calculate score
			
			
			W1 =  1 // 1
			W2 = -11 //-7
			W3 =  3 // 3
			W4 = -5 //-5
			
			//TempB = SumH / 9
			TempB = TempB / 9
			SumH  = y >> 6
			
	        if(!Scared) TScore = (SumH * W1) + (Holes * W2) - (Cleared * W3) + (TempB * W4)
	        else        TScore = (SumH * W1) + (Holes * W2) + (Cleared * W3) + (TempB * W4)
	        
			//show_debug_message("Differences: ")
			//show_debug_message(Bump)
			//show_debug_message("HeigthSum: " + string(SumH) + " - Holes: " + string(Holes) + " - Cleared: " + string(Cleared) + " - Bumpiness: " + string(TempB))
			//show_debug_message("Score: " + string(TScore))
			
			if(Best < TScore) 
	        {
	            //if(TestHold) DoHold = true
	            Best = TScore
            
	            RotSt = State
	            Xlist = x
	            Ylist = y
	            ActivePiece = CurrentPiece
	        }
        
	        Step ++
	    }

	x = OrX
	y = OrY
	sprite_index = PieceIndex[OrInd]
	CurrentPiece = OrInd
	image_index  = OrState  
	Step = 0
}
