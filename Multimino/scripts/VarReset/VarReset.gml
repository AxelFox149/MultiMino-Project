function VarReset() {
	level   = 1
	score   = 0
	lines   = 0
	GOType  = -1
	LockD   = true
	Warning = false
	PixelFade  = -1
	//RecordMode = true
	//PlayMode   = false

	pause    = false
	gameover = false

	if(GMode == 12 or GMode == 2)
	{
		Options[1] = PrevSkin
		Options[4] = PrevGhos
		Options[6] = PrevDAS
		Options[7] = PrevARR
	}

	if(Sel == 1)
	{
	    if(GMode <= 3) GMode = 0
	    else GMode -= 3
	}
	if(instance_exists(Control))	with(Control)  ds_stack_destroy(Stack)
	if(instance_exists(EnControl))	with(EnControl)ds_stack_destroy(Stack)
	if(instance_exists(Rec_Play_obj))
	{
		with(Rec_Play_obj)
		{
			ds_grid_destroy(_inputSequence)
			ds_list_destroy(_usedpieces)
		}
	}
}

function setQueue(argument0){
	switch(argument0)
            {
                case 0:
                    LB = 1;
                    UB = 7;
                    TP = 7;
                    break;
                
                case 1:
                    LB = 8;
                    UB = 25;
                    TP = 18;
                    break;
                
                case 2:
                    LB = 1;
                    UB = 29;
                    TP = 29;
                    break;
					
				case 3:
                    LB = 1;
                    UB = 7;
                    TP = 7;
                    break;
					
				case 4:
                    LB = 1;
                    UB = 25;
                    TP = 25;
                    break;
					
				case 5:
                    LB = 1;
                    UB = 89;
                    TP = 89;
                    break;
				
				case 6:
                    LB = 30;
                    UB = 89;
                    TP = 60;
					break;
            }	
}

function GetRepList(){
	var _fileName = file_find_first(working_directory+ "replays\\" + "*.txt",fa_directory), i = 0;
	var TempList = ds_list_create()
										
	while(_fileName != "")
	{
		//ReplayList[i] = _fileName;
		ds_list_add(TempList, _fileName)
		_fileName = file_find_next();
	}
	ReplayList = array_create(ds_list_size(TempList))
							
	for(i = 0; i < ds_list_size(TempList); i++) ReplayList[i] = TempList[| i]
							
	ds_list_destroy(TempList)
							
	if(array_length(ReplayList) > 7) MaxOff = array_length(ReplayList) - 8
	else							 MaxOff = 0
							
	file_find_close();
}

function getController()
{
	var maxpads = gamepad_get_device_count();
	
	for (var i = 0; i < maxpads; i++)
	{
		
	    if(gamepad_is_connected(i))
		{
			/*
			if(!_GPMapped and i >= 4)
			{
				var _GenMap = gamepad_get_mapping(i)
				show_debug_message("Gamepad Mapping = " + _GenMap)
				
				_GPMapped = true
			}
			*/
			return i
		}
	}
	return -1
}