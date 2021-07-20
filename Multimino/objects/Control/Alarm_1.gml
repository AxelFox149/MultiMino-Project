/// @description Piece reset

	instance_activate_object(Polyminoe)
	PieceReset(false, Polyminoe)

	NState   = 0
	if(GMode == 12 or GMode == 13)
	{
		if(GMode == 12) PieceCount[Polyminoe.CurrentPiece - 1] ++
		NState = 2
	}
	update   = false
	stage    = 0
	n        = 0
	LDASLoad  = false
	RDASLoad  = false