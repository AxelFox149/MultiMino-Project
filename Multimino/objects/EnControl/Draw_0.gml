/// @description Fila, estadisticas

if(GMode != 11)
{
    var i;

    for(i = 0; i < 3; i++) DrawPiece(Queue[i], 1348 + ComboArt.CurrentVel  + (i * 118), 104 + ComboArt.VerVel, 0, 1, 1, 1, 0,false)
    
    if(Hold != Point) DrawPiece(Hold, 1160 + ComboArt.CurrentVel, 104 + ComboArt.VerVel, 0, 1, 1, 1, 0,!CH)
    
    draw_text_transformed(1296,4, string_hash_to_newline(EText[0,Options[2]]),0.70,0.70,0)
    draw_text_transformed(1112,4, string_hash_to_newline(EText[1,Options[2]]),0.70,0.70,0)
}

var j, pcol;

for(i = 20; i <= 39; i++)
{
        for(j = 0; j <= BoardWidth; j++)
        {
            XOff = BoardStart + (64 * j)
            YOff =      -1152 + (64 * i)
            if(board[i][j] != 0)
            {
				if(Options[1] < 14)		pcol = ColorPal[board[i][j]]
				else					pcol = c_white
	
				if(gameover) 
				{
					if(Options[1] < 14) pcol = ColorPal[90]
					else				pcol = $404040
				}
				
                if(Options[1] < 14)		 draw_sprite_ext(Point,Options[1],XOff,YOff,2,2,0,pcol,1)
                else if(Options[1] == 14)draw_sprite_ext(Spc_Block_spr,(board[i][j] - 1) mod 30,XOff,YOff,8,8,0,pcol,1)
                else if(Options[1] == 15)
                {
                    if(board[i][j] != 30) draw_sprite_ext(Spc_Nes_spr,((board[i][j] - 1) mod 3) + (3 * ((level - 1) mod 10)),XOff,YOff,8,8,0,pcol,1)
                    else                  draw_sprite_ext(Spc_Nes_spr,30,XOff,YOff,8,8,0,pcol,1)
                }
                else if(Options[1] == 16) draw_sprite_ext(Spc_TGM_spr,    (board[i][j] - 1) mod 30,XOff,YOff,8,8,0,pcol,1)
				else if(Options[1] == 17) draw_sprite_ext(Spc_WRL_spr,    (board[i][j] - 1) mod 30,XOff,YOff,4,4,0,pcol,1)
				else if(Options[1] == 18) draw_sprite_ext(Spc_Program_spr,(board[i][j] - 1) mod 30,XOff,YOff,8,8,0,pcol,1)
            }
        }
}

/*
    if (!Scared)
    {
        draw_line(BoardStart, 928,1664,928)
        draw_text(1088,192,"Build")
    }
    else
    {
        draw_line(BoardStart, 1120, 1664, 1120)
        draw_text(1088,192,"Scared")
    }
*/
/* */
/*  */
