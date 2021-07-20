/// @description AI Control

if(Done)
{
        if(!Action and alarm_get(2) < 0)
        {
            
            //if     (x == Xlist[Best]) Down = 1
            if(x >  Xlist) {Izq = -1; Izqh = -1}
            else if(x <  Xlist) {Der = 1;  Derh =  1}
            
            //if(y == Ylist[Best]) Drop = true
            
            if(x == Xlist and image_index == RotSt)Drop = true
            
            if(image_index != RotSt)
            {
                if(RotSt > 2) RotL = true
                else                RotR = true
            }
            
            //if(sprite_index != ActivePiece)
            //{
                if(EnControl.CH and DoHold)
                {
                    EnControl.HPress = true
                    DoHold = false
                }
            //}
            
            Action = true
            alarm_set(2,1)
        }
        else 
        {
            Izq  = 0
            Der  = 0
            RotR = 0
            RotL = 0
            Derh = 0
            Izqh = 0
            EnControl.HPress = false
            //Drop = false
            Action = false
        }
}


if(!Done and !global.pause)
{
var OrInd = sprite_index;
repeat(2)
{
    
    while(State != 4)
    {
        Cleared = 0
        Holes = 0
        y = 96
        x = 608 + 64 * Step
        
        if((sprite_index == O or sprite_index == I))
        {
            y-= 32
            x-= 32
        }
        
        image_index = State
        
        while(place_meeting(x,y,Wall))
        {
            if(Step < 5) x += 64
            else
            {
                x -= 64
                Step = 9
            }
        }
        var i,TY = y;
        
        //Find lowest point
        for(i = 0; i <= 25; i ++)
        {
            y = TY + 64 * i
            if(place_meeting(x,y,Wall) or place_meeting(x,y,Placed))
            {
                y -= 64
                break
            }
        }
        i = 0;    
        //Hole Count
        if(sprite_index < O)
        {
            for(i = 0; i < 3; i++)
            {       
                if(!collision_point(x - 64 + (64 * i),y     ,all,true,false) and collision_point(x - 64 + (64 * i),y - 64,all,true,false)) Holes++
                if(!collision_point(x - 64 + (64 * i),y + 64,all,true,false) and collision_point(x - 64 + (64 * i),y     ,all,true,false)) Holes++
                if(!collision_point(x - 64 + (64 * i),y + 128,all,true,false)and collision_point(x - 64 + (64 * i),y + 64,all,true,false)) Holes++
            }
        }
        else if(sprite_index == O)
        {
            for(i = 0; i < 2; i++)
            {
                if(!collision_point(x - 64 + (64 * i),y + 96,all,false,false)) Holes++
            }
            
        }
        else if(State == 0 or State == 2)
        {
            var offset = 0;
            
            if(State == 2) offset = 1
            repeat(4)
            {
                if(!collision_point(-96 + (64 * i), 32 + (64 * offset),all,true,false)) Holes++
                i++
            }
        }
        //New lowness
        
        var ins = instance_nearest(864,0,Placed)
        
        if(ins != noone and ins.y < y) Height = (ins.y / 64)
        else                           Height = floor(y / 64)
        
        //lines cleared
        var j = 0,l;
        TY = (floor(bbox_top/64) * 64) + 32
        
        repeat(4)
        {
            l = true
            for(i = 0;i < 10;i++)
            {
                if(!collision_point(608 + (64 * i),TY + (64 * j),all,true,false))l = false    
            }
            j++
            if(l) Cleared ++ 
        }
        
        //Difference between max and lowest point
        /*
        var low = 0;
        for(i = 0; i < 10; i++)
        {
            for(j = 0; j < 22; j++)
            {
                if(collision_point(608 + (64 * i),32 + (64 * j),all,true,false))
                {
                    if(low < j) low = j
                    break
                }
            }
        }
        */
        //Bump = (low - Height)
        
        //Calculate score
        
        //if(Height < 18) 
        TScore = floor(y / 64) - (Holes * 5) + (Cleared * 3) + (Height * 2)
        //else            Scores[Pointer] = (y / 64) - (Holes * 4) + (Cleared * 5) + Height
        
        if(Best < TScore) 
        {
            if(TestHold) DoHold = true
            Best = TScore
            
            RotSt = State
            Xlist = x
            Ylist = y
            ActivePiece = sprite_index
        }
        
        Step ++
        
        Step = Step mod 10
        
        if(Step == 0) State += 1
    }
    if(EnControl.Hold != Point) sprite_index = EnControl.Hold
    else                        sprite_index = EnControl.Queue[0]
    
    TestHold = true
    
    State = 0
    Step  = 0
    
}
//else
//{        
        Done  = true   
        TestHold = false
        sprite_index = OrInd
        x = 864
        y = 96
        if(sprite_index == O or sprite_index == I) move_snap(64,64)
        
        Drop = false
        image_index = 0
//        }
}



/* */
Double = !Double

/* */
/*  */
