/// @description Garbage bar, Tip for spin board

if(GMode == 6 and !gameover and depth == -8)
{
    //draw_sprite_ext(Meter_spr,0,528,128,8,8,0,c_white,1)
    //draw_rectangle_colour(528,128,552,1408 - (InGarb*64),c_black,c_black,c_black,c_black,false)
	var minPGar = min(21,InGarb)
	draw_sprite_part_ext(Meter_spr,0,0,160 - (8 * minPGar),3,8 * minPGar,528,1408 - (minPGar * 64),8,8,c_white,1)
}

if(GMode == 7)
{
	draw_set_color(c_white)
	if(isDouble) AnOffset = AcceleScr(AnOffset, 492, 35.5 - abs(AnOffset *   36/492))
	else		 AnOffset = AcceleScr(AnOffset,   0, 36   - abs(AnOffset * 35.5/492))
	
	if(AnOffset != 0)
	{
		draw_sprite_ext(OptionSpr,1,AnOffset - 420,308,6,6,0,c_white,1)
		draw_text(AnOffset - 468, 332, Hint)
	}
}

if(GMode == 10 and !gameover and depth == -8)
{
	var minPGar = min(21,InGarb), minEGar = min(21,EnGarb);
	
	draw_sprite_part_ext(Meter_spr,0,0,160 - (8 * minPGar),3,8 * minPGar,80, 1408 - (minPGar * 64),8,8,c_white,1)
	draw_sprite_part_ext(Meter_spr,0,0,160 - (8 * minEGar),3,8 * minEGar,976,1408 - (minEGar * 64),8,8,c_white,1)
}

///Sprites en editor

if(GMode == 11 and instance_exists(Control))
{
	var str, i, j = 1, InsOff = 0, GOffSet = 0;
	
	_CurrentGP = getController()
	
	draw_set_halign(fa_center)
	draw_set_color(c_white)
    
	if(IsEdit)
    {
        draw_sprite_ext(Point, Options[1], CurX, CurY, 2, 2, 0, ColorPal[91], .5)
		
		if(_CurrentGP != -1)
		{
			draw_sprite_ext(spr_hand,0,CurPosX,CurPosY,8,8,0,c_white,1)
			InsOff = 1
		}
		
		str = EditorText[0,0]
        draw_text(232,320, str)
		
		str = EditorText[1,InsOff]
        draw_text_transformed(232,464, string_hash_to_newline(str),0.85,0.85,0)
        draw_sprite_ext(SArrow,0,1728,179 + (156 * Pointer),-8,8,0,c_white,1)
        
        for(i = 0; i < 9; i++)
		{
			if		(PieceArr[i] >= 30 and PieceArr[i]  < 40)  GOffSet = -24
			else if((PieceArr[i] >= 48 and PieceArr[i]  < 56) 
				 or (PieceArr[i] == 58 or  PieceArr[i] == 59) 
				 or (PieceArr[i] >= 80 and PieceArr[i]  < 88)) GOffSet = 24
			else											   GOffSet = 0
			
			DrawPiece(PieceArr[i], 1536, 185 + (i * 156) + GOffSet, 0, 1.5, 1.5, 1, 0, false)
		}
		draw_set_halign(fa_left)
		
		str = EditorText[2,0]
        draw_text_transformed(32,782,str,0.75,0.75,0)
		
		for(i = 0; i < 13; i++)
		{
			if(i == 2 or i == 5 or i == 7 or i == 10) continue
			
			str = EditorText[2, j + (9 * InsOff)]
			draw_text_transformed(32,862 + (40 * i),str,0.75,0.75,0)
			
			j++
		}
        
        /*if(SpinBoard != -1)*/
        var xyScal = 0.9
		
		if(_CurrentGP != -1)
		{
			draw_text_transformed(880, 48 + 56 * MovePoiter,  "(Y)",xyScal,xyScal,0)
			draw_text_transformed(832, 48 ," ^",xyScal,xyScal,0)
			draw_text_transformed(832, 104,"RS",xyScal,xyScal,0)
			draw_text_transformed(832, 160," v",xyScal,xyScal,0)
			
			draw_text_transformed(944, 48,  "O-Spin:",xyScal,xyScal,0)
			draw_text_transformed(944, 104, "20G:"   ,xyScal,xyScal,0)
			draw_text_transformed(944, 160, "LockD:" ,xyScal,xyScal,0)
		}
		else
		{
			draw_text_transformed(848, 48,  "(F1) O-Spin:",xyScal,xyScal,0)
			draw_text_transformed(848, 104, "(F2) 20G:"   ,xyScal,xyScal,0)
			draw_text_transformed(848, 160, "(F3) LockD:" ,xyScal,xyScal,0)
		}
		
		
        if(OSpin) draw_text_transformed_color(1088, 48, "Yes",xyScal,xyScal,0,c_green,c_green,c_green,c_green,1)
        else      draw_text_transformed_color(1088, 48, "No" ,xyScal,xyScal,0,c_red,c_red,c_red,c_red,1)
		
		if(G20)   draw_text_transformed_color(1088, 104, "Yes",xyScal,xyScal,0,c_green,c_green,c_green,c_green,1)
        else      draw_text_transformed_color(1088, 104, "No" ,xyScal,xyScal,0,c_red,c_red,c_red,c_red,1)
		
		if(LockD) draw_text_transformed_color(1088, 160, "Yes",xyScal,xyScal,0,c_green,c_green,c_green,c_green,1)
        else      draw_text_transformed_color(1088, 160, "No" ,xyScal,xyScal,0,c_red,c_red,c_red,c_red,1)
		
                  draw_text_transformed(640, 48, "Slot " + string(SpinBoard),xyScal,xyScal,0)
        
        if(SaveFlag) draw_text_transformed(640, 104, EditorText[3,0],xyScal,xyScal,0)
        
        draw_text_transformed(64,64,EditorText[4,InsOff],xyScal - 0.05,xyScal - 0.05,0)
        draw_set_halign(fa_center)
    }
    else
    {
		if(_CurrentGP != -1) InsOff = 1
		
        draw_text(232,320, EditorText[5,0])
		str = EditorText[6,InsOff]
        draw_text_transformed(232,464, string_hash_to_newline(str),0.85,0.85,0)
    }
    draw_set_halign(fa_left)
}

