// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function Grid_To_Buffer(g)
{
	var gh = ds_grid_height(g), b, maxval, dtype = buffer_u16;

	maxval = ds_grid_get_max(g, 0, 0, 0, gh - 1)
	
	if(maxval >= 65535) dtype = buffer_u32
	
	b = buffer_create(6 + ((buffer_sizeof(dtype) + 16) * gh), buffer_fixed, 1)
	
	// u16/u32									   s8
	//| frame | v1 | v2 | v3 | v4 | v5 | v6 | v7 | v8 | v9 | v10| v11| v12| v13| v14| v15| v16|
	//
	
	//buffer header
	
	buffer_write(b,buffer_u32,gh)
	buffer_write(b,buffer_u16,dtype)
	
	var i, j;
	
	for(i = 0; i < gh; i++)
	{
		buffer_write(b, dtype, g[# 0, i])
		
		for(j = 1; j < 17; j++)
		{
			g[# j, i] = abs(g[# j, i])
			buffer_write(b, buffer_bool, g[# j, i])
		}
	}
	//ds_grid_destroy(g)
	
	return b
}


function Buffer_To_Grid(b){
	var gh, dtype, g;
	
	buffer_seek(b, buffer_seek_start, 0)
	
	gh		= buffer_read(b,buffer_u32)
	dtype	= buffer_read(b, buffer_u16)
	
	g = ds_grid_create(17,gh)
	
	var i,j;
	
	for(i = 0; i < gh; i++)
	{
		g[# 0,i] = buffer_read(b,dtype)
		
		for(j = 1; j < 17; j++)
		{
			g[# j,i] = buffer_read(b, buffer_bool)
		}
	}
	
	buffer_delete(b)
	
	return g
}

function List_To_Buffer(l)
{
	var lsz = ds_list_size(l), b;
	
	b = buffer_create(lsz + 4, buffer_fixed, 1)
	
	buffer_write(b,buffer_u32,lsz)
	
	var i;
	
	for(i = 0; i < lsz; i++)
	{
		buffer_write(b, buffer_u8, l[| i])
	}
	//ds_grid_destroy(g)
	
	return b
}

function Buffer_To_List(b){
	var lsz, l;
	
	buffer_seek(b, buffer_seek_start, 0)
	
	l = ds_list_create()
	lsz = buffer_read(b,buffer_u32)
	
	var i;
	
	for(i = 0; i < lsz; i++)
	{
		ds_list_add(l,buffer_read(b,buffer_u8))
	}
	
	buffer_delete(b)
	
	return l
}