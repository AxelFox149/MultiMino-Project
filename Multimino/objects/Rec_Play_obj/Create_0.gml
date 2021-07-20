/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
// Variables


if(!Options[12] and !PlayMode) instance_destroy()
else
{
	// Check if currently recording or playing
	_isRecording = false;
	_isPlaying   = false;

	_saveFlag = false

	// Variables to keep track of the frames
	_frame = 0;
	_index = 0;

	// Arrays to store the keys to record, and the recorded values and frames
	_input         = array_create(16,0);
	//_inputSequence[0,0] = 0;
	//_inputSequence[0,1] = 0;
	_inputSequence = ds_grid_create(17,1)
	_usedpieces    = ds_list_create()

	// Hotkeys to start/stop recording and playback
	_kRecord = RecordMode;
	_kPlay   = PlayMode;

	Draw = true
	_pulse = false

	SpeedMod = array_create(6)

	SpeedMod[0] = 10
	SpeedMod[1] = 15
	SpeedMod[2] = 30
	SpeedMod[3] = 60
	SpeedMod[4] = 120
	SpeedMod[5] = 240
	SpeedMod[6] = 480

	_CurrentSpeed = 3

	if(((GMode != 12 and GMode >= 10) or GMode == 6) or (!RecordMode and !PlayMode))
	{
		_kRecord = 0;
		_kPlay   = 0;
	
		ds_grid_destroy(_inputSequence)
		ds_list_destroy(_usedpieces)
	
		instance_destroy()
	}


	if(((GMode != 6 and GMode != 7 and GMode < 10) or GMode == 12) and RecordMode)
	{
		ds_list_add(_usedpieces, Polyminoe.CurrentPiece)
		ds_list_add(_usedpieces, Control.Queue[0])
		ds_list_add(_usedpieces, Control.Queue[1])
		ds_list_add(_usedpieces, Control.Queue[2])
		ds_list_add(_usedpieces, Control.Queue[3])
		ds_list_add(_usedpieces, Control.Queue[4])
	}

	if(GMode == 7 and RecordMode) ds_list_add(_usedpieces,GameMode.RndT)


	if(RecordMode)
	{
		var _ModeStr, _Date, _PieceStr;
	
		switch(GMode)
		{
			case 0:  _ModeStr = "Endless"; break;
			case 1:  _ModeStr = "M150"; break;
			case 2:  _ModeStr = "M200"; break;
			case 3:  _ModeStr = "M300"; break;
			case 4:  _ModeStr = "Sprint"; break;
			case 5:  _ModeStr = "Ultra"; break;
			case 6:  _ModeStr = "Survival"; break;
			case 7:  _ModeStr = "SpinClear"; break;
			case 8:  _ModeStr = "Master"; break;
			case 9:  _ModeStr = "Combo"; break;
			case 10: _ModeStr = "VsCPU"; break;
			case 12: _ModeStr = "Classic"; break;
	
			default: _ModeStr = "Null"; break;
		}
		switch(QueueMode)
		{
			case 0:  _PieceStr = "Tetris"; break;
			case 1:  _PieceStr = "Pentris"; break;
			case 2:  _PieceStr = "Multris"; break;
			case 3:  _PieceStr = "Tetris+"; break;
			case 4:  _PieceStr = "Pentris+"; break;
			case 5:  _PieceStr = "Polytris"; break;
			case 6:  _PieceStr = "Hextris"; break;

			default: _PieceStr = "Null"; break;
		}
	
		_Date  = string(current_day) + "-" + string (current_month) + "-" + string(current_year) + "_"
		_Date  = _Date + string(current_hour) + "-" + string(current_minute) + "-" + string(current_second)

		_fileName = "Rec_" + _PieceStr + "_" + _ModeStr + "_" + _Date + ".txt";
	}
	if(PlayMode) _fileName = CurrentReplay
}