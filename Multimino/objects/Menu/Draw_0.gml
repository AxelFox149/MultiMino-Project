/// @description Control de sprites
//if(!Options[2]) ini_open("ENG_Text.ini")
//else            ini_open("ESP_Text.ini")
//ini_open(LanFile)
if(Sel < 3)
{
    var i, Start, An, Color, ToRead;
        
    Start = (room_height - (128 * (MaxPos + 1)))/2
    
	draw_set_color(c_white)
    draw_set_font(Console_Title)
    draw_set_halign(fa_center)
    if(Sel == 0) draw_self()
    if(Sel == 1)
    {
        //ToRead = ini_read_string("Text", "MenuText[12,0]","None")
        ToRead = MenuText[0][2,0]
		
		draw_sprite_ext(GradBox_spr,0,256,128,8,8,0,c_white,1)
        draw_text(room_width/2,128,string_hash_to_newline(ToRead))
        
        Start = 316
    }
    draw_set_halign(fa_left)
    draw_sprite_ext(DescBox_spr,0,896,1216,8,8,0,c_white,1)
        
    for(i = 0; i <= MaxPos; i++)
    {
        if(i == Pos)
        {
            Vel[i] = AcceleScr(Vel[i], 128, 8.5 - abs(Vel[i] * 9/128))
            Frame += 0.125
            An = Frame mod 8
            Color = $ffffff
        }
        else
        {
            Vel[i] = AcceleScr(Vel[i], 0, 9 - abs(Vel[i] * 8.5/128))
            An = 0
            Color = $505050
        }
        
        
        //ToRead = ini_read_string("Text","Texto[" + string(Sel) + "," + string(i + MenuOff) + "]","None")
        ToRead = Text[Sel, i + MenuOff]
		
		
        draw_sprite_ext(OptionSpr, 0, Vel[i], Start + (128 * i),8,8,0,Color,1)
        draw_text_colour(Vel[i] + 24, Start + (128 * i), string_hash_to_newline(ToRead), Color,Color,Color,Color,1)
        
        if(Sel == 2)
        {
			if(MenuOff != 0)		draw_sprite_ext(UpDnArr_spr,0,256,96 ,8,8,0,c_white,1)
			if(MenuOff != MaxOff)	draw_sprite_ext(UpDnArr_spr,1,256,1392,8,8,0,c_white,1)
            //draw_sprite_ext(ValWin_spr, 0, Vel[i] + 504, Start + (128 * i) + 32, 8, 8, 0, c_black, 1)
            draw_sprite_ext(ValWin_spr, 0, Vel[i] + 512, Start + (128 * i), 8, 8, 0, Color, 1)
            
            if(i == (1 - MenuOff))
			{
				if(Options[1] >= 14 and !Scores[105 + (Options[1] - 14)])
				{
					draw_sprite_ext(Point, Options[1], Vel[i] + 584, Start + (128 * i) + 28, 2, 2, 0, $808080 - Color, 1)
					draw_sprite_ext(CantHold, 0,	   Vel[i] + 616, Start + (128 * i) + 60, 1, 1, 0, Color, 1)
					CanUse = false
				}
				else
				{
					draw_sprite_ext(Point, Options[1], Vel[i] + 584, Start + (128 * i) + 28, 2, 2, 0, Color, 1)
					CanUse = true
				}
			}
            else
            {
                //ToRead = ini_read_string("Text","MenuText[2" + string(i + MenuOff) + "," + string(Options[i + MenuOff]) + "]","None")
                
				if(Options[i + MenuOff] < 2 or (i + MenuOff) == 2) ToRead = MenuText[1][i + MenuOff, Options[i + MenuOff]]
				else ToRead = ""
				
				draw_set_halign(fa_center)
                if !(i > (5 - MenuOff) and i < (9 - MenuOff)) draw_text_colour(Vel[i] + 620, Start + (128 * i) + 13, string_hash_to_newline(ToRead),	Color,Color,Color,Color,1)
                else										  draw_text_colour(Vel[i] + 620, Start + (128 * i) + 13, string_hash_to_newline(Options[i + MenuOff]),Color,Color,Color,Color,1)
                draw_set_halign(fa_left)
            }
            
            if(Wait and i != (3 - MenuOff) and i == Pos) draw_sprite_ext(Scroll_spr, 0, Vel[i] + 720, Start + (128 * i), 8, 8, 0, Color, 1)
        }
        
        if(Sel == 1)
        {
            //draw_sprite_ext(Flag_spr + i, An, 512 + Vel[i], Start + (128 * i) + 24, 8, 8, 0, c_black, 1)
            draw_sprite_ext(Flag_spr + i, An, 512 + Vel[i], Start + (128 * i) - 8, 8, 8, 0, Color, 1)
        }
    }
    
    if(Second and Sel == 1)
    {
        ArFrame = ArFrame + 0.1
        if(Wait)             ArFrame = 4
        else if(ArFrame > 3) ArFrame = 0
        
        
        
        for(i = 0; i <= 3; i++)
        {
            if      (Pos == 7 and i == 0)                continue
            else if((GMode and Pos != 7) != 0 and i < 2) continue    
        
            if(i == 0 or i == 1)        An = 8 * Value[i]
            if(i == 1 and Pos == 7)     An = 8 * (IALevel - 1)
            if(i == 2)                  An = 7 * Value[i]
            if(i == 2 and Pos == 7)     An = 8 * Value[3]
            if(i == 3)                  An = 0
            
            FLoc[i] = AcceleScr(FLoc[i], An, 1)
            
            if(i == SecPos)              draw_sprite_ext(SArrow,          ArFrame,952,  560 + (128 * i), 8, 8, 0, c_white,1)
            
            if(Pos == 7 and i == 1)      draw_sprite_ext(IARoll_spr,      FLoc[i],1024, 520 + (128 * i), 8, 8, 0, c_white,1)
            else if(Pos == 7 and i == 2) draw_sprite_ext(FirstToRoll_spr, FLoc[i],1024, 520 + (128 * i), 8, 8, 0, c_white,1)
            else                         draw_sprite_ext(LineRoll_spr + i,FLoc[i],1024, 520 + (128 * i), 8, 8, 0, c_white,1)
        }
        if(Pos == 0)
        {
            //str = ini_read_string("Text","MenuText[14,0]","None")
            str = MenuText[0][4,0]
			
			draw_text_colour(1216, 536, string_hash_to_newline(str),c_black,c_black,c_black,c_black,0.5)
            draw_text(1200, 512, string_hash_to_newline(str))
            
            //str = ini_read_string("Text","MenuText[14,1]","None")
			str = MenuText[0][4,1]
            draw_text_colour(1216, 664, string_hash_to_newline(str),c_black,c_black,c_black,c_black,0.5)
            draw_text(1200, 640, string_hash_to_newline(str))
        }
        else if(Pos == 7)
        {
            //str = ini_read_string("Text","MenuText[14,2]","None")
			str = MenuText[0][4,2]
            draw_text_colour(1216, 664, string_hash_to_newline(str),c_black,c_black,c_black,c_black,0.5)
            draw_text(1200, 640, string_hash_to_newline(str))
            
            //str = ini_read_string("Text","MenuText[14,3]","None")
			str = MenuText[0][4,3]
            draw_text_colour(1216, 792, string_hash_to_newline(str),c_black,c_black,c_black,c_black,0.5)
            draw_text(1200, 768, string_hash_to_newline(str))
        }
    }
    
    if(Sel == 2)
    {
        //ToRead = ini_read_string("Text","Texto[0,2]","None")
		ToRead = Text[0,2]
        draw_sprite_ext(GradBox_spr,0,room_width - 512,128,8,8,0,c_white,1)
        draw_text(1424,128,string_hash_to_newline(ToRead))
    }
    
    if(Third)
    {
        ArFrame = ArFrame + 0.1
        if(KeyWait)          ArFrame = 4
        else if(ArFrame > 3) ArFrame = 0
        
        var KeyChar;
        draw_set_font(Console)
        for(i = 0; i < 10; i++)
        {
            if(i == SecPos)
            {
                draw_sprite_ext(SArrow,ArFrame,928, 364 + (88 * i),8,8,0,c_white,1)
                Color = $FFFFFF
            }
            else Color = $505050
            
            if(i < 9)
            {
				if(_CurrentGP < 0)
				{
					ini_open(LanFile)
					ToRead = ini_read_string("Text","Key_" + string(CurrentButtons[i]), "-1")
					ini_close()
				
					if(ToRead == "-1") KeyChar = chr(CurrentButtons[i])
					else			   KeyChar = ToRead
				}
				else
				{
					var j;
					KeyChar = "Null"
					for(j = 0; j < 12; j++)
					{
						if(CurJPadButtons[i] == ButtonName[j][0]) KeyChar = ButtonName[j][1]
					}
				}
                //ToRead = ini_read_string("Text","Keys[0," + string(i) + "]","None")
				ToRead = Keys[i]
                
                draw_sprite_ext(ContBound_spr,0,1024, 332 + (88 * i),8,8,0,Color,1)
                draw_sprite_ext(ContBound_spr,0,1360, 332 + (88 * i),8,8,0,Color,1)
                draw_set_halign(fa_center)
                draw_text_transformed_colour(1152, 336 + (88 * i), string_hash_to_newline(KeyChar),0.9,0.9,0,Color,Color,Color,Color,1)
                draw_text_transformed_colour(1488, 336 + (88 * i), string_hash_to_newline(ToRead) ,0.9,0.9,0,Color,Color,Color,Color,1)
                draw_set_halign(fa_left)    
            }
            else
            {
                //ToRead = ini_read_string("Text","Keys[0,9]","None")
				ToRead = Keys[9]
                
                draw_sprite_ext(ContBound_spr,0,1192, 1124,8,8,0,Color,1)
                draw_set_halign(fa_center)
                draw_text_transformed_colour(1320, 1128, string_hash_to_newline(ToRead),0.9,0.9,0,Color,Color,Color,Color,1)
                draw_set_halign(fa_left)
            }
            
        }
        draw_set_font(Console_Title)
    }
}

