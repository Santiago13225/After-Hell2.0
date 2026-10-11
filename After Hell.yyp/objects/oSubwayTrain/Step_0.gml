if(screen_pause()){
	exit;
}

if(waiting){
	//Wait before starting warning
	repeatTimer++;
	if(repeatTimer >= repeatTime){
		repeatTimer = 0;
		waiting = false;
		warningTimer = 0;
		flashTimer = 0;
	}
}else if(!trainActive){
	//Warning phase
	warningTimer++;

	//Flash the track
	flashTimer++;
	if(flashTimer mod 10 == 0){
		flashVisible = !flashVisible;
	}

	if(warningTimer >= warningTime){
		//Start the train
		trainActive = true;
		flashVisible = false;
		trainDisplayTimer = 0;//new

		//Spawn from correct side based on direction
		if(moveDir == -1){
			trainX = trackX2;//starts from right, moves left
		}else{
			trainX = trackX1 - trainW;//starts from left, moves right
		}

		/*if(moveDir == -1){
			trainX = trackX2 + trainW;//fully off screen to the right
		}else{
			trainX = trackX1 - trainW * 2; // fully off screen to the left
		}*/

		//Create damage instance
		damageInst = instance_create_depth(trainX, trackY, depth - 1, oTrainDamage);
		with(damageInst){
			damage = 250;
			sprite_index = sDamageRect;
			image_xscale = other.trainW;
			image_yscale = other.trackH;
		}
		//show_debug_message("damageInst x: " + string(damageInst.x) + " xscale: " + string(damageInst.image_xscale) + " sprite width: " + string(sprite_get_width(sDamageRect)));
	}
}else{
	//Train moving phase
	trainX += trainSpd * moveDir;

	//Screen shake while train is active
	if(global.screenShake){
		screen_shake(4);
	}
	
	//Play train sound
	//if(!audio_is_playing(sndTrain)){
	oSFX.trainSnd = true;
	//audio_play_sound(sndTrain, 8, false);
	//}

	//Update damage instance position/old code
	/*if(instance_exists(damageInst)){
		damageInst.x = trainX;
		damageInst.y = trackY;
	}*/
	
	//Update damage instance position
	if(instance_exists(damageInst)){
		damageInst.x = clamp(trainX, trackX1, trackX2);
		damageInst.y = trackY;
	}
	
	//Update damage instance position/works for left-moving train
	/*if(instance_exists(damageInst)){
		//Clamp damage to track boundaries only
		var _clampedX = clamp(trainX, trackX1, trackX2);
		var _clampedRight = clamp(trainX + trainW, trackX1, trackX2);
		var _visibleW = _clampedRight - _clampedX;

		damageInst.x = _clampedX;
		damageInst.y = trackY;
		damageInst.image_xscale = max(_visibleW, 0);
	}*/

	//Count display time/old code
	/*trainDisplayTimer++;
	if(trainDisplayTimer >= trainDisplayTime){
		trainDisplayTimer = 0;
		//Clean up damage instance
		if(instance_exists(damageInst)){
			instance_destroy(damageInst);
		}
		trainActive = false;
		waiting = true;
		repeatTimer = 0;
	}*/

	//Check if train has fully exited the track boundaries
	var _exitedLeft = (moveDir == -1 && trainX + trainW < trackX1);
	var _exitedRight = (moveDir == 1 && trainX > trackX2);

	if(_exitedLeft || _exitedRight){
		audio_stop_sound(sndTrain);
		if(instance_exists(damageInst)){
			instance_destroy(damageInst);
		}
		trainActive = false;
		waiting = true;
		repeatTimer = 0;
	}

	//Check if train has fully crossed the track
	/*var _exitedLeft = (moveDir == -1 && trainX + trainW < trackX1);
	var _exitedRight = (moveDir == 1 && trainX > trackX2);

	if(_exitedLeft || _exitedRight){
		//Clean up damage instance
		if(instance_exists(damageInst)){
			instance_destroy(damageInst);
		}
		trainActive = false;
		waiting = true;
		repeatTimer = 0;
	}*/
}

//Play warning sound while flashing
if(!trainActive && !waiting){
//	if(!audio_is_playing(sndTrainWarning)){
//		audio_play_sound(sndTrainWarning, 8, false);//looping
		oSFX.trainWarningSnd = true;
//	}
}

/*if(trainActive){
	show_debug_message("trainX: " + string(trainX) + " trainW: " + string(trainW) + " trackX1: " + string(trackX1) + " trackX2: " + string(trackX2) + " moveDir: " + string(moveDir));
}*/