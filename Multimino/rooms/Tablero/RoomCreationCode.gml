//room_speed = 10

var back = layer_background_get_id("Common_bg")
layer_background_xscale(back, 8);
layer_background_yscale(back, 8);
layer_background_stretch(back,false);

back = layer_background_get_id("Hexo_bg")
layer_background_xscale(back, 8);
layer_background_yscale(back, 8);
layer_background_stretch(back,false);
layer_background_visible(back, false);


back = layer_background_get_id("Combo_bg")
layer_background_xscale(back, 8);
layer_background_yscale(back, 8);
layer_background_stretch(back,false);
layer_background_visible(back, false);

tile_layer_hide(-2)
tile_layer_hide(-3)
tile_layer_hide(-4)
tile_layer_hide(-5)
tile_layer_hide(-6)

if !((QueueMode == 5 or QueueMode == 6) and GMode != 6 and GMode != 11 and GMode != 9)
{
	if(GMode == 11)     tile_layer_show(-3)
	if(GMode == 6)		tile_layer_show(-6)
	else if(GMode == 9)
	{
		tile_layer_show(-4)
	
		layer_background_visible(back, true)
	
		back = layer_background_get_id("Common_bg")
		layer_background_visible(back, false)
	}
	else tile_layer_show(-5)
}
else
{
	back = layer_background_get_id("Hexo_bg")
	layer_background_visible(back, true)
	
	back = layer_background_get_id("Common_bg")
	layer_background_visible(back, false)
	
	tile_layer_show(-2)
}

instance_deactivate_object(Control)
instance_deactivate_object(Polyminoe)
instance_deactivate_object(ComboArt)
instance_deactivate_object(Placed)

//audio_play_sound(CurrentMusic,10,true)

pause = true