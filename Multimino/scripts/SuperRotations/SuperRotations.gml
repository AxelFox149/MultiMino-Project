// Los recursos de Script han cambiado para la v2.3.0, Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function PERSOffset()
{
	var Case, N, P = image_index, Mirror = 1;
	ST = true
	LT = 1
	if(Spin == 1) StateUpdate(1)
	if(Spin == -1)StateUpdate(-1)

	N = image_index

	if(CurrentPiece == 25 and !OSpin) exit //Pento X

	if(CurrentPiece < 14)
	{
	    //Offset table for Y,R,N,N2,J and L Pentominoes
	            //  1,     2,     3,     4     5     6
	    //0>>1
	    Kick[0] = [ 0, 0, -1, 0,  1, 0, -1,-1,  0, 3, -1, 3]
	    //1>>0
	    Kick[1] = [ 0, 0,  1, 0, -1, 0,  1, 1,  0,-3,  1,-3]
	    //1>>2
	    Kick[2] = [ 0, 0,  1, 0, -1, 0,  1, 2,  0,-2,  1,-2]
	    //2>>1
	    Kick[3] = [ 0, 0, -1, 0,  1, 0, -1,-2,  0, 2, -1, 2]
	    //2>>3
	    Kick[4] = [ 0, 0,  1, 0, -1, 0,  1,-2,  0, 2,  1, 2]
	    //3>>2
	    Kick[5] = [ 0, 0, -1, 0,  1, 0, -1, 2,  0,-2, -1,-2]
	    //3>>0
	    Kick[6] = [ 0, 0, -1, 0,  1, 0, -1, 1,  0,-3, -1,-3]
	    //0>>3
	    Kick[7] = [ 0, 0,  1, 0, -1, 0,  1,-1,  0, 3,  1, 3]
	}
	else if(CurrentPiece == 15 or CurrentPiece == 14)
	{
	    //Offset table P and Q Pentominoes
	            //  1,     2,     3,     4     5     6
	    //0>>1
	    Kick[0] = [ 0, 0,  1, 0,  0,-1, -1,-2,  0, 2,  1, 2]
	    //1>>0
	    Kick[1] = [ 0, 0, -1, 0,  0, 1,  1, 2,  0,-2, -1,-2]
	    //1>>2
	    Kick[2] = [ 0, 0,  1, 0,  0, 1,  1, 2,  0,-1,  1,-1]
	    //2>>1
	    Kick[3] = [ 0, 0, -1, 0,  0,-1, -1,-2,  0, 1, -1, 1]
	    //2>>3
	    Kick[4] = [ 0, 0, -1, 0,  0,-1,  1,-1,  0, 3, -1, 3]
	    //3>>2
	    Kick[5] = [ 0, 0,  1, 0,  0, 1, -1, 1,  0,-3,  1,-3]
	    //3>>0
	    Kick[6] = [ 0, 0, -1, 0,  0, 1, -2, 1,  0,-3, -1,-3]
	    //0>>3
	    Kick[7] = [ 0, 0,  1, 0,  0,-1,  2,-1,  0, 3,  1, 3]
	}
	else if(CurrentPiece == 16)
	{
	    //Offset table for I Pentomino
	            //  1,     2,     3,     4     5     6
	    //0>>1
	    Kick[0] = [ 0, 0,  2, 0, -2, 0, -2, 2,  0,-1,  2,-2]
	    //1>>0
	    Kick[1] = [ 0, 0, -2, 0,  2, 0, -2, 2,  0, 1,  2,-2]
	    //1>>0
	    Kick[2] = [ 0, 0,  2, 0, -2, 0,  2, 2,  0, 1, -2,-2]
	    //0>>1
	    Kick[3] = [ 0, 0, -2, 0,  2, 0,  2, 2,  0,-1, -2,-2]
	    //0>>1
	    Kick[4] = [ 0, 0,  2, 0, -2, 0, -2, 2,  0,-1,  2,-2]
	    //1>>0
	    Kick[5] = [ 0, 0, -2, 0,  2, 0, -2, 2,  0, 1,  2,-2]
	    //1>>0
	    Kick[6] = [ 0, 0,  2, 0, -2, 0,  2, 2,  0, 1, -2,-2]
	    //0>>1
	    Kick[7] = [ 0, 0, -2, 0,  2, 0,  2, 2,  0,-1, -2,-2]
	}
	else if(CurrentPiece == 20)
	{
	    //Offset table for W Pentomino
	            //  1,     2,     3,     4     5     6
	    //0>>1
	    Kick[0] = [ 0, 0, -1, 0,  1,-1,  1, 1,  0, 3,  1, 3]
	    //1>>0
	    Kick[1] = [ 0, 0,  1, 0, -1, 1, -1,-1,  0,-3, -1,-3]
	    //1>>2
	    Kick[2] = [ 0, 0,  1, 0,  1, 1,  1,-1,  0, 2,  0,-2]
	    //2>>1
	    Kick[3] = [ 0, 0, -1, 0, -1, 1, -1,-1,  0, 2,  0,-2]
	    //2>>3
	    Kick[4] = [ 0, 0, -1, 0,  1, 1,  1,-1,  0,-3, -1,-3]
	    //3>>2
	    Kick[5] = [ 0, 0,  1, 0, -1,-1, -1, 1,  0, 3,  1, 3]
	    //3>>0
	    Kick[6] = [ 0, 0, -1, 0, -1, 1, -1,-1,  0, 3,  0,-3]
	    //0>>3
	    Kick[7] = [ 0, 0,  1, 0,  1, 1,  1,-1,  0, 3,  0,-3]
	}
	else if(CurrentPiece > 16 and CurrentPiece < 21)
	{
	    //Offset table for T, F and 7 Pentominoes
	            //  1,     2,     3,     4     5     6
	    //0>>1
	    Kick[0] = [ 0, 0, -1, 0,  0, 1, -1, 1,  1, 3,  0, 3]
	    //1>>0
	    Kick[1] = [ 0, 0,  1, 0,  0,-1,  1,-1, -1,-3,  0,-3]
	    //1>>2
	    Kick[2] = [ 0, 0, -1, 0, -1,-1,  1,-1,  0, 1,  0, 2]
	    //2>>1
	    Kick[3] = [ 0, 0,  1, 0,  1, 1, -1, 1,  0,-1,  0,-2]
	    //2>>3
	    Kick[4] = [ 0, 0, -1, 0, -1, 1,  1, 1,  0,-1,  0,-2]
	    //3>>2
	    Kick[5] = [ 0, 0,  1, 0,  1,-1, -1,-1,  0, 1,  0, 2]
	    //3>>0
	    Kick[6] = [ 0, 0, -1, 0,  0,-1, -1,-1,  1,-3,  0,-3]
	    //0>>3
	    Kick[7] = [ 0, 0,  1, 0,  0, 1,  1, 1, -1, 3,  0, 3]
	}
	else if(CurrentPiece == 21 or CurrentPiece == 22)
	{
	    //Offset table for Z and S Pentominoes
	            //  1,     2,     3,     4     5     6
	    //0>>1
	    Kick[0] = [ 0, 0,  1, 1,  2, 0, -2, 0,  3, 0,  2,-1]
	    //1>>0
	    Kick[1] = [ 0, 0, -1,-1, -2, 0,  2, 0, -3, 0, -2, 1]
	    //1>>0
	    Kick[2] = [ 0, 0,  1, 1,  0, 2,  0,-1,  0,-3,  1, 2]
	    //0>>1
	    Kick[3] = [ 0, 0, -1,-1,  0,-2,  0,-1,  0, 3, -1,-2]
	    //0>>1
	    Kick[4] = [ 0, 0,  1, 1,  2, 0, -2, 0,  3, 0,  2,-1]
	    //1>>0
	    Kick[5] = [ 0, 0, -1,-1, -2, 0,  2, 0, -3, 0, -2, 1]
	    //1>>0
	    Kick[6] = [ 0, 0,  1, 1,  0, 2,  0,-1,  0,-3,  1, 2]
	    //0>>1
	    Kick[7] = [ 0, 0, -1,-1,  0,-2,  0,-1,  0, 3, -1,-2]
	}
	else if(CurrentPiece == 23)
	{
	    //Offset table for U Pentomino
	            //  1,     2,     3,     4     5     6
	    //0>>1
	    Kick[0] = [ 0, 0,  0, 1, -1, 0, -1,-1,  0, 2, -1, 2]
	    //1>>0
	    Kick[1] = [ 0, 0,  0,-1,  1, 0,  1, 1,  0,-2,  1,-2]
	    //1>>2
	    Kick[2] = [ 0, 0, -1, 0,  1, 0,  1, 1,  0,-2,  1,-2]
	    //2>>1
	    Kick[3] = [ 0, 0,  1, 0, -1, 0, -1,-1,  0, 2, -1, 2]
	    //2>>3
	    Kick[4] = [ 0, 0,  1, 1,  1, 0,  1,-1,  0, 2,  1, 2]
	    //3>>2
	    Kick[5] = [ 0, 0, -1,-1, -1, 0, -1, 1,  0,-2, -1,-2]
	    //3>>0
	    Kick[6] = [ 0, 0, -1, 0,  0,-1, -1, 1,  0,-2, -1,-2]
	    //0>>3
	    Kick[7] = [ 0, 0,  0, 1,  1, 0,  1,-1,  0, 2,  1, 2]
	}
	else if(CurrentPiece == 25)
	{
	    //Special offset table for X Pentomino
	            //  1,     2,     3,     4     5     6
	    //0>>1
	    Kick[0] = [ 1, 0,  1, 1,  1,-1,  2, 0,  0, 0,  0, 0]
	    //1>>0
	    Kick[1] = [-1, 0, -1,-1, -1, 1, -2, 0,  0, 0,  0, 0]
	    //1>>2
	    Kick[2] = [ 0, 1,  1, 1, -1, 1,  0, 2,  0, 0,  0, 0]
	    //2>>1
	    Kick[3] = [ 0,-1, -1,-1,  1,-1,  0,-2,  0, 0,  0, 0]
	    //2>>3
	    Kick[4] = [-1, 0, -1, 1, -1,-1, -2, 0,  0, 0,  0, 0]
	    //3>>2
	    Kick[5] = [ 1, 0,  1,-1,  1, 1,  2, 0,  0, 0,  0, 0]
	    //3>>0
	    Kick[6] = [ 0,-1,  1,-1, -1,-1,  0,-2,  0, 0,  0, 0]
	    //0>>3
	    Kick[7] = [ 0, 1, -1, 1,  1, 1,  0, 2,  0, 0,  0, 0]
	}
	else if(CurrentPiece == 24)
	{
	    //Offset table for V Pentomino
	            //  1,     2,     3,     4     5     6
	    //0>>1
	    Kick[0] = [ 0, 0, -2, 0,  2, 0,  0,-1,  0, 2,  3, 0]
	    //1>>0
	    Kick[1] = [ 0, 0,  2, 0, -2, 0,  0, 1,  0,-2, -3, 0]
	    //1>>2
	    Kick[2] = [ 0, 0,  0,-2,  0, 2,  1, 0, -2, 0,  0, 3]
	    //2>>1
	    Kick[3] = [ 0, 0,  0, 2,  0,-2, -1, 0,  2, 0,  1,-3]
	    //2>>3
	    Kick[4] = [ 0, 0, -2, 0,  2, 0,  0, 1,  0,-2, -3, 0]
	    //3>>2
	    Kick[5] = [ 0, 0,  2, 0, -2, 0,  0,-1,  0, 2,  3, 0]
	    //3>>0
	    Kick[6] = [ 0, 0,  0, 2,  0,-2, -1, 0,  2, 0,  0,-3]
	    //0>>3
	    Kick[7] = [ 0, 0,  0, 2,  0,-2,  1, 0, -2, 0,  0, 3]
	}

	if(CurrentPiece == 21 or CurrentPiece == 14)
	{
	    Mirror = -1
    
	    if(Spin == 1) StateUpdate(-2);
	    if(Spin == -1)StateUpdate(2);
    
	    N = image_index
	}

	if     (P == 0 and N == 1) Case = 0
	else if(P == 1 and N == 0) Case = 1
	else if(P == 1 and N == 2) Case = 2
	else if(P == 2 and N == 1) Case = 3
	else if(P == 2 and N == 3) Case = 4
	else if(P == 3 and N == 2) Case = 5
	else if(P == 3 and N == 0) Case = 6
	else if(P == 0 and N == 3) Case = 7

	var i, XO, YO;

	for(i = 0; i < 6; i++)
	{
	    //XO = real(string_char_at(Kick[Case], 1 + 6*i) + string_char_at(Kick[Case], 2 + 6*i)) * 64 * Mirror
	    //YO = real(string_char_at(Kick[Case], 4 + 6*i) + string_char_at(Kick[Case], 5 + 6*i)) * 64
		
		XO = Kick[Case, 0 + (2 * i)] * 64 * Mirror
		YO = Kick[Case, 1 + (2 * i)] * 64
		
	    if(!PieceCollision(x + XO, y + YO))
	    {
	        x += XO
	        y += YO
	        LT = i + 1
	        exit
	    }
	}

	if(CurrentPiece != 14 and CurrentPiece != 21)
	{
	    if(Spin == 1) StateUpdate(-1)
	    if(Spin == -1)StateUpdate(1)
	}
	else
	{
	    if(Spin == 1) StateUpdate(1)
	    if(Spin == -1)StateUpdate(-1)
	}

	ST = false
	exit
};

