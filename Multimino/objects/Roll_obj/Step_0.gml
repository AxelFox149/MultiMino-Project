/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

layer_y(back, LayerOffsetY)
_CurrentGP = getController()

if(Roll)
{
	LayerOffsetY  = max(-3840, LayerOffsetY  - 1.4)
	CreditOffsetY = max(-6032, CreditOffsetY - 2.2)
}

if(LayerOffsetY <= -3840 and alarm[1] <= 0) alarm[1] = 240

if(keyboard_check_pressed(vk_escape) or gamepad_button_check_pressed(_CurrentGP, gp_face1)) ExitSec = true
