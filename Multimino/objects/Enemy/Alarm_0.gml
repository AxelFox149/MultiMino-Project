if(!pause and !gameover){
    y += 64
    if(PieceCollision(x, y))y -= 64
    else
    {
        if(Down) score += 1 * level
        
        EnControl.PSpin = false
    }
}