///Texto
var ToRead = "";

draw_set_font(Console)
if(Sel == 0) draw_text(32,room_height - 80,string_hash_to_newline("v " + string(GM_version)))

if(Sel < 3)
{
	if(!Second or Sel == 2)
	{
	    //ToRead = ini_read_string("Text", "Desc[" + string(Sel) + "," + string(Pos + MenuOff) + "]" , "None")
		ToRead = Desc[0][Sel,Pos + MenuOff]
    
	    draw_text_ext(920, 1292, string_hash_to_newline(ToRead), 55, 832)
	}
	else if(Sel == 1)
	{
		
	    if(Pos != 7)
		{
			//if(SecPos == 2)	ToRead = ini_read_string("Text", "Desc[3,2" + string(Value[2]) + "]" , "None")
			//else			    ToRead = ini_read_string("Text", "Desc[3,"  + string(SecPos)   + "]" , "None")
			
			if(SecPos == 2)	ToRead = Desc[Value[2]][3,2]
			else			ToRead = Desc[0][3, SecPos]
		}
	    else				ToRead = Desc[0][3, SecPos + 3]
		//ToRead = ini_read_string("Text", "Desc[3," + string(SecPos + 3) + "]" , "None")
    
	    draw_text_ext(920, 1292, string_hash_to_newline(ToRead), 55, 832)
	}
}


