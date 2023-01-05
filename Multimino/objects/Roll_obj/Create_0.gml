/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
ini_open(LanFile)
back = layer_get_id("Background");
layer_y(back, 0)



ExitSec       = false
frame         = 8
LayerOffsetY  = 0
CreditOffsetY = 0
Roll = false

ExtraYOff = 640

alarm[0] = 120

CreditText[0] = @"
	Axel Fox"
	
CreditText[1] = @"
	Whocker
	Gotoxy
	MarkGamed7794
	Oshisaure
	SashLilac
	ArturoCM
	Coalt"
	
CreditText[2] = @"
	Chart
	MattMayuga"
	
CreditText[3] = @"
	Cambridge
	Puzzle Juggle Trouble
	Tetra Legends
	Master of Blocks
	Spirit Drop
	Pent-Up"

CreditText[4] = "\n"
	
CreditText[5] = @"
	Cambridge Discord
	Harddrop Discord
	Tetris Chatroom Discord
	Multimino Discord
	Tetris wiki
	Zarhaji Xolani
	Rodrigo Reyes
	Nikki Karissa
	Phoenix Flare
	GamerTim99
	gizmo4487
	Axcel CR
	MochoForestCat
	MixyDraws
	Blink
	Mine
	Dr Ocelot
	DeeDeeEn
	Gaby Urbano
	Alex Figueroa
	Zomer Vergara
	Darksnes
	Tetrian22
	Dr Mapache
	Ratafuzz"
	
CreditText[6]  = ini_read_string("Text", "CreditText[3]","Developer")				//"Developer"
CreditText[7]  = ini_read_string("Text", "CreditText[4]","Beta Testers")			//"Beta Testers"
CreditText[8]  = ini_read_string("Text", "CreditText[5]","Composer & Sound Design") //"Composer & Sound Design"
CreditText[9]  = ini_read_string("Text", "CreditText[6]","Other Games")				//"Other Games"
CreditText[10] = ini_read_string("Text", "CreditText[7]","Special Thanks")			//"Special Thanks"
CreditText[11] = ini_read_string("Text", "CreditText[8]","Thanks for playing")		//"Thanks for playing!"

CreditText[12] = "\n"
CreditText[12] += ini_read_string("Text", "CreditText[0]","Mamá y Papá") + "\n"
CreditText[12] += ini_read_string("Text", "CreditText[1]","Mi hermano") + "\n"
CreditText[12] += ini_read_string("Text", "CreditText[2]","And YOU, the player!")
var Tx1
Tx1 = ini_read_string("Text", "CreditText[10]","by")

CreditText[4] += Tx1 + " SashLilac\n"
CreditText[4] += Tx1 + " Oshisaure\n"
CreditText[4] += Tx1 + " Dr Ocelot\n"
CreditText[4] += Tx1 + " Phoenix Flare\n"
CreditText[4] += Tx1 + " RayRay26\n"
CreditText[4] += Tx1 + " Uni99"

ini_close();