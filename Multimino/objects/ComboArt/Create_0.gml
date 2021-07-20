/// @description Declaracion de variables

_Camera = camera_create_view(0, 0, room_width, room_height, 0, noone,-1, -1, 0, 0)

view_camera[0] = _Camera


ComboDraw  = false
ComboEnemy = false
EnLines   =  0
EnCount   = -1
EnBTB     =  1

Miss    = false
PSpin   = false
Mini    = false
Super   = false
AC      = false
n       = 0
LP      = Point
BTB     = 1
Counter = -1


SpinFrame = 0
LettFrame = 0
BTFrame   = 0
ComboFrame= 0
TrisFrame = 0
ACFrame   = 0
ACCounter = 0
SizeCount = 0
PauseFrame= 0
MissFrame = 0
PopFrame  = 0

CurrentVel = 0
VerVel     = 0
MaxVel     = - 12
DespVel    = 0

AMFlag = false
FVal   = 1

AlarmsHold = array_create(2)

if(GMode != 10) Scale     = 4 * 1.25
else            Scale     = 1.15

if(GMode != 10) depth = -14

//Spin animation offset table

AnimOffset = array_create(90)

AnimOffset[0] = 68
AnimOffset[1] = 19
AnimOffset[2] = 25
AnimOffset[3] = 18
AnimOffset[4] = 11
AnimOffset[5] = 9
AnimOffset[6] = 14
AnimOffset[7] = 8

//Pentos
AnimOffset[8] = 24
AnimOffset[9] = 17
AnimOffset[10] = 13
AnimOffset[11] = 50
AnimOffset[12] = 11
AnimOffset[13] = 9
AnimOffset[14] = 16
AnimOffset[15] = 15
AnimOffset[16] = 8
AnimOffset[17] = 19
AnimOffset[18] = 5
AnimOffset[19] = 48
AnimOffset[20] = 22
AnimOffset[21] = 18
AnimOffset[22] = 25
AnimOffset[23] = 20
AnimOffset[24] = 21
AnimOffset[25] = 23

//Monomino, Domino, Trominos
AnimOffset[26] = 32
AnimOffset[27] = 8
AnimOffset[28] = 27
AnimOffset[29] = 38

//Hexos
AnimOffset[30] = 19
AnimOffset[31] = 26
AnimOffset[32] = 49
AnimOffset[33] = 47
AnimOffset[34] = 52
AnimOffset[35] = 70
AnimOffset[36] = 64
AnimOffset[37] = 36
AnimOffset[38] = 18
AnimOffset[39] = 25

AnimOffset[40] = 2
AnimOffset[41] = 5
AnimOffset[42] = 48
AnimOffset[43] = 15
AnimOffset[44] = 1
AnimOffset[45] = 3
AnimOffset[46] = 6
AnimOffset[47] = 68

AnimOffset[48] = 58
AnimOffset[49] = 44

AnimOffset[50] = 57
AnimOffset[51] = 30
AnimOffset[52] = 53
AnimOffset[53] = 63
AnimOffset[54] = 39
AnimOffset[55] = 54

AnimOffset[56] = 41
AnimOffset[57] = 55
AnimOffset[58] = 65
AnimOffset[59] = 66

AnimOffset[60] = 8
AnimOffset[61] = 62
AnimOffset[62] = 40
AnimOffset[63] = 35
AnimOffset[64] = 29
AnimOffset[65] = 28
AnimOffset[66] = 51
AnimOffset[67] = 42
AnimOffset[68] = 13
AnimOffset[69] = 50

AnimOffset[70] = 14
AnimOffset[71] = 4
AnimOffset[72] = 56
AnimOffset[73] = 17
AnimOffset[74] = 33
AnimOffset[75] = 16
AnimOffset[76] = 61
AnimOffset[77] = 60
AnimOffset[78] = 7
AnimOffset[79] = 0

AnimOffset[80] = 9
AnimOffset[81] = 34
AnimOffset[82] = 68
AnimOffset[83] = 43
AnimOffset[84] = 46
AnimOffset[85] = 45
AnimOffset[86] = 59
AnimOffset[87] = 11

AnimOffset[88] = 37
AnimOffset[89] = 31