///Menu de puntaje
if(Sel == 3)
{
    var i, Color, str, clock, An;
	
    draw_set_font(Console_Title)
    draw_set_halign(fa_center)
    draw_sprite_ext(GradBox_spr,1,256,128,8,8,0,c_white,1)
    
    //str = ini_read_string("Text","MenuText[12,1]","None")
	str = MenuText[0][2,1]
    draw_text(room_width/2,128,string_hash_to_newline(str))
    
    draw_sprite_ext(IndexBox_spr,0,656,280,8,8,0,c_white,1)
    
    //str = ini_read_string("Text","MenuText[13," + string(ScoreIndex) + "]","None")
	str = MenuText[0][3,ScoreIndex]
    draw_text(room_width/2,272,string_hash_to_newline(str))
    
    draw_set_halign(fa_right)
	
	
	if(ScoreIndex != 6)
	{
	    for(i = 0; i < 7; i ++)
	    {
	        if(i == Pos)
			{
				Color = $ffffff
				Frame += 0.125
	            An = Frame mod 8
			}
	        else
			{
				Color = $505050
				An    = 0
			}
		
			if(i == 1 or i == 3) clock = 1
		    else                 clock = 0
        
			if(Pos == 0)
			{
				draw_sprite_ext(Count_spr,0, 472,472,8,8,0,c_white,1)
				draw_sprite_ext(Count_spr,1, 904,472,8,8,0,c_white,1)
				draw_sprite_ext(Count_spr,2,1328,472,8,8,0,c_white,1)
			}
		
		    draw_sprite_ext(Flag_spr + i,   An, 120, 504 + 128 * i, 8,8,0,Color,1)
		    draw_sprite_ext(ScoreBox_spr,clock, 384, 520 + 128 * i, 8,8,0,Color,1)
		
			if(i == 5) clock = 1
		    else       clock = 0
		
			if(i != 2 and i != 6) draw_sprite_ext(ScoreBox_spr,clock,816,520 + 128 * i,8,8,0,Color,1)
		
			if(i == 4)
			{
				draw_text_colour(768, 520 + 128 * i, Scores[4], Color,Color,Color,Color,1)
				draw_text_colour(1200,520 + 128 * i, Scores[11],Color,Color,Color,Color,1)
			}
			else if(i == 6)
			{
				draw_text_colour(768, 520 + 128 * i, Scores[6], Color,Color,Color,Color,1)
				draw_text_colour(1200,520 + 128 * i, Scores[13],Color,Color,Color,Color,1)
			}
			else
			{
				draw_text_colour(768, 520 + 128 * i, Scores[(i)    + (15 * ScoreIndex)],Color,Color,Color,Color,1)
				draw_text_colour(1200,520 + 128 * i, Scores[(i + 7)+ (15 * ScoreIndex)],Color,Color,Color,Color,1)
			}
		
			if(i == 0)
			{
				draw_sprite_ext(ScoreBox_spr,clock, 1248, 520, 8,8,0,Color,1)
				draw_text_colour(1632, 520, Scores[14 + (15 * ScoreIndex)],Color,Color,Color,Color,1)
			}
		
			if(Pos == 4) Color = $ffffff
	        else         Color = $505050
			draw_text_colour(560,1032, "AC's:",Color,Color,Color,Color,1)
		
			if(Pos == 6) Color = $ffffff
	        else         Color = $505050
			draw_text_colour(536,1288, "M.C:",Color,Color,Color,Color,1)
	    }
	}
	else
	{
		var hoff = 96;
		if(Pos > 3) Pos = 3
		
		for(i = 0; i < 4; i++)
		{	
			if(i == Pos)
			{
				Color = $ffffff
				Frame += 0.125
	            An = Frame mod 8
			}
	        else
			{
				Color = $505050
				An    = 0
			}
			
			if(i == 1 or i == 3) clock = 1
			else				 clock = 0

			draw_sprite_ext(ScoreBox_spr,	clock, 384 + hoff, 520 + 128 * i, 8,8,0,Color,1)
			
			if(i != 2)
			{
				if(i == 0) draw_sprite_ext(ScoreBox_spr,	1, 816 + hoff, 520 + 128 * i, 8,8,0,Color,1)
				else	   draw_sprite_ext(ScoreBox_spr,	0, 816 + hoff, 520 + 128 * i, 8,8,0,Color,1)
			}
			switch(i)
			{
				case 0: draw_sprite_ext(Endless_Score_spr,   0, 120 + hoff, 504 + 128 * i, 8,8,0,Color,1); break;
				case 1: draw_sprite_ext(Fall_spr,			An, 120 + hoff, 504 + 128 * i, 8,8,0,Color,1); break;
				case 2: draw_sprite_ext(Clock_spr,			An, 120 + hoff, 504 + 128 * i, 8,8,0,Color,1); break;
				case 3: draw_sprite_ext(Crown_spr,			An, 120 + hoff, 504 + 128 * i, 8,8,0,Color,1); break;	
			}
			
			draw_text_colour(768  + hoff, 520 + 128 * i, Scores[(i)    + (15 * ScoreIndex)],Color,Color,Color,Color,1)
			draw_text_colour(1200 + hoff, 520 + 128 * i, Scores[(i + 7)+ (15 * ScoreIndex)],Color,Color,Color,Color,1)
		}
	}
	
	for(i = 0; i < 3; i++)
	{
		draw_sprite_ext(Star_spr,Scores[105 + i], 32 + (64 * i), 1456,2.5,2.5,0,c_white,1)
	}
	draw_sprite_ext(Star_spr,Scores[109], 224, 1456,2.5,2.5,0,c_white,1)
	
	if(Scores[106])
	{
		draw_sprite_ext(Classic_T_spr,0,1216,1424,6,6,0,c_white,1)
		draw_sprite_ext(ScoreBox_spr,0,1408,1416,8,8,0,c_white,1)
		draw_text(1776,1416,Scores[110])
	}
}

