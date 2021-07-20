function RNDBoard() {
	var Choice, Used, AllUsed, PrevX, CanPut, X, Y, Size, Pointer, i, j, k, Mirror, Helper, Char, WasMir;
	var LineRead = "", QueueRead = "";
	//if(file_exists("RndBlock_Def.ini")) show_message("Existe")

	ini_open("RndBlock_Def.ini")

	SQueue  = ""
	Used    = array_create(9)
	Helper  = array_create(4)
	Size    = 10
	Pointer = 0
	PrevX   = -1
	Mirror  = 0
	Choice  = false
	AllUsed = false
	WasMir  = false

	while(true)
	{
	    CanPut = true
    
	    if(PrevX == 0 or PrevX == 1 or PrevX == 8) Choice = true
	    else Choice = false
    
	    repeat(9)
	    {
	        if(Choice) X = irandom_range(2,6)
	        else X = irandom_range(0,8)
        
	        if(!Used[X])
	        {
	            AllUsed = false
	            Mirror  = irandom_range(0,1)
	            break    
	        }
	        AllUsed = true
	    }
	    Used[X] = true
    
	    if     (X < 5)              Size -= 2
	    else if(X > 4 and Size >= 3)Size -= 3
	    else                        CanPut= false
    
	    if(Size < 0 or AllUsed) break
    
	    if(CanPut)
	    {
	        if(Mirror == !WasMir and PrevX == 4 and X == 2) X ++
	        j = 0;
	        for(i = Pointer; i < (10 - Size); i++)
	        {
	            LineRead = ini_read_string("Board","RNDBlock[" + string(X) + "," + string(j) + "]", "0 0 0 0 0 0 0 0 0 0")
	            if(Mirror)
	            {
	                Helper[j] = ""
	                for(k = 0; k <= 19; k++)
	                {
	                    Char = string_char_at(LineRead, 19 - k)
	                    Helper[j] = Helper[j] + Char
	                }
	                SMat[i] = Helper[j]
	            }
	            else SMat[i] = LineRead
            
	            j++
	        }
	        Pointer = 10 - Size
	    }
	    repeat(2)
	    {
	        if(Size >= 4 and irandom(6) < 5)
	        {
	            Y = -1
	            switch(X)
	            {
	                case 0:
	                    Y = irandom_range(9,12)
	                    if(Y == 9) Size -= 2
	                    else       Size -= 3
	                    break
                    
	                case 1:
	                    Y = irandom_range(10,16)
	                    Size -= 3
	                    break
                
	                case 8:
	                    Y = irandom_range(17,20)
	                    if(Y == 17)Size -= 3
	                    else       Size -= 4
	                    break
	            }
	            if(Y > 0)
	            {
	                j = 0;
        
	                for(i = Pointer; i < (10 - Size); i++)
	                {
	                    LineRead = ini_read_string("Board","RNDBlock[" + string(Y) + "," + string(j) + "]","0 0 0 0 0 0 0 0 0 0")
	                    if(Mirror)
	                    {
	                        Helper[j] = ""
	                        for(k = 0; k <= 19; k++)
	                        {
	                            Char = string_char_at(LineRead, 19 - k)
	                            Helper[j] = Helper[j] + Char
	                        }
	                        SMat[i] = Helper[j]
	                    }
	                    else SMat[i] = LineRead
                            
	                    j++
	                }
	                Pointer = 10 - Size
	                if(Mirror) Y += 21
	                QueueRead = ini_read_string("Queue","Q["+string(Y)+"]","00 ")
	                SQueue = SQueue + QueueRead
	            }
	        }
	    }
	    if(CanPut)
	    {
	        PrevX = X
	        if(Mirror) X += 21
	        QueueRead = ini_read_string("Queue","Q["+string(X)+"]","00 ")
	        SQueue = SQueue + QueueRead
	        WasMir = Mirror
	    }
	}

	if(Pointer != 10)
	{
	    for(i = 9; i >= 1; i--)
	    {
	        SMat[i] = SMat[i - 1]
	    }
	    SMat[0] = "0 0 0 0 0 0 0 0 0 0"
	}

	ini_close()



}
