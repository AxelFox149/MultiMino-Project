/// @description GameMode

if(!(gameover or pause) and instance_exists(Control))
{
	if(Top)
	{
	    GOType = 0
	    GOSecuence()
	}
	
	switch(GMode)
	{
	    case 0:
	        //Endless
	        break;
    
	    case 4:
	        //Sprint
	        if((QueueMode != 6 and lines >= 40) or (QueueMode == 6 and lines >= 20))
	        {
	            GOType = 5
				GameWin = true
	            GOSecuence()
	        }
	        break;
        
	    case 6:
	        //Survival
	        var RND
	        if(Timer <= 0)
			{
				
				Timer = irandom_range(360,480)
			}
	        else if(!Control.update) Timer --
        
	        if(Control.stage == 3 and InGarb != 0 and Control.n == 0)
	        {
	            Control.stage = 4

	            RND = irandom(9)
	            var i, j;
	            for(j = 0; j < 10; j++)
	            {
	                if(instance_exists(Placed)) with(Placed)
					{
						y    -= 64
						Posy --
					}
	                
					for(i = 0; i <= 9; i++)
	                {
	                    if(i == RND) continue;
                    
	                    with(instance_create_depth(576 + i * 64, 1344, -7 ,Placed))
	                    {
	                        CColor = 90
						
	                        if(Options[1] <  14) image_blend = ColorPal[CColor]
		                    else                
							{
								image_blend = c_white
								image_index = -1
							}
	                    }
	                }

	                InGarb --
	                if (InGarb == 0 or i == 9)
	                {
	                    ReadBoard(false, Control)
	                    break
	                }
	            }
	        }
        
	        if(Timer == 0)
	        {
	            if(lines <= 50)                  RND = irandom_range(1,2)
	            if(lines <= 100 and lines > 50)  RND = irandom_range(1,3)
	            if(lines <= 150 and lines > 100) RND = irandom_range(1,4)
	            if(lines <= 200 and lines > 150) RND = irandom_range(2,4)
	            if(lines > 200)                  RND = irandom_range(3,5)
	            InGarb += RND;
            
	        }
	        break;
        
	    case 5:
	    case 7:
	    case 9:
	        //Time Based
	        with(Control)
	        {
	            if(array_equals(Time,Zero) and !update) 
	            {
	                with(other) {GOType = 1; GOSecuence()}
	            }
	        }
	        break;
        
	    case 10:
	        //CPU Battle
	        var RND
        
	        if(Control.stage == 3 and InGarb != 0 and Control.n == 0)
	        {
	            Control.stage = 4
	            instance_activate_object(Placed)
	            var i, j;
				
	            for(j = 0; j < 10; j++)
	            {
	                if(PrevR1 == -1) RND = irandom(9)
	                else
	                {
	                    if((irandom(3) + 1) < 4) RND = PrevR1
	                    else                     RND = irandom(9)
	                }
                
	                PrevR1 = RND
                
	                if(instance_exists(Placed)) with(Placed)
					{
						Posy --
						y -= 64
					}
					
	                for(i = 0; i <= 9; i++)
	                {
	                    if(i == RND) continue;
                    
	                    with(instance_create_depth(128 + i * 64, 1344, -7,Placed))
	                    {
	                        CColor = 90
	                        image_blend = ColorPal[CColor]
	                    }
	                }

	                InGarb --
	                if (InGarb == 0 or j == 9)
	                {
	                    ReadBoard(false, Control)
	                    with(Control)
	                    {
	                        var i,j;
	                        instance_destroy(Placed)

	                        for(i = 15; i <= 39; i++)
	                        {
	                            for(j = 0; j <= BoardWidth; j++)
	                            {
	                                XOff = BoardStart + (64 * j)
	                                YOff =      -1152 + (64 * i)
	                                
									if(board[i][j] != 0)
	                                {
	                                    with(instance_create_depth(XOff, YOff, -7, Placed)) Flash = false
	                                }
	                            }
	                        }
	                    }
						
						IsClosedCheck(Placed)
						
	                    Insert1 = true
	                    break
	                }
	            }
	        }
			
	        if(EnControl.stage == 3 and EnGarb != 0 and EnControl.n == 0)
	        {
	            EnControl.stage = 4
	            instance_activate_object(EnPlaced)    
            
	            var i, j;
	            for(j = 0; j < 10; j++)
	            {
	                if(instance_exists(EnPlaced)) with(EnPlaced)
					{
						Posy --
						y -= 64
					}
					
	                if(PrevR2 == -1) RND = irandom(9)
	                else
	                {
	                    if((irandom(3) + 1) < 4) RND = PrevR2
	                    else                     RND = irandom(9)
	                }
                    
	                PrevR2 = RND
                
	                for(i = 0; i <= 9; i++)
	                {
	                    if(i == RND) continue;
                    
	                    with(instance_create_depth(1024 + i * 64, 1344, -7,EnPlaced))
	                    {
	                        CColor = 90
	                        image_blend = ColorPal[CColor]
	                    }
	                }

	                EnGarb --
	                if (EnGarb == 0 or i == 9)
	                {
	                    ReadBoard(false, EnControl)
	                    with(EnControl) 
	                    {
	                        var i,j;
	                        instance_destroy(EnPlaced)

	                        for(i = 15; i <= 39; i++)
	                        {
	                            for(j = 0; j <= BoardWidth; j++)
	                            {
	                                XOff = BoardStart + (64 * j)
	                                YOff =      -1152 + (64 * i)
	                                if(board[i][j] != 0)
	                                {
	                                    with(instance_create_depth(XOff, YOff, -7, EnPlaced)) Flash = false
	                                }
	                            }
	                        }
	                    }
						IsClosedCheck(EnPlaced)
	                    Insert2 = true
	                    break
	                }
	            }
	        }
        
	        break;
    
	    case 8:
	        //Master
	        if((lines >= 200 and QueueMode < 5) or (lines >= 150 and QueueMode > 5))
	        {
				GameWin = true
	            GOType = 11
	            GOSecuence()
	        }
	        break;
        
	    case 11:
		case 12:
		case 13:
		case 15:
			break;
            
	    default:
	        //Marathon
	        if(lines >= LevelCap * 10)
	        {
				GameWin = true
				
				switch(GMode)
				{
					case 1:
						switch(QueueMode)
						{
							case 0: GOType =  6;break; //Tetris
							case 1: GOType =  7;break; //Pentris
							case 2: GOType =  8;break; //Multris
							case 3: GOType =  5;break; //Tetris+
							case 4: GOType =  8;break; //Pentris+
							case 5: GOType =  9;break; //Polytris
							case 6: GOType = 10;break; //Hextris
						}
						break
						
					case 2:
						switch(QueueMode)
						{
							case 0: GOType =  7;break; //Tetris
							case 1: GOType =  8;break; //Pentris
							case 2: GOType =  9;break; //Multris
							case 3: GOType =  6;break; //Tetris+
							case 4: GOType =  9;break; //Pentris+
							case 5: GOType = 10;break; //Polytris
							case 6: GOType = 10;break; //Hextris
						}
						break
						
					case 3:
						switch(QueueMode)
						{
							case 0: GOType =  8;break; //Tetris
							case 1: GOType =  9;break; //Pentris
							case 2: GOType = 10;break; //Multris
							case 3: GOType =  7;break; //Tetris+
							case 4: GOType = 10;break; //Pentris+
							case 5: GOType = 11;break; //Polytris
							case 6: GOType = 11;break; //Hextris
						}
						break
						
					default:
						GOType = 0
						break
				}
	            GOSecuence()
	        }
	        break;
	}
}

