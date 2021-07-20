// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function TGMTetro(){
	var Case, N, P = image_index, MidAir = false, ExtraRule = false;

	ST = true
	LT = 0
	
	if(sprite_index == I and place_free(x, y + 64)) MidAir = true

	if(Spin == 1) StateUpdate(1)
	if(Spin == -1)StateUpdate(-1)

	N = image_index

	if(sprite_index == O) exit

	if     (P == 0 and N == 1) Case = 0
	else if(P == 1 and N == 0) Case = 1
	else if(P == 1 and N == 2) Case = 2
	else if(P == 2 and N == 1) Case = 3
	else if(P == 2 and N == 3) Case = 4
	else if(P == 3 and N == 2) Case = 5
	else if(P == 3 and N == 0) Case = 6
	else if(P == 0 and N == 3) Case = 7

	
	if(sprite_index == Z)
	{
	    //Offset table for Z
	            //     1     2     3     4
	    //0>>1
	    ARS[0] = "+0,-1 +1,-1 -1,-1 +0,-1"
	    //1>>0
	    ARS[1] = "+0,+1 +1,+1 -1,+1 +0,+0"
	    //1>>2
	    ARS[2] = "+0,+0 +1,+0 -1,+0 +0,+0"
	    //2>>1
	    ARS[3] = "+0,+0 +1,+0 -1,+0 +0,+0"
	    //2>>3
	    ARS[4] = "+1,+0 +2,+0 +0,+0 +1,+0"
	    //3>>2
	    ARS[5] = "-1,+0 +0,+0 -2,+0 -1,+0"
	    //3>>0
	    ARS[6] = "-1,+1 +0,+1 -2,+1 -1,+1"
	    //0>>3
	    ARS[7] = "+1,-1 +2,-1 +0,-1 +1,-1"
	}
	else if(sprite_index == S)
	{
	    //Offset table for Z
	            //     1     2     3     4
	    //0>>1
	    ARS[0] = "-1,-1 +0,-1 -2,-1 -1,-1"
	    //1>>0
	    ARS[1] = "+1,+1 +2,+1 +0,+1 +1,+1"
	    //1>>2
	    ARS[2] = "+1,+0 +2,+0 +0,+0 +1,+0"
	    //2>>1
	    ARS[3] = "-1,+0 +0,+0 -2,+0 -1,+0"
	    //2>>3
	    ARS[4] = "+0,+0 +1,+0 -1,+0 +0,+0"
	    //3>>2
	    ARS[5] = "+0,+0 +1,+0 -1,+0 +0,+0"
	    //3>>0
	    ARS[6] = "+0,+1 +1,+1 -1,+1 +0,+1"
	    //0>>3
	    ARS[7] = "+0,-1 +1,-1 -1,-1 +0,-1"
	}
	else if(sprite_index < O)
	{
	    //Offset table for T,L,J
	            //     1     2     3     4
	    //0>>1
	    ARS[0] = "+0,-1 +1,-1 -1,-1 +0,-1"
	    //1>>0
	    ARS[1] = "+0,+1 +1,+1 -1,+1 +0,+0"
	    //1>>2
	    ARS[2] = "+0,+0 +1,+0 -1,+0 +0,+0"
	    //2>>1
	    ARS[3] = "+0,+0 +1,+0 -1,+0 +0,+0"
	    //2>>3
	    ARS[4] = "+0,+0 +1,+0 -1,+0 +0,+0"
	    //3>>2
	    ARS[5] = "+0,+0 +1,+0 -1,+0 +0,+0"
	    //3>>0
	    ARS[6] = "+0,+1 +1,+1 -1,+1 +0,+0"
	    //0>>3
	    ARS[7] = "+0,-1 +1,-1 -1,-1 +0,-1"
	}
	else
	{
	    //Offset table for I
	            //  1     2     3     4     5
	    //0>>1
	    ARS[0] = "+0,+0 +0,-1 +0,-2 +0,+0"
	    //1>>0
	    ARS[1] = "+0,+0 -1,+0 +1,+0 +2,+0"
	    //1>>2
	    ARS[2] = "+0,-1 +1,-1 -1,-1 +2,-1"
	    //2>>1
	    ARS[3] = "+0,+1 +0,+0 +0,-1 +0,+0"
	    //2>>3
	    ARS[4] = "+1,+1 +1,+0 +1,-1 +1,+1"
	    //3>>2
	    ARS[5] = "-1,-1 -2,-1 +0,-1 +1,-1"
	    //3>>0
	    ARS[6] = "-1,+0 +0,+0 -2,+0 +1,+0"
	    //0>>3
	    ARS[7] = "+1,+0 +1,-1 +1,-2 +1,+0"
	}
	/*
	
	if(image_index == 2)
	{
		if      (Case == 4 and sprite_index == L and (!place_free(x, y + 64) and !place_free(x - 64, y - 64)))  ExtraRule = true
		else if (Case == 3 and sprite_index == J and (!place_free(x, y + 64) and !place_free(x - 64, y - 64)))  ExtraRule = true
		else if((sprite_index == J or sprite_index == L) and (!place_free(x, y + 64) or !place_free(x, y - 64)))ExtraRule = true
		else if( sprite_index == T and !place_free(x, y - 64))ExtraRule = true
	}
	*/
	if(P == 2)
	{	
		if((sprite_index == J or sprite_index == L) and collision_point(x,y + 64, Placed,false,true)) ExtraRule = true
		if(Case == 4 and sprite_index == L and (collision_point(x, y + 64, Placed,false,true) and collision_point(x - 64,y - 64, Placed,false,true)))  ExtraRule = false
		if(Case == 3 and sprite_index == J and (collision_point(x, y + 64, Placed,false,true) and collision_point(x + 64,y - 64, Placed,false,true)))  ExtraRule = false
		if(((sprite_index == J or sprite_index == L or sprite_index == T) and collision_point(x,y - 64, Placed,false,true))) ExtraRule = true
	}
	if(P == 0)
	{
		if((sprite_index == J or sprite_index == L) and (!place_empty(x, y - 64, Placed) or !place_empty(x, y - 128, Placed)))ExtraRule = true
		else if(sprite_index == T and !place_empty(x, y - 128, Placed)) ExtraRule = true
	}
	
	if(ExtraRule)
	{
		if(Spin == 1) StateUpdate(-1)
		if(Spin == -1)StateUpdate(1)
		ST = false
		exit
	}

	var i, XO, YO;

	for(i = 0; i < 4; i++)
	{
	    XO = real(string_char_at(ARS[Case], 1 + 6*i) + string_char_at(ARS[Case], 2 + 6*i)) * 64
	    YO = real(string_char_at(ARS[Case], 4 + 6*i) + string_char_at(ARS[Case], 5 + 6*i)) * 64
		
		
		
	    if(place_empty(x + XO, y + YO))
	    {
	        x += XO
	        y += YO

	        LT = i + 1
	        exit
	    }
		else if((Case == 0 or Case == 3 or Case == 4 or Case == 7) and MidAir) break
	}

	if(Spin == 1) StateUpdate(-1)
	if(Spin == -1)StateUpdate(1)
	ST = false
	exit
};