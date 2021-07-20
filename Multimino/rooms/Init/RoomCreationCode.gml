globalvar Options, Buttons, CurrentButtons, Scores, LanFile, LoadError, Compatible, PieceIndex;
globalvar CurJPadButtons, JoyPadButtons, Text, MenuText, Keys, Desc, _CurrentGP;

room_speed = 60

LoadError	   = false
Buttons        = array_create(8)
JoyPadButtons  = array_create(8)
CurrentButtons = array_create(8)
CurJPadButtons = array_create(8)
Options        = array_create(9)
Scores		   = array_create(112)
Compatible	   = array_create(9)
PieceIndex	   = array_create(90, Point)

randomize()

//----------------------------------------
//Versiones
Compatible[0] =  "1.0.0.0"
Compatible[1] =  "1.0.1.0"
Compatible[2] =  "1.0.2.0"
Compatible[3] =  "1.0.3.0"
Compatible[4] =  "1.0.4.0"
Compatible[5] =  "1.0.5.0"
Compatible[6] =  "1.0.6.0"
Compatible[7] =  "1.0.7.0"
Compatible[8] =  "1.0.8.0"
Compatible[9] =  "1.0.9.0"
Compatible[10] = "1.1.0.0"
Compatible[11] = "1.1.1.0"
Compatible[12] = "1.1.2.0"
Compatible[13] = "1.1.3.0"
Compatible[14] = "1.1.4.0"
Compatible[15] = "1.1.5.0"
Compatible[16] = "1.1.6.0"
Compatible[17] = "1.1.7.0"
Compatible[18] = "1.1.8.0"
Compatible[19] = "1.1.9.0"

//Options

Options[0] = 1  //Matrix Shift
Options[1] = 0  //Block Style
Options[2] = 0  //Language
Options[3] = 0  //Controls
Options[4] = 1  //Ghost Piece
Options[5] = 1  //Spin Detection
Options[6] = 12 //DAS Charge
Options[7] = 2  //ARR
Options[8] = 50 //Global Sound
Options[9] = 1  //Sound Effects
Options[10]= 1  //Music
Options[11]= 1  //Field Outline
Options[12]= 0  //Record Games	

//----------------------------------------
//Default Controls

Buttons[0] = 38  //Rotate Right
Buttons[1] = 40  //Soft Drop
Buttons[2] = 37  //Left
Buttons[3] = 39  //Right
Buttons[4] = 67  //Hold
Buttons[5] = 32  //Hard Drop
Buttons[6] = 88  //Rotate Left
Buttons[7] = 90  //Double Rotation
Buttons[8] = 82  //Reset

JoyPadButtons[0] = gp_face2
JoyPadButtons[1] = gp_padd
JoyPadButtons[2] = gp_padl
JoyPadButtons[3] = gp_padr
JoyPadButtons[4] = gp_shoulderr
JoyPadButtons[5] = gp_padu
JoyPadButtons[6] = gp_face1
JoyPadButtons[7] = gp_face3
JoyPadButtons[8] = gp_shoulderl

//----------------------------------------
//Current Controls
/*
CurrentButtons[0] = 38  //Rotate Right
CurrentButtons[1] = 40  //Soft Drop
CurrentButtons[2] = 37  //Left
CurrentButtons[3] = 39  //Right
CurrentButtons[4] = 67  //Hold
CurrentButtons[5] = 32  //Hard Drop
CurrentButtons[6] = 88  //Rotate Left
CurrentButtons[7] = 90  //Double Rotation
CurrentButtons[8] = 82  //Reset
*/
CurrentButtons = Buttons
CurJPadButtons = JoyPadButtons

