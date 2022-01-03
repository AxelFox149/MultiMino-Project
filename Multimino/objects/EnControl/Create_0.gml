/// @description Inicializacion

BoardStart = 1024
BoardWidth = 9
ZeroRow	   = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

var i

for(i = 0; i <= 39; i++)
{
    board[i] = ZeroRow
}

ComboDraw  = false
Hold       = Point
DoSwap     = false
CH         = true
HPress     = false
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
Zero       = array_create(3)

if(Time[0] != 0) Dec = true
else             Dec = false

Stack   = ds_stack_create()
Queue   = array_create(5)
NState  = 0
LDASLoad = false
RDASLoad = false

CShift = $FFFFFF

if(instance_exists(EnPlaced)) ReadBoard(true, EnControl);

    Enemy.CurrentPiece = RndPiece()
    
    with(Enemy)
    {
		sprite_index = PieceIndex[CurrentPiece]
        x = other.BoardStart + 288
        y = 96
        if((CurrentPiece >= 6 and CurrentPiece < 16) or (CurrentPiece >= 27 and CurrentPiece < 31)) move_snap(64,64)
    }
    for(i = 0; i <= 4; i++) Queue[i] = RndPiece()


draw_set_font(Console)
draw_set_colour(c_white)


//--------------------------------

EText[0,0] = "Next"
EText[1,0] = "Hold"

EText[0,1] = "Sig."
EText[1,1] = "Reser."

EText[0,2] = "Tiếp"
EText[1,2] = "Giữ"

EText[0,3] = "Next"
EText[1,3] = "Hold"

EText[0,4] = "Next"
EText[1,4] = "Hold"

EText[0,5] = "Next"
EText[1,5] = "Hold"

EText[0,6] = "Next"
EText[1,6] = "Hold"