if(screen_pause()){
	exit;
}

if(state == 0){
	if(place_meeting(x, y, oPlayer)){
		state = 1;
		//oSFX.alarmSnd = true;//add to oSFX
		myStrike = instance_create_depth(oPlayer.x, oPlayer.y, -bbox_top, oLaserStrikeDelayed);
	}
}else{
	flashTimer++;
	if(!instance_exists(myStrike)){
		state = 0;
		myStrike = noone;
		flashTimer = 0;
	}
}