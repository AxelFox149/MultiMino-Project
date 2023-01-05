globalvar level, lines, capture, Style, ColorPal, LevelCap, GMode, GOType;
globalvar LB, UB, TP, CDelay, Warning, PixelFade, Scared, IALevel, FirstTo;
globalvar Block, Corners, GSounds, CurrentMusic, pause, gameover, IsLevelUp;
globalvar G20, LockD, OSpin, QueueMode, DevMode, DangerMusic, NormalMusic;
globalvar CurrentReplay, PlayMode, RecordMode, TotalFrames, IsEdit, PieceMaxState;

//show_debug_overlay(true)

PieceMaxState = array_create(90, 4)

IsEdit    = false
PixelFade = -1;

pause    = false
gameover = false

PlayMode		= false
RecordMode		= true
TotalFrames		= 0
CurrentReplay	= ""
Options[10]		= 1	//NeverMusic

level = 1
score = 0
lines = 0

OSpin = true
LockD = true
G20   = false
DevMode   = false
IsLevelUp = false

IALevel = 1
FirstTo = 2

CurrentMusic = music_Marathon
NormalMusic  = music_Marathon
DangerMusic  = music_Danger_Marathon

LevelCap = 50
LB = 1
UB = 7
TP = 7

QueueMode = 0

GMode  = 1
GOType = -1

Warning = false

layer_hspeed("Grid", 0.5)
layer_vspeed("Grid", 0.5)

//----------------------------------------

ColorPal = array_create(92, $FFFFFF)

///Piece Colours

//Tetrominos

ColorPal[0] = $9D9D9D //Basura
ColorPal[1] = $FF00FF //T
ColorPal[2] = $0000FF //Z
ColorPal[3] = $00FF00 //S
ColorPal[4] = $0080FF //L
ColorPal[5] = $FF0000 //J
ColorPal[6] = $00FFFF //O
ColorPal[7] = $FFFF00 //I

//Pentominos

ColorPal[8]  = $FF80FF //Y
ColorPal[9]  = $800080 //R
ColorPal[10] = $8080FF //N
ColorPal[11] = $80FF80 //N2
ColorPal[12] = $80BDFF //L
ColorPal[13] = $FF8080 //J
ColorPal[14] = $00C3FF //Q
ColorPal[15] = $80FFFF //P
ColorPal[16] = $FF8C00 //I
ColorPal[17] = $FF007D //T
ColorPal[18] = $FF4D00 //F
ColorPal[19] = $004DFF //7
ColorPal[20] = $6000FF //W
ColorPal[21] = $00FFD4 //S
ColorPal[22] = $0000BF //Z
ColorPal[23] = $FFFF80 //U
ColorPal[24] = $9FFF00 //V
ColorPal[25] = $530080 //X

//Mo/Do/Tro-minos

ColorPal[26] = $00A0FF //Monomino
ColorPal[27] = $BF8F00 //Tromino I
ColorPal[28] = $BFBF00 //Domino  I
ColorPal[29] = $4079FF //Tromino V

//Hexominos

ColorPal[30] = $FF80BD //T
ColorPal[31] = $BF3D00 //f
ColorPal[32] = $0039BF //7
ColorPal[33] = $FFA880 //f_2
ColorPal[34] = $80A4FF //7_2
ColorPal[35] = $BF005C //$
ColorPal[36] = $FF409C //%
ColorPal[37] = $FFFFFF //t
ColorPal[38] = $00BF9F //S
ColorPal[39] = $000080 //Z

ColorPal[40] = $808000 //C
ColorPal[41] = $800000 //F
ColorPal[42] = $002480 //F2
ColorPal[43] = $80CEFF //P
ColorPal[44] = $004F80 //b
ColorPal[45] = $80DFFF //D
ColorPal[46] = $FFA880 //G
ColorPal[47] = $802800 //?
ColorPal[48] = $BC40FF //epsilon
ColorPal[49] = $FC00BF //3

ColorPal[50] = $BF3075 //yotta
ColorPal[51] = $008000 //m
ColorPal[52] = $8940FF //zetta
ColorPal[53] = $FFDBDD //phi
ColorPal[54] = $3030BF //w
ColorPal[55] = $40FFDF //sigma2

