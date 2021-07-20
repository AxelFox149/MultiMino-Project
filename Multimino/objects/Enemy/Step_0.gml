/// @description AI Control

if(Done)
{
        if(!Action and alarm_get(2) < 0)
        {
            if(CurrentPiece != ActivePiece)
            {
                if(EnControl.CH) EnControl.DoSwap = true
                else
                {
                    var i;
                    Best  = -9999
                    for(i = 0; i < 4; i++) CheckBVal(i,CurrentPiece)
                }
            }
            
            //if     (x == Xlist[Best]) Down = 1
            if(x >  Xlist)      {Izq = -1; Izqh = -1}
            else if(x <  Xlist) {Der =  1; Derh =  1}
            
            //if(y == Ylist[Best]) Drop = true
            
            if(x == Xlist and image_index == RotSt and CurrentPiece == ActivePiece)
            {
                if     (IALevel == 3 and y < 512)  Down = true
                else if(IALevel > 2 or y == Ylist) Drop = true
                else            Down = true

                
                //Drop = true
            }
            else Down = false
            
            if(image_index != RotSt)
            {
                if(RotSt > 2) RotL = -1
                else          RotR =  1
            }
            
            Action = true
            alarm_set(2,9 - (IALevel - 1) * 2)
        }
        else 
        {
            Izq  = 0
            Der  = 0
            RotR = 0
            RotL = 0
            Derh = 0
            Izqh = 0
            //Drop = false
            Action = false
        }
}


if(!Done and !pause)
{
        if(NowCheck < 4)
        {
            CheckBVal(NowCheck, CurrentPiece)
            NowCheck++
        }
        else if(NowCheck < 8)
        {
            var spr;
            
            if(EnControl.Hold != Point) spr = EnControl.Hold
            else                        spr = EnControl.Queue[0]
            
            CheckBVal(NowCheck - 4, spr)
            NowCheck++
        }
        else Wait = false        
        
        if(!Wait)
        {
            NowCheck = 0
            Done  = true
            
            Drop = false
            Wait = true
			image_index = 0
        }
}



///Movimiento horizontal y rotacion
if!(pause or gameover) and CurrentPiece != 0
{
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
    
if((Move != 0 or CM) and !EnControl.update)
{
    x +=(64 * Last)
    if(PieceCollision(x, y)) x -=(64 * Last)
    else
    {
        if(ML != 0 and PlaceTimer != ResetTime)
        {
            PlaceTimer = ResetTime
            ML --
        }
    }
}
Spin = RotR + RotL

if(Spin != 0 or DRot)
{
    if(DRot)                     DRSOffset()
    else if(CurrentPiece <= 7)   SRSOffset()
	else if(CurrentPiece <= 25)  PERSOffset()
    
    if(ML != 0 and ST and PlaceTimer != ResetTime)
    {
        PlaceTimer = ResetTime
        ML --
    }
}
}

///Gravedad y drop
if !(pause or gameover) and CurrentPiece != 0
{
Tic = 60

if(Down and !Pulse)
{
    alarm[0] = 3
    Pulse    = true
}

if(Down) Tic = min(1, Tic)

if((alarm_get(0) < 0) and (floor(Tic) > 0)) alarm_set(0, floor(Tic))

if(Drop)
{
    y = Ylist
    EnControl.update = true
    
    while(PieceCollision(x, y)) y -= 64
}

if(PieceCollision(x, y + 64)) PlaceTimer --

    if(PlaceTimer <= 0)
    {
        EnControl.update = true
    }
}

