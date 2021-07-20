/// @description Definicion de variables

/*
Game Mode Index Value

    0  = Endless   Marathon
    1  = 150 Lines Marathon
    2  = 200 Lines Marathon
    3  = 300 Lines Marathon
    4  = 40  Lines Sprint
    
    5  = Ultra Mode (3 Minutes Trial)
    
    6  = Survival
    7  = Spin Clear
    
    8  = Master Mode
    9  = Combo Breaker
    10 = CPU Battle
    11 = Editor
	12 = Classic Rule
	13 = Classic Master Rule
	14 = Null
	15 = Spin Clear Editor
*/
OSpin  = false
IsEdit = false

GameWin = false
RepSave = false
RepFlag = false

RepAnOff = 0

switch (GMode)
{
	case 0:				    break;
	case 5:
    case 1:  LevelCap = 15; break;
	case 2:  LevelCap = 20; break;
	case 3:  LevelCap = 30; break;
	case 8:  LevelCap = 40; 
			 level    = 21; break;
	case 11: LevelCap = 20; break;
	case 12: LevelCap = 99; break;
	case 13: LevelCap = 40; break;
	
    default: LevelCap = 1;  break;
}

if(GMode == 11)
{
    SpinBoard = 0 //Slot 0 loaded
    PieceArr  = array_create(10)
    LoadSlot()
    CurX      = room_height/2
    CurY      = room_width/2
	
	CurPosX   = CurX
	CurPosY   = CurY
	
    Pointer   = 0
    IsEdit    = true
    SaveFlag  = false
    BOGM      = false
}
////////////////////////////////////////////////////////
if(GMode == 15)
{
	SpinBoard  = -1 //No board loaded
	BoardCount = 54
    CurX      = 0
    CurY      = 0
    Pointer   = 0
    PieceArr  = array_create(10)
    IsEdit    = true
	var i, j, key;
    for(i = 0; i <= 14; i++)
    {
        for(j = 0; j <= 9; j++)
        {
            Box[i,j] = 0
        }
    }
    LevelCap = 1
    
    SaveFlag = false
    ini_open("SpinClear_Def.ini")
    OSpin	  = true
    MaxBoard  = ini_read_real("SpinMatrix","Total",1)
    Wait      = false
    Fila      = 0
    TotSize   = floor(MaxBoard / 5) + MaxBoard + 1
    Boards    = array_create(TotSize)
    SMat      = array_create(10)
    index	  = 1
    
    SMat[0] = "1 1 1 1 1 1 1 1 1 1"
    SMat[1] = "1 1 1 1 1 1 1 1 1 1"
    SMat[2] = "1 1 1 1 1 1 1 1 1 1"
    SMat[3] = "1 1 1 1 1 1 1 1 1 1"
    SMat[4] = "1 1 1 1 1 1 1 1 1 1"
    SMat[5] = "1 1 1 1 1 1 1 1 1 1"
    SMat[6] = "1 1 1 1 1 1 1 1 1 1"
    SMat[7] = "1 1 1 1 1 1 1 1 1 1"
    SMat[8] = "1 1 1 1 1 1 1 1 1 1"
    SMat[9] = "1 1 1 1 1 1 1 1 1 1"
    
    SQueue = "01 "
    
    CreateQueue(0)
    
    RndT = Boards[0]
    
    for(i = 0; i <= 9; i++)
    {
        key = "SMat[" + string(RndT) + " , " + string(i) + "]"
        SMat[i] = ini_read_string("SpinMatrix",key,"1 1 1 1 1 1 1 1 1 1")
    }
    key = "SQueue[" + string(RndT) + "]"
    SQueue = ini_read_string("SpinQueue",key,"01 ")
    ini_close()
}
////////////////////////////////////////////////////////
Top  = false
LX   = -50
LY   = -50
LS   = M_O
LP   = 0

DrawDes = false
NR      = false
Sel     = 0
aVal    = 0