ColorPal[56] = $00BFBF //empty set
ColorPal[57] = $0060BF //phi2

ColorPal[58] = $310080 // \
ColorPal[59] = $B080FF // /

ColorPal[60] = $FFFFA6 //I
ColorPal[61] = $A200FF //tau
ColorPal[62] = $4900BF //z
ColorPal[63] = $00BF00 //s
ColorPal[64] = $409FFF //l
ColorPal[65] = $FF4040 //j
ColorPal[66] = $FF40FF //1_2
ColorPal[67] = $BF00BF //1
ColorPal[68] = $4040FF //N
ColorPal[69] = $40FF40 //N2

ColorPal[70] = $40FFFF //O
ColorPal[71] = $D280FF //E
ColorPal[72] = $80003E //Alpha
ColorPal[73] = $40CFFF //R
ColorPal[74] = $008FBF //q
ColorPal[75] = $40B6FF //Q
ColorPal[76] = $0076BF //sigma
ColorPal[77] = $BF0000 //mu
ColorPal[78] = $FFCF40 //H
ColorPal[79] = $FF7C40 //A

ColorPal[80] = $4F8000 //J
ColorPal[81] = $76BF00 //r
ColorPal[82] = $00806A //4_2
ColorPal[83] = $80A4FF //2
ColorPal[84] = $80FFEA //5
ColorPal[85] = $97BD5E //4
ColorPal[86] = $40FF40 //lambda
ColorPal[87] = $80FF80 //L
ColorPal[88] = $FFDF80 //u
ColorPal[89] = $806000 //n

ColorPal[90] = $9D9D9D //Basura
ColorPal[91] = $404040 //Editor

//----------------------------------

//Block = array_create(89, [0, 0,  0, 0,  0, 0,  0, 0,  0, 0,  0, 0])
Block = 0

///Piece block location

//Tetrominos
Block[0,0]  = [ 0, 0,  -1, 0,   1, 0,   0,-1] //T
Block[0,1]  = [ 0, 0,  -1,-1,   1, 0,   0,-1] //Z
Block[0,2]  = [ 0, 0,  -1, 0,   1,-1,   0,-1] //S
Block[0,3]  = [ 0, 0,  -1, 0,   1, 0,   1,-1] //L
Block[0,4]  = [ 0, 0,  -1, 0,   1, 0,  -1,-1] //J

Block[0,5]  = [-1,-1,   1,-1,  -1, 1,   1, 1] //O
Block[0,6]  = [-3,-1,  -1,-1,   1,-1,   3,-1] //I

//Pentominos
Block[0,7]  = [-3, 1,  -1, 1,   1, 1,   3, 1,   1,-1] //Y
Block[0,8]  = [-3, 1,  -1, 1,   1, 1,   3, 1,  -1,-1] //R
Block[0,9]  = [-3,-1,  -1, 1,   1, 1,   3, 1,  -1,-1] //N
Block[0,10] = [-3, 1,  -1, 1,   1, 1,   3,-1,   1,-1] //N2
Block[0,11] = [-3, 1,  -1, 1,   1, 1,   3, 1,   3,-1] //L
Block[0,12] = [-3, 1,  -1, 1,   1, 1,   3, 1,  -3,-1] //J
Block[0,13] = [-1,-1,   1,-1,  -1, 1,   1, 1,  -3, 1] //Q
Block[0,14] = [-1,-1,   1,-1,  -1, 1,   1, 1,   3, 1] //P

Block[0,15] = [ 0, 0,  -1, 0,  -2, 0,   1, 0,   2, 0] //I
Block[0,16] = [ 0, 0,   1, 1,  -1, 1,   0, 1,   0,-1] //T
Block[0,17] = [ 0, 0,   1, 0,  -1, 1,   0, 1,   0,-1] //F
Block[0,18] = [ 0, 0,   1, 1,  -1, 0,   0, 1,   0,-1] //7
Block[0,19] = [ 0, 0,   1, 1,  -1, 0,   0, 1,  -1,-1] //W
Block[0,20] = [ 0, 0,   1,-1,  -1, 1,   0, 1,   0,-1] //S
Block[0,21] = [ 0, 0,   1, 1,  -1,-1,   0, 1,   0,-1] //Z
Block[0,22] = [ 0, 0,  -1, 0,   1, 0,  -1,-1,   1,-1] //U
Block[0,23] = [ 0, 1,   1, 1,  -1, 1,  -1, 0,  -1,-1] //V
Block[0,24] = [ 0, 0,  -1, 0,   1, 0,   0,-1,   0, 1] //X

