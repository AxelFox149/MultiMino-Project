// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function WriteInputRecording(argument0)
{
	if !(directory_exists(working_directory + "replays\\")) directory_create("replays")
	ini_open("replays\\" + argument0);
	
	var BufferStr, TempBuffer, TempList;
	
	TempBuffer = Grid_To_Buffer(_inputSequence)
	BufferStr  = buffer_base64_encode(TempBuffer,0,buffer_get_size(TempBuffer))
	ini_write_string("Inputs","str",BufferStr)
	
	TempBuffer = List_To_Buffer(_usedpieces)
	BufferStr  = buffer_base64_encode(TempBuffer,0,buffer_get_size(TempBuffer))
	ini_write_string("Pieces","str",BufferStr)
	
	TempList = ds_list_create()
	
	ds_list_add(TempList, GMode)	  //Record Game Mode
	ds_list_add(TempList, QueueMode)  //Piece Mode
	ds_list_add(TempList, LevelCap)   //Current Level Cap (for endless)
	ds_list_add(TempList, Options[1]) //Current Skin
	ds_list_add(TempList, Options[4]) //Ghost Piece
	ds_list_add(TempList, Options[5]) //SpinDetection
	ds_list_add(TempList, Options[6]) //DAS
	ds_list_add(TempList, Options[7]) //ARR
	//ds_list_add(TempList, _frame)	  //Total Frames
	
	TempBuffer = List_To_Buffer(TempList)
	BufferStr  = buffer_base64_encode(TempBuffer,0,buffer_get_size(TempBuffer))
	
	ini_write_string("Head","str",BufferStr)
	
	//ini_write_string("Inputs","0",ds_grid_write(_inputSequence))
	//ini_write_string("Pieces","0",ds_list_write(_usedpieces))
	
	ds_list_destroy(TempList)
	buffer_delete(TempBuffer)
	
	ini_close()
}

function ReadInputRecording(argument0){
	if(!_SecLoaded){
		ini_open("replays\\" + argument0);
	
		var BufferStr, TempBuffer;
	
		BufferStr = ini_read_string("Inputs","str","-1")
		TempBuffer = buffer_base64_decode(BufferStr)
	
		_inputSequence = Buffer_To_Grid(TempBuffer)
	
		BufferStr = ini_read_string("Pieces","str","-1")
		TempBuffer = buffer_base64_decode(BufferStr)
	
		_usedpieces = Buffer_To_List(TempBuffer)
		//ds_grid_read(_inputSequence, ini_read_string("Inputs","0","-1"))
		//ds_list_read(_usedpieces, ini_read_string("Pieces","0","-1"))
	
		buffer_delete(TempBuffer)
	
		ini_close()
		
		TotalFrames = ds_grid_get_max(_inputSequence,0,0,0,ds_grid_height(_inputSequence)) + 1
		
		_SecLoaded = true
	}
	
	with(Polyminoe)
	{
		if(GMode != 7)
		{
			CurrentPiece = other._usedpieces[| 0]
			sprite_index = PieceIndex[CurrentPiece]
		}
		else
		{
			CurrentPiece = 0
			sprite_index = Point
		}
		
		if(GMode == 10)
	    {
	        x = Control.BoardStart + 288
	        y = 160
	    }
	    else 
	    {
	        x = 864
	        y = 96
	    }
	    alarm[0]    = -1
	    image_index = 0
	    MoveTimer   = 1
	    ML          = 15
	    PlaceTimer  = ResetTime
		//CHD		= false
	    Drop		= false
		Stall	    = 5
		
		if((CurrentPiece >= 6 and CurrentPiece < 16) 
		or (CurrentPiece >= 28 and CurrentPiece < 61) 
		or (CurrentPiece >= 80 and CurrentPiece <= 87))
	    {
	        x += 32
	        y += 32 
	    }
	}
	
	if(GMode == 7)
	{
		with(GameMode)
		{
			RndT = other._usedpieces[| 0]
		
			ini_open("SpinClear_Def.ini")
			var i, key, b_ID = string(RndT);
		    for(i = 0; i <= 9; i++)
		    {
		        key = "SMat[" + string(RndT) + " , " + string(i) + "]"
		        SMat[i] = ini_read_string("SpinMatrix",key,"1 1 1 1 1 1 1 1 1 1")
		    }
		    key = "SQueue[" + string(RndT) + "]"
		    SQueue = ini_read_string("SpinQueue",key,"01 ")
			isDouble = bool(ini_read_real("DoubleTwist","ID_" + b_ID,0))

		    ini_close()
		}
	}
	else
	{
		with(Control)
		{
			Hold	 = 0
			CH		 = true
			Queue[0] = other._usedpieces[| 1]
			Queue[1] = other._usedpieces[| 2]
			Queue[2] = other._usedpieces[| 3]
			Queue[3] = other._usedpieces[| 4]
			Queue[4] = other._usedpieces[| 5]
		
			var r;
			ds_stack_clear(Stack)
			for(r = ds_list_size(other._usedpieces) - 1; r >= 6; r --)
			{
				ds_stack_push(Stack,other._usedpieces[| r])
			}
		}
	}
}

function PlayInputRecording(){
	// PlayInputRecording Script
	if(!pause and !gameover)
	{
		if(_index < ds_grid_height(_inputSequence) and _inputSequence[# 0, _index] == _frame)_index++

		_frame++

	}
}