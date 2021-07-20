/// @description GUI

if(stage == 1)
{
    if (n == 0) stage ++
    
    if(frame <= 6 and frame >= 0)
    {
        var i
        
        for(i = 0; i < n; i++)
        {
			if(frame >= 1)
			{
				instance_deactivate_region(BoardStart,(LC[i]* 64) - 1152,64 * BoardWidth,62,true,true)
				board[LC[i]] = ZeroRow
			}
            draw_sprite_part(ShortLC,floor(frame),0,0,64 * (BoardWidth + 1), 64,BoardStart,(LC[i]* 64) - 1152)
        }
    }
    if(!pause)     frame += 0.25
    if(frame >= 7) stage ++
}

///Fila, estadisticas
draw_set_colour(c_white)

if(ResetCounter != 0) draw_sprite_ext(RstHold_spr, (ResetCounter * 7) / 30,232,416,6,6,0,c_white,1)


if((GMode != 11 or !IsEdit) and GMode != 10 and (GMode != 15 or !IsEdit)){
    if !(pause or gameover)
    {
		TimeR[2] ++
		
		if(TimeR[2] >= 60) TimeR[1] ++
        if(TimeR[1] >= 60) TimeR[0] ++
		
        if(!Dec){
            if(instance_exists(Polyminoe)) Time[2] ++
            
			
            if(Time[2] >= 60) Time[1] ++
            if(Time[1] >= 60) Time[0] ++
        }
        else
        {
            if(stage != 1) Time[2] --
            
            if(Time[2] < 0) Time[1] --
            if(Time[1] < 0) Time[0] --
        }
        
        Time[0] = (Time[0] + 60) mod 60
        Time[1] = (Time[1] + 60) mod 60
        Time[2] = (Time[2] + 60) mod 60
		
		TimeR[0] = (TimeR[0] + 60) mod 60
        TimeR[1] = (TimeR[1] + 60) mod 60
        TimeR[2] = (TimeR[2] + 60) mod 60
    }
    //if(ComboArt.AMFlag) draw_set_colour($0F380F)
    var i, GOffSet = 0;
	
	if      (Queue[0] >= 30 and Queue[0] < 40)  GOffSet = -24
	else if((Queue[0] >= 48 and Queue[0] < 56) 
		 or (Queue[0] == 58 or Queue[0] == 59) 
		 or (Queue[0] >= 80 and Queue[0] < 88)) GOffSet = 24
	else										GOffSet = 0
	
	if(GMode == 12 or GMode == 13) GOffSet -= 48
	
    DrawPiece(Queue[0], 1536 + ComboArt.CurrentVel, 195 + ComboArt.VerVel + GOffSet, NState, 1.5, 1.5, 1, 0, false)
    
    if(GMode != 12)
	{
		for(i = 1; i < 5; i++)
		{
			if		(Queue[i] >= 30 and Queue[i] < 40)  GOffSet = -24
			else if((Queue[i] >= 48 and Queue[i] < 56) 
				 or (Queue[i] == 58 or Queue[i] == 59) 
				 or (Queue[i] >= 80 and Queue[i] < 88)) GOffSet = 24
			else										GOffSet = 0
			
			if(GMode == 12 or GMode == 13) GOffSet -= 48
			
			if(GMode != 13) DrawPiece(Queue[i], 1536 + ComboArt.CurrentVel, 220 + (i * 156) + ComboArt.VerVel + GOffSet, 0, 1.5, 1.5, 1, 0, false)
			else			DrawPiece(Queue[i], 1536 + ComboArt.CurrentVel, 220 + (i * 156) + ComboArt.VerVel + GOffSet, 2, 1.5, 1.5, 1, 0, false)
		}
	}
	
    if(Hold != Point)
	{
		if(GMode != 13) DrawPiece(Hold, 232 + ComboArt.CurrentVel, 195 + ComboArt.VerVel, 0, 1.5, 1.5, 1, 0, !CH)
		else			DrawPiece(Hold, 232 + ComboArt.CurrentVel, 195 + ComboArt.VerVel - GOffSet, 2, 1.5, 1.5, 1, 0, !CH)
	}
    draw_set_halign(fa_center)
    draw_text(1536,32, _DispText[0])
    draw_text(232,32,  _DispText[1])
	
	if(GMode == 12)
	{
		draw_text(1536,256,_DispText[6])
		for(i = 0; i < 7; i++)
		{
			DrawPiece(i + 1,1448, 392 + (i * 88), 0, 0.75, 0.75, 1, 0, 0)
			draw_text(1568,	  336 + (i * 88), PieceCount[i])
		}
	}
	draw_set_halign(fa_left)
    
    draw_text(1408,934, _DispText[2]) //Scores:
    draw_text(1408,994, string_hash_to_newline(score))
	
    switch(GMode)
    {
        case 7:
            draw_text(1408,1070,"All Clears: ")
            draw_text(1408,1130,string(Clears))
            break
        
        case 8:
            draw_text(1408,1070,_DispText[3])
            draw_text(1408,1130, string("M" + string(level - 20)))
            break
            
        default:
            draw_text(1408,1070,_DispText[3])
			
			if(GMode == 12)draw_text(1408,1130, string(level - 1))
            else		   draw_text(1408,1130, string(level))
            break
    }
    
    draw_text(1408,1206, _DispText[4])
    draw_text(1408,1266, string(lines))
    
    if(Dec and Time[0] == 59)
    {
        Time[0] = 0
        Time[1] = 0
        Time[2] = 0
    }
    
    for(i = 2; i >= 0; i--)
    {
		if(TimeR[i] < 10) TMR[i] = "0" + string(TimeR[i])
        else TMR[i] = string(TimeR[i])
		
        if(Time[i] < 10) TM[i] = "0" + string(Time[i])
        else TM[i] = string(Time[i])
    }
    TM[3] = string(TM[0] + ":" + TM[1] + "." + TM[2])
	TMR[3]= string(TMR[0]+ ":" + TMR[1]+ "." + TMR[2])
    
    draw_text(1408,1342,_DispText[5])
    
    if(Dec and (Time[0] == 0 and Time[1] <= 10)) draw_set_colour(c_red)
	else										 draw_set_colour(c_white)
	
	draw_text(1408,1402,TM[3])
	draw_text(1600,1402,"IGT")
	
	draw_set_colour(c_white)
	
	draw_text(1408,1466,TMR[3])
	draw_text(1600,1466,"RTA")
}

 

