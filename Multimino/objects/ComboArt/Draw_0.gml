/// @description Bonificaciones

if(ComboDraw and GMode != 10)
{
    if(BTB != 1 and n!= 0)
    {
        draw_sprite_ext(BackToBack,BTFrame,232,892,Scale,Scale,0,c_white,1)
        if(BTFrame >= 17) BTFrame = 10
        if!(pause)        BTFrame += 0.5
    }
    if(n == 4 and !PSpin) draw_sprite_ext(ATetris, TrisFrame,232,1000,Scale,Scale,0,c_white,1)
    if(n == 5 and !PSpin) draw_sprite_ext(APentris,TrisFrame,232,1000,Scale,Scale,0,c_white,1)
	if(n == 6 and !PSpin) draw_sprite_ext(AHextris,TrisFrame,232,1000,Scale,Scale,0,c_white,1)
    
    if(Mini)       draw_sprite_ext(MiniAn ,SpinFrame,232,974,Scale,Scale,0,c_white,1)
    else if(Super) draw_sprite_ext(SuperAn,SpinFrame,232,974,Scale,Scale,0,c_white,1)
    
    if(PSpin){
		if(LP != 47)
		{
						 draw_sprite_ext(Popout_spr,PopFrame,116,1024, Scale, Scale,0,c_white,1)
						 draw_sprite_ext(SpriteAn,SpinFrame, 232,1024, Scale, Scale,0,c_white,1)
        if(PopFrame >= 4)draw_sprite_ext(Letters ,LettFrame, 116,1024, Scale, Scale,0,c_white,1)
		}
		else			 draw_sprite_ext(SpinQTN_spr,SpinFrame, 232,1024, Scale, Scale,0,c_white,1)
		
		if(n == 4)       draw_sprite_ext(ATetris ,SpinFrame, 232,1115, Scale, Scale,0,c_white,1)
		else if(n == 5)  draw_sprite_ext(APentris,SpinFrame, 232,1115, Scale, Scale,0,c_white,1)
		else if(n == 6)  draw_sprite_ext(AHextris,SpinFrame, 232,1115, Scale, Scale,0,c_white,1)
        else if(n > 0)   draw_sprite_ext(SDT, (n - 1) + (Options[2] * 3), 232,1110, Scale, Scale,0,c_white,1)
    }
    
    if!(pause)
    {
		if(LP != 47)
		{
			if(PopFrame  <   7)													PopFrame  += 0.5
	        if((LettFrame <= (9 * (AnimOffset[LP] + 1)) - 1) and PopFrame >= 4) LettFrame += 0.4
		}
		if(SpinFrame <= 16)			   SpinFrame += 0.5
		
        if(TrisFrame <= 18)            TrisFrame += 0.5
        else                           TrisFrame  = 15
    }
}

if(GMode == 7 or GMode == 12) draw_sprite_ext(CantHold,0,232 + CurrentVel,195 + VerVel,2,2,0,c_white,1)

if(GMode == 10)
{
    if(ComboEnemy)
    {
        if(EnBTB and n!= 0)draw_sprite_ext(MiniBtB,      4,1344,1472,4 * Scale,4 * Scale,0,c_white,1)
        if(EnLines == 4)   draw_sprite_ext(MiniTetris,  17,1624,1472,4 * Scale,4 * Scale,0,c_white,1)
    }
    if(EnCount > 0)
    {
        draw_sprite_ext(SpcCombo,3,1064,1472,4 * Scale, 4 * Scale,0,c_white,1)
        draw_set_font(ComboNum)
        draw_set_valign(fa_center)
        draw_text_transformed(1196, 1472, string_hash_to_newline(EnCount), 0.85,0.85,0)
        draw_set_valign(fa_top)
        draw_set_font(Console)
    }
    
    if(ComboDraw)
    {
        if(BTB and n!= 0)     draw_sprite_ext(MiniBtB,    0, 448,1472,4* Scale,4* Scale,0,c_white,1)
        if(n == 4 and !PSpin) draw_sprite_ext(MiniTetris, 0, 728,1472,4* Scale,4* Scale,0,c_white,1)
        if(Mini)              draw_sprite_ext(SpcMini,    0, 524,1472,2* Scale,2* Scale,0,c_white,1)
        if(PSpin)             draw_sprite_ext(MiniSpin,   0, 728,1472,4* Scale,4* Scale,0,c_white,1)
    }
}

///Display de Combo