///Spin Clear Game Mode

if !(gameover or pause) and GMode == 7 and instance_exists(Control)
{
    if!(Wait)
    {
            var i, str;
            with(Placed)
			{
				y -= 64
				Posy --
			}
            
            for(i = 0; i <= 9; i++)
            {
                str = SMat[Fila]
                
                if(string_char_at(str, (i * 2) + 1) == "0") continue
                
                with(instance_create_depth(576 + i * 64, 1344, -7,Placed))
                {
                    CColor = 90
                    
                    if(Options[1] <  14)
					{
						image_blend = ColorPal[CColor]
						var h,s,v, col = image_blend;
    
						h = colour_get_hue(col)
						s = colour_get_saturation(col)
						v = colour_get_value(col)

						v -= v * (0.2)
    
						col = make_colour_hsv(h,s,v)

						image_blend = col
					}
                    else                
					{
						image_blend = c_white
						
						image_blend = $DDDDDD
						image_index = -1
					}
                }
            }
        Fila ++
        
        if(Fila > 9)
        {
            Wait = true
            
            instance_activate_object(Polyminoe)
            
            with(Control)
            {
                var i;
                
                repeat(6) ds_stack_push(Stack, 0)
                
                for(i = (string_length(other.SQueue)/3) - 1; i >= 0; i--)
                {
                    var num;
                    
                    num = real(string_char_at(other.SQueue, (i * 3) + 1) + string_char_at(other.SQueue, (i * 3) + 2))
                    
                    ds_stack_push(Stack, num)
                }
            
                var CurPc = RndPiece()
        
                with(Polyminoe)
				{
					CurrentPiece = CurPc
					image_index  = 0
					sprite_index = PieceIndex[CurrentPiece]
					if((CurrentPiece >= 6 and CurrentPiece < 16) or (CurrentPiece >= 28 and CurrentPiece < 61) or (CurrentPiece >= 80 and CurrentPiece <= 87))
					{
						x += 32
						y += 32
					}
				}
                for(i = 0; i <= 4; i++) Queue[i] = RndPiece()
				
				if(Options[9] and (Options[1] == 16 or Options[1] == 17) and Queue[0] != 0 and Queue[0] < 30)
				{
					audio_play_sound(TGMSound[Queue[0] - 1],10,false)
				}
            }
        }
		ReadBoard(true, Control);
    }
    else
    {
        if (instance_exists(Polyminoe) and Polyminoe.CurrentPiece == 0)
        {
            ComboArt.Counter   = -1
            Control.ComboCount = -1
            if(instance_exists(Placed))
            {
                with(Placed)
                {
                    if(!Vanish)
                    {
                        Vanish = true
                        Flash  = true
                        alpha  = 1
                        
                        with(ComboArt){
                            Miss = true
                            MissFrame = 0
                            DespVel = 0
                        }
                    }
                }
            }
            else
            {
                instance_deactivate_object(Polyminoe)
                Fila = 0
                Wait = false
                with(Control)
                {
                    ds_stack_clear(Stack)
                    if(!ComboArt.Miss)
                    {
						if(other.FirstBag and other.index < 34)		 Time[1] += 10
						else if(other.FirstBag and other.index < 68) Time[1] += 7
						else										 Time[1] += 5
                        
						if(Time[1] >= 60) Time[0] ++
                        Clears ++
                    }
                }
				
				
                if(!PlayMode)
				{
					RndT = Boards[index]
					index ++
					
					if(index == 101)
					{
						index = 0
						FirstBag = false
					}
				
	                if(index == 0) CreateQueue(0)
				}
				else
				{
					with(Rec_Play_obj)
					{
						other.RndT = _usedpieces[| other.index]
					}
					index++
				}
				
				if(instance_exists(Rec_Play_obj))
				{
					with(Rec_Play_obj)
					{
						if(_isRecording) ds_list_add(_usedpieces, other.RndT)
					}
				}	
                
				/*
                if(RndT == -1)
				{
					RNDBoard()
					isDouble = false
					
				}*/
                //else
                //{
                    ini_open("SpinClear_Def.ini")
                    
                    var i, key, b_ID = string(RndT);
                    for(i = 0; i <= 9; i++)
                    {
                        key = "SMat[" + b_ID + " , " + string(i) + "]"
                        SMat[i] = ini_read_string("SpinMatrix",key,"1 1 1 1 1 1 1 1 1 1")
						with(Control) board[39 - i] = ZeroRow
                    }
					
					
                    key      = "SQueue[" + b_ID + "]"
                    SQueue   = ini_read_string("SpinQueue",key,"01 ")
                    isDouble = bool(ini_read_real("DoubleTwist","ID_" + b_ID,0))
                    
                    ini_close()
                //}
            }
        }
    }
}

