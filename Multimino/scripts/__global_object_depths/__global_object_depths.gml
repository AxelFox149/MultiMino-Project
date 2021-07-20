function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = -10; // Polyminoe
	global.__objectDepths[1] = -12; // Placed
	global.__objectDepths[2] = 0; // Wall
	global.__objectDepths[3] = -7; // ComboArt
	global.__objectDepths[4] = -11; // Control
	global.__objectDepths[5] = -16; // GameMode
	global.__objectDepths[6] = 0; // Menu
	global.__objectDepths[7] = 0; // RotSis
	global.__objectDepths[8] = -20; // scrCapture
	global.__objectDepths[9] = -10; // Enemy
	global.__objectDepths[10] = -12; // EnPlaced
	global.__objectDepths[11] = -11; // EnControl


	global.__objectNames[0] = "Polyminoe";
	global.__objectNames[1] = "Placed";
	global.__objectNames[2] = "Wall";
	global.__objectNames[3] = "ComboArt";
	global.__objectNames[4] = "Control";
	global.__objectNames[5] = "GameMode";
	global.__objectNames[6] = "Menu";
	global.__objectNames[7] = "RotSis";
	global.__objectNames[8] = "scrCapture";
	global.__objectNames[9] = "Enemy";
	global.__objectNames[10] = "EnPlaced";
	global.__objectNames[11] = "EnControl";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