if(Counter > 0)
{
    if(GMode != 10)
    {
        draw_sprite_ext(ComboAn,ComboFrame,232,824,Scale,Scale,0,c_white,1)
        draw_set_font(ComboNum)
        draw_text(326, 824, string_hash_to_newline(Counter))
        draw_set_font(Console)
        if(ComboFrame < 3.5) ComboFrame += 0.5
    }
    else
    {
        draw_sprite_ext(SpcCombo,0,168,1472,4 * Scale,4 * Scale,0,c_white,1)
        draw_set_font(ComboNum)
        draw_set_valign(fa_center)
        draw_text_transformed(300, 1472, string_hash_to_newline(Counter), 0.85,0.85,0)
        draw_set_valign(fa_top)
        draw_set_font(Console)
    }
}

///Missed Spin

if(Miss){
    draw_sprite_ext(Missed,floor(MissFrame),896, 320, 8, 8, 0, c_white, 1)
    
    if!(pause)
    {
        if(DespVel < 8 or DespVel > 52) MissFrame += 0.5
        DespVel ++
    }
    
    if(MissFrame > 7)
    {
        Miss = false
        MissFrame = 0
        DespVel = 0
    }
}

///Pausa y Modo de juego

if(GMode == 15)      draw_sprite_ext(SpinEditor_spr,0,232,695,6,6,0,c_white,1)
else if(GMode != 10) draw_sprite_ext(ModeSprite,GMode + (13 * Options[2]),232,695,6,6,0,c_white,1)
else
{
    draw_sprite_ext(ModeSprite,GMode,room_width/2,695,6,6,0,c_white,1)
    draw_set_halign(fa_center)
    draw_text(room_width/2,760,string_hash_to_newline("LV " + string(IALevel)))
    draw_set_halign(fa_left)
}

if(pause)
{
    if!(GMode == 11)
    {
        if(GMode != 10) draw_sprite_ext(PauseAn,PauseFrame,232,448,4 * 1.25,4 * 1.25,0,c_white,1)
        else			draw_sprite_ext(PauseAn,PauseFrame,(room_width/2),(room_height/2) - 232,4 * 1.25,4 * 1.25,0,c_white,1)
		
        PauseFrame += 0.2
    
        if(PauseFrame > 15) PauseFrame = 0
    }
    else
    {
		ini_open(LanFile)
        draw_set_halign(fa_center)
        draw_set_alpha(0.85)
        draw_rectangle_colour(0,0,room_width,room_height,c_black,c_black,c_black,c_black,false)
        draw_set_alpha(1)
        draw_text_transformed((room_width/2),(room_height/2) - 232,string_hash_to_newline(ini_read_string("Text","Game[14]","a")),0.85,0.85,0)
        draw_set_halign(fa_left)
		ini_close()
    }
}

///Perfect Clear

if(AC)
{
    draw_sprite_ext(AllClear,ACFrame,896,320,8 * (1 + SizeCount),8 * (1 + SizeCount),0,c_white,1)
    
    if!(pause)
    {
        if(ACCounter < 8 or ACCounter > 82) ACFrame += 0.5
        ACCounter ++
        if(ACCounter mod 6 == 0)SizeCount += 0.013
    }
    
    if(ACCounter > 90)
    {
        AC = false
        ACCounter = 0
        ACFrame   = 0
        SizeCount = 0
    }
}

///Ancient Multris

if(QueueMode == 2 and !AMFlag and level >= 20 and GMode == 2)
{
    //background_colour = make_colour_rgb(202,222,113)
    //TilesColour($0F380F)
    Options[1] = 14
    with(Placed)
    {
        sprite_index = Spc_Block_spr 
        image_blend  = c_white
        image_xscale = 8
        image_yscale = 8
        image_index  = (30 * (Options[1] - 14)) + ((CColor - 1) mod 30)
    }
	
	GSounds[0] = GB_LineClear	  //Line clear
	GSounds[1] = GB_Tetris		  //4 lines
	GSounds[2] = GB_Tetris		  //Spin line clear
	GSounds[3] = GB_Drop		  //Placed sound
	GSounds[4] = GB_Rotate		  //Rotation
	GSounds[5] = GB_Rotate		  //Spin Rotation
	GSounds[6] = GB_Move		  //Move Block
	GSounds[7] = Gen_BlockedSound //Can't Rotate
	GSounds[8] = Gen_HoldPiece    //Hold Sound
	GSounds[9] = GB_LevelUp		  //LevelUp
	
    AMFlag = true
}

if(AMFlag and FVal > 0)
{
    depth = -20
    draw_set_alpha(FVal)
    draw_rectangle_colour(0,0,room_width,room_height,c_white,c_white,c_white,c_white,false)
    draw_set_alpha(1)
    FVal -= 0.05
    depth = -7
}

if(pause)
{
	alarm_set(0, AlarmsHold[0])
	alarm_set(1, AlarmsHold[1])
}