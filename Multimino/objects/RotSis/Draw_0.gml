/// @description Draw offset table

/*

for(i = 0; i < 6; i++)
{
    XO = real(string_char_at(PERS[Case], 1 + 6*i) + string_char_at(PERS[Case], 2 + 6*i)) * 64 * Mirror
    YO = real(string_char_at(PERS[Case], 4 + 6*i) + string_char_at(PERS[Case], 5 + 6*i)) * 64
    
    if(place_empty(x + XO, y + YO))
    {
        x += XO
        y += YO
        LT = i + 1
        exit
    }
}*/
if(!Double){
var i, tempX, tempY, XO, YO, num;

if(PieceIndex <= I or PieceIndex >= T_I) num = 5
else                num = 6

for(i = 0; i < num; i++)
{
    XO = real(string_char_at(PERS[7], 1 + 6*i) + string_char_at(PERS[7], 2 + 6*i)) * 24 * Mirror
    YO = real(string_char_at(PERS[7], 4 + 6*i) + string_char_at(PERS[7], 5 + 6*i)) * 24
    
    tempX = 792 - (144 * i)
    tempY = 256
    
    DrawPiece(PieceIndex, tempX, tempY, 0, 0.75, 0.75, 1, 100, false)
    
    tempX += XO
    tempY += YO
    
    DrawPiece(PieceIndex, tempX, tempY, 3, 0.75, 0.75, 1, 0, false)
    
    XO = real(string_char_at(PERS[0], 1 + 6*i) + string_char_at(PERS[0], 2 + 6*i)) * 24 * Mirror
    YO = real(string_char_at(PERS[0], 4 + 6*i) + string_char_at(PERS[0], 5 + 6*i)) * 24
    
    tempX = 1048 + (144 * i)
    tempY = 256
    
    DrawPiece(PieceIndex, tempX, tempY, 0, 0.75, 0.75, 1, 100, false)
    
    tempX += XO
    tempY += YO
    
    DrawPiece(PieceIndex, tempX, tempY, 1, 0.75, 0.75, 1, 0, false)
}

DrawPiece(PieceIndex, 920, 256, 0, 0.75, 0.75, 1, 0, false)

///----------------------------------------------------------------------

for(i = 0; i < num; i++)
{
    XO = real(string_char_at(PERS[1], 1 + 6*i) + string_char_at(PERS[1], 2 + 6*i)) * 24 * Mirror
    YO = real(string_char_at(PERS[1], 4 + 6*i) + string_char_at(PERS[1], 5 + 6*i)) * 24
    
    tempX = 768 - (144 * i)
    tempY = 512
    
    DrawPiece(PieceIndex, tempX, tempY, 1, 0.75, 0.75, 1, 100, false)
    
    tempX += XO
    tempY += YO
    
    DrawPiece(PieceIndex, tempX, tempY, 0, 0.75, 0.75, 1, 0, false)
    
    XO = real(string_char_at(PERS[2], 1 + 6*i) + string_char_at(PERS[2], 2 + 6*i)) * 24 * Mirror
    YO = real(string_char_at(PERS[2], 4 + 6*i) + string_char_at(PERS[2], 5 + 6*i)) * 24
    
    tempX = 1024 + (144 * i)
    tempY = 512
    
    DrawPiece(PieceIndex, tempX, tempY, 1, 0.75, 0.75, 1, 100, false)
    
    tempX += XO
    tempY += YO
    
    DrawPiece(PieceIndex, tempX, tempY, 2, 0.75, 0.75, 1, 0, false)
}

DrawPiece(PieceIndex, 896, 512, 1, 0.75, 0.75, 1, 0, false)

//-------------------------------------------------------------------

for(i = 0; i < num; i++)
{
    XO = real(string_char_at(PERS[3], 1 + 6*i) + string_char_at(PERS[3], 2 + 6*i)) * 24 * Mirror
    YO = real(string_char_at(PERS[3], 4 + 6*i) + string_char_at(PERS[3], 5 + 6*i)) * 24
    
    tempX = 792 - (144 * i)
    tempY = 768
    
    DrawPiece(PieceIndex, tempX, tempY, 2, 0.75, 0.75, 1, 100, false)
    
    tempX += XO
    tempY += YO
    
    DrawPiece(PieceIndex, tempX, tempY, 1, 0.75, 0.75, 1, 0, false)
    
    XO = real(string_char_at(PERS[4], 1 + 6*i) + string_char_at(PERS[4], 2 + 6*i)) * 24 * Mirror
    YO = real(string_char_at(PERS[4], 4 + 6*i) + string_char_at(PERS[4], 5 + 6*i)) * 24
    
    tempX = 1048 + (144 * i)
    tempY = 768
    
    DrawPiece(PieceIndex, tempX, tempY, 2, 0.75, 0.75, 1, 100, false)
    
    tempX += XO
    tempY += YO
    
    DrawPiece(PieceIndex, tempX, tempY, 3, 0.75, 0.75, 1, 0, false)
}
DrawPiece(PieceIndex, 920, 768, 2, 0.75, 0.75, 1, 0, false)

///----------------------------------------------------------------------

for(i = 0; i < num; i++)
{
    XO = real(string_char_at(PERS[5], 1 + 6*i) + string_char_at(PERS[5], 2 + 6*i)) * 24 * Mirror
    YO = real(string_char_at(PERS[5], 4 + 6*i) + string_char_at(PERS[5], 5 + 6*i)) * 24
    
    tempX = 776 - (144 * i)
    tempY = 1024
    
    DrawPiece(PieceIndex, tempX, tempY, 3, 0.75, 0.75, 1, 100, false)
    
    tempX += XO
    tempY += YO
    
    DrawPiece(PieceIndex, tempX, tempY, 2, 0.75, 0.75, 1, 0, false)
    
    XO = real(string_char_at(PERS[6], 1 + 6*i) + string_char_at(PERS[6], 2 + 6*i)) * 24 * Mirror
    YO = real(string_char_at(PERS[6], 4 + 6*i) + string_char_at(PERS[6], 5 + 6*i)) * 24
    
    tempX = 1032 + (144 * i)
    tempY = 1024
    
    DrawPiece(PieceIndex, tempX, tempY, 3, 0.75, 0.75, 1, 100, false)
    
    tempX += XO
    tempY += YO
    
    DrawPiece(PieceIndex, tempX, tempY, 0, 0.75, 0.75, 1, 0, false)
}

DrawPiece(PieceIndex, 904, 1024, 3, 0.75, 0.75, 1, 0, false)
}

