function LoadSlot() {
	ini_open("SavedBoard.sav")
	var i, j, str, num;
	for(j = 0; j <= 17; j++)
	{
	    str = ini_read_string("Matrix","SMat[" + string(SpinBoard) +  " , " + string(j) + "]", "0 0 0 0 0 0 0 0 0 0")
	    for(i = 0; i <= 9; i++)
	    {
	        if(string_char_at(str, (i * 2) + 1) == "0") continue
        
	        instance_create_depth(576 + i * 64, 256 + (64 * j), -7, Placed)        
	    }
	}

	str = ini_read_string("BoardQueue","SQueue[" + string(SpinBoard) + "]", "00 ")
	
	OSpin = bool(ini_read_real("BoardQueue","OXRot[" + string(SpinBoard) + "]",0))
	G20   = bool(ini_read_real("BoardQueue","MaxGr[" + string(SpinBoard) + "]",0))
	LockD = bool(ini_read_real("BoardQueue","Delay[" + string(SpinBoard) + "]",1))

	for(i = (string_length(str)/3) - 1; i >= 0; i--)
	{
	    num = string_char_at(str, (i * 3) + 1) + string_char_at(str, (i * 3) + 2)
                            
	    PieceArr[i] = real(num)
	}

	ini_close()

	for(i = 0; i <= 17; i++)
	{
	    for(j = 0; j <= 9; j++)
	    {
	        CX = 576 + (j * 64)
	        CY = 256 + (i * 64)
	        if(place_free(CX,CY)) Box[i,j] = 0
	        else                  Box[i,j] = 1
	    }
	}



}