function SRSOffset()
{
	if(GMode == 12)
	{
		NRSOffset()
		exit
	}
	if(GMode == 13)
	{
		TGMTetro()
		exit
	}
	
	var Case, N, P = image_index;

	ST = true
	LT = 0
	if(Spin == 1) StateUpdate(1)
	if(Spin == -1)StateUpdate(-1)

	N = image_index

	if(CurrentPiece == 6 and !OSpin) exit

	if     (P == 0 and N == 1) Case = 0
	else if(P == 1 and N == 0) Case = 1
	else if(P == 1 and N == 2) Case = 2
	else if(P == 2 and N == 1) Case = 3
	else if(P == 2 and N == 3) Case = 4
	else if(P == 3 and N == 2) Case = 5
	else if(P == 3 and N == 0) Case = 6
	else if(P == 0 and N == 3) Case = 7

	if(CurrentPiece < 6)
	{
	    //Offset table for T,Z,S,L,J
	            //  1,     2,     3,     4     5
	    //0>>1
	    Kick[0] = [ 0, 0, -1, 0, -1,-1,  0, 2, -1, 2]
	    //1>>0
	    Kick[1] = [ 0, 0,  1, 0,  1, 1,  0,-2,  1,-2]
	    //1>>2
	    Kick[2] = [ 0, 0,  1, 0,  1, 1,  0,-2,  1,-2]
	    //2>>1
	    Kick[3] = [ 0, 0, -1, 0, -1,-1,  0, 2, -1, 2]
	    //2>>3
	    Kick[4] = [ 0, 0,  1, 0,  1,-1,  0, 2,  1, 2]
	    //3>>2
	    Kick[5] = [ 0, 0, -1, 0, -1, 1,  0,-2, -1,-2]
	    //3>>0
	    Kick[6] = [ 0, 0, -1, 0, -1, 1,  0,-2, -1,-2]
	    //0>>3
	    Kick[7] = [ 0, 0,  1, 0,  1,-1,  0, 2,  1, 2]
	}
	else if(CurrentPiece == 6)
	{
	    //Special offset table for O
	            //  1,     2,     3,     4     5
	    //0>>1
	    Kick[0] = [ 1, 0,  1, 1,  1,-1,  1, 2,  0, 0]
	    //1>>0
	    Kick[1] = [-1, 0, -1,-1, -1, 1, -1,-2,  0, 0]
	    //1>>2
	    Kick[2] = [ 0, 1,  1, 1, -1, 1,  2, 1,  0, 0]
	    //2>>1
	    Kick[3] = [ 0,-1, -1,-1,  1,-1, -2,-1,  0, 0]
	    //2>>3
	    Kick[4] = [-1, 0, -1, 1, -1,-1, -1, 2,  0, 0]
	    //3>>2
	    Kick[5] = [ 1, 0,  1,-1,  1, 1,  1,-2,  0, 0]
	    //3>>0
	    Kick[6] = [ 0,-1,  1,-1, -1,-1,  1,-2,  0, 0]
	    //0>>3
	    Kick[7] = [ 0, 1, -1, 1,  1, 1, -1, 2,  0, 0]
	}
	else
	{
	    //Offset table for I
	            //  1,     2,     3,     4     5
	    //0>>1
	    Kick[0] = [ 0, 0, -2, 0,  1, 0, -2, 1,  1,-2]
	    //1>>0
	    Kick[1] = [ 0, 0,  2, 0, -1, 0,  2,-1, -1, 2]
	    //1>>2
	    Kick[2] = [ 0, 0, -1, 0,  2, 0, -1,-2,  2, 1]
	    //2>>1
	    Kick[3] = [ 0, 0,  1, 0, -2, 2,  1, 2, -2,-1]
	    //2>>3
	    Kick[4] = [ 0, 0,  2, 0, -1, 0,  2,-1, -1, 2]
	    //3>>2
	    Kick[5] = [ 0, 0, -2, 0,  1, 0, -2, 1,  1,-2]
	    //3>>0
	    Kick[6] = [ 0, 0,  1, 0, -2, 0,  1, 2, -2,-1]
	    //0>>3
	    Kick[7] = [ 0, 0, -1, 0,  2, 0, -1,-2,  2, 1]
	}

	var i, XO, YO;

	for(i = 0; i < 5; i++)
	{
	    //XO = real(string_char_at(Kick[Case], 1 + 6*i) + string_char_at(Kick[Case], 2 + 6*i)) * 64 * PieceScale
	    //YO = real(string_char_at(Kick[Case], 4 + 6*i) + string_char_at(Kick[Case], 5 + 6*i)) * 64 * PieceScale
		
		XO = Kick[Case, 0 + (2 * i)] * 64 * PieceScale
		YO = Kick[Case, 1 + (2 * i)] * 64 * PieceScale
		
	    if(!PieceCollision(x + XO, y + YO))
	    {
	        x += XO
	        y += YO

	        LT = i + 1
	        exit
	    }
	}

	if(Spin == 1) StateUpdate(-1)
	if(Spin == -1)StateUpdate(1)

	ST = false
	exit
};

