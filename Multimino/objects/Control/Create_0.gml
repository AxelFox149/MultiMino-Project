/// @description Inicializacion

if((QueueMode == 5 or QueueMode == 6) and GMode != 6)
{
	BoardStart = 512
    BoardWidth = 11
	ZeroRow = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
}
else if(GMode == 10)
{
    BoardStart = 128
    BoardWidth = 9
	ZeroRow = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
}
else if(GMode == 9)
{
    BoardStart = 768
    BoardWidth = 3
	ZeroRow = [0, 0, 0, 0]
}
else
{
    BoardStart = 576
    BoardWidth = 9
	ZeroRow = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
}

var i


board = array_create(40, ZeroRow)


if(Options[1] == 16)
{
	TGMSound = array_create(29)
	
	TGMSound[0] = ARS_Next_T
	TGMSound[1] = ARS_Next_Z
	TGMSound[2] = ARS_Next_S
	TGMSound[3] = ARS_Next_L
	TGMSound[4] = ARS_Next_J
	TGMSound[5] = ARS_Next_O
	TGMSound[6] = ARS_Next_I
	TGMSound[7] = ARS_Next_Y
	TGMSound[8] = ARS_Next_R
	TGMSound[9] = ARS_Next_N
	TGMSound[10]= ARS_Next_N2
	TGMSound[11]= ARS_Next_L5
	TGMSound[12] = ARS_Next_J5
	TGMSound[13] = ARS_Next_Q
	TGMSound[14] = ARS_Next_P
	TGMSound[15] = ARS_Next_I5
	TGMSound[16] = ARS_Next_T5
	TGMSound[17] = ARS_Next_F
	TGMSound[18] = ARS_Next_7
	TGMSound[19] = ARS_Next_W
	TGMSound[20] = ARS_Next_S5
	TGMSound[21] = ARS_Next_Z5
	TGMSound[22] = ARS_Next_U
	TGMSound[23] = ARS_Next_V
	TGMSound[24] = ARS_Next_X
	TGMSound[25] = ARS_Next_O1
	TGMSound[26] = ARS_Next_I3
	TGMSound[27] = ARS_Next_I2
	TGMSound[28] = ARS_Next_V3
}
if(Options[1] == 17)
{
	TGMSound = array_create(29)
	
	TGMSound[0] = WRD_Next_T
	TGMSound[1] = WRD_Next_Z
	TGMSound[2] = WRD_Next_S
	TGMSound[3] = WRD_Next_L
	TGMSound[4] = WRD_Next_J
	TGMSound[5] = WRD_Next_O
	TGMSound[6] = WRD_Next_I
	TGMSound[7] = WRD_Next_Y
	TGMSound[8] = WRD_Next_R
	TGMSound[9] = WRD_Next_N
	TGMSound[10]= WRD_Next_N2
	TGMSound[11]= WRD_Next_L5
	TGMSound[12] = WRD_Next_J5
	TGMSound[13] = WRD_Next_Q
	TGMSound[14] = WRD_Next_P
	TGMSound[15] = WRD_Next_I5
	TGMSound[16] = WRD_Next_T5
	TGMSound[17] = WRD_Next_F
	TGMSound[18] = WRD_Next_7
	TGMSound[19] = WRD_Next_W
	TGMSound[20] = WRD_Next_S5
	TGMSound[21] = WRD_Next_Z5
	TGMSound[22] = WRD_Next_U
	TGMSound[23] = WRD_Next_V
	TGMSound[24] = WRD_Next_X
	TGMSound[25] = WRD_Next_O1
	TGMSound[26] = WRD_Next_I3
	TGMSound[27] = WRD_Next_I2
	TGMSound[28] = WRD_Next_V3
}

HPress	   = false
ComboDraw  = false
Hold       = Point
CH         = true
update     = false
stage      = 0
n          = 0
BTB        = 1
PSpin      = false
Mini       = false
Super      = false
frame      = -0.15
Bonus      = false
ComboCount = -1
AC         = false
Time       = array_create(3)
TimeR      = array_create(3)
TM         = array_create(4)
TMR        = array_create(4)
Zero       = array_create(3)

AlarmsHold = array_create(3)

ResetCounter = 0

if(GMode == 5) Time[0] = 3
if(GMode == 7) Time[0] = 2
if(GMode == 9)
{
    Time[0] = 1
    instance_create_depth(832,1280, -7,Placed)
    instance_create_depth(768,1280, -7,Placed)
    instance_create_depth(768,1344, -7,Placed)
}

if(Time[0] != 0) Dec = true
else             Dec = false

Stack   = ds_stack_create()
Queue   = array_create(5)
NState  = 0
LDASLoad = false
RDASLoad = false

RLeft   = false
RRight  = false
RDoble  = false
RCharge = false
LCharge = false

CShift = $FFFFFF

if(instance_exists(Placed)) ReadBoard(true, Control);


if(QueueMode == 5) 
{
	Calls = 0
	HBStore = array_create(60);
}

MaxCombo = -1
if(GMode != 7 and GMode != 11 and GMode != 15)
{
	var NPIECE = RndPiece()
    
    with(Polyminoe)
    {
        //x = 288 + other.BoardStart
        //y = 96
		CurrentPiece = NPIECE
		sprite_index = PieceIndex[CurrentPiece]
		
        if((CurrentPiece >= 6 and CurrentPiece < 16) 
		or (CurrentPiece >= 28 and CurrentPiece < 61) 
		or (CurrentPiece >= 80 and CurrentPiece <= 87))
		{
			//move_snap(64,64)
			x += 32
			y += 32
		}
		
		if(PieceScale == 2)
		{
			if (CurrentPiece < 6) move_snap(64,64)
			else 
			{
				x += 64
				y += 64 
			}
		}
	    
		
		ResetTime = floor(30 - power(2,(level - 21) / 4)) + 1
		FallSpeed = power(0.8 - ((level - 1) * 0.007), level - 1) * 60
    }
    for(i = 0; i <= 4; i++)
	{
		Queue[i] = RndPiece()
	}
}
else
{
    instance_deactivate_object(Polyminoe)
    Clears = 0
}

if(GMode == 12)
{
	PieceCount = array_create(7)
	
	var CPIECE;
	with(Polyminoe)
	{
		CPIECE = CurrentPiece
		image_index = 2
	}
	
	PieceCount[CPIECE - 1] ++
	
	NState = 2
}
if(GMode == 13) NState = 2
draw_set_font(Console)
draw_set_colour(c_white)

ini_open(LanFile)

_DispText = [
ini_read_string("Text", "Game[0]", "a"),
ini_read_string("Text", "Game[1]", "a"),
ini_read_string("Text", "Game[2]", "a"),
ini_read_string("Text", "Game[3]", "a"),
ini_read_string("Text", "Game[4]", "a"),
ini_read_string("Text", "Game[5]", "a"),
ini_read_string("Text", "Game[15]", "a"),
ini_read_string("Text", "Game[16]", "a"),
ini_read_string("Text", "Game[17]", "a")
]

ini_close()

