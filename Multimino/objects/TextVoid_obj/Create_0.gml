/// @description Inserte aquí la descripción
// Puede escribir su código en este editor


var _num = irandom_range(0,69)
ini_open(LanFile)

Text0 = ""
Text1 = ""
Text2 = ""
Text3 = ""
Text4 = ""

if(!LoadError)
{
	Text0 = ini_read_string("Text", "Void" + string(_num),"What?")
	if(Scores[111]) alarm[0] = 180
}
else
{
	Text0 = ini_read_string("Text", "Error0", "Error")
	Text1 = ini_read_string("Text", "Error" + string(ErrorType), "Error")
	Text2 = ini_read_string("Text", "Alert[3]", "Error")
	
	if(ErrorType < 4) Text3 = ini_read_string("Text", "Alert[5]", "Error")
	else if(ErrorType < 7) Text3 = ini_read_string("Text", "Alert[6]", "Error")
	
	Text4 = ini_read_string("Text", "Alert[4]", "Error")
}

ini_close()
anframe = 0
fade    = false

Anim = 0
stage = 0

draw_set_colour(c_white)
draw_set_font(Console)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