//Mo/Do/Tro-Minos

Block[0,25] = [ 0, 0]             //Point
Block[0,26] = [ 0, 0,  -1, 0,   1, 0] //Tromino I
Block[0,27] = [-1,-1,   1,-1]       //Domino  I
Block[0,28] = [-1,-1,  -1, 1,   1, 1] //Tromino V

//Hexominos
Block[0,29] = [-3, 1,  -1, 1,   1, 1,   3, 1,  -3,-1,  -3, 3] //T
Block[0,30] = [-3, 1,  -1, 1,   1, 1,   3, 1,  -3,-1,  -1, 3] //f
Block[0,31] = [-3, 1,  -1, 1,   1, 1,   3, 1,   3,-1,   1, 3] //7
Block[0,32] = [-3, 1,  -1, 1,   1, 1,   3, 1,  -3,-1,   1, 3] //f_2
Block[0,33] = [-3, 1,  -1, 1,   1, 1,   3, 1,   3,-1,  -1, 3] //7_2
Block[0,34] = [-3, 1,  -1, 1,   1, 1,   3, 1,  -1,-1,   1, 3] //$
Block[0,35] = [-3, 1,  -1, 1,   1, 1,   3, 1,   1,-1,  -1, 3] //%
Block[0,36] = [-3, 1,  -1, 1,   1, 1,   3, 1,  -1,-1,  -1, 3] //t
Block[0,37] = [-3, 1,  -1, 1,   1, 1,   3, 1,  -3,-1,   3, 3] //S
Block[0,38] = [-3, 1,  -1, 1,   1, 1,   3, 1,   3,-1,  -3, 3] //Z

Block[0,39] = [-3, 1,  -1, 1,   1, 1,   3, 1,  -3,-1,   3,-1] //C
Block[0,40] = [-3, 1,  -1, 1,   1, 1,   3, 1,  -3,-1,   1,-1] //f_3
Block[0,41] = [-3, 1,  -1, 1,   1, 1,   3, 1,  -1,-1,   3,-1] //7_3
Block[0,42] = [-3, 1,  -1, 1,   1, 1,   3, 1,  -3,-1,  -1,-1] //P
Block[0,43] = [-3, 1,  -1, 1,   1, 1,   3, 1,   1,-1,   3,-1] //b
Block[0,44] = [-3, 1,  -1, 1,   1, 1,   3, 1,  -1,-1,   1,-1] //D
Block[0,45] = [-3, 1,  -1, 1,   1, 1,   3,-1,  -3,-1,   1,-1] //G
Block[0,46] = [-3,-1,  -1, 1,   1, 1,   3, 1,  -1,-1,   3,-1] //?
Block[0,47] = [-3,-3,  -1, 1,   1, 1,   3, 1,  -3,-1,  -1,-1] //epsilon
Block[0,48] = [-3, 1,  -1, 1,   1, 1,   3,-3,   3,-1,   1,-1] //3

Block[0,49] = [-3, 1,  -1,-1,   1,-1,   3,-1,  -1, 1,  -1,-3] //yotta
Block[0,50] = [-3, 1,  -1,-1,   1,-1,   3,-1,  -1, 1,   1,-3] //m
Block[0,51] = [-3, 1,  -1,-1,   1,-1,   3,-1,  -1, 1,   3,-3] //zetta
Block[0,52] = [-3,-1,  -1,-1,   1,-1,   3, 1,   1, 1,   1,-3] //phi
Block[0,53] = [-3,-1,  -1,-1,   1,-1,   3, 1,   1, 1,  -1,-3] //w
Block[0,54] = [-3,-1,  -1,-1,   1,-1,   3, 1,   1, 1,  -3,-3] //sigma