/* */
///Debug stuff
/*
if(GMode == 7)
{
    var i, YCor;
    for(i = 0; i < array_length_1d(Boards); i++)
    {
        YCor = 16 + (38 * i)
        if(Boards[i] = -1)  draw_set_colour(c_red)
        if(i == (index - 1))draw_set_colour(c_green)
        
        if(YCor < 1504) draw_text(32,  YCor,		Boards[i])
        else            draw_text(408, YCor - 1520, Boards[i])
        draw_set_colour(c_white)
    }
    
    
}
*/

/* */
///Dibuja los sprites de GameOver


if(gameover)
{
    if(GMode != 10 and !instance_exists(Polyminoe)) DrawPiece(LS, LX, LY, LP, 2, 2, 1, 0, false)

    draw_set_alpha(aVal)
    draw_rectangle_colour(0,0,room_width,room_height,c_black,c_black,c_black,c_black,0)
    draw_set_alpha(1)
    
    if(aVal != 0.5) aVal += 0.05
    
    if(alarm_get(0) < 0)
    {
        if(GMode != 10)
        {
			draw_sprite_part_ext(SwitchType,Options[2],0,14 * GOType, 68, 14, (room_width/2) - 256, (room_height/2) - 44,8,8,c_white,1)
			
            //draw_sprite_ext(SwitchType, GOType + (13 * Options[2]), room_width/2, room_height/2,8,8,0,c_white,1)
            //if(!NR) draw_sprite_ext(SwitchType, 11 + (13 * Options[2]), room_width/2, 840,8,8,0,c_white,1)
			
			if(!NR) draw_sprite_part_ext(SwitchType, Options[2], 0 , 182, 68, 14, (room_width/2) - 256, 796,8,8,c_white,1)
            if(alarm_get(1) < 0) alarm[1] = 90
        }
        else
        {
            if((P1Count < FirstTo) and (P2Count < FirstTo))
            {
				draw_sprite_part_ext(SwitchType, Options[2],0,14 * GOType, 68, 14, 192 + (896 * (Lost - 1)), (room_height/2) - 44,8,8,c_white,1)
				
                //draw_sprite_ext(SwitchType, GOType + (13 * Options[2]), 448 + (896 * (Lost - 1)), room_height/2,8,8,0,c_white,1)
                if(alarm_get(3) < 0) alarm[3] = 90
				
				draw_sprite_ext(PointCount_spr, P1Count,448 , room_height/2 + 128,8,8,0,c_white,1)
                draw_sprite_ext(PointCount_spr, P2Count,1344, room_height/2 + 128,8,8,0,c_white,1)
				
				//if(P1Count >= FirstTo) GameWin = true

            }
            else
            {
				draw_sprite_part_ext(SwitchType, Options[2],0,14 * 4, 68, 14, 192 + (896 *  bool(Lost - 1)), (room_height/2) - 44,8,8,c_white,1)
                draw_sprite_part_ext(SwitchType, Options[2],0,14 * 3, 68, 14, 192 + (896 * !bool(Lost - 1)), (room_height/2) - 44,8,8,c_white,1)
				
				//draw_sprite_ext(SwitchType, 6 + (13 * Options[2]), 448 + (896 *  bool(Lost - 1)), room_height/2,8,8,0,c_white,1)
                //draw_sprite_ext(SwitchType, 5 + (13 * Options[2]), 448 + (896 * !bool(Lost - 1)), room_height/2,8,8,0,c_white,1)
                if(alarm_get(1) < 0) alarm[1] = 120
            }
        }
    }
    
    if(DrawDes)
    {
		if(((GMode != 6 and GMode < 10) or GMode == 12) and !PlayMode and Options[12])
		{
			var col, f1press = keyboard_check_pressed(vk_f1);
			
			if(f1press and !RepSave)
			{
				RepSave  = true
				alarm[4] = 60
			}
			
			if(!RepFlag) RepAnOff = AcceleScr(RepAnOff, 520, 35.5 - abs(RepAnOff *   36/520))
			else		 RepAnOff = AcceleScr(RepAnOff,   0, 36   - abs(RepAnOff * 35.5/520))
			
			if(RepSave) col = c_lime
			else		col = c_white
			
			draw_sprite_ext(OptionSpr,1,RepAnOff - 448,308,6,6,0,col,1)
			draw_text_color(RepAnOff - 468,332,"F1: Save Replay",col,col,col,col,1)
		}
		
        if(NR) draw_sprite_part_ext(SwitchType, Options[2], 0 , 168, 68, 14, (room_width / 2) - 256, 796,8,8,c_white,1)
        
        draw_sprite_part_ext(SwitchType, Options[2], 0, 196, 68, 28, (room_width / 2) - 256, 960, 8, 8, c_white, 1)
		draw_sprite_ext(GOArrow_New_spr,0,(room_width / 2) - 208, 992 + (112 * Sel),8,8,0,c_white,1)
		
		//draw_sprite_ext(Des_spr, Sel + (2 * Options[2]),  (room_width / 2) - 528, 992 + (112 * Sel),8,8,0,c_white,1)
    }
}