if(GMode == 7)
{
	UB = 18
    ini_open("SpinClear_Def.ini")
    OSpin     = true
    MaxBoard  = ini_read_real("SpinMatrix","Total",1)
    Wait      = false
    Fila      = 0
    //TotSize   = floor(MaxBoard / 5) + MaxBoard + 1
    TotSize   = MaxBoard + 1
	Boards    = array_create(TotSize)
    SMat      = array_create(10)
    index     = 1
    AnOffset  = 0
	FirstBag  = true
	
    SMat[0] = "1 1 1 1 1 1 1 1 1 1"
    SMat[1] = "1 1 1 1 1 1 1 1 1 1"
    SMat[2] = "1 1 1 1 1 1 1 1 1 1"
    SMat[3] = "1 1 1 1 1 1 1 1 1 1"
    SMat[4] = "1 1 1 1 1 1 1 1 1 1"
    SMat[5] = "1 1 1 1 1 1 1 1 1 1"
    SMat[6] = "1 1 1 1 1 1 1 1 1 1"
    SMat[7] = "1 1 1 1 1 1 1 1 1 1"
    SMat[8] = "1 1 1 1 1 1 1 1 1 1"
    SMat[9] = "1 1 1 1 1 1 1 1 1 1"
    
    SQueue = "01 "
    
    CreateQueue(1)
    
    RndT = Boards[0]

    var i, key, b_ID = string(RndT);
    for(i = 0; i <= 9; i++)
    {
        key = "SMat[" + string(RndT) + " , " + string(i) + "]"
        SMat[i] = ini_read_string("SpinMatrix",key,"1 1 1 1 1 1 1 1 1 1")
    }
    key = "SQueue[" + string(RndT) + "]"
    SQueue = ini_read_string("SpinQueue",key,"01 ")
	isDouble = bool(ini_read_real("DoubleTwist","ID_" + b_ID,0))

    ini_close()
}

if(GMode == 12 or GMode == 2)
{
	PrevSkin = Options[1]
	PrevGhos = Options[4]
	PrevDAS  = Options[6]
	PrevARR  = Options[7]
	
	if(GMode == 12)
	{
		Options[1] = 15
		Options[4] = 0
		Options[6] = 16
		Options[7] = 6
	}

}


Fade  = -1
Alpha = 8

InGarb  = 0
Timer   = 450

EnGarb  = 0
PrevR1  = -1
PrevR2  = -1
Lost    = 0
P1Count = 0
P2Count = 0
Insert1 = false
Insert2 = false

//Envio de lineas
GarbageSend[0,0] = 0
GarbageSend[0,1] = 0  //Single
GarbageSend[0,2] = 1  //Double
GarbageSend[0,3] = 2  //Triple
GarbageSend[0,4] = 4  //Tetris
GarbageSend[0,5] = 6  //Pentris
GarbageSend[0,6] = 10  //All Clear

//Es Spin
GarbageSend[1,0] = 0
GarbageSend[1,1] = 2  //Single
GarbageSend[1,2] = 4  //Double
GarbageSend[1,3] = 6  //Triple
GarbageSend[1,4] = 8  //Tetris
GarbageSend[1,5] = 10 //All Clear

//Combo

ComboSend = array_create(21)

ComboSend[0]  = 0
ComboSend[1]  = 0
ComboSend[2]  = 1
ComboSend[3]  = 1
ComboSend[4]  = 2
ComboSend[5]  = 2
ComboSend[6]  = 3
ComboSend[7]  = 3
ComboSend[8]  = 4
ComboSend[9]  = 4
ComboSend[10] = 4
ComboSend[11] = 5
ComboSend[12] = 5
ComboSend[13] = 5
ComboSend[14] = 5
ComboSend[15] = 5
ComboSend[16] = 5
ComboSend[17] = 5
ComboSend[18] = 5
ComboSend[19] = 5
ComboSend[20] = 5

/* */
/*  */
