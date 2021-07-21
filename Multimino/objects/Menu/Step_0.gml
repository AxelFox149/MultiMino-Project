/// @description Movimiento por el menu

_CurrentGP = getController()

var Up    = keyboard_check_pressed(vk_up)    or gamepad_button_check_pressed(_CurrentGP, gp_padu);
var Down  = keyboard_check_pressed(vk_down)  or gamepad_button_check_pressed(_CurrentGP, gp_padd);
var Right = keyboard_check_pressed(vk_right) or gamepad_button_check_pressed(_CurrentGP, gp_padr);
var Left  = keyboard_check_pressed(vk_left)  or gamepad_button_check_pressed(_CurrentGP, gp_padl);
var Selector = keyboard_check_pressed(vk_enter)	    or gamepad_button_check_pressed(_CurrentGP, gp_face2);
var Cancel   = keyboard_check_pressed(vk_backspace) or gamepad_button_check_pressed(_CurrentGP, gp_face1);
var Destroy  = keyboard_check_pressed(vk_delete)    or gamepad_button_check_pressed(_CurrentGP, gp_select);

if(Up or Down) DelCounter = 0


//-------------------
#region Cancel
if(Cancel)
{
	if(PixelFade == 0)
	{
	    if(!Second)
	    {
	        if(Sel == 3 or Sel == 4) Sel = 0
	        else if(Sel != 0 and Sel != 2) Sel --
	        else Sel = 0
    
	        Pos = 0
		
			MenuOff = 0
	    }
    
	    if(!KeyWait)
	    {
	        if(Third) Third = false
        
	        if(Wait and Sel == 2)
	        {
	            Wait = false
	            //ConfigWrite()
				JsonDataSave()
	        }
	        if(Second and !Wait)  Second = false
        
	        Wait = false
	    }
	    if(_CurrentGP < 0) KeyWait = false
	}
}
#endregion

//-------------------
#region Selector

if(Selector)
{
	if(PixelFade == 0)
	{
	    if(!Second)
	    {
	        switch(Sel)
	        {
	            case 0:
	                switch(Pos)
	                {
	                    case 0:
	                        Sel = 1;
							Pos = 0
	                        break;
                        
	                    case 1:
	                        Sel = 3;
							Pos = 0
	                        break;
                    
	                    case 2:
	                        Sel = 2;
							Pos = 0
	                        break;
                    
	                    case 3:
							PixelFade = 1
	                        break;
						
						case 4:
							Sel = 4
							Pos = 0
						
							if(directory_exists("replays")) GetRepList()
	                        break;
						
						case 5:
							game_end()
							break;
	                }
					MenuOff = 0
	                break;
                
	            case 1:
	                GMode = Pos
	                Second = true
	                SecPos = 0
                
	                if(Pos == 4 or Pos == 6)
	                {
						QueueMode = 0
	                    GMode    += 3
	                    Second    = false
	                    PixelFade = 1
						setQueue(QueueMode)
					}
				
	                if(Pos == 8)
	                {
						QueueMode = 0
	                    GMode     = 11
	                    Second    = false
	                    PixelFade = 1
						setQueue(QueueMode)
					}
				
	                break;
            
	            case 2:
	                Second = true
	                Wait = true
	                SecPos = 0
	                break;
                
	            case 3:
	                break;
				
				case 4:
					if((Pos + MenuOff) < array_length(ReplayList))
					{
						CurrentReplay = ReplayList[Pos + MenuOff]
					
						TempVal[0] = Options[1]
						TempVal[1] = Options[4]
						TempVal[2] = Options[5]
						TempVal[3] = Options[6]
						TempVal[4] = Options[7]
					
						ini_open("replays\\" + CurrentReplay)
					
						var TempBuffer, TempList, TempStr;
					
						TempStr = ini_read_string("Head","str",-1)
						TempBuffer = buffer_base64_decode(TempStr)
					
						TempList = ds_list_create()
					
						TempList = Buffer_To_List(TempBuffer)
					
						GMode      = TempList[| 0]
						QueueMode  = TempList[| 1]
						LevelCap   = TempList[| 2]
					
						Options[1] = TempList[| 3]
						Options[4] = TempList[| 4]
						Options[5] = TempList[| 5]
						Options[6] = TempList[| 6]
						Options[7] = TempList[| 7]
					
						//TotalFrames = TempList[| 8]
					
						ds_list_destroy(TempList)
						buffer_delete(TempBuffer)
					
						setQueue(QueueMode)
					
						ini_close()
					
						PlayMode   = true
						RecordMode = false
						PixelFade = 1
					}
					break;
	        }
	    }
	    else if(Sel == 1)
	    {
	        if(SecPos == 3)
	        {
	            setQueue(Value[2])
            
	            switch(Value[3])
	            {
	                case 0: FirstTo = 2; break;
	                case 1: FirstTo = 3; break;
	                case 2: FirstTo = 5; break;
	                case 3: FirstTo = 7; break;
	                case 4: FirstTo = 10;break;
	            }
            
				QueueMode = Value[2]
			
	            if(GMode == 0) GMode = Value[0]
	            else GMode += 3
            
	            if(Value[1] == 0) LevelCap = 1
	            if(Value[1] == 1) LevelCap = 15
	            if(Value[1] == 2) LevelCap = 20
	            if(Value[1] == 3) LevelCap = 30
				if(Value[1] == 4) LevelCap = 999
            
	            PixelFade = 1
	        }
	        else Wait = true
	    }
    
	    if(Third)
	    {
			if(!ButtonFlag and !KeyWait)
			{
		        if(SecPos != 9) KeyWait = true
		        else
				{
					if(_CurrentGP < 0) array_copy(CurrentButtons, 0, Buttons, 0, 9)
					else			   array_copy(CurJPadButtons, 0, JoyPadButtons, 0, 9)
				}
				ButtonFlag = true
			}
	    }
    
	    if(Sel == 2 and Pos == (3 - MenuOff) and !Third)
	    {
	        Third  = true
	        SecPos = 0
	    }
	}
}