Block[0,55] = [-1,-1,   1,-1,  -1, 1,   1, 1,  -3,-1,   3, 1] //empty
Block[0,56] = [-1,-1,   1,-1,  -1, 1,   1, 1,  -3, 1,   3,-1] //Phi_2

Block[0,57] = [-1,-1,   1,-1,  -1,-3,   1, 1,  -3,-3,   3, 1] // \
Block[0,58] = [ 1,-1,  -1,-1,   1,-3,  -1, 1,   3,-3,  -3, 1] // /

Block[0,59] = [-5,-1,  -3,-1,  -1,-1,   1,-1,   3,-1,   5,-1] //I
Block[0,60] = [ 0, 0,  -1, 0,   1, 0,   0,-1,  -2, 0,   2, 0] //tau
Block[0,61] = [ 0, 0,  -1,-1,   1, 0,   0,-1,  -2,-1,   2, 0] //s
Block[0,62] = [ 0, 0,  -1, 0,   1,-1,   0,-1,   2,-1,  -2, 0] //z
Block[0,63] = [ 0, 0,  -1, 0,   1, 0,   2,-1,  -2, 0,   2, 0] //l
Block[0,64] = [ 0, 0,  -1, 0,   1, 0,  -2,-1,  -2, 0,   2, 0] //j
Block[0,65] = [ 0, 0,  -1, 0,   1, 0,  -1,-1,  -2, 0,   2, 0] //1_2
Block[0,66] = [ 0, 0,  -1, 0,   1, 0,   1,-1,  -2, 0,   2, 0] //1
Block[0,67] = [ 0, 0,  -1, 0,   1, 0,  -1,-1,  -2,-1,   2, 0] //N
Block[0,68] = [ 0, 0,  -1, 0,   1, 0,   1,-1,  -2, 0,   2,-1] //N2

Block[0,69] = [ 0, 0,  -1, 0,   1, 0,  -1,-1,   1,-1,   0,-1] //O
Block[0,70] = [ 0, 0,   1, 1,  -1, 0,   0, 1,  -1,-1,  -1, 1] //E

Block[0,71] = [ 0, 0,  -1, 0,   1, 0,  -1, 1,   0,-1,   0, 1] //alpha
Block[0,72] = [ 0, 0,  -1, 0,   1, 0,   1, 1,   0, 1,   1,-1] //R
Block[0,73] = [ 0, 0,  -1, 0,   1, 0,   0, 1,  -1, 1,  -1,-1] //q
Block[0,74] = [ 0, 0,  -1, 0,   1, 0,   0, 1,  -1, 1,   1,-1] //Q
Block[0,75] = [ 0, 0,  -1, 0,   1, 0,   1, 1,   0, 1,  -1,-1] //sigma
Block[0,76] = [ 0, 0,  -1, 0,   1, 0,  -1, 1,   1, 1,   1,-1] //mu
Block[0,77] = [ 0, 0,  -1, 0,   1, 0,  -1, 1,   1, 1,  -1,-1] //h
Block[0,78] = [ 0, 0,  -1, 0,   1, 0,  -1, 1,   1, 1,   0,-1] //A

Block[0,79] = [-3, 1,  -1, 1,   1, 1,   3, 1,  -3,-1,  -3,-3] //J
Block[0,80] = [-3, 1,  -1, 1,   1, 1,   3, 1,  -1,-1,  -1,-3] //r
Block[0,81] = [-3,-1,  -1, 1,   1, 1,   3, 1,  -1,-1,  -1,-3] //4_2
Block[0,82] = [-3,-3,  -1, 1,   1, 1,   3, 1,  -1,-1,  -1,-3] //2

Block[0,83] = [ 3,-3,   1, 1,  -1, 1,  -3, 1,   1,-1,   1,-3] //5
Block[0,84] = [ 3,-1,   1, 1,  -1, 1,  -3, 1,   1,-1,   1,-3] //4
Block[0,85] = [ 3, 1,   1, 1,  -1, 1,  -3, 1,   1,-1,   1,-3] //lambda
Block[0,86] = [ 3, 1,   1, 1,  -1, 1,  -3, 1,   3,-1,   3,-3] //L