///////////////////////////////////////////////////////////////////////
///Replay menu
if(Sel == 4)
{
	var i, Start, Color;
        
    //Start = (room_height - (128 * (MaxPos + 1)))/2
	Start = 428
	
	draw_set_color(c_white)
    draw_set_font(Console_Title)
    draw_set_halign(fa_center)

        draw_sprite_ext(GradBox_spr,0,256,128,8,8,0,c_white,1)
		draw_text(room_width/2,128,Text[0,4])
        //draw_text(room_width/2,152,ini_read_string("Text","Texto[0,4]","None"))

    draw_set_halign(fa_left)
    //draw_sprite_ext(DescBox_spr,0,896,1216,8,8,0,c_white,1)
	
	if(MenuOff != 0)		draw_sprite_ext(UpDnArr_spr,0,160,416 ,8,8,0,c_white,1)
	if(MenuOff != MaxOff)	draw_sprite_ext(UpDnArr_spr,1,160,1200,8,8,0,c_white,1)
	
	draw_sprite_ext(RepWin_spr,0,256,384, 8,8,0,c_white,1)
	draw_sprite_ext(ComWin_spr,0,184,1408,8,8,0,c_white,1)
	
	//draw_text_transformed(384, 1448,ini_read_string("Text","MenuText[15,0]","None"),0.7,0.7,0)
	//draw_text_transformed(1024,1448,ini_read_string("Text","MenuText[15,1"+ string(DelCounter) +"]","None"),0.7,0.7,0)
	
	draw_text_transformed(384, 1448,MenuText[0][5,0],0.7,0.7,0)
	draw_text_transformed(1024,1448,MenuText[0][5,1 + DelCounter],0.7,0.7,0)
	
	draw_sprite_ext(SArrow,0,272,Start + (104 * Pos) + 48,8,8,0,c_white,1)
	
	for(i = 0; i <= MaxPos; i++)
    {	
        if(i == Pos)
		{
			if(DelCounter == 0) Color = $ffffff
			else				Color = $0000ff
		}
        else Color = $505050
		
		if(i < array_length(ReplayList)) draw_text_transformed_color(384, Start + (104 * i), ReplayList[i + MenuOff], 0.7, 0.7, 0, Color,Color,Color,Color,1)
		else							 draw_text_transformed_color(384, Start + (104 * i), "Empty", 0.7, 0.7, 0, Color,Color,Color,Color,1)
	}
}

