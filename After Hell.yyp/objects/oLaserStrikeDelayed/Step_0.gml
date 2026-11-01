//Advance cloud animation manually
//cloud_image_index += cloud_image_speed;

if(screen_pause()){
	//Save and freeze the alarm
	if(alarm[0] > 0){
		savedAlarm = alarm[0];
		alarm[0] = -1;//disable the alarm
	}
	exit;
}

//Restore alarm when unpaused
if(savedAlarm > 0 && alarm[0] == -1){
	alarm[0] = savedAlarm;
	savedAlarm = 0;
}

//Follow the player until the last 15 frames
if(!strike_created && alarm[0] > 15 && instance_exists(oPlayer)){
	x = oPlayer.x;
	y = oPlayer.y;
	//x = lerp(x, oPlayer.x, 0.1);
	//y = lerp(y, oPlayer.y, 0.1);
	depth = -bbox_top;
}

if(!strike_created){
	//Advance cloud animation, clamp to last frame
	orb_image_index = min(orb_image_index + orb_image_speed, sprite_get_number(sOrbForming) - 1);
}else if(!strike_done){
	//Hold on last frame while strike is active
	orb_image_index = sprite_get_number(sOrbForming) - 1;
}else{
	//Play backwards
	orb_image_index -= reverse_orb_image_speed;
	if(orb_image_index <= 0){
		instance_destroy();
	}
}

//Only check for strike ending after it has been created
//if(strike_created && !instance_exists(oLightningStrike)){
//Only check for OUR specific strike ending
if(strike_created && !instance_exists(my_strike)){
	strike_done = true;
}