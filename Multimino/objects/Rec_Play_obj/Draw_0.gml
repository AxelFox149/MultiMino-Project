/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

//var i;

if(PlayMode)
{
	ini_open(LanFile)
	
	if(Draw) draw_text(608,32,ini_read_string("Text", "Game[22]", "a"))
	if(alarm[0] <= 0) alarm[0] = 60
	
	
	draw_text(608,96,"x" + string(SpeedMod[_CurrentSpeed] / 60))
	draw_text(896,32,_frame)
	draw_text(1024,32, " / " + string(TotalFrames))
	
	draw_text_transformed(32,1198,ini_read_string("Text", "Game[19]", "a"),0.9,0.9,0)
	draw_text_transformed(64,1262,ini_read_string("Text", "Game[20]", "a"),0.9,0.9,0)
	draw_text_transformed(64,1326,ini_read_string("Text", "Game[21]", "a"),0.9,0.9,0)
	ini_close()
}
//for(i = 0; i < 15; i++) draw_text(16 + 32 *i,128,_inputSequence[# i + 1, _index])
//for(i = 0; i < ds_list_size(_usedpieces); i++) draw_text(256,128 + 48 * i,_usedpieces[| i])
/*

if(ds_exists(_inputSequence,ds_type_grid))
{
	var j, lim = ds_grid_height(_inputSequence);
	
	if(_isRecording)
	{
		if(lim > 20)
		{
			lim = 20
			DrawOff = ds_grid_height(_inputSequence) - 20
		}
	}
	else
	{
		if(lim > 20)
		{
			lim = 20
			
			if(_index > lim) DrawOff = _index - 20
		}
	}
	
	for(j = 0; j < lim; j++)
	{

		if(j + DrawOff == _index - 1) draw_set_color(c_green)
		
		draw_text(16 ,512 + 48 * j,_inputSequence[# 0,j + DrawOff])
		//for(i = 0; i < 16; i++)draw_text(128 + 48*i,192 + 48 * j,_inputSequence[# i + 1, j + DrawOff])
	
		draw_set_color(c_white)
	}
}
*/