///Editor Mode

if(GMode == 11 and instance_exists(Control) and !pause and !gameover)
{
    if(IsEdit)
    {
			if(_CurrentGP < 0)
			{
				CurPosX = mouse_x;
				CurPosY = mouse_y;
			}
			else
			{
				CurPosX += gamepad_axis_value(_CurrentGP,gp_axislh) * 10
				CurPosY += gamepad_axis_value(_CurrentGP,gp_axislv) * 10
				
				var axVal = gamepad_axis_value(_CurrentGP,gp_axisrv)
				
				if(abs(axVal) > 0.5)
				{
					if(!MovedFlag)
					{
						MovePoiter += 1 * sign(axVal)
					
						MovePoiter = (MovePoiter + 3) mod 3
						MovedFlag  = true
					}
				}
				else MovedFlag = false
			}
			
			CurX = clamp(floor(CurPosX / 64) * 64,  576, 1152);
			CurY = clamp(floor(CurPosY / 64) * 64,  256, 1344);
			
			CurPosX = clamp(CurPosX,  576, 1216);
			CurPosY = clamp(CurPosY,  256, 1408);
			
            var Izq  = keyboard_check_pressed(vk_left)   or gamepad_button_check_pressed(_CurrentGP,gp_padl)
            var Der  = keyboard_check_pressed(vk_right)  or gamepad_button_check_pressed(_CurrentGP,gp_padr)
            var Arr  = keyboard_check_pressed(vk_up)     or gamepad_button_check_pressed(_CurrentGP,gp_padu)
            var Aba  = keyboard_check_pressed(vk_down)   or gamepad_button_check_pressed(_CurrentGP,gp_padd)
			var Alt  = keyboard_check(vk_alt)			 or gamepad_button_check(_CurrentGP,gp_shoulderrb)
			var Ctrl = keyboard_check(vk_control)		 or gamepad_button_check(_CurrentGP,gp_shoulderlb)
			var Next = keyboard_check_pressed(ord("D"))  or gamepad_button_check_pressed(_CurrentGP,gp_shoulderr)
			var Prev = keyboard_check_pressed(ord("A"))  or gamepad_button_check_pressed(_CurrentGP,gp_shoulderl)
			var Save = keyboard_check_pressed(ord("S"))  or gamepad_button_check_pressed(_CurrentGP,gp_face3)
			
			var SelFlag = gamepad_button_check_pressed(_CurrentGP,gp_face4)
			
			var Select  = keyboard_check_pressed(vk_enter) or (Ctrl and gamepad_button_check_pressed(_CurrentGP,gp_select))
			
			var F1 = keyboard_check_pressed(vk_f1)
			var F2 = keyboard_check_pressed(vk_f2)
			var F3 = keyboard_check_pressed(vk_f3)
			
			var PlaceBlock = mouse_check_button(mb_left)  or gamepad_button_check(_CurrentGP,gp_face2)
			var RemovBlock = mouse_check_button(mb_right) or gamepad_button_check(_CurrentGP,gp_face1)
            
            //if(CurX > 1152) CurX = 1152
            //if(CurY <  256) CurY =  256
			
            //switch(mouse_button)
            //{
                //case mb_left:
                if(PlaceBlock)
				{
					if(place_free(CurX, CurY))
                    {
                        instance_create_depth(CurX,CurY, -7, Placed)
                        Box[(CurY - 256) / 64,(CurX - 576)/ 64] = 1
                    }
                    //break
				}   
                //case mb_right:
				if(RemovBlock)
				{
                    var ToDes = instance_place(CurX, CurY, Placed);
                    
                    if(ToDes != noone)
                    {
                        instance_destroy(ToDes)
                        Box[(CurY - 256) / 64,(CurX - 576)/ 64] = 0
                    }
                    //break
				}
            //}
            
			if(F1 or (MovePoiter == 0 and SelFlag)) OSpin = !OSpin
			if(F2 or (MovePoiter == 1 and SelFlag)) G20	  = !G20
			if(F3 or (MovePoiter == 2 and SelFlag)) LockD = !LockD
			
            if(Ctrl)
            {
                if(Save and instance_exists(Placed))
                {
                    SaveSlot()
                    SaveFlag = true
                    alarm_set(2, 90)
                }
                
                if(Arr or Aba or Der or Izq)
                {
                    if(instance_exists(Placed))
                    {
                        if(Arr) with(Placed)
                        {
                            y    -= 64
							Posy --
                            if(y < 256)
							{
								y    += 1152
								Posy += 18
							}
                        }
                        if(Aba) with(Placed)
                        {
                            y	 += 64
							Posy ++
                            if(y > 1344)
							{
								y	 -= 1152
								Posy -= 18
							}
                        }
                        if(Der) with(Placed)
                        {
                            x    += 64
							Posx ++
                            if(x > 1152)
							{
								x	 -= 640
								Posx -= 10
							}
                        }
                        if(Izq) with(Placed)
                        {
                            x	 -= 64
							Posx --
                            if(x < 576)
							{
								x	 += 640
								Posx += 10
							}
                        }
                        
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
                }
            }
            else
            {
				if(Alt)
				{
					if(Izq) PieceArr[Pointer] = (PieceArr[Pointer] + 85) mod 90
	                if(Der) PieceArr[Pointer] = (PieceArr[Pointer] + 95) mod 90
				}
                else
				{
					if(Izq) PieceArr[Pointer] = (PieceArr[Pointer] + 89) mod 90
	                if(Der) PieceArr[Pointer] = (PieceArr[Pointer] + 91) mod 90
				}
				if(Arr) Pointer = max(0, Pointer - 1)
                if(Aba) Pointer = min(8, Pointer + 1)
            }
            
            if(Next or Prev)
            {
                
                if(Next) SpinBoard = min(SpinBoard + 1, 15)
                if(Prev) SpinBoard = max(SpinBoard - 1, 0)
                
                var i;
                
                for(i = 0; i <= 8; i++) PieceArr[i] = 0
                 
                instance_destroy(Placed)
                LoadSlot()
            }
            
            if(Select)
            {
                instance_activate_object(Polyminoe)
                var NPIECE;
				with(Control)
                {
                    ReadBoard(true, Control)
                    var i;
                    repeat(8) ds_stack_push(Stack, 0)
                    for(i = 0; i <= 9; i++) ds_stack_push(Stack,other.PieceArr[9 - i])
                    NPIECE = RndPiece()
                    for(i = 0; i <= 4; i++) Queue[i] = RndPiece()      
                    score = 0
					Hold  = 0
                    CH    = true
					//BTB	  = 1
					//Bonus = false
					if(G20) level = 20
					else	level = 1
                    Time[0] = 0
                    Time[1] = 0
                    Time[2] = 0
					if(Options[9] 
					and (Options[1] == 16 or Options[1] == 17) 
					and Queue[0] != 0 
					and Queue[0] < (array_length(TGMSound) + 1))
					{
						audio_play_sound(TGMSound[Queue[0] - 1],10,false)
					}
                }
                with(Polyminoe)
                {
					CurrentPiece = NPIECE
					sprite_index = PieceIndex[CurrentPiece]
                    x = 864
                    y = 96
                    image_index = 0
                    alarm[0]    = -1
                    MoveTimer   = 1
                    ML          = 15
                    PlaceTimer  = ResetTime
					
					if(G20) FallSpeed = 0
					else	FallSpeed = 60
                    
                    Drop = false
                    
                    BC = 255 - PlaceTimer * 4
                    if((CurrentPiece >= 6 and CurrentPiece < 16) or (CurrentPiece >= 28 and CurrentPiece < 61) or (CurrentPiece >= 80 and CurrentPiece <= 87))
					{
						x += 32
						y += 32
					}
                }
                lines  = 0
				level  = 1
                IsEdit = false
                tile_layer_hide(-3)
            }
        }
        else
        {
			var Ctrl   = keyboard_check(vk_control)		  or gamepad_button_check(_CurrentGP,gp_shoulderlb)
			var Select = keyboard_check_pressed(vk_backspace) or (Ctrl and gamepad_button_check_pressed(_CurrentGP,gp_select))
			
            if(Select or BOGM)
            {
                if(!instance_exists(Polyminoe)) instance_activate_object(Polyminoe)
                
				with(Polyminoe)
				{
					sprite_index = 0
					CurrentPiece = 0
				}
				
				instance_deactivate_object(Polyminoe)
                instance_destroy(Placed)
                ComboArt.ComboDraw = false
                ComboArt.Counter   = -1
                with(Control)
                {
                    Warning    =  false
                    ComboCount = -1
                    stage      =  0
                    n          =  0
					update     =  0
					frame	   = -0.15
					
                    ds_stack_clear(Stack)
                    var i, j, XOff, YOff;
                    for(i = 0; i <= 4; i++) Queue[i] = 0
                    
                    for(i = 0; i < 40; i++)
                    {
                        for(j = 0; j < 10; j++)
                        {
                            if(i > 21) board[i][j] = other.Box[(i - 22),j] * 90
                            else       board[i][j] = 0
							
							XOff = BoardStart + (64 * j)
				            YOff =      -1152 + (64 * i)
				            if(board[i][j] != 0) with(instance_create_depth(XOff, YOff, -7, Placed)) Flash = false
                        }
                    }
                }
                tile_layer_show(-3)
                BOGM   = false
                IsEdit = true
            }
        }
}

///Seleccion durante GameOver

if(gameover)
{
    var Up = keyboard_check_pressed(vk_up) or gamepad_button_check_pressed(_CurrentGP, gp_padu)
    var Dn = keyboard_check_pressed(vk_down) or gamepad_button_check_pressed(_CurrentGP, gp_padd)
	var Sc = keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(_CurrentGP, gp_face2)
    
    if(Up and Sel != 0) Sel --
    if(Dn and Sel != 1) Sel ++
	
	if(Sc and (GMode < 10 or GMode >= 12) and DrawDes)
	{
	    Fade = true
	    depth = -15
	}

}

///////////////////////////////////////////////////////////

if(GMode == 15 and instance_exists(Control))
{
    if(IsEdit)
    {
            CurX = max(floor(mouse_x / 64) * 64, 576);
            CurY = min(floor(mouse_y / 64) * 64,1344);
            
            var Izq = keyboard_check_pressed(vk_left)
            var Der = keyboard_check_pressed(vk_right)
            var Arr = keyboard_check_pressed(vk_up)
            var Aba = keyboard_check_pressed(vk_down)
			var Alt = keyboard_check(vk_alt)
			
			var ContUp = keyboard_check_pressed(ord("1"))
			var ContDn = keyboard_check_pressed(ord("2"))
			
			var F1 = keyboard_check_pressed(vk_f1)
			var F2 = keyboard_check_pressed(vk_f2)
			
			if(ContDn) BoardCount = min(100, BoardCount + 1)
			if(ContUp) BoardCount = max(54, BoardCount - 1)
            
			if(F1) LockD = !LockD
			if(F2) OSpin = !OSpin
			
            if(CurX > 1152) CurX = 1152
            if(CurY <  448) CurY =  448
    
            switch(mouse_button)
            {
                case mb_left:
                    if(place_free(CurX, CurY))
                    {
                        instance_create(CurX,CurY,Placed)
                        Box[(CurY - 448) / 64,(CurX - 576)/ 64] = 1
                    }
                    break
                    
                case mb_right:
                    var ToDes = instance_place(CurX, CurY, Placed);
                    
                    if(ToDes != noone)
                    {
                        instance_destroy(ToDes)
                        Box[(CurY - 448) / 64,(CurX - 576)/ 64] = 0
                    }
                    break
            }
            
            if(keyboard_check(vk_control))
            {
                if(keyboard_check_pressed(ord("S")) and instance_exists(Placed))
                {
                    //if(file_exists("SpinBoard.sav")) file_delete("SpinBoard.sav")
                    
                    ini_open("SpinBoard.sav")
                    var i,j,s,p, WriteTo;
                    
                    if(SpinBoard != -1) WriteTo = SpinBoard
                    else                WriteTo = BoardCount
                    
                    s = ""
                    p = ""
                    for(i = 0; i < 9; i++)
                    {
                        if(PieceArr[i] < 10) p = "0" + string(PieceArr[i]) + " "
                        else                 p =       string(PieceArr[i]) + " "
                        
                        if(p == "00 ") break
                        
                        s = s + p
                    }
                    ini_write_string("SpinQueue", "SQueue[" + string(WriteTo) + "]",s)
                    
                    //for(i = 14; i >= 5; i--)
					for(i = 5; i <= 14; i++)
                    {
                        s = ""
                        for(j = 0; j <= 9; j++)
                        {
                            s = s + string(Box[i, j])
                            
                            if(j != 9) s = s + " "
                        }
                        ini_write_string("SpinMatrix","SMat[" + string(WriteTo) + " , " + string(i - 5) + "]",s)
                    }
                    ini_close()
                    
                    SaveFlag = true
                    alarm_set(2, 90)
                }
                
                if(Arr or Aba or Der or Izq)
                {
                    if(instance_exists(Placed))
                    {
                        if(Arr) with(Placed)
                        {
                            y -= 64
                            if(y < 448) y+= 960
                        }
                        if(Aba) with(Placed)
                        {
                            y += 64
                            if(y > 1344) y-= 960
                        }
                        if(Der) with(Placed)
                        {
                            x += 64
                            if(x > 1152) x-= 640
                        }
                        if(Izq) with(Placed)
                        {
                            x -= 64
                            if(x < 576) x += 640
                        }
                        
                        for(i = 5; i <= 14; i++)
                        {
                            for(j = 0; j <= 9; j++)
                            {
                                CX = 576 + (j * 64)
                                CY = 448 + (i * 64)
                                if(place_free(CX,CY)) Box[i,j] = 0
                                else                  Box[i,j] = 1
                            }
                        }
                    }
                }
            }
            else
            {
                if(Alt)
				{
					if(Izq) PieceArr[Pointer] = (PieceArr[Pointer] + 85) mod 90
	                if(Der) PieceArr[Pointer] = (PieceArr[Pointer] + 95) mod 90
				}
                else
				{
					if(Izq) PieceArr[Pointer] = (PieceArr[Pointer] + 89) mod 90
	                if(Der) PieceArr[Pointer] = (PieceArr[Pointer] + 91) mod 90
				}
				if(Arr) Pointer = max(0, Pointer - 1)
                if(Aba) Pointer = min(8, Pointer + 1)
            }
            
            if(keyboard_check_pressed(ord("D")) or keyboard_check_pressed(ord("A")) or keyboard_check_pressed(ord("L")))
            {
                
                if(keyboard_key == ord("D")) SpinBoard = min(SpinBoard + 1, MaxBoard)
                if(keyboard_key == ord("A")) SpinBoard = max(SpinBoard - 1, -1)
                
                var i;
                
                for(i = 0; i <= 8; i++) PieceArr[i] = 0
                 
                instance_destroy(Placed)
                if(SpinBoard != -1)
                {
                    ini_open("SpinClear_Def.ini")
                    var j, str, num;
                    for(j = 0; j <= 9; j++)
                    {
                        str = ini_read_string("SpinMatrix","SMat[" + string(SpinBoard) +  " , " + string(j) + "]", "1 1 1 1 1 1 1 1 1 1")
                        for(i = 0; i <= 9; i++)
                        {
                            if(string_char_at(str, (i * 2) + 1) == "0") continue
                            
                            instance_create(576 + i * 64, 768 + (64 * j),Placed)
                        }
                    }
                    str = ini_read_string("SpinQueue","SQueue[" + string(SpinBoard) + "]", "01 ")
                    for(i = (string_length(str)/3) - 1; i >= 0; i--)
                    {
                        num = real(string_char_at(str, (i * 3) + 1) + string_char_at(str, (i * 3) + 2))
                        
                        PieceArr[i] = num
                    }
                    ini_close()
                }
				else if(keyboard_check_pressed(ord("L")))
				{
					ini_open("SpinBoard.sav")
                    var j, str, num;
                    for(j = 0; j <= 9; j++)
                    {
                        str = ini_read_string("SpinMatrix","SMat[" + string(BoardCount) +  " , " + string(j) + "]", "1 1 1 1 1 1 1 1 1 1")
                        for(i = 0; i <= 9; i++)
                        {
                            if(string_char_at(str, (i * 2) + 1) == "0") continue
                            
                            instance_create_depth(576 + i * 64, 768 + (64 * j), -7,Placed)
                        }
                    }
                    str = ini_read_string("SpinQueue","SQueue[" + string(BoardCount) + "]", "01 ")
                    for(i = (string_length(str)/3) - 1; i >= 0; i--)
                    {
                        num = real(string_char_at(str, (i * 3) + 1) + string_char_at(str, (i * 3) + 2))
                        
                        PieceArr[i] = num
                    }
                    ini_close()
				}
				
                for(i = 0; i <= 14; i++)
                {
                    for(j = 0; j <= 9; j++)
                    {
                        CX = 576 + (j * 64)
                        CY = 448 + (i * 64)
                        if(place_free(CX,CY)) Box[i,j] = 0
                        else                  Box[i,j] = 1
                    }
                }
            }
            
            if(keyboard_check_pressed(vk_enter))
            {
                var NPIECE
				instance_activate_object(Polyminoe)
                with(Control)
                {
                    ReadBoard(true, Control)
                    var i;
                    repeat(8) ds_stack_push(Stack, 0)
                    for(i = 0; i <= 9; i++) ds_stack_push(Stack,other.PieceArr[9 - i])
                    NPIECE = RndPiece()
                    for(i = 0; i <= 4; i++) Queue[i] = RndPiece()      
                    score = 0
					Hold  = 0
                    CH    = true
					if(G20) level = 20
					else	level = 1
                    Time[0] = 0
                    Time[1] = 0
                    Time[2] = 0
					if(Options[9] 
					and (Options[1] == 16 or Options[1] == 17) 
					and Queue[0] != 0 
					and Queue[0] < (array_length(TGMSound) + 1))
					{
						audio_play_sound(TGMSound[Queue[0] - 1],10,false)
					}
                }
                with(Polyminoe)
                {
					CurrentPiece = NPIECE
                    sprite_index = PieceIndex[CurrentPiece]
                    x = 864
                    y = 96
                    image_index = 0
                    alarm[0]    = -1
                    MoveTimer   = 1
                    ML          = 15
                    PlaceTimer  = ResetTime
					
					if(G20) FallSpeed = 0
					else	FallSpeed = 60
                    
                    Drop = false
                    
                    BC = 255 - PlaceTimer * 4
                    if((CurrentPiece >= 6 and CurrentPiece < 16) or (CurrentPiece >= 28 and CurrentPiece < 61) or (CurrentPiece >= 80 and CurrentPiece <= 87))
					{
						x += 32
						y += 32
					}
                }
                lines = 0
                IsEdit = false
            }
        }
        else
        {
            if(keyboard_check_pressed(vk_backspace))
            {
                if(!instance_exists(Polyminoe)) instance_activate_object(Polyminoe)
                Polyminoe.sprite_index = Point
				Polyminoe.CurrentPiece = 0
                instance_deactivate_object(Polyminoe)
                instance_destroy(Placed)
                ComboArt.Counter = -1
                with(Control)
                {
                    ComboCount = -1
                    stage      =  2
                    n          =  0
                    ds_stack_clear(Stack)
                    var i, j;
                    for(i = 0; i <= 4; i++) Queue[i] = 0
                    
                    for(i = 0; i < 40; i++)
                    {
                        for(j = 0; j < 10; j++)
                        {
                            if(i > 24) board[i][j] = other.Box[(i - 25),j] * 90
                            else       board[i][j] = 0
                        }
                    }
                }
                
                var i, j, CX, CY;
                for(i = 0; i < 15; i++)
                {
                    for(j = 0; j < 10; j++)
                    {
                        CX = 576 + (j * 64)
                        CY = 448 + (i * 64)
                        if(Box[i,j]) instance_create_depth(CX, CY, -7, Placed)
                    }
                }
                IsEdit = true
            }
        }
}
