/// @description Inserte aquí la descripción
// Puede escribir su código en este editor


var _num = irandom_range(0,69)
ini_open(LanFile)

Text0 = ""
Text1 = ""
Text2 = ""

if(!LoadError) Text0 = ini_read_string("Text", "Void" + string(_num),"What?")

ini_close()
anframe = 0
fade    = false

Anim = 0

stage = 0

if(Scores[111]) alarm[0] = 180

draw_set_colour(c_white)
draw_set_font(Console)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
