/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if(PlayMode)
{
	var SpeedUp, SlowDown;

	SlowDown = keyboard_check_pressed(ord("1"))
	SpeedUp  = keyboard_check_pressed(ord("2"))

	if(SlowDown and _CurrentSpeed != 0) _CurrentSpeed --
	if(SpeedUp  and _CurrentSpeed != 6) _CurrentSpeed ++
}

if(pause or gameover) game_set_speed(60, gamespeed_fps)
else
{
	game_set_speed(SpeedMod[_CurrentSpeed], gamespeed_fps)
}


if (_kRecord and !_isPlaying)
	{
	    // Save the recording
	    //if (_isRecording) WriteInputRecording(_fileName);
	    _isRecording = !_isRecording;
	}
	
if (_kPlay and !_isRecording)
	{
	    _isPlaying = !_isPlaying;
    
	    // Load up all the recording sequence from the file into memory
	    if (_isPlaying) ReadInputRecording(_fileName);
	}

if(!pause)
{	
	if (_isRecording or _pulse)
	{
			var i = 0,j = 0;
			
			for(i = 0; i < 16; i++)
			{
				if((_input[i] != _inputSequence[# i + 1,_index]) or _pulse)
				{
					ds_grid_resize(_inputSequence, 17, ds_grid_height(_inputSequence) + 1)
					
					_inputSequence[# 0, _index + 1] = _frame
					
					for(j = 0; j < 16; j++) 
					{
						_inputSequence[# j + 1,_index + 1] = _input[j]
					}
					
					_index ++;
					break;
				}
			}
			_frame ++
	}
	
	if (_isPlaying) PlayInputRecording();
	
	//_kRecord = keyboard_check_pressed(ord("Q"));
	//_kPlay   = keyboard_check_pressed(ord("P"));
	
	_kRecord = 0;
	_kPlay   = 0;
	_pulse   = false
}