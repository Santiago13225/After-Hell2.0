//get inputs
up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
accept_key = keyboard_check_pressed(vk_space);

//Controller input
var _gamePad = 0;
if(gamepad_is_connected(_gamePad)){
    accept_key = accept_key || gamepad_button_check_pressed(_gamePad, gp_start);
	option[0, 0] = "Trademark and Copyright Notice\n" +
    "All trademarks and trade names mentioned in this game are the property of their respective \n"+ 
    "owners. Red Shift Studios, the Red Shift Studios logo, and all related names, logos, and \n" +
    "distinctive brand features are trademarks of Red Shift Studios.\n\n" +
    "This game and all of its content, including but not limited to graphics, audio, and gameplay \n" +
    "mechanics, are protected by copyright law. Unauthorized reproduction, distribution, or \n" +
    "modification of this game is strictly prohibited and may result in legal action.\n\n" +
    "Copyright @ 2026 Red Shift Studios. All rights reserved.\n\n" +
    "Press the \"Start\" button to Continue";
}else{
	option[0, 0] = "Trademark and Copyright Notice\n" +
    "All trademarks and trade names mentioned in this game are the property of their respective \n"+ 
    "owners. Red Shift Studios, the Red Shift Studios logo, and all related names, logos, and \n" +
    "distinctive brand features are trademarks of Red Shift Studios.\n\n" +
    "This game and all of its content, including but not limited to graphics, audio, and gameplay \n" +
    "mechanics, are protected by copyright law. Unauthorized reproduction, distribution, or \n" +
    "modification of this game is strictly prohibited and may result in legal action.\n\n" +
    "Copyright @ 2026 Red Shift Studios. All rights reserved.\n\n" +
    "Press [Space] to Continue";
}

//store number of options in current menu
op_length = array_length(option[menu_level]);

//move through the menu
pos += down_key - up_key;
if(pos >= op_length){
	pos = 0;
}
if(pos < 0){
	pos = op_length - 1;
}

//use the options
if (accept_key){
	var _sml = menu_level;

	switch(menu_level){
		//menu
		case 0:
		switch(pos){
			//start game
			case 0:
				audio_play_sound(sndBeep, 10, false);//Play sound effect.
				//room_goto(rm_Main);
				//TransitionStart(rm_Title_Screen, sqFadeOut, sqFadeIn);
				TransitionStart(rm_Logo_Screen, sqFadeOut, sqFadeIn);
				//TransitionStart(rm_Disclaimer_Screen, sqFadeOut, sqFadeIn);
				break;
		}
		break;
	}
	
	//set position back
	if (_sml != menu_level){
		pos = 0;
	}
	
	//correct option length
	op_length = array_length(option[menu_level]);
}