function NRSOffset()
{
	var Case, N, P = image_index;

	ST = true
	LT = 0
	if(Spin == 1) StateUpdate(1)
	if(Spin == -1)StateUpdate(-1)

	N = image_index

	if(CurrentPiece == 6 and !OSpin) exit

	if     (P == 0 and N == 1) Case = 0
	else if(P == 1 and N == 0) Case = 1
	else if(P == 1 and N == 2) Case = 2
	else if(P == 2 and N == 1) Case = 3
	else if(P == 2 and N == 3) Case = 4
	else if(P == 3 and N == 2) Case = 5
	else if(P == 3 and N == 0) Case = 6
	else if(P == 0 and N == 3) Case = 7


	if(CurrentPiece == 2)
	{
		//Offset table for Z
	            //  1,     2,     3,     4     5
		//0>>1
	    Kick[0] = [ 0,-1]
	    //1>>0
	    Kick[1] = [ 0, 1]
	    //1>>2
	    Kick[2] = [ 0, 0]
	    //2>>1
	    Kick[3] = [ 0, 0]
	    //2>>3
	    Kick[4] = [ 1, 0]
	    //3>>2
	    Kick[5] = [-1, 0]
	    //3>>0
	    Kick[6] = [-1, 1]
	    //0>>3
	    Kick[7] = [ 1,-1]
	}
	else if(CurrentPiece == 3)
	{
		//Offset table for S
	            //  1,     2,     3,     4     5
		//0>>1
	    Kick[0] = [ 0,-1]
	    //1>>0
	    Kick[1] = [ 0, 1]
	    //1>>2
	    Kick[2] = [ 0, 0]
	    //2>>1
	    Kick[3] = [ 0, 0]
	    //2>>3
	    Kick[4] = [ 1, 0]
	    //3>>2
	    Kick[5] = [-1, 0]
	    //3>>0
	    Kick[6] = [-1, 1]
	    //0>>3
	    Kick[7] = [ 1,-1]
	}
	else if(CurrentPiece < 6)
	{
	    //Offset table for T,L,J
	            //  1,     2,     3,     4     5
		//0>>1
	    Kick[0] = [ 0, 0]
	    //1>>0
	    Kick[1] = [ 0, 0]
	    //1>>2
	    Kick[2] = [ 0, 0]
	    //2>>1
	    Kick[3] = [ 0, 0]
	    //2>>3
	    Kick[4] = [ 0, 0]
	    //3>>2
	    Kick[5] = [ 0, 0]
	    //3>>0
	    Kick[6] = [ 0, 0]
	    //0>>3
	    Kick[7] = [ 0, 0]
	}
	else
	{
	    //Offset table for I
	            //  1,     2,     3,     4     5
	    //0>>1
	    Kick[0] = [ 0,-1]
	    //1>>0
	    Kick[1] = [ 0, 1]
	    //1>>2
	    Kick[2] = [ 0, 0]
	    //2>>1
	    Kick[3] = [ 0, 0]
	    //2>>3
	    Kick[4] = [ 1, 0]
	    //3>>2
	    Kick[5] = [-1, 0]
	    //3>>0
	    Kick[6] = [-1, 1]
	    //0>>3
	    Kick[7] = [ 1,-1]
	}

	var i, XO, YO;

	for(i = 0; i < 1; i++)
	{	
		XO = Kick[Case, 0 + (2 * i)] * 64
		YO = Kick[Case, 1 + (2 * i)] * 64
    
	    if(!PieceCollision(x + XO, y + YO))
	    {
	        x += XO
	        y += YO

	        LT = i + 1
	        exit
	    }
	}

	if(Spin == 1) StateUpdate(-1)
	if(Spin == -1)StateUpdate(1)

	ST = false
	exit
};

