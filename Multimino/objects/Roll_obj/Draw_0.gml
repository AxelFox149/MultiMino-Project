/// @description Inserte aquí la descripción
// Puede escribir su código en este editor


draw_sprite_ext(Logo,0,(room_width / 2) - 498, 550 + CreditOffsetY,12,12,0,c_white,1)


draw_set_color(c_black)
draw_set_alpha(0.5)
draw_text(264, 908  + CreditOffsetY + ExtraYOff,CreditText[6])
draw_text(264, 1108 + CreditOffsetY + ExtraYOff,CreditText[7])
draw_text(264, 1758 + CreditOffsetY + ExtraYOff,CreditText[8])
draw_text(264, 2033 + CreditOffsetY + ExtraYOff,CreditText[9])
draw_text(264, 2608 + CreditOffsetY + ExtraYOff,CreditText[10])
draw_text(328, 908  + CreditOffsetY + ExtraYOff,CreditText[0])
draw_text(328, 1108 + CreditOffsetY + ExtraYOff,CreditText[1])
draw_text(328, 1758 + CreditOffsetY + ExtraYOff,CreditText[2])
draw_text(328, 2033 + CreditOffsetY + ExtraYOff,CreditText[3])
draw_text(908, 2033 + CreditOffsetY + ExtraYOff,CreditText[4])
draw_text(328, 2608 + CreditOffsetY + ExtraYOff,CreditText[5])
draw_text(328, 4508 + CreditOffsetY + ExtraYOff,CreditText[12])

draw_set_halign(fa_center)
draw_text_transformed(room_width/2 + 12, 6162 + CreditOffsetY + ExtraYOff,CreditText[11],1.5,1.5,0)
draw_set_halign(fa_left)

draw_set_alpha(1)

draw_set_colour(c_yellow)
draw_text(256, 900  + CreditOffsetY + ExtraYOff,CreditText[6])
draw_text(256, 1100 + CreditOffsetY + ExtraYOff,CreditText[7])
draw_text(256, 1750 + CreditOffsetY + ExtraYOff,CreditText[8])
draw_text(256, 2025 + CreditOffsetY + ExtraYOff,CreditText[9])
draw_text(256, 2600 + CreditOffsetY + ExtraYOff,CreditText[10])

draw_set_color(c_white)
draw_text(320, 900  + CreditOffsetY + ExtraYOff,CreditText[0])
draw_text(320, 1100 + CreditOffsetY + ExtraYOff,CreditText[1])
draw_text(320, 1750 + CreditOffsetY + ExtraYOff,CreditText[2])
draw_text(320, 2025 + CreditOffsetY + ExtraYOff,CreditText[3])
draw_text(900, 2025 + CreditOffsetY + ExtraYOff,CreditText[4])
draw_text(320, 2600 + CreditOffsetY + ExtraYOff,CreditText[5])
draw_text(320, 4500 + CreditOffsetY + ExtraYOff,CreditText[12])

draw_set_halign(fa_center)
draw_text_transformed(room_width/2, 6150 + CreditOffsetY + ExtraYOff,CreditText[11],1.5,1.5,0)
draw_set_halign(fa_left)



if(ExitSec)
{
	draw_sprite_tiled(Gradient_spr,frame,0,0)
    
    frame += 0.35
    
    if(frame >= 8)
    {
		PixelFade = -1
		room_goto(Title)
	}
}
else if(frame >= 0)
{
	draw_sprite_tiled(Gradient_spr,frame,0,0)
	frame -= 0.35
}