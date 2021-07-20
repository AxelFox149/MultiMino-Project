
///Declaracion de variables
strCode = ""

frame  = 8

Sel     = 0
MenuOff = 0
MaxOff  = 1

Pos    = 0
MaxPos = 4
ScoreIndex = 0

SecPos = 0
Second = false
Third  = false

KeyWait = false
CanUse  = true

Value = array_create(4)
FLoc  = array_create(4)

Value[0] = 1
Value[1] = 0
Value[2] = 0
Value[3] = 0

Wait      = false
ArFrame   = 0

ReplayList = 0
//NoRep	   = false
TempVal	   = array_create(5)

TempVal[0] = Options[1]
TempVal[1] = Options[4]
TempVal[2] = Options[5]
TempVal[3] = Options[6]
TempVal[4] = Options[7]


DelCounter = 0

ButtonName = array_create(12)

ButtonName[0] = [gp_face1, "A"]
ButtonName[1] = [gp_face2, "B"]
ButtonName[2] = [gp_face3, "X"]
ButtonName[3] = [gp_face4, "Y"]

ButtonName[4] = [gp_shoulderl,  "LT"]
ButtonName[5] = [gp_shoulderlb, "LB"]
ButtonName[6] = [gp_shoulderr,  "RT"]
ButtonName[7] = [gp_shoulderrb, "RB"]

ButtonName[8]  = [gp_padu, "Pad Up"]
ButtonName[9]  = [gp_padd, "Pad Down"]
ButtonName[10] = [gp_padl, "Pad Left"]
ButtonName[11] = [gp_padr, "Pad Right"]

ButtonFlag = false

/*
LineDef(Value[0])

    0 = Endless
    1 = 150
    2 = 200
    3 = 300
    
Cap(Value[1])
    
    0 = 1
    1 = 15
    2 = 20
    3 = 30

PieceMode(Value[2])

    0 = Tetris
    1 = Pentris
    2 = Multris
	3 = Tetris +
	4 = Pentris +
	5 = Hextris
	6 = Ultris

First to value(Value[3])
    0 = 2 Win
    1 = 3 Wins
    2 = 5 Wins
    4 = 7 Wins
    5 = 10 Wins
*/

Frame = 0

Vel = array_create(11)
Vel[0] = 120

draw_set_colour(c_white)

/*  */