/* */
///DrawDouble Offset Table

if(Double){
var i, tempX, tempY, XO, YO, num;

num = 6

for(i = 0; i < num; i++)
{
    XO = real(string_char_at(PERS[0], 1 + 6*i) + string_char_at(PERS[0], 2 + 6*i)) * 24 * Mirror
    YO = real(string_char_at(PERS[0], 4 + 6*i) + string_char_at(PERS[0], 5 + 6*i)) * 24
    
    tempX = 480 + (192 * i)
    tempY = 256
    
    DrawPiece(PieceIndex, tempX, tempY, 0, 0.75, 0.75, 1, 100, false)
    
    tempX += XO
    tempY += YO
    
    DrawPiece(PieceIndex, tempX, tempY, 2, 0.75, 0.75, 1, 0, false)
}

DrawPiece(PieceIndex, 320, 256, 0, 0.75, 0.75, 1, 0, false)
///----------------------------------------------------------------------

for(i = 0; i < num; i++)
{
    XO = real(string_char_at(PERS[1], 1 + 6*i) + string_char_at(PERS[1], 2 + 6*i)) * 24 * Mirror
    YO = real(string_char_at(PERS[1], 4 + 6*i) + string_char_at(PERS[1], 5 + 6*i)) * 24
    
    tempX = 480 + (192 * i)
    tempY = 512
    
    DrawPiece(PieceIndex, tempX, tempY, 1, 0.75, 0.75, 1, 100, false)
    
    tempX += XO
    tempY += YO
    
    DrawPiece(PieceIndex, tempX, tempY, 3, 0.75, 0.75, 1, 0, false)
}

DrawPiece(PieceIndex, 320, 512, 1, 0.75, 0.75, 1, 0, false)

//-------------------------------------------------------------------

for(i = 0; i < num; i++)
{
    XO = real(string_char_at(PERS[2], 1 + 6*i) + string_char_at(PERS[2], 2 + 6*i)) * 24 * Mirror
    YO = real(string_char_at(PERS[2], 4 + 6*i) + string_char_at(PERS[2], 5 + 6*i)) * 24
    
    tempX = 480 + (192 * i)
    tempY = 768
    
    DrawPiece(PieceIndex, tempX, tempY, 2, 0.75, 0.75, 1, 100, false)
    
    tempX += XO
    tempY += YO
    
    DrawPiece(PieceIndex, tempX, tempY, 0, 0.75, 0.75, 1, 0, false)
}
DrawPiece(PieceIndex, 320, 768, 2, 0.75, 0.75, 1, 0, false)

///----------------------------------------------------------------------

for(i = 0; i < num; i++)
{
    XO = real(string_char_at(PERS[3], 1 + 6*i) + string_char_at(PERS[3], 2 + 6*i)) * 24 * Mirror
    YO = real(string_char_at(PERS[3], 4 + 6*i) + string_char_at(PERS[3], 5 + 6*i)) * 24
    
    tempX = 480 + (192 * i)
    tempY = 1024
    
    DrawPiece(PieceIndex, tempX, tempY, 3, 0.75, 0.75, 1, 100, false)
    
    tempX += XO
    tempY += YO
    
    DrawPiece(PieceIndex, tempX, tempY, 1, 0.75, 0.75, 1, 0, false)
}

DrawPiece(PieceIndex, 320, 1024, 3, 0.75, 0.75, 1, 0, false)
}

/* */
/*  */