//ini_close()
///BlackScreen

if(PixelFade != 0)
{
    draw_sprite_tiled(Gradient_spr,frame,0,0)
    
	if(Sel != 4)
	{
		RecordMode = true
		PlayMode   = false
	}
	
    frame += 0.35 * PixelFade
    
    if(frame >= 8 and PixelFade == 1)
    {
		if(!CanUse) Options[1] = 0
		
		if(Sel == 0 and GMode != 12) room_goto(CreditsRoll)
		else 
		{
			if(GMode != 12)
			{
				switch(Options[1])
				{
					case 14:
						GSounds[0] = GB_LineClear	  //Line clear
						GSounds[1] = GB_Tetris		  //4 lines
						GSounds[2] = GB_Tetris		  //Spin line clear
						GSounds[3] = GB_Drop		  //Placed sound
						GSounds[4] = GB_Rotate		  //Rotation
						GSounds[5] = GB_Rotate		  //Spin Rotation
						GSounds[6] = GB_Move		  //Move Block
						GSounds[7] = Gen_BlockedSound //Can't Rotate
						GSounds[8] = Gen_HoldPiece    //Hold Sound
						GSounds[9] = GB_LevelUp		  //LevelUp
						break
			
					case 15:
						GSounds[0] = NES_LineClear	  //Line clear
						GSounds[1] = NES_Tetris		  //4 lines
						GSounds[2] = NES_Tetris		  //Spin line clear
						GSounds[3] = NES_Drop		  //Placed sound
						GSounds[4] = NES_Rotate		  //Rotation
						GSounds[5] = NES_Rotate		  //Spin Rotation
						GSounds[6] = NES_Move		  //Move Block
						GSounds[7] = Gen_BlockedSound //Can't Rotate
						GSounds[8] = Gen_HoldPiece    //Hold Sound
						GSounds[9] = NES_LevelUp	  //LevelUp
						break
					
					case 16:
					case 17:
						GSounds[0] = TGM_LineClear	  //Line clear
						GSounds[1] = TGM_Tetris		  //4 lines
						GSounds[2] = TGM_Tetris		  //Spin line clear
						GSounds[3] = TGM_Drop		  //Placed sound
						GSounds[4] = TGM_Rotate		  //Rotation
						GSounds[5] = TGM_Rotate		  //Spin Rotation
						GSounds[6] = TGM_Move		  //Move Block
						GSounds[7] = TGM_RotateFail   //Can't Rotate
						GSounds[8] = TGM_Hold	      //Hold Sound
						GSounds[9] = TGM_LevelUp	  //LevelUp
						break
			
					default:
						GSounds[0] = GB_LineClear	  //Line clear
						GSounds[1] = DX_Tetris		  //4 lines
						GSounds[2] = GB_Tetris		  //Spin line clear
						GSounds[3] = GB_Drop		  //Placed sound
						GSounds[4] = DX_Rotate		  //Rotation
						GSounds[5] = GB_Rotate		  //Spin Rotation
						GSounds[6] = DX_Move		  //Move Block
						GSounds[7] = Gen_BlockedSound //Can't Rotate
						GSounds[8] = Gen_HoldPiece    //Hold Sound
						GSounds[9] = DX_LevelUp		  //LevelUp
						break
				}
			}
			else
			{
				GSounds[0] = NES_LineClear	  //Line clear
				GSounds[1] = NES_Tetris		  //4 lines
				GSounds[2] = NES_Tetris		  //Spin line clear
				GSounds[3] = NES_Drop		  //Placed sound
				GSounds[4] = NES_Rotate		  //Rotation
				GSounds[5] = NES_Rotate		  //Spin Rotation
				GSounds[6] = NES_Move		  //Move Block
				GSounds[7] = Gen_BlockedSound //Can't Rotate
				GSounds[8] = Gen_HoldPiece    //Hold Sound
				GSounds[9] = NES_LevelUp	  //LevelUp
			}
        
			if(GMode != 10) room_goto(Tablero)
	        else            
	        {
				QueueMode = 0
					//LB = 1;
                    //UB = 29;
                    //TP = 29;
	            LB = 1
	            UB = 7
	            TP = 7
	            room_goto(Battle)
	        }
		}
    }
    if(frame <= 0 and PixelFade == -1) PixelFade = 0
	
	if(PixelFade == -1 and Sel == 4)
	{
		Options[1] = TempVal[0]
		Options[4] = TempVal[1]
		Options[5] = TempVal[2]
		Options[6] = TempVal[3]
		Options[7] = TempVal[4]
	}
}

