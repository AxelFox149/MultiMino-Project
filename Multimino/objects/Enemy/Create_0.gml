/// @description Valores iniciales

//------------------
Scared = false
Done = false

Action = false

Pointer = 0
Step = 0
NowCheck = 0
//State= 0
Stall= 5
Holes= 0
Best = -999
TestHold = false
DoHold = false
ActivePiece = Point

Wait = true

TScore = 0
RotSt  = 0
Xlist  = 0
Ylist  = 0
Height = 0
Cleared= 0
//----------------------

PieceScale = 1

image_speed  = 0
CurrentPiece = 0
sprite_index = 0
image_xscale = 4 * PieceScale
image_yscale = 4 * PieceScale

Derh =  false
Izqh =  false

Der =  false
Izq =  false

RotR=  false
RotL=  false
DRot=  false
Down = false
Drop = false

Spin = 0
Move = 0
Dir  = 0
Tic  = 20
CM   = false
LDAS  = false
RDAS  = false
Last	 = 0
PrevLast = 0
ST   = false
MoveTimer = 0

LT = 0
ML = 15
BC = 115
PlaceTimer = 30
ResetTime  = 30

Pulse = true

HardDrop = part_system_create()
DropEmm  = part_emitter_create(HardDrop)
p_Spark  = part_type_create()
part_type_sprite(p_Spark,SmolSpark,true,true,false)
part_type_scale(p_Spark,1.5,1.5)
part_type_speed(p_Spark,1,4.25,0,0)
part_type_direction(p_Spark,90,90,0,0)
part_type_life(p_Spark,30,45)
part_type_size(p_Spark,0.7,1.2,0,0)

