/// @description Matrix shift

if(!Options[0]) VerVel = 0

if(instance_exists(Polyminoe) and Options[0] and GMode != 10){
    var COND = false;
	
	with(Polyminoe)
    {
        if(Dir != 0 and !place_free(x + (64 * Dir), y)) COND = true

		if(PlaceTimer <= 0) other.VerVel = -10
    }
	
	if(COND) CurrentVel = AcceleScr(CurrentVel, MaxVel * Polyminoe.Dir, 2.5 - abs(CurrentVel * 3/MaxVel))
	else	 CurrentVel = AcceleScr(CurrentVel, 0, 3 - abs(CurrentVel * 2.5/MaxVel))
}
else		 CurrentVel = AcceleScr(CurrentVel, 0, 3 - abs(CurrentVel * 2.5/MaxVel))


VerVel = AcceleScr(VerVel, 0, 2 - abs(VerVel * 1.5/ 20))
camera_set_view_pos(_Camera, 0 + CurrentVel, 0 + VerVel)