/// @description Flash

if(Flash)
{
    draw_set_colour(c_white)
    draw_set_alpha(alpha)
    draw_rectangle(x,y,x+64,y+64,false)
    draw_set_alpha(1)
    
    if(!pause) alpha -= 0.04
    
    if(alpha < 0)
    {
        Flash = false
        var Closed = 0, BRD = EnControl.board;

        if(BRD[max(Posy - 1, 0)][Posx] != 0) Closed ++ 
        if(BRD[min(Posy + 1,39)][Posx] != 0) Closed ++
        if(BRD[Posy][min(Posx + 1, 9)] != 0) Closed ++
        if(BRD[Posy][max(Posx - 1, 0)] != 0) Closed ++
        if(Closed == 4) instance_deactivate_object(self)
        if(Vanish) instance_destroy()
    }
}