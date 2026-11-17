if(!has_been_interacted){
	if(collision_circle(x, y, radius, oPlayer, false, true)){
		has_been_interacted = true;
		if(!audio_is_playing(sndLottery)){
			audio_play_sound(sndLottery, 10, false);
		}
		if(!instance_exists(oTextbox2) && !instance_exists(oScratchcard)){
			if(global.controllerMode == 0){
				create_textbox("ScratchcardWallbuy");
			}else{
				create_textbox("ScratchcardWallbuyC");
			}
		}
	}
}

if(!collision_circle(x, y, radius, oPlayer, false, true)){
	has_been_interacted = false;
}