/// @description Valores iniciales

PieceScale = 1

image_speed  = 0
sprite_index = 0
CurrentPiece = 0
image_xscale = 4 * PieceScale
image_yscale = 4 * PieceScale

DropY = 0
Dis   = 0
Stall = 5

Izq  = false
Der  = false
RotR = false
RotL = false
Derh = false
Izqh = false
DRot = false
Down  = false
DPress= false
Drop  = false

Spin = 0
Move = 0
Dir  = 0
Tic  = 20
CM   = false
CHD  = true
DAS  = false
ST   = false
MoveTimer = 0

LDAS = false
RDAS = false
Last = 0
PrevLast = 0

PressFlag = false

LT = 0
ML = 15
BC = 115
PlaceTimer = 30
ResetTime  = 30
FallSpeed  = 60

AlarmsHold = array_create(4)
isPressed  = array_create(2)

isPressed[0] = 0
isPressed[1] = 0

if(GMode == 12)
{
	G = array_create(30)
	
	G[0]  = 48
	G[1]  = 43
	G[2]  = 38
	G[3]  = 33
	G[4]  = 28
	G[5]  = 23
	G[6]  = 18
	G[7]  = 13
	G[8]  = 8
	G[9]  = 6
	G[10] = 5
	G[11] = 5
	G[12] = 5
	G[13] = 4
	G[14] = 4
	G[15] = 4
	G[16] = 3
	G[17] = 3
	G[18] = 3
	G[19] = 2
	G[20] = 2
	G[21] = 2
	G[22] = 2
	G[23] = 2
	G[24] = 2
	G[25] = 2
	G[26] = 2
	G[27] = 2
	G[28] = 2
	G[29] = 1
}

HardDrop = part_system_create()
DropEmm  = part_emitter_create(HardDrop)
p_Spark  = part_type_create()
part_type_sprite(p_Spark,SmolSpark,true,true,false)
part_type_scale(p_Spark,1.5,1.5)
part_type_speed(p_Spark,1,4.25,0,0)
part_type_direction(p_Spark,90,90,0,0)
part_type_life(p_Spark,30,45)
part_type_size(p_Spark,0.7,1.2,0,0)