//----------------------------------------
//Scores
	
	//Tetris
	Scores[0]  = 70000		//150     : Score
	Scores[1]  = "02:30.00" //Sprint  : Time
	Scores[2]  = 50000	    //Ultra   : Score
	Scores[3]  = "03:00.00" //Survival: Time
	Scores[4]  = 5		    //Spin	  : All Clears
	Scores[5]  = 150000	    //Master  : Score
	Scores[6]  = 10		    //Combo   : Count
	
	Scores[7]  = 90000		//200     : Score
	Scores[8]  = 20000		//Sprint  : Score
	Scores[9]  = ""			//Ultra   : -
	Scores[10] = 35000		//Survival: Score
	Scores[11] = 60000		//Spin	  : Score
	Scores[12] = "02:40.00"	//Master  : Time
	Scores[13] = ""			//Combo   : -
	
	Scores[14] = 150000		//300     : Score
	
	//Pentris
	Scores[15] = 40000		//150     : Score
	Scores[16] = "04:00.00" //Sprint  : Time
	Scores[17] = 30000	    //Ultra   : Score
	Scores[18] = "01:30.00" //Survival: Time
	Scores[19] = 5		    //Spin	  : All Clears
	Scores[20] = 75000	    //Master  : Score
	Scores[21] = 10		    //Combo   : Count
	
	Scores[22] = 50000		//200     : Score
	Scores[23] = 25000		//Sprint  : Score
	Scores[24] = ""			//Ultra   : -
	Scores[25] = 10000		//Survival: Score
	Scores[26] = 60000		//Spin	  : Score
	Scores[27] = "01:30.00"	//Master  : Time
	Scores[28] = ""			//Combo   : -
	
	Scores[29] = 80000		//300     : Score
	
	//Multris
	Scores[30] = 50000		//150     : Score
	Scores[31] = "03:30.00" //Sprint  : Time
	Scores[32] = 45000	    //Ultra   : Score
	Scores[33] = "02:30.00" //Survival: Time
	Scores[34] = 5		    //Spin	  : All Clears
	Scores[35] = 100000	    //Master  : Score
	Scores[36] = 10		    //Combo   : Count
	
	Scores[37] = 70000		//200     : Score
	Scores[38] = 50000		//Sprint  : Score
	Scores[39] = ""			//Ultra   : -
	Scores[40] = 15000		//Survival: Score
	Scores[41] = 60000		//Spin	  : Score
	Scores[42] = "02:00.00"	//Master  : Time
	Scores[43] = ""			//Combo   : -
	
	Scores[44] = 90000		//300     : Score
	
	//Tetris +
	Scores[45] = 75000		//150     : Score
	Scores[46] = "02:15.00" //Sprint  : Time
	Scores[47] = 50000	    //Ultra   : Score
	Scores[48] = "04:30.00" //Survival: Time
	Scores[49] = 5		    //Spin	  : All Clears
	Scores[50] = 175000	    //Master  : Score
	Scores[51] = 10		    //Combo   : Count
	
	Scores[52] = 85000		//200     : Score
	Scores[53] = 35000		//Sprint  : Score
	Scores[54] = ""			//Ultra   : -
	Scores[55] = 15000		//Survival: Score
	Scores[56] = 80000		//Spin	  : Score
	Scores[57] = "02:50.00"	//Master  : Time
	Scores[58] = ""			//Combo   : -
	
	Scores[59] = 95000		//300     : Score
	
	//Pentris +
	Scores[60] = 50000		//150     : Score
	Scores[61] = "04:15.00" //Sprint  : Time
	Scores[62] = 40000	    //Ultra   : Score
	Scores[63] = "02:45.00" //Survival: Time
	Scores[64] = 5		    //Spin	  : All Clears
	Scores[65] = 150000	    //Master  : Score
	Scores[66] = 10		    //Combo   : Count

	Scores[67] = 70000		//200     : Score
	Scores[68] = 60000		//Sprint  : Score
	Scores[69] = ""			//Ultra   : -
	Scores[70] = 25000		//Survival: Score
	Scores[71] = 60000		//Spin	  : Score
	Scores[72] = "02:10.00"	//Master  : Time
	Scores[73] = ""			//Combo   : -
	
	Scores[74] = 90000		//300     : Score
	
	//Ultimatris
	Scores[75] = 70000		//150     : Score
	Scores[76] = "03:30.00" //Sprint  : Time
	Scores[77] = 65000	    //Ultra   : Score
	Scores[78] = "02:30.00" //Survival: Time
	Scores[79] = 5		    //Spin	  : All Clears
	Scores[80] = 150000	    //Master  : Score
	Scores[81] = 10		    //Combo   : Count
	
	Scores[82] = 80000		//200     : Score
	Scores[83] = 50000		//Sprint  : Score
	Scores[84] = ""			//Ultra   : -
	Scores[85] = 15000		//Survival: Score
	Scores[86] = 60000		//Spin	  : Score
	Scores[87] = "02:45.00" //Master  : Time
	Scores[88] = ""		    //Combo   : -

	Scores[89] = 100000	//300     : Score
	
	//Hextris
	Scores[90] = 0			//Endless   : Score
	Scores[91] = "59:59.59"	//Sprint	: Time
	Scores[92] = 0			//Ultra		: Score
	Scores[93] = "00:00.00"	//Master    : Time
	Scores[94] = -1		    //Unused	
	Scores[95] = -1			//Unused
	Scores[96] = -1		    //Unused
	
	Scores[97] =  "00:00.00"//Endless   : Time
	Scores[98] =  0			//Sprint    : Score
	Scores[99] =  ""		//Ultra	    : Level
	Scores[100] = 0			//Master    : Score
	Scores[101] = -1		//Unused
	Scores[102] = -1		//Unused
	Scores[103] = -1		//Unused
	
	Scores[104] = -1		//Unused
	
	//Skins
	
	Scores[105] = false		//GameBoy
	Scores[106] = false		//NES
	Scores[107] = false		//TGM: Arika
	Scores[108] = false		//TGM: World
	Scores[109] = false		//Programmer art
	
	Scores[110] = 0			//Classic Score
	
	Scores[111] = false		//First time boot
	
//----------------------------------------
//ConfigInit()
MapDataInit()

LanTextLoad()
room_goto_next()




