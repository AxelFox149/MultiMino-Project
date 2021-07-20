/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if(!Scores[111])
{
	switch(stage)
	{
		case 0:
			var Up = keyboard_check_pressed(vk_up)
			var Dn = keyboard_check_pressed(vk_down)
			
			if(Up and Options[2] != 0) Options[2] --
			if(Dn and Options[2] != 1) Options[2] ++
			
			draw_sprite_ext(SArrow,0,room_width/2 - 160, room_height/2 - 68 + (124 * Options[2]),7,7,0,c_white,1)
			
			draw_text(room_width/2, room_height/4, " - Select your language - ")
			draw_text(room_width/2, room_height/2, string_hash_to_newline("English## Español"))
			
			if(keyboard_check_pressed(vk_enter))
			{
				if(Options[2] == 0) LanFile = "ENG_Text.ini"
				else				LanFile = "ESP_Text.ini"
				
				ini_open(LanFile)
				
				Text1 = ini_read_string("Text", "Alert[0]", "Error")
				Text0 = ini_read_string("Text", "Alert[1]", "Error")
				Text2 = ini_read_string("Text", "Alert[2]", "Error")
				
				ini_close()
				
				stage ++
			}
			break
		
		case 1:
			draw_set_font(Console_Title)
			draw_text(room_width/2, room_height/5, string_hash_to_newline(Text1))
			
			draw_set_font(Console)
			draw_text(room_width/2, room_height/2, string_hash_to_newline(Text0))
			
			draw_text(room_width/2, room_height/2 + 512, string_hash_to_newline(Text2))
			
			if(keyboard_check_pressed(vk_enter))
			{
				if(Options[2] == 0) LanFile = "ENG_Text.ini"
				else				LanFile = "ESP_Text.ini"
				
				ini_open(LanFile)
				
				if(!LoadError) Text0 = ini_read_string("Text", "Tutorial", "Error")
				else		   Text0 = ini_read_string("Text", "Error",    "Error")
				
				ini_close()
				
				alarm[0] = 420
				
				stage ++
			}
			break
		
		case 2:
			if(LoadError) draw_text(room_width/2, room_height/2, string_hash_to_newline(Text0))
			else
			{
				draw_text(room_width/2, room_height/4, string_hash_to_newline(Text0))
				
				draw_sprite_ext(B_Tutorial,Anim,room_width/2, room_height/2, 8, 8, 0, c_white, 1)
				Anim += 0.2
			}
			break
	}
	
}
else draw_text(room_width/2, room_height/2, string_hash_to_newline(Text0))

if(fade)
{
	draw_sprite_tiled(Gradient_spr,anframe,0,0)
	anframe += 0.35
	
	if(anframe >= 8)
	{
		if(!Scores[111])
		{
			Scores[111] = true
			MapDataSave()
		}
		draw_set_valign(fa_top)
		draw_set_halign(fa_left)
		room_goto_next()
	}
}