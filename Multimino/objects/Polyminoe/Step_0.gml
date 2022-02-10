/// @description Movimiento horizontal y rotacion
if!(pause or gameover) and CurrentPiece != 0
{

//var Izq, Der, RotR, RotL, Derh, Izqh, DRot, Drel, Lrel;

if(!PlayMode)
{
	_CurrentGP = getController()
	
	
	Derh =  keyboard_check(CurrentButtons[3]) or gamepad_button_check(_CurrentGP, CurJPadButtons[3])
	Izqh =  keyboard_check(CurrentButtons[2]) or gamepad_button_check(_CurrentGP, CurJPadButtons[2])

	Der  =  keyboard_check_pressed(CurrentButtons[3]) or gamepad_button_check_pressed(_CurrentGP, CurJPadButtons[3])
	Izq  =  keyboard_check_pressed(CurrentButtons[2]) or gamepad_button_check_pressed(_CurrentGP, CurJPadButtons[2])

	RotR =  keyboard_check_pressed(CurrentButtons[0]) or gamepad_button_check_pressed(_CurrentGP, CurJPadButtons[0])
	RotL =  keyboard_check_pressed(CurrentButtons[6]) or gamepad_button_check_pressed(_CurrentGP, CurJPadButtons[6])
	DRot =  keyboard_check_pressed(CurrentButtons[7]) or gamepad_button_check_pressed(_CurrentGP, CurJPadButtons[7])
	
	Down   = keyboard_check(CurrentButtons[1]) or gamepad_button_check(_CurrentGP, CurJPadButtons[1])
	DPress = keyboard_check_pressed(CurrentButtons[1]) or gamepad_button_check_pressed(_CurrentGP, CurJPadButtons[1])
	Drop   = keyboard_check_pressed(CurrentButtons[5]) or gamepad_button_check_pressed(_CurrentGP, CurJPadButtons[5])
	
	Izqh *= -1
	Izq  *= -1
	RotL *= -1
}
else
{
	with(Rec_Play_obj)
	{
		if(_index < ds_grid_height(_inputSequence) and _inputSequence[# 0, _index] == _frame)
		{			
			Polyminoe.RotR		= _inputSequence[# 3, _index]
			Polyminoe.RotL		= _inputSequence[# 4, _index] * -1
			
			Polyminoe.Derh		= _inputSequence[# 5, _index]
			Polyminoe.Izqh		= _inputSequence[# 6, _index] * -1
			
			Polyminoe.Izq		= _inputSequence[# 1, _index] * -1
			Polyminoe.Der		= _inputSequence[# 2, _index]
			
			/*
			if(!Polyminoe.isPressed[0]) Polyminoe.Izq = Polyminoe.Izqh
			else						Polyminoe.Izq = 0
			
			if(!Polyminoe.isPressed[1]) Polyminoe.Der = Polyminoe.Derh
			else						Polyminoe.Der = 0
			
			if(Polyminoe.Izqh != 0) Polyminoe.isPressed[0] = true
			if(Polyminoe.Derh != 0) Polyminoe.isPressed[1] = true
			
			if(Polyminoe.Izqh == 0) Polyminoe.isPressed[0] = false
			if(Polyminoe.Derh == 0) Polyminoe.isPressed[1] = false
			*/
			Polyminoe.DRot		= _inputSequence[# 7, _index]
			Polyminoe.Down		= _inputSequence[# 8, _index]
			Polyminoe.DPress	= _inputSequence[# 9, _index]
			Polyminoe.Drop		= _inputSequence[# 10,_index]
		}
	}
}


if(GMode == 12) DRot = false

Move = Izq + Der
Dir  = Izqh+ Derh


if(Izqh != 0 and Derh != 0)
{
	if(!PressFlag)
	{
		if(Last == -1 or Last == 0) Last =  1
		else					    Last = -1
	}
	PressFlag = true
}
else
{
	if(Izqh != 0) Last = -1
	if(Derh != 0) Last =  1
	
	PressFlag = false
}

if(PrevLast != Last) MoveTimer = Options[7]

PrevLast = Last

///---------------
if(Izqh != 0)
{
	if(alarm_get(2) < 0) alarm_set(2, Options[6])
	if(LDAS and Last == -1)
	{
		MoveTimer --
		if(MoveTimer == -1) MoveTimer = Options[7]
	}
}
else
{
	LDAS = false
	alarm[2] = -1
}

if(Derh != 0)
{
	if(alarm_get(3) < 0) alarm_set(3, Options[6])
	if(RDAS and Last == 1)
	{
		MoveTimer --
		if(MoveTimer == -1) MoveTimer = Options[7]
	}
}
else
{
	RDAS = false
	alarm[3] = -1
}

if(!RDAS and !LDAS) MoveTimer = Options[7]

///----------------

if(MoveTimer == 0 and (RDAS or LDAS)) CM = true
else								  CM = false
    
if((Move != 0 or CM) and !Control.update)
{
    x += 64 * Last * PieceScale
	
    if(PieceCollision(x, y)) x -= 64 * Last * PieceScale
    else
    {
        if(ML != 0 and PlaceTimer != ResetTime)
        {
            PlaceTimer = ResetTime
            ML --
        }
        
        Control.PSpin = false
		
		if(Options[9]) audio_play_sound(GSounds[6],10,false)
    }
}
Spin = RotR + RotL

if(Spin != 0 or DRot)
{
	if(Stall > 0)
	{
		var StallMove = false, LastY = y;
	
		if(!PieceCollision(x, y + 64)) StallMove = true
	
	    if(DRot)                    DRSOffset()
	    else if(CurrentPiece <= 7)  SRSOffset()
	    else if(CurrentPiece <= 25) PERSOffset()
	    else if(CurrentPiece <  30) MDTRSOffset()
	    else						SHeRSOffset()
	
		if(!PieceCollision(x, y + 64) and StallMove and LT >= 4 and LastY > y) Stall --
	}
	else SimpleCheck(DRot);

	SpinDetection(Control, DRot)
	
    if(ML != 0 and ST and PlaceTimer != ResetTime and Stall > 0)
    {
        PlaceTimer = ResetTime
        ML --
    }
}

///Gravedad y drop

if(GMode != 12) Tic = FallSpeed
else			Tic = G[min(level - 1, 29)]

if(DPress) alarm[0] = 3

if(Down)
{
	if(GMode != 12) Tic = min(1, FallSpeed)
	else			Tic = min(1, G[min(level - 1, 29)])
}

if(floor(Tic) < 1)
{
    var i;
    
    if(level >= 20) Tic = 20
    else Tic = power(Tic, -1)
    
    for(i = 0; i <= Tic; i++)
    {
        y += 64

        if(PieceCollision(x, y))
        {
            y -= 64
            break
        }
        else with(Control)
		{
			Mini  = false
			PSpin = false
		}
    }
}
else if((alarm_get(0) < 0) and (floor(Tic) > 0)) alarm_set(0, floor(Tic))

var i;
Dis = 0

for(i = 1; i <= 25; i ++)
{
	if(PieceCollision(x, y + (i * 64)))
    {
        DropY = y + ((i - 1) * 64)       
        break
    }
    Dis++
}

if(Drop and GMode != 12 and CHD)
{
    if(GMode != 10 and Dis >= 3)
    {
        var LeftBound, RightBound, i;
        
        if(CurrentPiece == 26)
        {
            LeftBound  = x - 16
            RightBound = x + 16
        }
        for(i = 0; i <= 12; i++)
        {
            if(collision_line(513 + i*64, bbox_top, 513 + i*64, bbox_bottom, Polyminoe,true,false))
            {
                LeftBound = (513 + i*64) + 14
                break
            }
        }
        for(i = 0; i <= 12; i++)
        {
            if(collision_line(1279 - i*64, bbox_top, 1279 - i*64, bbox_bottom, Polyminoe,true,false)) 
            {
                RightBound = (1279 - i*64) - 14
                break
            }
        }
        part_emitter_region(HardDrop,DropEmm,LeftBound,RightBound,y - 28,DropY,ps_shape_rectangle,ps_distr_linear)
        part_emitter_burst(HardDrop,DropEmm,p_Spark, Dis)
    }
    y = DropY
	
	Control.update = true
	
	if(Dis > 0)
	{
		with(Control)
		{
			Mini  = false
			PSpin = false
		}
	}
	
	ComboArt.VerVel = -15
    if(Options[9]) audio_play_sound(GSounds[3],10,false)
    score += (2 * Dis)
}

	if(PieceCollision(x, y + 64))
	{
		if(Stall <= 0) PlaceTimer = 0
		else if(LockD and GMode != 12) PlaceTimer --
	}

    if(PlaceTimer <= 0)
    {
        Control.update = true
        if(Options[9])
		{
			if !(Options[1] == 16 or Options[1] == 17) audio_play_sound(GSounds[3],10,false)
			else	  								   audio_play_sound(TGM_Lock,10,false)
		}
		
    }
	PlaceTimer = 99
	
	if(instance_exists(Rec_Play_obj))
	{
		with(Rec_Play_obj)
		{
			if(_isRecording)
			{
				_input[0] = abs(Polyminoe.Izq)
				_input[1] = Polyminoe.Der
				_input[2] = Polyminoe.RotR 
				_input[3] = abs(Polyminoe.RotL) 
				_input[4] = Polyminoe.Derh 
				_input[5] = abs(Polyminoe.Izqh) 
				_input[6] = Polyminoe.DRot 
				_input[7] = Polyminoe.Down  
				_input[8] = Polyminoe.DPress
				_input[9] = Polyminoe.Drop
			}
		}
	}
/*
	if(PlayMode)
	{
		Der  =  false
		Izq  =  false
		RotR =  false
		RotL =  false
		DRot =  false
		Drop   = false
		DPress = false
	}*/
}