function DRSOffset()
{
	if(GMode == 13) exit
	var Case, N, P = image_index, Mirror = 1;

	ST = true
	StateUpdate(2)

	N = image_index

	if(GMode == 10)
	{
	    if(PieceCollision(x,y))
	    {
	        ST = false
	        StateUpdate(-2)
	    }
    
	    exit
	}

	if(CurrentPiece == 16 or CurrentPiece == 21 or CurrentPiece == 22) exit

	if((CurrentPiece == 6 or CurrentPiece == 25 or CurrentPiece == 26) and !OSpin) exit

	
	if(CurrentPiece == 6)
	{
	    //Special Offset table for O Tetromino
	            //  1,     2,     3,     4     5     6
	    //0>>2
	    Kick[0] = [ 1, 1,  1, 2,  1, 0,  2, 2,  0, 0,  0, 0]
	    //1>>3
	    Kick[1] = [-1, 1, -1, 2, -1, 0, -2, 2,  0, 0,  0, 0]
	    //2>>0
	    Kick[2] = [-1,-1, -1, 0, -1,-2, -2,-2,  0, 0,  0, 0]
	    //3>>1
	    Kick[3] = [ 1,-1,  1, 0,  1,-2,  2,-2,  0, 0,  0, 0]
	}
	else if(CurrentPiece == 7 or CurrentPiece == 60)
	{
	    //Offset table for I Tetromino and I Hexomino
	            //  1,     2,     3,     4     5     6
	    //0>>2
	    Kick[0] = [ 0, 0, -1, 0, -2, 0,  1, 0,  2, 0,  0, 1]
	    //1>>3
	    Kick[1] = [ 0, 0,  0, 1,  0, 2,  0,-1,  0,-2, -1, 0]
	    //2>>0
	    Kick[2] = [ 0, 0,  1, 0,  2, 0, -1, 0, -2, 0,  0,-1]
	    //3>>1
	    Kick[3] = [ 0, 0,  0, 1,  0, 2,  0,-1,  0,-2,  1, 0]
	}
	else if(CurrentPiece > 7 and CurrentPiece < 14) or (CurrentPiece > 29 and CurrentPiece < 50) or (CurrentPiece > 79 and CurrentPiece < 88)
	{
	    //Offset table for Y,R,N,N2,L,J Pentominoes and T,f,7,f2,72,$,%,t,S,Z,C,F,F2,P,b,D,G,?,epsilon,3,J,r,4_2,2,5,4,lambda,L Hexominos
	            //  1,     2,     3,     4     5     6
	    //0>>2
	    Kick[0] = [ 0, 1, -1, 1, -2, 1,  1, 1,  2, 1,  0, 0]
	    //1>>3
	    Kick[1] = [-1, 0, -1, 1, -1, 2, -1,-1, -1,-2,  0, 0]
	    //2>>0
	    Kick[2] = [ 0,-1,  1,-1,  2,-1, -1,-1, -2,-1,  0, 0]
	    //3>>1
	    Kick[3] = [ 1, 0,  1, 1,  1, 2,  1,-1,  1,-2,  0, 0]
	}
	else if(CurrentPiece == 14 or CurrentPiece == 15)
	{
	    //Offset table for Q,P Pentominoes
	            //  1,     2,     3,     4     5     6
	    //0>>2
	    Kick[0] = [ 0, 0,  0, 1, -1, 1,  1, 1,  2, 1,  1, 0]
	    //1>>3
	    Kick[1] = [ 0, 0, -1, 0, -1,-1, -1, 2, -1, 3,  0, 1]
	    //2>>0
	    Kick[2] = [ 0, 0,  0,-1,  1,-1, -1,-1, -2,-1, -1, 0]
	    //3>>1
	    Kick[3] = [ 0, 0,  1, 0,  1, 1,  1,-2,  1,-3,  0,-1]
	}
	else if(CurrentPiece == 25)
	{
	    //Special Offset table for X Pentominoe
	            //  1,     2,     3,     4     5     6
	    //0>>2
	    Kick[0] = [ 1, 1,  1, 2,  2, 1,  2, 2,  0, 0,  0, 0]
	    //1>>3
	    Kick[1] = [-1, 1, -1, 2, -2, 1, -2, 2,  0, 0,  0, 0]
	    //2>>0
	    Kick[2] = [-1,-1, -2,-1, -1,-2, -2,-2,  0, 0,  0, 0]
	    //3>>1
	    Kick[3] = [ 1,-1,  2,-1,  1,-2,  2,-2,  0, 0,  0, 0]
	}
	else if(CurrentPiece == 26)
	{
	    //Special Offset table for O Monomino
	            //  1,     2,     3,     4     5     6
	    //0>>2
	    Kick[0] = [ 1, 1,  1, 2,  0, 2,  0, 0,  0, 0,  0, 0]
	    //1>>3
	    Kick[1] = [-1, 1, -1, 2,  0, 2,  0, 0,  0, 0,  0, 0]
	    //2>>0
	    Kick[2] = [-1,-1, -1,-2,  0,-2,  0, 0,  0, 0,  0, 0]
	    //3>>1
	    Kick[3] = [ 1,-1,  1,-2,  0,-2,  0, 0,  0, 0,  0, 0]
	}
	else if(CurrentPiece == 29)
	{
	    //Special Offset table for V tromino
	            //  1,     2,     3,     4     5     6
	    //0>>2
	    Kick[0] = [ 0, 0,  0, 1,  1, 1, -1, 1, -1, 0, -1,-1]
	    //1>>3
	    Kick[1] = [ 0, 0, -1, 0, -1, 1, -1,-1,  0,-1,  1,-1]
	    //2>>0
	    Kick[2] = [ 0, 0,  1, 0,  1, 1,  1,-1,  0,-1, -1,-1]
	    //3>>1
	    Kick[3] = [ 0, 0,  0, 1, -1, 1,  1, 1,  1, 0,  1,-1]
	}
	else if(CurrentPiece == 28)
	{
	    //Offset table for I Domino
	            //  1,     2,     3,     4     5     6
	    //0>>2
	    Kick[0] = [ 0, 0, -1, 0,  1, 0,  0, 1,  0, 0,  0, 0]
	    //1>>3
	    Kick[1] = [ 0, 0,  0, 1,  0,-1, -1, 0,  0, 0,  0, 0]
	    //2>>0
	    Kick[2] = [ 0, 0,  1, 0, -1, 0,  0,-1,  0, 0,  0, 0]
	    //3>>1
	    Kick[3] = [ 0, 0,  0, 1,  0,-1,  1, 0,  0, 0,  0, 0]
	}
	else if(CurrentPiece == 20 or CurrentPiece == 24 or CurrentPiece == 71 or CurrentPiece == 88 or CurrentPiece == 89)
	{
	    //Offset table for W,V Pentrominos and E,u,n Hexominos
	            //  1,     2,     3,     4     5     6
	    //0>>2
	    Kick[0] = [ 0, 0,  0, 2,  1, 2, -2, 2, -2, 0, -2,-1]
	    //1>>3
	    Kick[1] = [ 0, 0, -2, 0, -2, 1, -2,-2,  0,-2,  1,-2]
	    //2>>0
	    Kick[2] = [ 0, 0,  2, 0,  2, 1,  2,-2,  0,-2, -1,-2]
	    //3>>1
	    Kick[3] = [ 0, 0,  0, 2, -1, 2,  2, 2,  2, 0,  2,-1]
	}
	else if(CurrentPiece > 49 and CurrentPiece < 56)
	{
	    //Offset table for yotta,zetta,phi,sigma2,m,w Hexominos
	            //  1,     2,     3,     4     5     6
	    //0>>2
	    Kick[0] = [ 0, 0,  1, 0,  2, 0, -1, 0, -2, 0,  0,-1]
	    //1>>3
	    Kick[1] = [ 0, 0,  1, 1,  1, 2,  0,-1,  0,-2,  1, 0]
	    //2>>0
	    Kick[2] = [ 0, 0, -1, 0, -2, 0,  1, 0,  2, 0,  0, 1]
	    //3>>1
	    Kick[3] = [ 0, 0,  0, 1,  0, 2, -1,-1, -1,-2, -1, 0]
	}
	else
	{
	    //Offset table for T,Z,S,L,J Tetrominos, I,T,F,7,U Pentominos and A,h,mu,R,q,Q,sigma,alpha,Tau,z,s,l,j,1,1M,N,N2,/,\ Hexominos
	            //  1,     2,     3,     4     5     6
	    //0>>2
	    Kick[0] = [ 0, 0,  1, 0,  2, 0, -1, 0, -2, 0,  0,-1]
	    //1>>3
	    Kick[1] = [ 0, 0,  0, 1,  0, 2,  0,-1,  0,-2,  1, 0]
	    //2>>0
	    Kick[2] = [ 0, 0, -1, 0, -2, 0,  1, 0,  2, 0,  0, 1]
	    //3>>1
	    Kick[3] = [ 0, 0,  0, 1,  0, 2,  0,-1,  0,-2, -1, 0]
	}

	if     (P == 0 and N == 2) Case = 0
	else if(P == 1 and N == 3) Case = 1
	else if(P == 2 and N == 0) Case = 2
	else if(P == 3 and N == 1) Case = 3

	if(CurrentPiece == 14
	or (CurrentPiece == 32 or CurrentPiece == 34 or CurrentPiece == 39)
	or (CurrentPiece >= 53 and CurrentPiece <= 55)  
	or (CurrentPiece >= 84 and CurrentPiece <= 88)) Mirror = -1

	var i, XO, YO;

	for(i = 0; i < 6; i++)
	{
	    //XO = real(string_char_at(Kick[Case], 1 + 6*i) + string_char_at(Kick[Case], 2 + 6*i)) * 64 * Mirror * PieceScale
	    //YO = real(string_char_at(Kick[Case], 4 + 6*i) + string_char_at(Kick[Case], 5 + 6*i)) * 64 * PieceScale
		
		XO = Kick[Case, 0 + (2 * i)] * 64 * Mirror * PieceScale
		YO = Kick[Case, 1 + (2 * i)] * 64 * PieceScale
		
	    if(!PieceCollision(x + XO, y + YO))
	    {
	        x += XO
	        y += YO
	        LT = i + 1
	        exit
	    }
	}

	StateUpdate(-2)

	ST = false
	exit
};