Block[0,87] = [ 0, 1,  -1, 1,   1, 1,   1, 0,   1,-1,   0,-1] //u
Block[0,88] = [ 0, 1,   1, 1,  -1, 1,  -1, 0,  -1,-1,   0,-1] //n


var i, j, k;

for(i = 1; i < 4; i++)
{
	for(j = 0; j < 89; j++)
	{
		var l = array_length(Block[0,j])
		for(k = 0; k < l; k += 2)
		{
			Block[i,j][k]		= cos(i * pi / 2) * Block[0,j][k] - sin(i * pi / 2) * Block[0,j][k + 1]
			Block[i,j][k + 1]	= sin(i * pi / 2) * Block[0,j][k] + cos(i * pi / 2) * Block[0,j][k + 1]
		}
	}
}

//-------------------------------------------------

Corners = array_create(89,[ 0, 0,   0, 0,   0, 0,   0, 0])

///Piece corner locations
   
//Tetrominos
        //         Top       Bottom
Corners[0] = [-1,-1,   1,-1,  -1, 1,   1, 1] //T
Corners[1] = [ 1,-1,  -1, 0,  -1,-2,   1, 1] //Z
Corners[2] = [-1,-1,   1, 0,   1,-2,  -1, 1] //S
Corners[3] = [-1,-1,   0,-1,  -1, 1,   1, 1] //L
Corners[4] = [ 0,-1,   1,-1,  -1, 1,   1, 1] //J
Corners[5] = [ 0, 0,   0, 0,   0, 0,   0, 0] //O

Corners[6] = [-3, 1,   3, 1,  -3,-3,   3,-3] //I

//Pentominos
        //          Top       Bottom
Corners[7]  = [-3,-1,   3,-1,  -3, 3,   3, 3] //Y
Corners[8]  = [-3,-1,   3,-1,  -3, 3,   3, 3] //R
Corners[9]  = [-5,-1,   3,-1,  -3, 1,   3, 3] //N
Corners[10] = [ 5,-1,  -3,-1,   3, 1,  -3, 3] //N2
Corners[11] = [ 1,-1,  -3,-1,  -3, 3,   3, 3] //L
Corners[12] = [-1,-1,   3,-1,  -3, 3,   3, 3] //J
Corners[13] = [ 1,-3,  -3,-1,   1, 3,  -3, 3] //Q
Corners[14] = [-1,-3,   3,-1,  -1, 3,   3, 3] //P

Corners[15] = [-2,-1,   2,-1,  -2, 1,   2, 1] //I
Corners[16] = [-1,-1,   1,-1,  -1, 2,   1, 2] //T
Corners[17] = [-1,-1,   1,-1,  -1, 2,   1, 1] //F
Corners[18] = [-1,-1,   1,-1,  -1, 1,   1, 2] //7
Corners[19] = [ 0,-1,   1, 0,   0, 2,  -2, 0] //W
Corners[20] = [-1,-1,   1, 0,  -1, 0,   1, 1] //S
Corners[21] = [ 1,-1,  -1, 0,   1, 0,  -1, 1] //Z
Corners[22] = [-1,-2,   1,-2,  -1, 1,   1, 1] //U
Corners[23] = [ 0,-1,   1, 0,  -2, 1,  -1, 2] //V
Corners[24] = [ 0, 0,   0, 0,   0, 0,   0, 0] //X

//Mo/Do/Tro-Minos

Corners[25] = [ 0, 0,   0, 0,   0, 0,   0, 0] //Point
Corners[26] = [-1,-1,   1,-1,  -1, 1,   1, 1] //Tromino I
Corners[27] = [-1,-3,   1,-3,  -1, 1,   1, 1] //Domino  I
Corners[28] = [ 1,-1,   1,-1,  -3, 1,  -1, 3] //Tromino V

