function SetScore() {
	
	if(GMode == 12)
	{
		if(n == 1) score += 40   * level
	    if(n == 2) score += 100  * level
	    if(n == 3) score += 300  * level
	    if(n == 4) score += 1200 * level
		
		exit
	}
	
	if(PSpin and !Mini)
	{
	    var Fact;
    
		Fact = 400

	    if(Super)Fact = 425
    
	    if(n == 0) score += Fact * level
	    else       score += Fact * (n + 1) * level * BTB
	}
	else
	{
	    if(n == 1) score +=  100 * level
	    if(n == 2) score +=  300 * level
	    if(n == 3) score +=  500 * level
	    if(n == 4) score +=  800 * level * BTB
		if(n == 5) score += 1200 * level * BTB
		if(n == 6) score += 1800 * level * BTB
		
		if(Mini) score += 100 * BTB
	}

	if(AC)			   score += 2500 * level
	if(ComboCount > 0) score += 50 * ComboCount * level
}
