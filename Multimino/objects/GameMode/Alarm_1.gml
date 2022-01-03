/// @description Activate


if(GMode == 11)
{
    BOGM = true
    gameover = false
    Top = false
    aVal = 0
}
else if((GMode != 10) and !DrawDes)
{
    DrawDes = true
    NR      = false
    var _index = 0, _val = 0, _secret = false;
	
	if(!PlayMode)
	{
	    switch(GMode)
	    {
			case 0:
				if(QueueMode == 6)
				{
					_index = 90;
				
					if(Scores[_index] < score)
			        {
			            NR = true
			            Scores[_index] = score
					
						Scores[_index + 7] = Control.TM[3]
			        }
				}
				break;
			
	        case 1:
	        case 2:
	        case 3:
	            //Marathon
				_index = (7 * (GMode - 1)) + (15 * QueueMode)
			
	            if(Scores[_index] < score)
	            {
	                NR = true
	                Scores[_index] = score
	            }
			
				if(GameWin and QueueMode == 2)
				{
					Scores[105] = true
					_secret	    = true
				}
	            break;
            
	        case 4:
	            //Sprint
				if(QueueMode != 6) _index = 1 + (15 * QueueMode)
				else			   _index = 91
				
		        _val   = real(string_digits(Scores[_index]))
            
				if((_val > real(string_digits(Control.TM[3]))) and GameWin)
		        {
		            NR = true
					Scores[_index] = Control.TM[3]
				
					if(QueueMode != 6) 	_index = 8 + (15 * QueueMode)
					else				_index = 98
					Scores[_index] = score
		        }
	            break;
            
	        case 5:
	            //Ultra
				if(QueueMode != 6) _index = 2 + (15 * QueueMode)
				else			   _index = 92
			
	            if(Scores[_index] < score)
	            {
	                NR = true
	                Scores[_index] = score
	            }
	            break;
            
	        case 6:
	            //Survival
				_index = 3 + (15 * QueueMode)
	            _val   = real(string_digits(Scores[_index]))
            
	            if(_val < real(string_digits(Control.TM[3])))
	            {
	                NR = true
				
					Scores[_index] = Control.TM[3]
				
					_index = 10 + (15 * QueueMode)
					Scores[_index] = score
	            }
	            break;
        
	        case 7:
	            //Spin Clear

	            if(Scores[4] < Control.Clears)
	            {
	                NR = true
					var i;
				
					for(i = 0; i < 3; i++)
					{
						Scores[4  + 15 * i] = Control.Clears
						Scores[11 + 15 * i] = score
					}
	            }
			
				if(Control.Clears >= 50)
				{
					Scores[109] = true
					_secret    = true
				}
	            break;
            
	        case 8:
	            //Master
				if(QueueMode != 6)
				{
					_index = 5 + (15 * QueueMode)
		            if(Scores[_index] < score)
		            {
		                NR = true
				
						Scores[_index] = score
				
						_index = 12 + (15 * QueueMode)
						Scores[_index] = Control.TM[3]
		            }
			
					if(GameWin)
					{	
						Scores[107] = true		//TGM: Arika
						Scores[108] = true		//TGM: World
				
						_secret	   = true
					}
				}
				else
				{
					_index = 93
		            _val   = real(string_digits(Scores[_index]))
            
		            if(_val < real(string_digits(Control.TM[3])))
		            {
		                NR = true
				
						Scores[_index] = Control.TM[3]
				
						_index = 100
						Scores[_index] = score
		            }
				}
	            break;
            
	        case 9:
				//Combo
	            _index = 6
			
	            if(Scores[_index] < Control.MaxCombo)
	            {
	                NR = true
				
	                var i;
				
					for(i = 0; i < 3; i++) Scores[6  + 15 * i] = Control.MaxCombo
	            }
	            break;
			
			case 12:
				//Clasico
				if(!Scores[106] and level >= 15)
				{
					NR = true
					Scores[106] = true
					Scores[110] = score
				}
				else if(Scores[106] and Scores[110] < score)
				{
					NR = true
				
					Scores[110] = score
				}
				break;
		
	        default:
	            NR = false;
	            break;
	    }
	}
	
	if(NR or _secret)
	{
		if(GMode == 12 or GMode == 2)
		{
			Options[1] = PrevSkin
			Options[4] = PrevGhos
			Options[6] = PrevDAS
			Options[7] = PrevARR
			
			MapDataSave()
			
			if(GMode == 12)
			{
				Options[1] = 15
				Options[4] = 0
				Options[6] = 16
				Options[7] = 6
			}
			else if(_secret) Options[1] = 14
		}
		else JsonDataSave()
		
	}

}

if(GMode == 10)
{
    Sel   = 1
    Fade  = true
    depth = -15
}

