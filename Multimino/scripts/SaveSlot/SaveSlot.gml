function SaveSlot() {
	ini_open("SavedBoard.sav")
	var i,j,s,p, WriteTo;

	/*if(SpinBoard != -1) WriteTo = SpinBoard
	else                  WriteTo = MaxBoard + 1*/

	WriteTo = SpinBoard
                    
	s = ""
	p = ""
	for(i = 0; i < 9; i++)
	{
	    if(PieceArr[i] < 10) p = "0" + string(PieceArr[i]) + " "
	    else                 p =       string(PieceArr[i]) + " "
                            
	    if(p == "00 ") break
                            
	    s = s + p
	}
	ini_write_string("BoardQueue", "SQueue[" + string(WriteTo) + "]",s)
                    
	for(i = 17; i >= 0; i--)
	{
	    s = ""
	    for(j = 0; j <= 9; j++)
	    {
	        s = s + string(Box[i, j])
                                    
	        if(j != 9) s = s + " "
	    }
	    ini_write_string("Matrix","SMat[" + string(WriteTo) + " , " + string(i) + "]",s)
	}
	ini_write_real("BoardQueue","OXRot[" + string(SpinBoard) + "]",OSpin)
	ini_write_real("BoardQueue","MaxGr[" + string(SpinBoard) + "]",G20)
	ini_write_real("BoardQueue","Delay[" + string(SpinBoard) + "]",LockD)
	ini_close()



}
