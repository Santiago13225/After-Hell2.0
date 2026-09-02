//Get inputs
back_key = keyboard_check_pressed(vk_backspace);
accept_key = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter);
left_key = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
right_key = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));

//Hold to scroll for keyboard
var _kb_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var _kb_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _kb_moved = false;

if(kb_delay > 0) kb_delay--;

if(kb_delay <= 0){
	if(_kb_left){ left_key = true; _kb_moved = true; }
	else if(_kb_right){ right_key = true; _kb_moved = true; }
	
	if(_kb_moved){
		if(!kb_held){
			kb_delay = 20;
			kb_held = true;
		}else{
			kb_delay = 6;
		}
	}else{
		kb_held = false;
	}
}

// --- Update input device status ---
if(gamepad_is_connected(0)){
	global.controllerMode = 1;//Controller detected
}else{
	global.controllerMode = 0;//No controller, use keyboard/mouse
}

//Controller inputs
var _gamePad = 0;
var is_controller_connected = gamepad_is_connected(_gamePad);

if(is_controller_connected){
	left_key |= gamepad_button_check_pressed(_gamePad, gp_padl);
	right_key |= gamepad_button_check_pressed(_gamePad, gp_padr);
	accept_key |= gamepad_button_check_pressed(_gamePad, gp_face1);
	back_key |= gamepad_button_check_pressed(_gamePad, gp_face2);
	
	//Hold to scroll for D-pad
	var _dp_left = gamepad_button_check(_gamePad, gp_padl);
	var _dp_right = gamepad_button_check(_gamePad, gp_padr);
	var _dp_moved = false;

	if(dpad_delay > 0) dpad_delay--;

	if(dpad_delay <= 0){
		if(_dp_left){ left_key = true; _dp_moved = true; }
		else if(_dp_right){ right_key = true; _dp_moved = true; }
		
		if(_dp_moved){
			if(!dpad_held){
				dpad_delay = 20;
				dpad_held = true;
			}else{
				dpad_delay = 6;
			}
		}else{
			dpad_held = false;
		}
	}

	//Stick settings
	var deadzone = 0.5;//threshold
	var delay_initial = 15;//delay before repeat starts
	var delay_repeat  = 6;//faster repeat after holding

	if(!variable_instance_exists(id, "stick_delay")) stick_delay = 0;
	if(!variable_instance_exists(id, "stick_held")) stick_held = false;

	//Stick input
	var lx = gamepad_axis_value(0, gp_axislh);
	var ly = gamepad_axis_value(0, gp_axislv);
	var moved = false;

	//Countdown
	if(stick_delay > 0) stick_delay--;

	//Check input
	if(stick_delay <= 0){
		if(lx > deadzone){
			right_key = true;
			//audio_play_sound(sndClick, 10, false);
			moved = true;
		}else if(lx < -deadzone){
			left_key = true;
			//audio_play_sound(sndClick, 10, false);
			moved = true;
		}
		//else if(ly > deadzone) { down_key = true; audio_play_sound(sndClick, 10, false); moved = true; }
		//else if(ly < -deadzone) { up_key = true; audio_play_sound(sndClick, 10, false); moved = true; }

		if(moved){
			if(!stick_held){
				stick_delay = delay_initial;//first delay
				stick_held = true;
			}else{
				stick_delay = delay_repeat;//repeat delay
			}
		}else{
			stick_held = false;//reset if neutral
		}
	}
}

//change the selection based on the left and right arrow keys
if(right_key){
	selected -= 1;
	arrowRightAnim = 1;//set full animation effect when right is pressed
}else if(left_key){
	selected += 1;
	arrowLeftAnim = 1;//set full animation effect when left is pressed
}

if(right_key || left_key){
	//audio_play_sound(sndClick, 10, false);
	oSFX.clickSnd = true;
}

//Decay the animation variables over time (adjust the decay rate as needed)
arrowLeftAnim = max(arrowLeftAnim - 0.05, 0);
arrowRightAnim = max(arrowRightAnim - 0.05, 0);

//rotate towards the selection
//rot -= angle_difference(rot, selected * (360/image_number))/(0.2 * room_speed);
rot -= angle_difference(rot, selected * (360/image_number))/13;

//setting the item variable to image index
item = -selected mod image_number;
if(item < 0){
	item += image_number;
}

if(accept_key){
	//audio_play_sound(sndBeep, 10, false);
	oSFX.beepSnd = true;
	//Store the selected map sprite in a global variable for the HUD/scoreboard
	global.selectedMapSprite = item;//Use the sprite you are displaying in the carousel
	//global.selectedMapName = text;//Store the map name for text display if needed

	switch(global.selectedMapSprite){
		case 0:
			//global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM1, sqFadeOut, sqFadeIn);
			break;
		case 1:
			//global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM2, sqFadeOut, sqFadeIn);
			break;
		case 2:
			//global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM3_2, sqFadeOut, sqFadeIn);
			break;
		case 3:
			//global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM4, sqFadeOut, sqFadeIn);
			break;
		case 4:
			//global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM5, sqFadeOut, sqFadeIn);
			break;
		case 5:
			//global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM6, sqFadeOut, sqFadeIn);
			break;
		case 6://Labyrinth
			//global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM7, sqFadeOut, sqFadeIn);
			break;
		case 7:
			//global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM8, sqFadeOut, sqFadeIn);
			break;
		case 8:
			//global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM9_2, sqFadeOut, sqFadeIn);
			break;
		case 9:
			//global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM10_2, sqFadeOut, sqFadeIn);
			break;
		case 10:
			//global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM11, sqFadeOut, sqFadeIn);
			break;
		case 11:
			//global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM12_2, sqFadeOut, sqFadeIn);
			break;
		case 12:
			//global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM13_2, sqFadeOut, sqFadeIn);
			break;
		case 13:
			//global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM14, sqFadeOut, sqFadeIn);
			break;
		case 14:
			//global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM15_2, sqFadeOut, sqFadeIn);
			break;
		case 15:
			//global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM16, sqFadeOut, sqFadeIn);
			break;
		case 16:
			//global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM17, sqFadeOut, sqFadeIn);
			break;
		case 17:
			//global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM18_2, sqFadeOut, sqFadeIn);
			break;
		case 18:
			//global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM19, sqFadeOut, sqFadeIn);
			break;
		case 19:
			//global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM20_2, sqFadeOut, sqFadeIn);
			break;
	}
}

if(back_key){
	//audio_play_sound(sndBeep, 10, false);
	oSFX.beepSnd = true;
	//instance_destroy();
	//instance_create_layer(0, 0, "Instances", oPerkCarouselMenu);
	//Return to perk select menu
	instance_destroy();
	var m = instance_create_layer(0, 0, "Instances", oTitleMenu2);
	m.menu_level = 3;
	m.pos = 0;
}
