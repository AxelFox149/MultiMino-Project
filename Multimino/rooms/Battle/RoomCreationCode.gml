tile_layer_hide(-4)
tile_layer_hide(-5)
tile_layer_hide(-6)

if(GMode == 6)      tile_layer_show(-6)
else if(GMode == 9) tile_layer_show(-4)
else                tile_layer_show(-5)

instance_deactivate_object(Control)
instance_deactivate_object(Polyminoe)
instance_deactivate_object(EnControl)
instance_deactivate_object(Enemy)
instance_deactivate_object(ComboArt)

pause = true