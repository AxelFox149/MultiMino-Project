function DrawPiece(SPR, XPOS, YPOS, ANG, XSCAL, YSCAL, ALP, DRKFAC, GRAY) 
{
	SPR  -= 1;
	XPOS -= 32;
	YPOS -= 32;

	if(SPR == -1) exit
	else if(SPR == 13 
		or (SPR == 31 or SPR == 33 or SPR == 38) 
		or (SPR >= 52 and SPR <= 54) 
		or (SPR == 56 or SPR == 58) 
		or (SPR >= 83 and SPR <= 87))
		{
			ANG *= -1
			ANG = (ANG + 4) mod 4
		}

	var PX, PY, i, l, col;

	if(SPR >= 29)					l = 6
	else if(SPR < 7)                l = 4
	else if(SPR > 6 and SPR < 25)   l = 5
	else if(SPR == 25)              l = 1
	else if(SPR == 26 or SPR == 28) l = 3
	else if(SPR == 27)              l = 2

	if(Options[1] < 14)			col = ColorPal[SPR + 1]
	else						col = c_white

	if(gameover or GRAY) 
	{
		if(Options[1] < 14) col = ColorPal[90]
		else				col = $404040
	}
	
	if(DRKFAC != 0)
	{
	    var h,s,v;
    
	    h = colour_get_hue(col)
	    s = colour_get_saturation(col)
	    v = colour_get_value(col)

	    v -= v * (DRKFAC/100)
    
	    col = make_colour_hsv(h,s,v)
	}

	for(i = 0; i < l; i++)
	{
		
		PX = Block[ANG,SPR][0 + (2 * i)] * 32 * XSCAL
		PY = Block[ANG,SPR][1 + (2 * i)] * 32 * XSCAL
		
		if((SPR >= 5 and SPR <= 14) or (SPR >= 27 and SPR < 60) or (SPR >= 79 and SPR < 87))
	    {
	        PX *= 0.5
	        PY *= 0.5
	    }
		
		PX += XPOS
		PY += YPOS
		
	    if(Options[1] == 14)	  draw_sprite_ext(Spc_Block_spr,  (90 * (Options[1] - 14))+ (SPR mod 90),PX,PY,4 * XSCAL, 4 * YSCAL, 0,col,ALP)
	    else if(Options[1] == 15) draw_sprite_ext(Spc_Nes_spr,  (SPR mod 3) + (3 * ((level - 1) mod 10)),PX,PY,4 * XSCAL, 4 * YSCAL, 0,col,ALP)
	    else if(Options[1] == 16) draw_sprite_ext(Spc_TGM_spr,    (90 * (Options[1] - 14))+ (SPR mod 90),PX,PY,4 * XSCAL, 4 * YSCAL, 0,col,ALP)
	    else if(Options[1] == 17) draw_sprite_ext(Spc_WRL_spr,    (90 * (Options[1] - 14))+ (SPR mod 90),PX,PY,2 * XSCAL, 2 * YSCAL, 0,col,ALP)
		else if(Options[1] == 18) draw_sprite_ext(Spc_Program_spr,(90 * (Options[1] - 14))+ (SPR mod 90),PX,PY,4 * XSCAL, 4 * YSCAL, 0,col,ALP)
		else					  draw_sprite_ext(Point,Options[1],PX,PY,XSCAL,YSCAL,0,col,ALP)
	}
};


function PieceCollision(XPOS, YPOS)
{
	var PX, PY, i, l, SPR, ANG, BRD, STR, SZ;
	
	SPR = CurrentPiece - 1
	ANG = image_index
	
	if(SPR == -1) exit
	else if(SPR == 13 
		or (SPR == 31 or SPR == 33 or SPR == 38) 
		or (SPR >= 52 and SPR <= 54) 
		or (SPR == 56 or SPR == 58) 
		or (SPR >= 83 and SPR <= 87))
		{
			ANG *= -1
			ANG = (ANG + 4) mod 4
		}
	
	if(SPR >= 29)					l = 6
	else if(SPR < 7)                l = 4
	else if(SPR > 6 and SPR < 25)   l = 5
	else if(SPR == 25)              l = 1
	else if(SPR == 26 or SPR == 28) l = 3
	else if(SPR == 27)              l = 2
	
	
	if(object_index == Polyminoe)
	{
		with(Control)
		{
			BRD = board
			STR = BoardStart
			SZ  = BoardWidth
		}
	}
	else
	{
		with(EnControl)
		{
			BRD = board
			STR = BoardStart
			SZ  = BoardWidth
		}
	}
	
	for(i = 0; i < l; i++)
	{
		PX = Block[ANG,SPR][0 + (2 * i)] * 64
		PY = Block[ANG,SPR][1 + (2 * i)] * 64
		
		if((SPR >= 5  and SPR <= 14) 
		or (SPR >= 27 and SPR <  60) 
		or (SPR >= 79 and SPR <  87))
	    {
	        PX *= 0.5
	        PY *= 0.5
	    }
		
		PX += XPOS
		PY += YPOS

		PX = floor((PX - STR)  / 64)
		PY = floor((PY + 1152) / 64)
		
		if(PX < 0 or PX > SZ) return true;
		if(PY < 0 or PY > 39) return true;
		
		if(BRD[PY][PX] != 0) return true;
	}
	
	return false
};