#endregion

//-------------------
#region Delete
if(Destroy)
{
	if(Sel == 4 and (Pos + MenuOff) < array_length(ReplayList)) DelCounter ++

	if(DelCounter == 2)
	{
		file_delete("replays\\" + ReplayList[Pos + MenuOff])
		GetRepList()
		if(MenuOff > MaxOff) MenuOff = MaxOff
		DelCounter = 0
	}
}
#endregion

//-------------------
#region Secret code
if(PixelFade != 0)
{
    Up   = 0
    Down = 0
}
else if(Sel == 0)
{
	if(keyboard_check_pressed(vk_anykey))
	{
		if(keyboard_lastkey > 47 and keyboard_lastkey < 58)
		{
			strCode += keyboard_lastchar
			audio_play_sound(NES_Drop,10,false)
		}
		if(strCode == "1989")
		{
			audio_play_sound(NES_Tetris,10,false)
			PixelFade = 1
			
			GMode = 12
			
			LB = 1;
			UB = 7;
			TP = 7;
			strCode = ""
		}
		
		if(string_length(strCode) > 3)
		{
			strCode = ""
			audio_play_sound(GB_Drop,10,false)
		}
	}
}
#endregion

//-------------------
#region Menu Offsets
switch(Sel)
    {
        case 0:
            MaxPos = 5
			MaxOff = 0
            break;
        
        case 1:
            MaxPos = 8
            MaxSec = 3
			MaxOff = 0
            break;
        
        case 2:
            MaxPos = 8
            MaxSec = 9
			MaxOff = 4
            break;
            
        case 3:
            MaxPos = 6
			MaxOff = 0
            break;
			
		case 4:
			MaxPos = 7
			//MaxOff = 0
			break;
    }
 #endregion
 
    if(!Second)
    {
        if(Up and Pos != 0)
        {
            Frame = 0
            Pos --
        }
		else if(Up and MenuOff != 0)
		{
			MenuOff --
			//Vel[1] = Vel[0]
			//Vel[0] = 0
		}
		
        if(Down and Pos != MaxPos)
        {
            Frame = 0
            Pos ++
        }
		else if(Down and MenuOff != MaxOff)
		{
			MenuOff++
			//Vel[Pos - 1] = Vel[Pos]
			//Vel[Pos]     = 0
		}
		
        if(Sel == 3)
        {
            if(Left)  ScoreIndex --
            if(Right) ScoreIndex ++
            
            ScoreIndex = (ScoreIndex + 7) mod 7
        }
    }
    else if(!Third)
    {
        if(!Wait)
        {
            if(Up   and SecPos != 0) SecPos --
            if(Down and SecPos != MaxSec) SecPos ++
            
            if     (Pos == 7 and SecPos < 1)   SecPos = 1
            else if(GMode != 0 and Pos != 7 and SecPos < 2) SecPos = 2
            
        }
        else if(Sel == 1)
        {
            if(Pos == 7)
            {
                if(SecPos == 1)
                {
                    if(Up   and IALevel != 1) IALevel --
                    if(Down and IALevel != 5) IALevel ++
                }
                else if(SecPos == 2 and Up and Value[3] != 0) Value[3] --
            }
            else if(Up and Value[SecPos] != 0) Value[SecPos] --
            
            
            switch(SecPos)
            {
				case 1:
					if(Pos != 7 and Down and Value[1] != 3) Value[SecPos] ++
					break
                case 2:
                    if(Pos == 7 and Down and Value[3] != 4) Value[3] ++
                    else if(Down and Value[2] != 6) Value[2] ++
					break
                    
                case 3:
                    break
                    
                default:
                    if(Pos != 7 and Down and Value[SecPos] != 3)Value[SecPos] ++
                    break
            }
        }
        else
        {
            if(Up)  Options[Pos + MenuOff] --
            if(Down)Options[Pos + MenuOff] ++
            
            switch(Pos + MenuOff)
            {
                case 1:
                    Options[1] = (Options[1] + sprite_get_number(Point)) mod sprite_get_number(Point)
                    break;
                
				case 6:
                    if(Up)  Options[Pos + MenuOff] += 2
                    if(Down)Options[Pos + MenuOff] -= 2
                    
                    if(Options[6] > 12) Options[6] = 12
                    if(Options[6] < 3 ) Options[6] = 3
                    break;
				
				case 7:
                    if(Up)  Options[Pos + MenuOff] += 2
                    if(Down)Options[Pos + MenuOff] -= 2
                    
                    if(Options[7] > 6) Options[7] = 6
                    if(Options[7] < 0) Options[7] = 0
                    break;
				
                case 8:
                    if(Up)  Options[Pos + MenuOff] += 6
                    if(Down)Options[Pos + MenuOff] -= 6
                    
                    if(Options[8] > 100) Options[8] = 100
                    if(Options[8] < 0  ) Options[8] = 0
                    
                    audio_master_gain(Options[8]/100)
                    break;
                
                default:
                    Options[Pos + MenuOff] = (Options[Pos + MenuOff] + 2) mod 2
					
					if(Options[2] == 0) LanFile = "ENG_Text.ini"
					else				LanFile = "ESP_Text.ini"
			
					LanTextLoad()
                    break;
            }
			Options[10] = 0 //No music
        }
    }
    if(Value[2] == 6 and (!(Pos == 1 or Pos == 2 or Pos == 5 or Pos == 0) or (Pos == 0 and Value[0] != 0))) Value[2] = 5

	
    if(Third)
    {
        if!(KeyWait)
        {
            if(Up   and SecPos != 0) SecPos --
            if(Down and SecPos != 9) SecPos ++
        }
        else
        {
			if(_CurrentGP < 0)
			{
				if(   keyboard_check_pressed(vk_anykey) 
				and !(keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_f4)))
				{
					CurrentButtons[SecPos] = keyboard_lastkey
					KeyWait = false
				}
			}
			else if(!ButtonFlag)
			{
				var i;
				for(i = 0; i < 12; i++)
				{
					if(gamepad_button_check_pressed(_CurrentGP, ButtonName[i][0]))
					{
						CurJPadButtons[SecPos] = ButtonName[i][0]
						KeyWait = false
						ButtonFlag = true
						break
					}
				}
			}
        }
		
		if(_CurrentGP < 0)
		{
	        if(array_equals(CurrentButtons, Buttons)) Options[3] = 0
	        else Options[3] = 1
		}
		else
		{
			if(array_equals(CurJPadButtons, JoyPadButtons)) Options[3] = 0
	        else Options[3] = 1
		}
    }
ButtonFlag = false