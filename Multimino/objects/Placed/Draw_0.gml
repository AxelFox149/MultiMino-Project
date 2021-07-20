/// @description Flash

if(!Vanish and GMode != 10) draw_self()

if(image_alpha != 0 and Options[11])
{
		draw_set_color($CCCCCC)
		
		if(Vanish) draw_set_alpha(alpha)
		
		if(GMode != 10 and !IsEdit)
		{
			var BRD, SZD 
			
			with(Control)
			{
				BRD = board
				SZD = BoardWidth
			}
			
			if(BRD[max(Posy - 1, 0)][Posx] == 0) draw_rectangle(x,y - 8,x + 64,y,false)
			if(BRD[min(Posy + 1,39)][Posx] == 0) draw_rectangle(x,y + 72,x + 64,y + 64,false)
		
			if(BRD[Posy][min(Posx + 1, SZD)] == 0) draw_rectangle(x + 64,y,x + 72,y + 64,false)
			if(BRD[Posy][max(Posx - 1, 0)]   == 0) draw_rectangle(x - 8, y,x,y + 64,false)
		
			if(BRD[max(Posy - 1, 0)][max(Posx - 1, 0)] == 0) draw_rectangle(x - 8,y - 8,x,y,false)
			if(BRD[min(Posy + 1,39)][max(Posx - 1, 0)] == 0) draw_rectangle(x - 8,y + 72,x,y + 64,false)
		
			if(BRD[max(Posy - 1, 0)][min(Posx + 1, SZD)] == 0) draw_rectangle(x + 64,y - 8,x + 72,y,false)
			if(BRD[min(Posy + 1,39)][min(Posx + 1, SZD)] == 0) draw_rectangle(x + 64,y + 64,x + 72,y + 72,false)
		}
}

if(Flash)
{
    draw_set_colour(c_white)
    draw_set_alpha(alpha)
    draw_rectangle(x,y,x+64,y+64,false)
    draw_set_alpha(1)
    
    alpha -= 0.04
    
    if(alpha < 0)
    {   
        Flash = false
        
        if(GMode == 10)
        {
            var Closed = 0, BRD;
			
			with(Control) BRD = board


            if(BRD[max(Posy - 1, 0)][Posx] != 0) Closed ++ 
            if(BRD[min(Posy + 1,39)][Posx] != 0) Closed ++
            if(BRD[Posy][min(Posx + 1, 9)] != 0) Closed ++
            if(BRD[Posy][max(Posx - 1, 0)] != 0) Closed ++
            
            if(Closed == 4) instance_deactivate_object(self)
        }
        
        if(Vanish) instance_destroy()
    }
}
/*
if(pause) image_alpha = 0
else	  image_alpha = 1
*/

