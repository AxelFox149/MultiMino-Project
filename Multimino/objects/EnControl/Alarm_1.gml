/// @description Piece reset
instance_activate_object(Enemy)
PieceReset(false, Enemy)

with(Enemy)
{
    DoHold = false
    Done   = false
    Best   = -999
    Down   = false
    Pulse  = true
}

stage    = 0
n        = 0
NState   = 0
RDASLoad  = false
LDASLoad  = false

