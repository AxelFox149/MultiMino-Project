/// @description Ghost
var DRK, DrawOffset = 0;

if(PieceScale == 2)  DrawOffset = -32

if(Options[4] and !gameover) DrawPiece(CurrentPiece, x + DrawOffset, DropY + DrawOffset, image_index, 2 * PieceScale, 2 * PieceScale, 0.5, 50, false)

DRK = 65 - ((PlaceTimer * 65) / ResetTime)
//if(!pause)
DrawPiece(CurrentPiece, x + DrawOffset, y + DrawOffset, image_index, 2 * PieceScale, 2 * PieceScale, 1, DRK, false)

if(DevMode)
{
	DrawDetection()
	draw_text(592,16,CurrentPiece)
	draw_text(656,16,sprite_get_name(PieceIndex[CurrentPiece]))
	draw_text(592,80,"x:" + string(x))
	draw_text(720,80,"y:" + string(y))
	draw_text(592,144,"LK:" + string(LT))
	draw_text(1040,80,"St:" + string(image_index))
	
	draw_circle(x,y,8,false)
}
/*
var BRD = Control.board
var i, PX, PY, j;

for(i = 0; i < 4; i++)
{
				PX = Block[image_index,CurrentPiece - 1][0 + (2 * i)] * 64
				PY = Block[image_index,CurrentPiece - 1][1 + (2 * i)] * 64
		
				if(CurrentPiece > 5)
			    {
			        PX *= 0.5
			        PY *= 0.5
			    }
				
				PX += x
				PY += y
				
				PY = (PY + 1152) / 64
				PX = (PX - Control.BoardStart) / 64
				
				BRD[PY,PX] = CurrentPiece
}
var XOff
var YOff
for(i = 20; i < 40; i++)
{
	for(j = 0; j < 10; j++)
	{
		XOff = Control.BoardStart + (64 * j)
        YOff =      -1152 + (64 * i)
        draw_text(XOff,YOff,BRD[i, j])
	}
}


draw_text(64,64,LDAS)
draw_text(64,128,RDAS)

draw_text(64,192,Last)
draw_text(64,256,MoveTimer)

draw_text(128,64,alarm[2])
draw_text(128,128,alarm[3])



var D = depth
depth = -20
draw_text(64,64,image_index)

if(collision_point(x     ,y - 64, Placed,false,true)) draw_set_color(c_red)
else												  draw_set_color(c_white)
draw_circle(x, y - 64, 8,false)

if(collision_point(x - 64,y - 64, Placed,false,true)) draw_set_color(c_red)
else												  draw_set_color(c_white)
draw_circle(x - 64, y - 64, 8,false)

if(collision_point(x     ,y + 64, Placed,false,true)) draw_set_color(c_red)
else												  draw_set_color(c_white)
draw_circle(x, y + 64, 8,false)
depth = D
draw_set_color(c_white)

*/