if(GMode == 10)
{
    var i, j, pcol;
    draw_rectangle_colour(1024,0,1664,128,c_black,c_black,c_black,c_black,false)
    draw_rectangle_colour(128,0,768,128,c_black,c_black,c_black,c_black,false)

    for(i = 0; i < 3; i++) DrawPiece(Queue[i], 452 + ComboArt.CurrentVel  + (i * 118), 104 + ComboArt.VerVel, 0, 1, 1, 1, 0, false)
    
    if(Hold != Point) DrawPiece(Hold, 272 + ComboArt.CurrentVel, 104 + ComboArt.VerVel, 0, 1, 1, 1, 0, !CH)
    
    draw_text_transformed(408,4, _DispText[7],0.70,0.70,0)
    draw_text_transformed(216,4, _DispText[8],0.70,0.70,0)
	
    for(i = 20; i <= 39; i++)
    {
        for(j = 0; j <= BoardWidth; j++)
        {
            XOff = BoardStart + (64 * j)
            YOff =      -1152 + (64 * i)
            //draw_text(XOff,YOff,board[i][j])
            if(board[i][j] != 0)
            {
				if(Options[1] < 14)		pcol = ColorPal[board[i][j]]
				else					pcol = c_white
	
				if(gameover) 
				{
					if(Options[1] < 14) pcol = ColorPal[90]
					else				pcol = $404040
				}
				
                if(Options[1] < 14)		 draw_sprite_ext(Point,		   Options[1],				XOff,YOff,2,2,0,pcol,1)
                else if(Options[1] == 14)draw_sprite_ext(Spc_Block_spr,(board[i][j] - 1) mod 90,XOff,YOff,8,8,0,pcol,1)
                else if(Options[1] == 15)
                {
                    if(board[i][j] != 90) draw_sprite_ext(Spc_Nes_spr,((board[i][j] - 1) mod 3) + (3 * ((level - 1) mod 10)),XOff,YOff,8,8,0,pcol,1)
                    else                  draw_sprite_ext(Spc_Nes_spr,90,XOff,YOff,8,8,0,pcol,1)
                }
                else if(Options[1] == 16)draw_sprite_ext(Spc_TGM_spr,    (board[i][j] - 1) mod 90,XOff,YOff,8,8,0,pcol,1)
				else if(Options[1] == 17)draw_sprite_ext(Spc_WRL_spr,    (board[i][j] - 1) mod 90,XOff,YOff,4,4,0,pcol,1)
				else if(Options[1] == 18)draw_sprite_ext(Spc_Program_spr,(board[i][j] - 1) mod 90,XOff,YOff,8,8,0,pcol,1)
            }
        }
    }
}