/// @description Creacion de lineas

///Intercambio

if(DoSwap)
{
    if(CH and !update and instance_exists(Enemy) and !(pause or gameover) and GMode != 7)
    {
        if(Hold == Point)
        {
            Hold = Enemy.CurrentPiece
            PieceReset(false,Enemy)
        }
        else
        {
            var Pivot
            Pivot = Hold
            Hold = Enemy.CurrentPiece
            Enemy.sprite_index = PieceIndex[Pivot]
			Enemy.CurrentPiece = Pivot
            PieceReset(true,Enemy)
        }
        
        CH = false
        DoSwap = false
    }
}

if(update and stage == 0)
{
    var i, j, line
    
    for(i = 15; i <= 39; i++)
    {
        line = true
        for(j = 0; j <= BoardWidth; j++)
        {
            XOff = BoardStart + (64 * j)
            YOff =      -1152 + (64 * i)
            if(place_meeting(XOff, YOff,Enemy))
            {
                board[i][j] = Enemy.CurrentPiece
                instance_create_depth(XOff, YOff, -7, EnPlaced)
            }
            if(board[i][j] = 0) line = false
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
        
        if((BTB != 1) and (n >= 4 or PSpin)) Bonus = true
        else Bonus = false

        if(n < 4 and !PSpin) BTB = 1
        else                 BTB = 1.5
        
        for(i = 0; i < n; i++) instance_deactivate_region(BoardStart,(LC[i]* 64) - 1152,638,62,true,true)
        
        if(instance_exists(EnPlaced)) AC = false
        else AC = true
        
        instance_activate_object(EnPlaced)
        instance_activate_object(Enemy)
        instance_activate_object(Wall)
        
        var LineReturn = 0;
            
        LineReturn           = GameMode.GarbageSend[!Mini and PSpin, n] + real(Bonus)
        if(AC)   LineReturn  = GameMode.GarbageSend[!Mini and PSpin, 6]
		
        LineReturn          += GameMode.ComboSend[abs(ComboCount)]
        
        GameMode.EnGarb -= LineReturn
        
        with(GameMode)
        {
            if(EnGarb < 0)
            {
                InGarb += abs(EnGarb)
                EnGarb = 0
            }
        }

    }
    else    ComboCount = -1
    
    if(Super) Mini = false
    stage = 2
    
    with(ComboArt)
    {
        EnCount    = other.ComboCount
    }
    
    if(n >= 4 or PSpin or AC)
    {
        with(ComboArt)
        {
            EnLines   = other.n
            
            if(other.AC)
            {
                AC        = true
                ACFrame   = 0
                ACCounter = 0
            }
            
            ComboEnemy = true
            alarm[1]   = 90
        }
    }
    
    instance_deactivate_object(Enemy)
}

///Reset
if(stage == 2)
{
    instance_activate_object(EnPlaced)
    ClearBoard(EnPlaced)
    
    AC    = false
    
    update = false
    stage  = 3
    frame  = -0.15
    CH     = true

    alarm[1] = 5

    if     (!Scared and !array_equals(board[32], ZeroRow)) Scared = true
    else if( Scared and  array_equals(board[35], ZeroRow)) Scared = false

    IsClosedCheck(EnPlaced)
}

