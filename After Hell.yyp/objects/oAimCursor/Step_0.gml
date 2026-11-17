if(global.controllerMode == 0 && !global.dialog_active){
	visible = true;
	cursor_sprite = sUICursor;
}else{
	visible = false;
	cursor_sprite = -1;
}

/*show_debug_message("controllerMode: " + string(global.controllerMode) + 
                   " | dialog_active: " + string(global.dialog_active) + 
                   " | victoryExists: " + string(instance_exists(oVictoryScreen2)) +
                   " | visible: " + string(visible) +
                   " | cursor_sprite: " + string(cursor_sprite));*/