//Hexominos
Corners[29] = [ 3,-1,   3, 3,  -5, 3,  -5,-1] //T
Corners[30] = [ 3,-1,   3, 3,  -3, 3,  -5,-1] //f_1
Corners[31] = [-3,-1,  -3, 3,   3, 3,   5,-1] //7_1
Corners[32] = [ 3,-1,   3, 3,  -1, 3,  -5,-1] //f_2
Corners[33] = [-3,-1,  -3, 3,   1, 3,   5,-1] //7_2
Corners[34] = [-3,-1,   3,-1,  -3, 3,   3, 3] //$
Corners[35] = [-3,-1,   3,-1,  -3, 3,   3, 3] //%
Corners[36] = [ 3,-1,   3, 3,  -3, 3,  -3,-1] //t
Corners[37] = [-1,-1,   3,-1,  -3, 3,   1, 3] //S
Corners[38] = [-3,-1,   1,-1,  -1, 3,   3, 3] //Z

Corners[39] = [-1,-1,   1,-1,  -3, 3,   3, 3] //C
Corners[40] = [-1,-1,   3,-1,  -3, 3,   3, 3] //f_3
Corners[41] = [-3,-1,   1,-1,  -3, 3,   3, 3] //7_3
Corners[42] = [ 1,-1,   3,-1,  -3, 3,   3, 3] //P
Corners[43] = [-3,-1,  -1,-1,  -3, 3,   3, 3] //b
Corners[44] = [-3,-1,   3,-1,  -3, 3,   3, 3] //D
Corners[45] = [-1,-1,   5,-1,  -3, 3,   3, 1] //G
Corners[46] = [ 1,-1,  -5,-1,   3, 3,  -3, 1] //?
Corners[47] = [ 1,-1,  -1,-3,  -1, 3,  -5,-1] //epsilon
Corners[48] = [-1,-1,   1,-3,   1, 3,   5,-1] //3

Corners[49] = [ 3,-3,  -3,-1,   3, 1,  -3, 3] //yotta
Corners[50] = [ 3,-3,  -3,-1,   3, 1,  -3, 3] //m
Corners[51] = [ 1,-3,  -3,-1,   3, 1,  -3, 3] //zetta
Corners[52] = [-3,-3,   3,-1,  -3, 1,   3, 3] //phi
Corners[53] = [-3,-3,   3,-1,  -3, 1,   3, 3] //w
Corners[54] = [-1,-3,   3,-1,  -3, 1,   3, 3] //sigma
Corners[55] = [-3,-3,   3,-1,  -3, 1,   3, 3] //empty set
Corners[56] = [ 3,-3,  -3,-1,   3, 1,  -3, 3] //phi 2

Corners[57] = [ 3,-1,   1,-3,  -1, 1,  -3,-1] // \
Corners[58] = [-3,-1,  -1,-3,   1, 1,   3,-1] // /

Corners[59] = [-5, 1,   5, 1,  -5,-3,   5,-3] //I
Corners[60] = [-2,-1,   2,-1,  -2, 1,   2, 1] //tau
Corners[61] = [-3,-1,   2,-1,  -2, 0,   2, 1] //z
Corners[62] = [ 3,-1,  -2,-1,   2, 0,  -2, 1] //s
Corners[63] = [-2,-1,   1,-1,  -2, 1,   2, 1] //l
Corners[64] = [-1,-1,   2,-1,  -2, 1,   2, 1] //j
Corners[65] = [-2,-1,   2,-1,  -2, 1,   2, 1] //1_2
Corners[66] = [-2,-1,   2,-1,  -2, 1,   2, 1] //1
Corners[67] = [-3,-1,   2,-1,  -2, 0,   2, 1] //N
Corners[68] = [ 3,-1,  -2,-1,   2, 0,  -2, 1] //N2

Corners[69] = [-1,-2,   1,-2,  -1, 1,   1, 1] //O
Corners[70] = [ 0,-1,   1, 0,  -2, 0,   0, 2] //E
Corners[71] = [-1, 2,  -2, 1,   1, 1,  -1,-1] //Alpha
Corners[72] = [ 0,-1,   2,-1,   2, 1,  -1, 1] //R
Corners[73] = [ 0,-1,  -2,-1,  -2, 1,   1, 1] //q
Corners[74] = [ 0,-1,   2,-1,   1, 1,  -2, 1] //Q
Corners[75] = [ 0,-1,  -2,-1,  -1, 1,   2, 1] //sigma
Corners[76] = [ 0,-1,   0, 1,  -2, 1,   2, 1] //mu
Corners[77] = [ 0,-1,   0, 1,  -2, 1,   2, 1] //H
Corners[78] = [-1,-1,   1,-1,  -1, 2,   1, 2] //A

