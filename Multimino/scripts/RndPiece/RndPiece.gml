function RndPiece() {
	if(ds_stack_empty(Stack))
	{
		if(GMode != 12)
		{
			/*
			var X, A;
			
		    A = array_create(TP)
		    repeat(TP)
		    {
		        X = irandom(TP - 1)
		        while(A[X])
		        {
		            X = irandom(TP - 1)
		        }                             
		        A[X] = true
            
		        ds_stack_push(Stack, X + LB)
		    }
			*/
			
			var PL = ds_list_create();
			
			switch(QueueMode)
			{
				case 3:
					var i;
					for(i = LB; i <= UB; i++) ds_list_add(PL, i)
					for(i = 26; i <= 29; i++) ds_list_add(PL, i)
					
					ds_list_shuffle(PL)
					
					for(i = 0; i < ds_list_size(PL); i++) 
					{
						ds_stack_push(Stack, PL[| i])
					}
				break;
					
				case 5:
					var i;
					
					/*
					if((Calls mod 2) == 0)
					{
						var PBL = ds_list_create()
						for(i = 8; i < 26; i++) ds_list_add(PBL, i)
						
						ds_list_shuffle(PBL)
					
						for(i = 0; i < ds_list_size(PBL); i++)  PBStore[i] = PBL[| i]
						ds_list_destroy(PBL)
					}
					
					for(i = 1;  i <= 7; i++)  ds_list_add(PL, i)
					for(i = 26; i <= 29; i++) ds_list_add(PL, i)
					for(i = 0 + (8 * (Calls mod 2)); i < 8 + (8 * (Calls mod 2)); i++) ds_list_add(PL, PBStore[i])
					*/
					
					if(Calls == 0)
					{
						var HBL = ds_list_create()
						for(i = 30; i < 90; i++) ds_list_add(HBL, i)
						
						ds_list_shuffle(HBL)
					
						for(i = 0; i < ds_list_size(HBL); i++)  HBStore[i] = HBL[| i]
						
						ds_list_destroy(HBL)
					}
					
					//repeat(2)
					//{
						for(i = 26; i <= 29; i++) ds_list_add(PL, i)
						for(i = 1;  i <= 7;  i++) ds_list_add(PL, i)
					//}
					
					for(i = 1;  i <= 29; i++)  ds_list_add(PL, i)
					for(i = 0 + (10 * Calls); i < 10 + (10 * Calls); i++) ds_list_add(PL, HBStore[i])
					
					ds_list_shuffle(PL)
					
					for(i = 0; i < ds_list_size(PL); i++) ds_stack_push(Stack, PL[| i])

					Calls = (Calls + 1) mod 6
				break;
				
			    default:
			        var i;
					for(i = LB; i <= UB; i++) ds_list_add(PL, i)
					
					ds_list_shuffle(PL)
					
					for(i = 0; i < ds_list_size(PL); i++)  ds_stack_push(Stack, PL[| i])
				break;
			}
			ds_list_destroy(PL)
		}
		else
		{
			var N, P = Queue[4];
			repeat(TP)
			{
				N = irandom(TP - 1)
				
				if(N == P) N = irandom(TP - 1)
				
				P = N
				
				ds_stack_push(Stack,N + LB)
			}
		}
	}
	return ds_stack_pop(Stack)
}