function MDTRSOffset()
{
	var Case, N, P = image_index;
	ST = true
	LT = 0
	if(Spin == 1) StateUpdate(1)
	if(Spin == -1)StateUpdate(-1)

	N = image_index

	if(CurrentPiece == 26 and !OSpin) exit

	if     (P == 0 and N == 1) Case = 0
	else if(P == 1 and N == 0) Case = 1
	else if(P == 1 and N == 2) Case = 2
	else if(P == 2 and N == 1) Case = 3
	else if(P == 2 and N == 3) Case = 4
	else if(P == 3 and N == 2) Case = 5
	else if(P == 3 and N == 0) Case = 6
	else if(P == 0 and N == 3) Case = 7

	if(CurrentPiece == 27)
	{
	    //Offset table for I Tromino
	            //  1,     2,     3,     4     5
	    //0>>1
	    Kick[0] = [ 0, 0,  1, 0, -1, 0, -1, 1,  1,-1]
	    //1>>0
	    Kick[1] = [ 0, 0, -1, 0,  1, 0, -1, 1,  1,-1]
	    //1>>0
	    Kick[2] = [ 0, 0,  1, 0, -1, 0,  1, 1, -1,-1]
	    //0>>1
	    Kick[3] = [ 0, 0, -1, 0,  1, 0,  1, 1, -1,-1]
	    //0>>1
	    Kick[4] = [ 0, 0,  1, 0, -1, 0, -1, 1,  1,-1]
	    //1>>0
	    Kick[5] = [ 0, 0, -1, 0,  1, 0, -1, 1,  1,-1]
	    //1>>0
	    Kick[6] = [ 0, 0,  1, 0, -1, 0,  1, 1, -1,-1]
	    //0>>1
	    Kick[7] = [ 0, 0, -1, 0,  1, 0,  1, 1, -1,-1]
	}
	else if(CurrentPiece == 26)
	{
	    //Offset table for O Monomino
	            //  1,     2,     3,     4     5
	    //0>>1
	    Kick[0] = [ 1, 0,  1, 1,  1,-1,  0, 0,  0, 0]
	    //1>>0
	    Kick[1] = [-1, 0, -1,-1, -1, 1,  0, 0,  0, 0]
	    //1>>2
	    Kick[2] = [ 0, 1,  1, 1, -1, 1,  0, 0,  0, 0]
	    //2>>1
	    Kick[3] = [ 0,-1, -1,-1,  1,-1,  0, 0,  0, 0]
	    //2>>3
	    Kick[4] = [-1, 0, -1, 1, -1,-1,  0, 0,  0, 0]
	    //3>>2
	    Kick[5] = [ 1, 0,  1,-1,  1, 1,  0, 0,  0, 0]
	    //3>>0
	    Kick[6] = [ 0,-1,  1,-1, -1,-1,  0, 0,  0, 0]
	    //0>>3
	    Kick[7] = [ 0, 1, -1, 1,  1, 1,  0, 0,  0, 0]
	}
	else if(CurrentPiece == 28)
	{
	    //Offset table for I Domino
	            //  1,     2,     3,     4     5
	    //0>>1
	    Kick[0] = [ 0, 0, -1, 0,  0,-1,  0, 0,  0, 0]
	    //1>>0
	    Kick[1] = [ 0, 0,  1, 0,  0, 1,  0, 0,  0, 0]
	    //1>>2
	    Kick[2] = [ 0, 0,  1, 0,  0,-1,  0, 0,  0, 0]
	    //2>>1
	    Kick[3] = [ 0, 0, -1, 0,  0, 1,  0, 0,  0, 0]
	    //2>>3
	    Kick[4] = [ 0, 0,  1, 0,  0, 1,  0, 0,  0, 0]
	    //3>>2
	    Kick[5] = [ 0, 0, -1, 0,  0,-1,  0, 0,  0, 0]
	    //3>>0
	    Kick[6] = [ 0, 0, -1, 0,  0, 1,  0, 0,  0, 0]
	    //0>>3
	    Kick[7] = [ 0, 0,  1, 0,  0,-1,  0, 0,  0, 0]
	}
	else
	{
	//Offset table for V Tromino
	            //  1,     2,     3,     4     5
	    //0>>1
	    Kick[0] = [ 0, 0, -1, 0,  1, 0,  0,-1,  2, 0]
	    //1>>0
	    Kick[1] = [ 0, 0, -1, 0, -1, 0,  0, 1, -2, 0]
	    //1>>2
	    Kick[2] = [ 0, 0,  0, 1,  0,-1,  1, 0,  0, 2]
	    //2>>1
	    Kick[3] = [ 0, 0,  0,-1,  0, 1, -1, 0,  0,-2]
	    //2>>3
	    Kick[4] = [ 0, 0, -1, 0,  1, 0,  0, 1, -2, 0]
	    //3>>2
	    Kick[5] = [ 0, 0,  1, 0, -1, 0,  0,-1,  2, 0]
	    //3>>0
	    Kick[6] = [ 0, 0,  0, 1,  0,-1, -1, 0,  0,-2]
	    //0>>3
	    Kick[7] = [ 0, 0,  0,-1,  0, 1,  1, 0,  0, 2]
	}

	var i, XO, YO;

	for(i = 0; i < 5; i++)
	{
	    //XO = real(string_char_at(Kick[Case], 1 + 6*i) + string_char_at(Kick[Case], 2 + 6*i)) * 64
	    //YO = real(string_char_at(Kick[Case], 4 + 6*i) + string_char_at(Kick[Case], 5 + 6*i)) * 64
		
		XO = Kick[Case, 0 + (2 * i)] * 64
		YO = Kick[Case, 1 + (2 * i)] * 64
    
	    if(!PieceCollision(x + XO, y + YO))
	    {
	        x += XO
	        y += YO

	        LT = i + 1
	        exit
	    }
	}

	if(Spin == 1) StateUpdate(-1)
	if(Spin == -1)StateUpdate(1)

	ST = false
	exit
};

