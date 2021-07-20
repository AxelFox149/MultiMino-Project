/// @description Wait for next battle

var i;

instance_activate_object(all)

instance_destroy(Placed)
instance_destroy(EnPlaced)

with(Control)
{
	
	for(i = 0; i <= 39; i++)
	{
	   board[i] = ZeroRow
	}
	
    ds_stack_clear(Stack)
    for(i = 0; i <= 4; i++) Queue[i] = RndPiece()
    
    PieceReset(false, Polyminoe)
    Hold = 0
    CH   = true
}

with(EnControl)
{
	for(i = 0; i <= 39; i++)
	{
		board[i] = ZeroRow
	}

    ds_stack_clear(Stack)
    for(i = 0; i <= 4; i++) Queue[i] = RndPiece()
    
	PieceReset(false, Enemy)
    Hold = 0
    CH   = true
}

with(Enemy)
{
    Done        = false
    Wait        = true
	Drop        = false
    NowCheck    = 0
	Down	    = false
	image_index = 0
}

gameover		= false
Top             = false
Scared          = false
depth           = -5
InGarb          = 0
EnGarb          = 0