/// @description Ghost
var DRK;
DRK = 65 - ((PlaceTimer * 65) / ResetTime)
DrawPiece(ActivePiece, Xlist, Ylist, RotSt, 2, 2, 0.5, 50, false)
DrawPiece(CurrentPiece, x, y, image_index, 2, 2, 1, DRK,false)

/*


//draw_self()
draw_text(32,0 ,Pointer)
draw_text(32,32,Holes)
draw_text(32,64,Cleared)
draw_text(32,96,Izq)
draw_text(32,128,Der)
draw_text(32,160,Spin)

var i

if(sprite_index < O)
{
    for(i = 0; i < 3; i++)
    {
        //if(collision_point(x - 64 + (64 * i),y  + 128,all,true,false)) draw_circle_colour(x - 64 + (64 * i),y + 128, 8,c_red,c_red,false)
        //else draw_circle_colour(x - 64 + (64 * i),y + 128, 8,c_white,c_white,false)
    
        //if(collision_point(x - 64 + (64 * i),y ,all,true,false)) draw_circle_colour(x - 64 + (64 * i),y, 8,c_red,c_red,false)
        //else draw_circle_colour(x - 64 + (64 * i),y, 8,c_white,c_white,false)
        
        //if(collision_point(x - 64 + (64 * i),y + 64,all,true,false))draw_circle_colour(x - 64 + (64 * i),y + 64, 8,c_red,c_red,false)
        //else draw_circle_colour(x - 64 + (64 * i),y + 64, 8,c_white,c_white,false)
        
        
        if(!collision_point(x - 64 + (64 * i),y     ,all,true,false) and collision_point(x - 64 + (64 * i),y - 64,all,true,false)) draw_circle_colour(x - 64 + (64 * i),y     , 8,c_white,c_white,false)
        if(!collision_point(x - 64 + (64 * i),y + 64,all,true,false) and collision_point(x - 64 + (64 * i),y     ,all,true,false)) draw_circle_colour(x - 64 + (64 * i),y + 64, 8,c_white,c_white,false)
        if(!collision_point(x - 64 + (64 * i),y + 128,all,true,false)and collision_point(x - 64 + (64 * i),y + 64,all,true,false)) draw_circle_colour(x - 64 + (64 * i),y +128, 8,c_white,c_white,false)
    }
}
else if(sprite_index == O)
{
    //if(collision_point(x - 96,y + 32,all,true,false)) draw_circle_colour(x - 96,y + 32, 8,c_red,c_red,false)
    //else draw_circle_colour(x - 96,y + 32, 8,c_white,c_white,false)
    //if(collision_point(x + 96,y + 32,all,true,false)) draw_circle_colour(x + 96,y + 32, 8,c_red,c_red,false)
    //else draw_circle_colour(x + 96,y + 32, 8,c_white,c_white,false)
    
    for(i = 1; i < 3; i++)
    {
        
        //if(collision_point(x - 96 + (64 * i),y + 96,all,true,false)) draw_circle_colour(x - 96 + (64 * i),y + 96, 8,c_red,c_red,false)
        //else draw_circle_colour(x - 96 + (64 * i),y + 96, 8,c_white,c_white,false)
         
        if(!collision_point(x - 96 + (64 * i),y + 96,all,true,false) and collision_point(x - 96 + (64 * i),y + 32,all,true,false)) draw_circle_colour(x - 96 + (64 * i),y + 96, 8,c_white,c_white,false)
    }
    
}
else
{
    var P1X,P1Y,P2Y,NX1,NY1, i = 0;
    
    P1X = -96 
    P1Y =  32
    P2Y = -96
    
    NX1 = cos(State * pi / 2) * P1X - sin(State * pi / 2) * P1Y + x
    NY1 = sin(State * pi / 2) * P1X + cos(State * pi / 2) * P1Y + y
    
    NX2 = cos(State * pi / 2) * P1X - sin(State * pi / 2) * P2Y + x
    NY2 = sin(State * pi / 2) * P1X + cos(State * pi / 2) * P2Y + y
    
    if(State == 0 or State == 2)
    {
        repeat(4)
        {
            
            //if(collision_point(NX1 + (64 * i),NY1,all,true,false)) draw_circle_colour(NX1 + (64 * i),NY1, 8,c_red,c_red,false)
            //else draw_circle_colour(NX1 + (64 * i),NY1, 8,c_white,c_white,false)
            
            //if(collision_point(NX2 + (64 * i),NY2,all,true,false)) draw_circle_colour(NX2 + (64 * i),NY2, 8,c_red,c_red,false)
            //else draw_circle_colour(NX2 + (64 * i),NY2, 8,c_white,c_white,false)
            
            
            if(!collision_point(NX1 + (64 * i),NY1,all,true,false) and collision_point(NX1 + (64 * i),NY1 - 64,all,true,false)) draw_circle_colour(NX1 + (64 * i),NY1, 8,c_white,c_white,false)
            if(!collision_point(NX2 + (64 * i),NY2,all,true,false) and collision_point(NX2 + (64 * i),NY2 - 64,all,true,false)) draw_circle_colour(NX2 + (64 * i),NY2, 8,c_white,c_white,false)
            
            if(State == 0) i++
            else           i--
        }
    }
    else
    {
        repeat(4)
        {
            //if(collision_point(NX1,NY1  + (64 * i),all,true,false)) draw_circle_colour(NX1,NY1 + (64 * i), 8,c_red,c_red,false)
            //else draw_circle_colour(NX1,NY1  + (64 * i), 8,c_white,c_white,false)
            
            //if(collision_point(NX2,NY2  + (64 * i),all,true,false)) draw_circle_colour(NX2,NY2 + (64 * i), 8,c_red,c_red,false)
            //else draw_circle_colour(NX2,NY2  + (64 * i), 8,c_white,c_white,false)
            
            if(!collision_point(NX1,NY1  + (64 * i),all,true,false) and collision_point(NX1,NY1 + (64 * i) - 64,all,true,false)) draw_circle_colour(NX1,NY1  + (64 * i), 8,c_white,c_white,false)
            if(!collision_point(NX2,NY2  + (64 * i),all,true,false) and collision_point(NX2,NY2 + (64 * i) - 64,all,true,false)) draw_circle_colour(NX2,NY2  + (64 * i), 8,c_white,c_white,false)
                
            if(State == 1) i++
            else           i--
        }
    }
    
}*/

/* */
/*  */