function SHeRSOffset()
{
	var Case, N, P = image_index, Mirror = 1;

	ST = true
	LT = 0
	if(Spin == 1) StateUpdate(1)
	if(Spin == -1)StateUpdate(-1)

	N = image_index

	if(CurrentPiece < 40)
	{
	    //Offset table for T,f,7,f2,72,$,%,t,S,Z Hexominos
	            //     1,     2,     3,     4     5     6     7
	    //0>>1
	    Kick[0] = [ 0, 0,  1, 0, -1, 0,  2,-1, -1,-1,  1, 2,  0, 3]
	    //1>>0
	    Kick[1] = [ 0, 0, -1, 0,  1, 0, -2, 1,  1, 1, -1,-2,  0,-3]
	    //1>>2
	    Kick[2] = [ 0, 0, -1, 0, -2, 1,  1, 2, -2, 2,  0,-1, -1,-2]
	    //2>>1
	    Kick[3] = [ 0, 0,  1, 0,  2,-1, -1,-2,  2,-2,  0, 1,  1, 2]
	    //2>>3
	    Kick[4] = [ 0, 0, -1, 0, -1,-2, -2,-2,  1, 2,  1,-4,  0,-4]
	    //3>>2
	    Kick[5] = [ 0, 0,  1, 0,  1, 2,  2, 2, -1, 4,  0, 4, -1,-2]
	    //3>>0
	    Kick[6] = [ 0, 0,  1, 0,  0, 1, -1, 1,  2, 3,  1, 3,  2,-3]
	    //0>>3
	    Kick[7] = [ 0, 0, -1, 0,  0,-1,  1,-1, -2, 3, -2,-3, -1,-3]
	}
	else if(CurrentPiece < 50)
	{
	    //Offset table for C,F,F2,P,b,D,G,?,epsilon,3, Hexominos
	              //  1,     2,     3,     4,     5     6     7
	    //0>>1
	    Kick[0] = [ 0, 0, -1, 0,  1, 2,  1, 0, -1,-1,  0, 3, -1, 3]
	    //1>>0
	    Kick[1] = [ 0, 0,  1, 0, -1, 0,  1, 1, -1,-2,  0,-3,  1,-3]
	    //1>>2
	    Kick[2] = [ 0, 0, -1, 0, -2, 0,  1, 0,  1, 2,  0,-2,  1,-2]
	    //2>>1
	    Kick[3] = [ 0, 0,  1, 0,  2, 0, -1, 0, -1,-2,  0, 2, -1, 2]
	    //2>>3
	    Kick[4] = [ 0, 0,  1, 0,  1, 1, -1, 0,  1,-2,  0, 2,  1, 2]
	    //3>>2
	    Kick[5] = [ 0, 0, -1, 0,  1, 0, -1, 2, -1,-1,  0,-2, -1,-2]
	    //3>>0
	    Kick[6] = [ 0, 0, -1, 0,  1, 0, -1, 1,  1,-2,  0,-3, -1,-3]
	    //0>>3
	    Kick[7] = [ 0, 0,  1, 0, -1, 2, -1, 0,  1,-1,  0, 3,  1, 3]
	}
	else if(CurrentPiece < 56)
	{
	    //Offset table for yotta,zetta,phi,sigma2,m,w Hexominos
	              //  1,     2,     3,     4,     5     6     7
	    //0>>1
	    Kick[0] = [ 0, 0, -1, 0, -1,-1, -2,-1,  0, 3, -1, 3,  1,-2]
	    //1>>0
	    Kick[1] = [ 0, 0,  1, 0,  1, 1,  2, 1, -1, 2,  0,-3,  1,-3]
	    //1>>2
	    Kick[2] = [ 0, 0,  1, 0,  0, 1,  2, 1,  1,-2,  0,-3,  1,-3]
	    //2>>1
	    Kick[3] = [ 0, 0, -1, 0,  0,-1, -2,-1, -1, 2,  0, 3, -1, 3]
	    //2>>3
	    Kick[4] = [ 0, 0,  1, 0,  1,-1,  2,-1,  0, 3, -1, 3, -1,-2]
	    //3>>2
	    Kick[5] = [ 0, 0, -1, 0, -1, 1, -2, 1,  1, 2,  0,-3,  1,-3]
	    //3>>0
	    Kick[6] = [ 0, 0, -1, 0, -1, 1, -2, 1,  1, 2,  0,-3,  1,-3]
	    //0>>3
	    Kick[7] = [ 0, 0,  1, 0,  1,-1,  2,-1,  0, 3, -1, 3, -1,-2]
	}
	else if(CurrentPiece < 58)
	{
	    //Offset table for empty set, phi2 Hexominos
	              //  1,     2,     3,     4,     5     6     7
	    //0>>1
	    Kick[0] = [ 0, 0, -1, 0,  1, 0, -1,-1,  2,-1,  0, 3, -1, 3]
	    //1>>0
	    Kick[1] = [ 0, 0,  1, 0, -1, 0,  1, 1, -2, 1,  0,-3,  1,-3]
	    //1>>0
	    Kick[2] = [ 0, 0, -1, 0,  1, 0, -1, 1,  1, 2,  0,-3, -1,-3]
	    //0>>1
	    Kick[3] = [ 0, 0,  1, 0, -1, 0,  1,-1,  0, 3,  1, 3, -1,-2]
	    //0>>1
	    Kick[4] = [ 0, 0, -1, 0,  1, 0, -1,-1,  2,-1,  0, 3, -1, 3]
	    //1>>0
	    Kick[5] = [ 0, 0,  1, 0, -1, 0,  1, 1, -2, 1,  0,-3,  1,-3]
	    //1>>0
	    Kick[6] = [ 0, 0, -1, 0,  1, 0, -1, 1,  1, 2,  0,-3, -1,-3]
	    //0>>1
	    Kick[7] = [ 0, 0,  1, 0, -1, 0,  1,-1,  0, 3,  1, 3, -1,-2]
	}
	else if(CurrentPiece < 60)
	{
	    //Offset table for /,\ Hexominos
	              //  1,     2,     3,     4,     5     6     7
	    //0>>1
	    Kick[0] = [ 0, 0, -1, 0, -1,-1,  0,-1,  0, 1,  0, 3,  2,-1]
	    //1>>0
	    Kick[1] = [ 0, 0,  1, 0,  1, 1,  0, 1, -2, 1,  0,-1,  0,-3]
	    //1>>2
	    Kick[2] = [ 0, 0,  1, 0,  1, 2, -1, 1,  3, 0,  0,-3,  1,-3]
	    //2>>1
	    Kick[3] = [ 0, 0, -1, 0, -1,-2,  1,-1, -2, 0,  0, 3, -1, 3]
	    //2>>3
	    Kick[4] = [ 0, 0,  1, 0,  1,-1,  1, 1,  3, 0,  0, 3,  1, 3]
	    //3>>2
	    Kick[5] = [ 0, 0, -1, 0, -1, 1, -1,-1, -3, 0,  0,-3, -1,-3]
	    //3>>0
	    Kick[6] = [ 0, 0, -1, 0, -1, 1,  0,-1,  0, 3,  0,-3, -1,-3]
	    //0>>3
	    Kick[7] = [ 0, 0,  1, 0,  1,-1,  0, 1,  0, 3,  1, 3,  0,-3]
	}
	else if(CurrentPiece == 60)
	{
	    //Offset table for I Hexomino
	            //  1,     2,     3,     4,     5     6     7
	    //0>>1
	    Kick[0] = [ 0, 0,  2, 0, -3, 0, -3, 2,  0,-1,  0,-2,  2,-3]
	    //1>>0
	    Kick[1] = [ 0, 0, -2, 0,  3, 0, -2, 3,  0, 2,  0, 1,  3,-2]
	    //1>>2
	    Kick[2] = [ 0, 0, -2, 0,  3, 0,  3, 2,  0, 1, -2,-3,  0, 2]
	    //2>>1
	    Kick[3] = [ 0, 0,  2, 0, -3, 0,  2, 3,  0,-1, -3,-2,  0,-2]
	    //2>>3
	    Kick[4] = [ 0, 0,  3, 0, -2, 0, -2, 3,  0,-1,  3,-2,  0,-2]
	    //3>>2
	    Kick[5] = [ 0, 0, -3, 0,  2, 0, -3, 2,  0,-1,  2,-3,  0, 2]
	    //3>>0
	    Kick[6] = [ 0, 0, -3, 0,  2, 0,  2, 3,  0, 2,  0, 1, -3,-2]
	    //0>>3
	    Kick[7] = [ 0, 0,  3, 0, -2, 0,  3, 2,  0,-1,  0,-2, -2,-3]
	}
	else if(CurrentPiece <= 69)
	{
		//Offset table for Tau,z,s,l,j,1,1M,N,N2 Hexominos
	            //  1,     2,     3,     4,     5     6     7	    
		//0>>1
	    Kick[0] = [ 0, 0, -1, 0,  1, 0, -2, 0, -2,-2,  0, 3, -2, 3]
	    //1>>0
	    Kick[1] = [ 0, 0,  1, 0, -1, 0,  2, 0,  2, 2,  0,-3,  2,-3]
	    //1>>2
	    Kick[2] = [ 0, 0,  1, 0, -1, 0,  2, 0,  2, 2,  0,-3,  2,-3]
	    //2>>1
	    Kick[3] = [ 0, 0, -1, 0,  1, 0, -2, 0, -2,-2,  0, 3, -2, 3]
	    //2>>3
	    Kick[4] = [ 0, 0,  1, 0, -1, 0,  2, 0,  2,-2,  0, 3,  2, 3]
	    //3>>2
	    Kick[5] = [ 0, 0, -1, 0,  1, 0, -2, 0, -2, 2,  0,-3, -2,-3]
	    //3>>0
	    Kick[6] = [ 0, 0, -1, 0,  1, 0, -2, 0, -2, 2,  0,-3, -2,-3]
	    //0>>3
	    Kick[7] = [ 0, 0,  1, 0, -1, 0,  2, 0,  2,-2,  0, 3,  2, 3]
	}
	else if(CurrentPiece == 70)
	{
		//Offset table for O Hexomino
	            //  1,     2,     3,     4,     5     6     7
	    //0>>1
	    Kick[0] = [ 0, 0, -1, 0, -2, 1, -2, 2, -1, 2, -1,-1,  0,-1]
	    //1>>0
	    Kick[1] = [ 0, 0,  1, 0,  2,-1,  2,-2,  1,-2,  1, 1,  0, 1]
	    //1>>2
	    Kick[2] = [ 0, 0,  1, 0,  2, 1,  3, 1,  2, 2,  0,-3,  1,-3]
	    //2>>1
	    Kick[3] = [ 0, 0, -1, 0, -2, 0, -3, 0, -2,-2,  0, 3, -1, 3]
	    //2>>3
	    Kick[4] = [ 0, 0,  1, 0,  2,-1,  3,-1,  2,-2,  1, 3,  0, 3]
	    //3>>2
	    Kick[5] = [ 0, 0, -1, 0, -2, 1, -3, 1, -2, 2, -1,-3,  0,-3]
	    //3>>0
	    Kick[6] = [ 0, 0, -1, 0, -2,-1, -2,-2, -1,-2, -1, 1,  0, 1]
	    //0>>3
	    Kick[7] = [ 0, 0,  1, 0,  2, 1,  2, 2,  1, 2,  1,-1,  0,-1]
	}
	else if(CurrentPiece == 71)
	{
		//Offset table for E Hexomino
	            //  1,     2,     3,     4,     5     6     7
	    //0>>1
	    Kick[0] = [ 0, 0, -2, 0,  1,-1,  1, 1,  2, 0,  1, 3,  2, 3]
	    //1>>0
	    Kick[1] = [ 0, 0, -2, 0, -1, 1, -1,-1, -2, 0, -1,-3, -2,-3]
	    //1>>2
	    Kick[2] = [ 0, 0,  1, 0,  1, 1,  1,-1,  2, 0,  0, 2,  0,-2]
	    //2>>1
	    Kick[3] = [ 0, 0, -1, 0, -1, 1, -1,-1, -2, 0,  0, 2,  0,-2]
	    //2>>3
	    Kick[4] = [ 0, 0, -2, 0,  1, 1,  1,-1,  2, 0,  1,-3,  2,-3]
	    //3>>2
	    Kick[5] = [ 0, 0,  2, 0, -1,-1, -1, 1, -2, 0, -1, 3, -2, 3]
	    //3>>0
	    Kick[6] = [ 0, 0, -1, 0, -1, 1, -1,-1, -2, 0,  0, 3,  0,-3]
	    //0>>3
	    Kick[7] = [ 0, 0,  1, 0,  1, 1,  1,-1,  2, 0,  0, 3,  0,-3]
	}
	else if(CurrentPiece <= 79)
	{
		//Offset table for A,h,mu,R,q,Q,sigma,alpha Hexominos
	            //  1,     2,     3,     4,     5     6     7
		//0>>1
	    Kick[0] = [ 0, 0, -1, 0,  1,-1, -1,-1,  1, 1,  0, 3,  0,-3]
	    //1>>0
	    Kick[1] = [ 0, 0,  1, 0, -1, 1,  1, 1,  0, 3, -1,-1,  0,-3]
	    //1>>2
	    Kick[2] = [ 0, 0, -1, 0, -1, 1,  1,-1,  1, 1,  0,-2, -1,-2]
	    //2>>1
	    Kick[3] = [ 0, 0,  1, 0,  1,-1, -1, 1,  0, 2,  1, 2, -1,-1]
	    //2>>3
	    Kick[4] = [ 0, 0, -1, 0, -1,-1,  1, 1,  0, 3, -1, 3,  1,-1]
	    //3>>2
	    Kick[5] = [ 0, 0,  1, 0,  1, 1, -1,-1, -1, 1,  0,-3,  1,-3]
	    //3>>0
	    Kick[6] = [ 0, 0, -1, 0,  1, 1, -1, 1,  0, 3,  1,-1,  0,-3]
	    //0>>3
	    Kick[7] = [ 0, 0,  1, 0, -1,-1,  1,-1, -1, 1,  0, 3,  0,-3]
	}
	else if(CurrentPiece <= 87)
	{
		//Offset table for J,r,4_2,2,5,4,lambda,L Hexominos
	            //  1,     2,     3,     4,     5     6     7
		//0>>1
	    Kick[0] = [ 0, 0, -1, 0, -1,-1,  0,-1,  0, 1,  0, 3, -1, 3]
	    //1>>0
	    Kick[1] = [ 0, 0,  1, 0,  1, 1,  0, 1,  0,-1,  0,-3,  1,-3]
	    //1>>2
	    Kick[2] = [ 0, 0,  1, 0,  1, 2,  2, 0, -1, 0,  0,-2,  1,-2]
	    //2>>1
	    Kick[3] = [ 0, 0, -1, 0, -1,-2, -2, 0,  1, 0,  0, 2, -1, 2]
	    //2>>3
	    Kick[4] = [ 0, 0,  1, 0,  1,-2, -1, 0,  0, 2,  1, 2,  0,-1]
	    //3>>2
	    Kick[5] = [ 0, 0, -1, 0, -1, 2,  1, 0,  0,-2, -1,-2,  0, 1]
	    //3>>0
	    Kick[6] = [ 0, 0, -1, 0, -1, 1, -2, 0,  1, 0,  0,-3, -1,-3]
	    //0>>3
	    Kick[7] = [ 0, 0,  1, 0,  1,-1,  2, 0, -1, 0,  0, 3,  1, 3]
	}
	else
	{
		//Offset table for u,n Hexominos
	            //  1,     2,     3,     4,     5     6     7
	    //0>>1
	    Kick[0] = [ 0, 0, -2, 0,  2, 0,  0,-1,  0, 2,  3, 0, -1,-1]
	    //1>>0
	    Kick[1] = [ 0, 0,  2, 0, -2, 0,  0, 1,  0,-2, -3, 0,  1, 1]
	    //1>>2
	    Kick[2] = [ 0, 0,  0, 2,  0,-2,  1, 0, -2, 0,  0, 3,  1,-1]
	    //2>>1
	    Kick[3] = [ 0, 0,  0,-2,  0, 2, -1, 0,  2, 0,  0,-3, -1, 1]
	    //2>>3
	    Kick[4] = [ 0, 0, -2, 0,  2, 0,  0, 1,  0,-2, -3, 0,  1, 1]
	    //3>>2
	    Kick[5] = [ 0, 0,  2, 0, -2, 0,  0,-1,  0, 2,  3, 0, -1,-1]
	    //3>>0
	    Kick[6] = [ 0, 0,  0, 2,  0,-2, -1, 0,  2, 0,  0,-3, -1, 1]
	    //0>>3
	    Kick[7] = [ 0, 0,  0,-2,  0, 2,  1, 0, -2, 0,  0, 3,  1,-1]
	}

	if((CurrentPiece >= 53 and CurrentPiece <= 55) 
	or (CurrentPiece == 32 or CurrentPiece == 34 or CurrentPiece == 39)
	or (CurrentPiece == 57 or CurrentPiece == 59) 
	or (CurrentPiece >= 84 and CurrentPiece <= 88))
	{
	    Mirror = -1
    
	    if(Spin == 1) StateUpdate(-2);
	    if(Spin == -1)StateUpdate(2);
    
	    N = image_index
	}

	if     (P == 0 and N == 1) Case = 0
	else if(P == 1 and N == 0) Case = 1
	else if(P == 1 and N == 2) Case = 2
	else if(P == 2 and N == 1) Case = 3
	else if(P == 2 and N == 3) Case = 4
	else if(P == 3 and N == 2) Case = 5
	else if(P == 3 and N == 0) Case = 6
	else if(P == 0 and N == 3) Case = 7

	var i, XO, YO;

	for(i = 0; i < 7; i++)
	{
	    //XO = real(string_char_at(Kick[Case], 1 + 6*i) + string_char_at(Kick[Case], 2 + 6*i)) * 64 * Mirror
	    //YO = real(string_char_at(Kick[Case], 4 + 6*i) + string_char_at(Kick[Case], 5 + 6*i)) * 64
		
		XO = Kick[Case, 0 + (2 * i)] * 64 * Mirror
		YO = Kick[Case, 1 + (2 * i)] * 64
    
	    if(!PieceCollision(x + XO, y + YO))
	    {
	        x += XO
	        y += YO

	        LT = i + 1
	        exit
	    }
	}
	
	if((CurrentPiece >= 53 and CurrentPiece <= 55)
	or (CurrentPiece == 32 or CurrentPiece == 34 or CurrentPiece == 39)
	or (CurrentPiece == 57 or CurrentPiece == 59) 
	or (CurrentPiece >= 84 and CurrentPiece <= 88))
	{
		if(Spin == 1) StateUpdate(1)
	    if(Spin == -1)StateUpdate(-1)
	}
	else
	{
	    if(Spin == 1) StateUpdate(-1)
	    if(Spin == -1)StateUpdate(1)
	}

	ST = false
	exit
};

