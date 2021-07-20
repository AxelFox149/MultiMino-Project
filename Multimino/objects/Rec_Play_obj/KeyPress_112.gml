/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if(gameover and !_saveFlag and ((GMode != 6 and GMode < 10) or GMode == 12) and !PlayMode)
{
	WriteInputRecording(_fileName)
	
	_saveFlag = true
}