Corners[79] = [ 3,-1,  -1,-3,   1, 3,  -5,-1] //J
Corners[80] = [-3,-1,   3,-1,  -3, 3,   3, 3] //r
Corners[81] = [ 1,-3,   3,-1,  -1, 3,  -3, 1] //4_2
Corners[82] = [ 1,-3,   3,-1,  -1, 3,  -3,-1] //2
Corners[83] = [-1,-3,  -3,-1,   1, 3,   3,-1] //5
Corners[84] = [-1,-3,  -3,-1,   1, 3,   3, 1] //4
Corners[85] = [ 3,-1,  -3,-1,   3, 3,  -3, 3] //lambda
Corners[86] = [-3,-1,   1,-3,  -1, 3,   5,-1] //L

Corners[87] = [ 0, 0,  -1,-1,   2, 1,   1, 2] //u
Corners[88] = [ 0, 0,   1,-1,  -2, 1,  -1, 2] //n

//--------------------------------------------------

GSounds = array_create(10)

GSounds[0] = GB_LineClear	  //Line clear
GSounds[1] = DX_Tetris		  //4 lines
GSounds[2] = GB_Tetris		  //Spin line clear
GSounds[3] = GB_Drop		  //Placed sound
GSounds[4] = DX_Rotate		  //Rotation
GSounds[5] = GB_Rotate		  //Spin Rotation
GSounds[6] = DX_Move		  //Move Block
GSounds[7] = Gen_BlockedSound //Can't Rotate
GSounds[8] = Gen_HoldPiece    //Hold Sound
GSounds[9] = DX_LevelUp		  //LevelUp


//--------------------------------------------------
//Piece Index def

//Tetros
PieceIndex[0] = Point
PieceIndex[1] = T
PieceIndex[2] = Z
PieceIndex[3] = S
PieceIndex[4] = L
PieceIndex[5] = J
PieceIndex[6] = O
PieceIndex[7] = I

//Pentos
PieceIndex[8] = P_Y
PieceIndex[9] = P_R
PieceIndex[10] = P_N
PieceIndex[11] = P_N2
PieceIndex[12] = P_L
PieceIndex[13] = P_J
PieceIndex[14] = P_Q
PieceIndex[15] = P_P
PieceIndex[16] = P_I
PieceIndex[17] = P_T
PieceIndex[18] = P_F
PieceIndex[19] = P_7
PieceIndex[20] = P_W
PieceIndex[21] = P_S
PieceIndex[22] = P_Z
PieceIndex[23] = P_U
PieceIndex[24] = P_V
PieceIndex[25] = P_X

//Monomino, Domino, Trominos
PieceIndex[26] = M_O
PieceIndex[27] = T_I
PieceIndex[28] = D_I
PieceIndex[29] = T_V

//Hexos
PieceIndex[30] = H_t2
PieceIndex[31] = H_f1
PieceIndex[32] = H_71
PieceIndex[33] = H_f2
PieceIndex[34] = H_72
PieceIndex[35] = H_cash1
PieceIndex[36] = H_percent1
PieceIndex[37] = H_t3
PieceIndex[38] = H_s2
PieceIndex[39] = H_z2

PieceIndex[40] = H_C1
PieceIndex[41] = H_F3
PieceIndex[42] = H_73
PieceIndex[43] = H_P1
PieceIndex[44] = H_b1
PieceIndex[45] = H_D1
PieceIndex[46] = H_G1
PieceIndex[47] = H_question1

PieceIndex[48] = H_epsilon1
PieceIndex[49] = H_31

PieceIndex[50] = H_yotta1
PieceIndex[51] = H_m1
PieceIndex[52] = H_zetta
PieceIndex[53] = H_phi1
PieceIndex[54] = H_w1
PieceIndex[55] = H_sigma2

PieceIndex[56] = H_empty1
PieceIndex[57] = H_phi2
PieceIndex[58] = H_slash1
PieceIndex[59] = H_slash2