function SimpleCheck(DoubleRot)
{
		ST = true
		
		if(!DoubleRot)
		{
			if(Spin == 1) StateUpdate(1)
			if(Spin == -1)StateUpdate(-1)
		
			if((CurrentPiece == 21 or CurrentPiece == 14)
			or (CurrentPiece >= 53 and CurrentPiece <= 55) 
			or (CurrentPiece == 57 or CurrentPiece == 59) 
			or (CurrentPiece >= 84 and CurrentPiece <= 88))
			{
			    if(Spin == 1) StateUpdate(-2);
			    if(Spin == -1)StateUpdate(2);
			}
		}
		else StateUpdate(2)
		
		if(!PieceCollision(x, y)) exit
		
		if(!DoubleRot)
		{
			if((CurrentPiece == 21 or CurrentPiece == 14)
			or (CurrentPiece >= 53 and CurrentPiece <= 55) 
			or (CurrentPiece == 57 or CurrentPiece == 59) 
			or (CurrentPiece >= 84 and CurrentPiece <= 88))
			{
				if(Spin == 1) StateUpdate(1)
			    if(Spin == -1)StateUpdate(-1)
			}
			else
			{
			    if(Spin == 1) StateUpdate(-1)
			    if(Spin == -1)StateUpdate(1)
			}
		}
		else StateUpdate(-2)
		
		ST = false
		exit
};