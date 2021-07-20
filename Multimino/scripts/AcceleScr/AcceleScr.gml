/// @description  Aceleracion
function AcceleScr(argument0, argument1, argument2) {

	//argument0 = Valor actual de velocidad
	//argument1 = Valor maximo de velocidad
	//argument2 = Valor de aceleracion


	if (argument0 < argument1)
	    return min (argument0 + argument2,argument1)
	else
	    return max (argument0 - argument2,argument1)



}