PieceIndex[60] = H_i1
PieceIndex[61] = H_t1
PieceIndex[62] = H_z1
PieceIndex[63] = H_s1
PieceIndex[64] = H_l1
PieceIndex[65] = H_j1
PieceIndex[66] = H_r1
PieceIndex[67] = H_y1
PieceIndex[68] = H_n1
PieceIndex[69] = H_mn1

PieceIndex[70] = H_O
PieceIndex[71] = H_E
PieceIndex[72] = H_alpha1
PieceIndex[73] = H_R2
PieceIndex[74] = H_q2
PieceIndex[75] = H_Q1
PieceIndex[76] = H_sigma1
PieceIndex[77] = H_mu1
PieceIndex[78] = H_h1
PieceIndex[79] = H_a1

PieceIndex[80] = H_j2
PieceIndex[81] = H_r3
PieceIndex[82] = H_42
PieceIndex[83] = H_21
PieceIndex[84] = H_51
PieceIndex[85] = H_41
PieceIndex[86] = H_lambda1
PieceIndex[87] = H_l2

PieceIndex[88] = H_u1
PieceIndex[89] = H_n2

//-------------------
//Tetros

PieceMaxState[0] = 0
PieceMaxState[1] = 4
PieceMaxState[2] = 2
PieceMaxState[3] = 2
PieceMaxState[4] = 4
PieceMaxState[5] = 4
PieceMaxState[6] = 1
PieceMaxState[7] = 2

//Pentos
PieceMaxState[8] = 4
PieceMaxState[9] = 4
PieceMaxState[10] = 4
PieceMaxState[11] = 4
PieceMaxState[12] = 4
PieceMaxState[13] = 4
PieceMaxState[14] = 4
PieceMaxState[15] = 4
PieceMaxState[16] = 2
PieceMaxState[17] = 4
PieceMaxState[18] = 4
PieceMaxState[19] = 4
PieceMaxState[20] = 2
PieceMaxState[21] = 2
PieceMaxState[22] = 4
PieceMaxState[23] = 4
PieceMaxState[24] = 1

//Mini
PieceMaxState[25] = 1
PieceMaxState[26] = 2
PieceMaxState[27] = 2
PieceMaxState[28] = 4

//Hexo
PieceMaxState[29] = 4
PieceMaxState[30] = 4
PieceMaxState[31] = 4
PieceMaxState[32] = 4
PieceMaxState[33] = 4
PieceMaxState[34] = 2
PieceMaxState[35] = 2
PieceMaxState[36] = 4
PieceMaxState[37] = 2
PieceMaxState[38] = 2
PieceMaxState[39] = 4
PieceMaxState[40] = 4
PieceMaxState[41] = 4
PieceMaxState[42] = 4
PieceMaxState[43] = 4
PieceMaxState[44] = 4
PieceMaxState[45] = 4
PieceMaxState[46] = 4
PieceMaxState[47] = 4
PieceMaxState[48] = 4
PieceMaxState[49] = 4
PieceMaxState[50] = 4
PieceMaxState[51] = 4
PieceMaxState[52] = 4
PieceMaxState[53] = 4
PieceMaxState[54] = 4
PieceMaxState[55] = 2
PieceMaxState[56] = 2
PieceMaxState[57] = 2
PieceMaxState[58] = 2
PieceMaxState[59] = 2
PieceMaxState[61] = 2
PieceMaxState[62] = 2
PieceMaxState[63] = 4
PieceMaxState[64] = 4
PieceMaxState[65] = 4
PieceMaxState[66] = 4
PieceMaxState[67] = 4
PieceMaxState[68] = 4
PieceMaxState[69] = 2
PieceMaxState[70] = 4
PieceMaxState[71] = 4
PieceMaxState[72] = 4
PieceMaxState[73] = 4
PieceMaxState[74] = 4
PieceMaxState[75] = 4
PieceMaxState[76] = 4
PieceMaxState[77] = 4
PieceMaxState[78] = 4
PieceMaxState[79] = 4
PieceMaxState[80] = 4
PieceMaxState[81] = 4
PieceMaxState[82] = 4
PieceMaxState[83] = 4
PieceMaxState[84] = 4
PieceMaxState[85] = 4
PieceMaxState[86] = 4
PieceMaxState[87] = 4
PieceMaxState[88] = 4
PieceMaxState[89] = 4