/* */
///Desvanecimiento

if(Fade != 0)
{
    draw_sprite_tiled(Gradient_spr,Alpha,0,0)
    
    if(Alpha >= 8 and Fade == 1)
    {
		VarReset()
		
        if(Sel == 0) room_restart()
        else         room_goto(Title)
    }
    else if(Alpha <= 0 and Fade == -1)
    {
        Fade = 0

        if(GMode != 11) instance_activate_object(Polyminoe)

		instance_activate_object(Control)
        instance_activate_object(ComboArt)
        instance_activate_object(EnControl)
        instance_activate_object(Enemy)
		instance_activate_object(Placed)
		
		switch(GMode)
		{
			case 0:
			case 1:
			case 2:
			case 3:
				NormalMusic  = music_Marathon
				DangerMusic  = music_Danger_Marathon
				break;
			case 5:
				NormalMusic = music_Blitz
				DangerMusic = music_Blitz
				break
			case 8:
				NormalMusic  = music_Master_1
				DangerMusic  = music_Danger_Master_1
				break;
			
			case 7:
				NormalMusic = music_SpinClear
				DangerMusic = music_SpinClear
				break;
				
			case 12:
				NormalMusic  = music_Classic
				DangerMusic  = music_Danger_Classic
				break;
				
		}	
		
		with(Polyminoe) FallSpeed = power(0.8 - ((level - 1) * 0.007), level - 1) * 60
		
		CurrentMusic = NormalMusic
		if(Options[10])audio_play_sound(CurrentMusic,10,true)
		
		if(Options[9] and (Options[1] == 16 or Options[1] == 17) and Control.Queue[0] != 0 and Control.Queue[0] < (array_length(Control.TGMSound) + 1))
		{
			with(Control) audio_play_sound(TGMSound[Queue[0] - 1],10,false)
		}
		
        depth = -8
        pause = false
    }
    Alpha += 0.35 * Fade
}
///////////////////////////////////////////////////////////////

if(GMode == 15 and instance_exists(Control))
{
    draw_line(576,768,1216,768)
    draw_set_halign(fa_center)
    if(IsEdit)
    {
        draw_sprite_ext(Point, Options[1], CurX, CurY, 2, 2, 0, ColorPal[91], .5)
        draw_text(256,320, string_hash_to_newline("EDIT MODE"))
        
        if(OSpin) draw_text(256, 256, string_hash_to_newline("O-Spin: true"))
        else      draw_text(256, 256, string_hash_to_newline("O-Spin: false"))
		if(LockD) draw_text(256, 192, string_hash_to_newline("Lock: true"))
        else      draw_text(256, 192, string_hash_to_newline("Lock: false"))
        
        draw_sprite_ext(SArrow,0,1728,179 + (156 * Pointer),-8,8,0,c_white,1)
        var i, GOffSet = 0;
        for(i = 0; i < 9; i++)
		{
			if		(PieceArr[i] >= 30 and PieceArr[i] < 40)  GOffSet = -24
			else if((PieceArr[i] >= 48 and PieceArr[i] < 56) 
				 or (PieceArr[i] == 58 or PieceArr[i] == 59) 
				 or (PieceArr[i] >= 80 and PieceArr[i] < 88)) GOffSet = 24
			else											  GOffSet = 0
			
			DrawPiece(PieceArr[i], 1536, 185 + (i * 156) + GOffSet, 0, 1.5, 1.5, 1, 0, false)
		}
    }
    else draw_text(256,320, string_hash_to_newline("TEST MODE"))
    
    if(SpinBoard != -1) draw_text(256, 384, string_hash_to_newline("Spin Board: " + string(SpinBoard)))
    else				draw_text(256, 384, string_hash_to_newline("Save Index: " + string(BoardCount)))
	draw_set_halign(fa_left)
    
    if(SaveFlag) draw_text(640, 64, string_hash_to_newline("SPIN BOARD SAVED"))
}


/* */
/*  */
