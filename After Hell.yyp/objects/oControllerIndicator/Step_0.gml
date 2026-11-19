//Count connected controllers each step
var count = 0;

//Check if any controller is connected
for(var i = 0; i < 4; i++){ 
	if(gamepad_is_connected(i)){
		count++;
	}
}
//controller_count = count;

//Detect changes
if(count > prev_controller_count){
	//A controller was added
	
	//AUTO-SWITCH TO CONTROLLER MODE
	global.controllerMode = 1;
	
	if(prev_controller_count == 0){
		//First ever controller connected
		audio_play_sound(sndConnect, 10, false);
		//audio_play_sound(sndFirstConnect, 10, false);
	}else{
		//Additional controllers
		audio_play_sound(sndConnect, 10, false);
	}
}else if(count < prev_controller_count){
	//A controller was removed
	audio_play_sound(sndDisconnect, 10, false);
	
	if(instance_exists(oPlayer) && (room == rm_Tutorial_Level || room == rm_Level1 || room == rm_Mission0 || room == rm_Arcade_Level || room == rm_House_Level || room == rm_Facility_Level || room == rm_Temple_Level || room == rm_Overlook_Level || room == rm_Island_Level || room == rm_Casino_Level || room == rm_Labyrinth_Level || room == rm_Graveyard_Level || room == rm_Museum_Level || room == rm_Sewers_Level || room == rm_CityBlock_Level || room == rm_Yard_Level || room == rm_Supermarket_Level || room == rm_Subway_Station_Level || room == rm_Gas_Station_Level || room == rm_Cathedral_Level || room == rm_Void_Level || room == rm_Cloudwalk_Level || room == rm_Inferno_Level)){//replace with your actual gameplay room check
        if(global.controllerMode == 1 && count == 0){//If control mode set to bluetooth controller and bluetooth controller appears to be disconnected
			if(!instance_exists(oPauseMenu)){//If pause menu does not exist
	            if(!instance_exists(oScoreboard)){//If scoreboard does not exist
					if(!instance_exists(oPauseMenu)){//If pause menu does not exist
		                global.controllerMode = 0;//Switch back to keyboard/mouse
						global.dialog_active = true;//disable silhouette drawing
						//audio_play_sound(sndBeep, 8, false);
						var _pause = instance_create_depth(0, 0, 0, oPauseMenu);//Jump straight to Settings tab in pause menu
						with(_pause){//while paused
							menu_level = 1;//jump directly into Settings
							pos = 0;       //optional: highlight first option in Settings
						}
		            }
				}else if(instance_exists(oScoreboard)){//If scoreboard does exist
					if(!instance_exists(oPauseMenu)){//If pause menu does not exist
						instance_destroy(oScoreboard);//Destroy the scoreboard
						global.controllerMode = 0;//Switch back to keyboard/mouse
						global.dialog_active = true;//disable silhouette drawing
						//audio_play_sound(sndBeep, 8, false);
						var _pause = instance_create_depth(0, 0, 0, oPauseMenu);//Jump straight to Settings tab in pause menu
						with(_pause){//while paused
							menu_level = 1;//jump directly into Settings
							pos = 0;       //optional: highlight first option in Settings
						}
					}
				}
			}else if(instance_exists(oPauseMenu)){//If pause menu does exist
				global.controllerMode = 0;//Switch back to keyboard/mouse
				with(oPauseMenu){//while in the pause menu
					menu_level = 1;//jump directly into Settings
					pos = 0;       //optional: highlight first option in Settings
				}
			}
        }
    }
	//Controller removed on the main menu: fall back to keyboard/mouse once none are left
	if(room == rm_Main_Menu && count == 0){
		global.controllerMode = 0;
	}
}

//Update counts
prev_controller_count = count;
controller_count = count;