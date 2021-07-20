Posy = (y + 1152) / 64
Posx = (x - Control.BoardStart) / 64

CColor = Control.board[Posy, Posx]

image_speed  = 0
image_xscale = 2
image_yscale = 2

if(Options[1] < 14)
{
    image_blend = ColorPal[CColor]
    image_index = Options[1]
}
else
{
    image_blend  = c_white
    image_xscale = 8
    image_yscale = 8
    
	switch(Options[1])
	{
		case 15:
			sprite_index = Spc_Nes_spr
			image_index  = ((CColor - 1) mod 3) + (3 * ((level - 1) mod 10))
			
			if(CColor == 90) image_index = 30
			break
			
		case 14:
			sprite_index = Spc_Block_spr
			break
			
		case 16:
			sprite_index = Spc_TGM_spr
			break
			
		case 17:
			image_xscale = 4
			image_yscale = 4
			sprite_index = Spc_WRL_spr
			break
			
		case 18:
			sprite_index = Spc_Program_spr
			break
	}
	
	if(Options[1] != 15) image_index = (CColor - 1) mod 90
}

var h,s,v, col = image_blend;
    
h = colour_get_hue(col)
s = colour_get_saturation(col)
v = colour_get_value(col)

v -= v * (0.20)
    
col = make_colour_hsv(h,s,v)

image_blend = col

if(Control.stage != 2) Flash = true
else Flash = false
alpha = 0.6

Vanish = false

