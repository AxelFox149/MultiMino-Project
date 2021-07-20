/// @description Sets a tile's blending.
/// @param index The index of the tile.
/// @param colour The colour to blend the tile with.
/// @returns 
function tile_set_blend(argument0, argument1) {

	var __index = argument0;
	var __colour = argument1;

	return layer_tile_blend(__index, __colour);
}
