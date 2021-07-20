function CreateQueue(Type) 
{
	if(!Type)
	{
		var i = 0;
		var AllBoards = ds_list_create();
		
		for(i = 0; i <= MaxBoard; i++)
		{
			ds_list_add(AllBoards,i)
		}
		ds_list_shuffle(AllBoards)
		for(i = 0; i <= MaxBoard; i++)
		{
			Boards[i] = AllBoards[| i]
		}
		
		ds_list_destroy(AllBoards)
		return
/*
		repeat(MaxBoard)
		{
		    X = irandom_range(0, MaxBoard)
		    while(A[X])
		    {
		        X = irandom_range(0, MaxBoard)
		    }
		    A[X]      = true               
		    Boards[i] = X
		    i ++
    
		    //if((i mod 5) == 0) {Boards[i] = -1; i ++}

}
*/
	}
	else
	{
		var Easy = ds_list_create();
		var Medi = ds_list_create();
		var Hard = ds_list_create();
		var AllBoards = ds_list_create();
		var c,rx,i;
		
		ds_list_add(Easy,0 ,2 ,3 ,6 ,7 ,10,11,12,16,17,21,23,32,33,37,41,44,45,47,57,59,62,73,74,77,81,85,88,89,92,94,98,100)
		ds_list_add(Medi,1 ,4 ,5 ,8 ,13,14,19,20,22,24,25,26,30,34,36,40,42,49,51,53,55,56,61,65,69,70,71,78,79,80,82,86,87,93)
		ds_list_add(Hard,9 ,15,18,27,28,29,21,35,38,39,43,46,48,50,52,54,58,60,63,64,66,67,68,72,75,76,83,84,90,91,95,96,97,99)

		while(!ds_list_empty(Easy) or !ds_list_empty(Medi) or !ds_list_empty(Hard))
		{
			c = choose(3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,2,1)
			
			if(c == 3 and !ds_list_empty(Easy))
			{
				rx = irandom_range(0,ds_list_size(Easy) - 1)
				ds_list_add(AllBoards, Easy[|rx])
				ds_list_delete(Easy,rx)
			}
			//else if(ds_list_empty(Easy)) c = 2
			
			if(c == 2 and !ds_list_empty(Medi))
			{
				rx = irandom_range(0,ds_list_size(Medi) - 1)
				ds_list_add(AllBoards, Medi[|rx])
				ds_list_delete(Medi,rx)
			}
			//else if(ds_list_empty(Medi)) c = 1
			
			if((c == 1 or (ds_list_empty(Easy) and ds_list_empty(Medi))) and !ds_list_empty(Hard))
			{
				rx = irandom_range(0,ds_list_size(Hard) - 1)
				ds_list_add(AllBoards, Hard[|rx])
				ds_list_delete(Hard,rx)
			}
		}
		
		for(i = 0; i <= 100; i++) Boards[i] = AllBoards[|i]
		
		ds_list_destroy(Easy)
		ds_list_destroy(Medi)
		ds_list_destroy(Hard)
		ds_list_destroy(AllBoards)
	}
}
