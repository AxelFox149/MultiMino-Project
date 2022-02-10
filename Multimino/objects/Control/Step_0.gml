/// @description Control del juego

if((keyboard_check(CurrentButtons[8]) or gamepad_button_check(_CurrentGP, CurJPadButtons[8])) 
and !pause and GMode != 10 and GMode != 11) ResetCounter ++
else										ResetCounter = 0

if(PlayMode)
{
	with(Rec_Play_obj)
	{
		if(_index < ds_grid_height(_inputSequence) and _inputSequence[# 0, _index] == _frame)
		{
			Control.HPress		= _inputSequence[# 11, _index]
			Control.RRight		= _inputSequence[# 12, _index]
			Control.RLeft		= _inputSequence[# 13, _index]
			Control.RDoble		= _inputSequence[# 14, _index]
			Control.LCharge		= _inputSequence[# 15, _index]
			Control.RCharge		= _inputSequence[# 16, _index]
		}
	}
}

///Hold to reset
#region Reset Sequence
if(ResetCounter > 30)
{
    with(GameMode)
    {
        Fade = 1
        depth = -15
        
        Sel = 0
    }
	
	if(instance_exists(EnControl)) with(EnControl) ds_stack_destroy(Stack)
	ds_stack_destroy(Stack)
	
	if(instance_exists(Rec_Play_obj))
	{
		with(Rec_Play_obj)
		{
			ds_grid_destroy(_inputSequence)
			ds_list_destroy(_usedpieces)
		}
		
		instance_destroy(Rec_Play_obj)
	}
	
    instance_destroy(Polyminoe)
    instance_destroy(Enemy)
    instance_destroy(Placed)
    instance_destroy(EnControl)
    instance_destroy(EnPlaced)
	audio_stop_all()
    instance_destroy()
}
#endregion

///Droped
#region Check for line clears
if(update and stage == 0)
{
    var i, j, line
    
    for(i = 10; i <= 39; i++)
    {
        line = true
        for(j = 0; j <= BoardWidth; j++)
        {
            XOff = BoardStart + (64 * j)
            YOff =      -1152 + (64 * i)
            if(place_meeting(XOff, YOff,Polyminoe))
            {
                board[i][j] = Polyminoe.CurrentPiece
                //instance_create(XOff, YOff, Placed)
				instance_create_depth(XOff, YOff, -7, Placed)
            }
            if(board[i][j] == 0) line = false
        }
        if(line)
        {
            LC[n] = i
            n++
        }
    }
    if(n != 0)
    { 
        ComboCount += 1
        
        if(MaxCombo < ComboCount) MaxCombo = ComboCount
        
		if(Options[9])
		{
	        if(PSpin)       
			{
				if!(Options[1] == 16 or Options[1] == 17) audio_play_sound(GSounds[2],10,false)
				else									  audio_play_sound(TGM_TSpin, 10,false)
			}
			else if(n >= 4) audio_play_sound(GSounds[1],10,false)
	        else            audio_play_sound(GSounds[0],10,false)
		}
		
		if(Bonus and (n >= 4 or PSpin)) BTB = 1.5
        else						    BTB = 1

        if(n < 4 and !PSpin) Bonus = false
        else                 Bonus = true
		
        for(i = 0; i < n; i++) instance_deactivate_region(BoardStart,(LC[i]* 64) - 1152,BoardWidth * 64,62,true,true)
        
        if(instance_exists(Placed)) AC = false
        else AC = true
        
        //instance_activate_object(Placed)
        instance_activate_object(Polyminoe)
        instance_activate_object(Wall)
        
        if(GMode == 6 or GMode == 10)
        {
            var LineReturn = 0;
			var isAC = AC;
			var Cond = !Mini and PSpin
			var lnum = n
			var CCount = abs(ComboCount)
			var IsBon  = real(Bonus)
            
			
			with(GameMode)
			{
	            if(isAC)   LineReturn  = GarbageSend[Cond, 7]
				else	   LineReturn  = GarbageSend[Cond, lnum] + IsBon
				LineReturn            += ComboSend[CCount]
			
	            if(GMode == 6)		   InGarb = max(0, InGarb - LineReturn)
	            else
	            {
					InGarb -= LineReturn
	                if(InGarb < 0)
	                {
						EnGarb += abs(InGarb)
	                    InGarb = 0
	                }
	            }
			}
        }
    }
    else    ComboCount = -1
    
    if(Super)		Mini = false
    if(GMode != 10) stage ++
    else            stage = 2
    
    with(ComboArt)
    {
        Counter    = other.ComboCount
        ComboFrame = 0
    }
    
    if(n >= 4 or PSpin or AC)
    {
        with(ComboArt)
        {
            n     = other.n
            PSpin = other.PSpin
            Mini  = other.Mini
            Super = other.Super
            BTB   = other.BTB
            LP    = Polyminoe.CurrentPiece
            
            LettFrame = AnimOffset[LP] * 9
            SpinFrame = 0
			PopFrame  = 0
            BTFrame   = 0
            TrisFrame = 0
            
            if(other.AC)
            {
                AC        = true
                ACFrame   = 0
                ACCounter = 0
            }
            
            ComboDraw = true
            alarm[0] = 105
        }
    }
    else if(GMode == 7)
	{
		with(Polyminoe)
		{
			CurrentPiece = 0
			sprite_index = Point
		}
	}
	CH = true
    instance_deactivate_object(Polyminoe)
}
#endregion

///IRS
#region IRS
if(update)
{
	if(!PlayMode)
	{
	    RLeft   = keyboard_check_pressed(CurrentButtons[6]) or gamepad_button_check_pressed(_CurrentGP, CurJPadButtons[6])
	    RRight  = keyboard_check_pressed(CurrentButtons[0]) or gamepad_button_check_pressed(_CurrentGP, CurJPadButtons[0])
		RDoble  = keyboard_check_pressed(CurrentButtons[7]) or gamepad_button_check_pressed(_CurrentGP, CurJPadButtons[7])
	    RCharge = keyboard_check(CurrentButtons[3]) or gamepad_button_check(_CurrentGP, CurJPadButtons[3])
		LCharge = keyboard_check(CurrentButtons[2]) or gamepad_button_check(_CurrentGP, CurJPadButtons[2])
	}

	var Press = RLeft or RRight or RDoble;
    
	if(GMode != 12)
	{
		if(RLeft) 
		{
			if(Queue[0] == 14 
			or (Queue[0] >= 53 and Queue[0] <= 55) 
			or (Queue[0] == 57 or  Queue[0] == 59) 
			or (Queue[0] == 32 or  Queue[0] == 32 or Queue[0] == 39) 
			or (Queue[0] >= 84 and Queue[0] <= 88)) NState ++
			else			    NState --
		}
		if(RRight)
		{
			if(Queue[0] == 14 
			or (Queue[0] >= 53 and Queue[0] <= 55) 
			or (Queue[0] == 57 or  Queue[0] == 59)
			or (Queue[0] == 32 or  Queue[0] == 34 or Queue[0] == 39) 
			or (Queue[0] >= 84 and Queue[0] <= 88)) NState --
			else			    NState ++
		}
		if(RDoble)NState += 2 
		
		if(Press and (Options[1] == 16 or Options[1] == 17) and Options[9]) audio_play_sound(TGM_IniRot,10,false)
	}
	else NState = 2
	
	NState = (NState + 4) mod 4
    
    if(LCharge){if(alarm_get(0) < 0) alarm[0] = Options[6]}
    else {alarm[0] = -1; LDASLoad = false}
	
	if(RCharge){if(alarm_get(2) < 0) alarm[2] = Options[6]}
    else {alarm[2] = -1; RDASLoad = false}
	
	
	/*if(PlayMode)
	{
		RLeft = false;
	    RRight= false;
		RDoble= false;
	}*/
}
#endregion

///Prepara la pieza siguiente
#region Reset to next piece
if(stage == 2)
{
    var i, temp;
    
    ClearBoard(Placed)
    SetScore()
    lines += n
    
	IsLevelUp = false
	
    temp = floor(lines / 10) + 1
    if(GMode == 8) temp += 20
    
    if(level < temp)
    {
        level = temp
        if !(level > LevelCap)
        {
			if(Options[1] == 15)
			{
	            with(Placed) 
	            {
	                image_index  = ((CColor - 1) mod 3) + (3 * ((level - 1) mod 10))
	                if(CColor  == 90) image_index = 90
	                Flash = true
	                alpha = 0.3
	            }
			}
			if(Options[9]) audio_play_sound(GSounds[9],10,false)
			
			IsLevelUp = true
        }
		else level = LevelCap
    }
    
    PSpin = false
    Mini  = false   
    Super = false
    AC    = false
    
    //update = false
    stage  = 3
    frame  = -0.15

	if(GMode != 12) alarm[1] = 5
    else			alarm[1] = 10
    
	
	
    if(!Warning and !array_equals(board[22], ZeroRow))
    {
        Warning = true
        if(Options[9] and !Options[10]) audio_play_sound(WarningSound,10,false)
		if(Options[10])
		{
			audio_stop_sound(CurrentMusic)
			
			audio_play_sound(music_Danger_Intro, 10, false)
			CurrentMusic = music_Danger_Intro
			//audio_play_sound(music_Classic_Danger, 10, true)
		}
    }
    else if(Warning and array_equals(board[26], ZeroRow))
	{
		Warning = false
		if(Options[10])
		{
			audio_stop_sound(CurrentMusic)
			CurrentMusic = NormalMusic
			audio_play_sound(CurrentMusic, 10, true)
		}
	}
    
    if(GMode == 10)IsClosedCheck(Placed)
}
#endregion

///Warning state
#region Warning
if(Warning and Options[10] and CurrentMusic == music_Danger_Intro)
{
	if(!audio_is_playing(music_Danger_Intro))
	{
		CurrentMusic = DangerMusic
		audio_play_sound(CurrentMusic, 10, true)
	}
}

if(GMode != 10 and !ComboArt.AMFlag)
{
    if(Warning and CShift != $0000FF)
    {
        CShift -= $111100
        TilesColour(CShift)
    }
    if(!Warning and CShift != $FFFFFF)
    {
        CShift += $111100
        TilesColour(CShift)
    }
}
#endregion

///Intercambio
#region Hold
if(!PlayMode) HPress = keyboard_check_pressed(CurrentButtons[4]) or gamepad_button_check_pressed(_CurrentGP, CurJPadButtons[4])

if(CH and !(pause or gameover) and HPress and GMode != 7 and GMode != 12 and !IsEdit)
{
	CH	  = false
	PSpin = false
	
    if(Hold == Point)
    {
        if(!update)
		{
			Hold = Polyminoe.CurrentPiece
			PieceReset(false,Polyminoe)
		}
        else
		{
			Hold = Queue[0]
			for(i = 0; i < 4; i++) Queue[i]  = Queue[i + 1]
			Queue[4] = RndPiece()
			
			if(instance_exists(Rec_Play_obj) and (GMode != 6 and GMode != 7 and GMode != 10 and GMode != 11))
			{
				with(Rec_Play_obj)
				{
					if(_isRecording) ds_list_add(_usedpieces, other.Queue[4])
				}
			}
		}
    }
    else
    {
        var Pivot
        Pivot = Hold
		
		if(!update)
		{
			Hold = Polyminoe.CurrentPiece
			Polyminoe.sprite_index = PieceIndex[Pivot]
			Polyminoe.CurrentPiece = Pivot
			PieceReset(true,Polyminoe)
		}
		else
		{
			Hold	 = Queue[0]
			Queue[0] = Pivot
		}
    }
    
	if(instance_exists(Polyminoe))
	{
	    with(Polyminoe)
	    {
	        var i;
	        for(i = 0; i <= 25; i ++)
	        {
				if(PieceCollision(x, y + (i * 64)))
	            {
	                DropY = y + ((i - 1) * 64)       
	                break
	            }
	        }
	    }
	}
	
    if(Options[9])
	{
		if(update and (Options[1] == 16 or Options[2] == 17)) audio_play_sound(TGM_IniHold,10,false)
		else audio_play_sound(GSounds[8],10,false)
	}
	
	//if(PlayMode) HPress = false
}
#endregion

///Pausa
#region Pause
if(!gameover and (keyboard_check_pressed(vk_escape) or gamepad_button_check_pressed(_CurrentGP, gp_start)))
{
    pause = !pause
    
    if(pause)
    {
        audio_pause_all()
		
		AlarmsHold[0] = alarm_get(0)
		AlarmsHold[1] = alarm_get(1)
		AlarmsHold[2] = alarm_get(2)
		
		alarm[0] = -1
		alarm[1] = -1
		alarm[2] = -1
		
        with(ComboArt)
		{
			AlarmsHold[0] = alarm_get(0)
			AlarmsHold[1] = alarm_get(1)
		}

		if(instance_exists(Polyminoe))
		{
			with(Polyminoe)
			{
				AlarmsHold[0] = alarm_get(0)
				AlarmsHold[1] = alarm_get(1)
				AlarmsHold[2] = alarm_get(2)
				AlarmsHold[3] = alarm_get(3)
				
				alarm[0] = -1
				alarm[1] = -1
				alarm[2] = -1
				alarm[3] = -1
			}
		}
    }
    else
	{
		audio_resume_all()
		
		alarm[0] = AlarmsHold[0]
		alarm[1] = AlarmsHold[1]
		alarm[2] = AlarmsHold[2]
		
		if(instance_exists(Polyminoe))
		{
			with(Polyminoe)
			{
				alarm[0] = AlarmsHold[0]
				alarm[1] = AlarmsHold[1]
				alarm[2] = AlarmsHold[2]
				alarm[3] = AlarmsHold[3]
			}
		}
	}
}
#endregion

///Retorno
#region Return
if(pause and (keyboard_check_pressed(vk_backspace) or gamepad_button_check_pressed(_CurrentGP, gp_select)))
{
    with(GameMode)
    {
        Fade = 1
        depth = -15
        
        Sel = 1
    }
	
	if(instance_exists(EnControl)) with(EnControl) ds_stack_destroy(Stack)
	ds_stack_destroy(Stack)
	
	if(instance_exists(Rec_Play_obj))
	{
		with(Rec_Play_obj)
		{
			ds_grid_destroy(_inputSequence)
			ds_list_destroy(_usedpieces)
		}
		
		instance_destroy(Rec_Play_obj)
	}
	
    instance_destroy(Polyminoe)
    instance_destroy(Enemy)
    instance_destroy(Placed)
    instance_destroy(EnControl)
    instance_destroy(EnPlaced)
    instance_destroy()
    audio_stop_all()
}
#endregion

if(instance_exists(Rec_Play_obj))
{
	with(Rec_Play_obj)
	{
		if(_isRecording)
		{
			_input[10] = Control.HPress
			_input[11] = Control.RRight
			_input[12] = Control.RLeft
			_input[13] = Control.RDoble
			_input[14] = Control.LCharge
			_input[15] = Control.RCharge
		}
	}
}