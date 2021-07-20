function TilesColour(argument0) {
	var Colour, tiles = tile_get_ids();

	Colour = argument0;

	for (var i = 0; i < array_length_1d(tiles); i++;)
	{
	        tile_set_blend(tiles[i], Colour);
	}



}
