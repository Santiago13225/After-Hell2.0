if(screen_pause()){
	exit;
}

if(!burstActive && !retracting && !extending){
	depth = -bbox_top;//closer to ground during warning
}else{
	depth = -2000;//above everything during burst
}

//Animate burst frames
if(extending || burstActive || retracting){
	animTimer++;
	if(animTimer >= animSpeed){
		animTimer = 0;
		animFrame = (animFrame + 1) mod 2;
	}
}

if(waiting){
	repeatTimer++;
	if(repeatTimer >= repeatTime){
		repeatTimer = 0;
		waiting = false;
		warningTimer = 0;
		flashTimer = 0;
	}
}else if(!burstActive && !retracting && !extending){
	//Warning phase
	warningTimer++;

	//Flash
	flashTimer++;
	if(flashTimer mod 10 == 0){
		flashVisible = !flashVisible;
	}

	//Warning sound
	//if(!audio_is_playing(sndWaterBurstWarning)){
		//oSFX.waterBurstWarningSnd = true;
	//}

	if(warningTimer >= warningTime){
		//Start extending
		extending = true;
		flashVisible = false;
		extendLength = 0;

		//Create damage instance
		damageInst = instance_create_depth(x, y, depth - 1, oDamagePlayer);
		with(damageInst){
			damage = 250;
			sprite_index = sDamageRect;
			if(other.burstDir == 0){//right
				image_xscale = 1;
				image_yscale = other.burstWidth;
				y -= other.burstWidth / 2;
			}else{//left
				image_xscale = 1;
				image_yscale = other.burstWidth;
				y -= other.burstWidth / 2;
			}
		}
	}
}else if(extending){
	//Play burst sound
	oSFX.waterBurstSndLoop = true;

	if(global.screenShake){
		screen_shake(2);//subtle shake during extending
	}

	//Extend phase
	extendLength += extendSpeed;

	//Update damage instance size
	if(instance_exists(damageInst)){
		if(burstDir == 0){//right
			damageInst.image_xscale = extendLength;
		}else{//left
			damageInst.image_xscale = extendLength;
			damageInst.x = x - extendLength;
		}
	}

	if(extendLength >= burstLength){
		extendLength = burstLength;
		extending = false;
		burstActive = true;
		burstTimer = 0;
		retractLength = burstLength;
	}
}else if(burstActive){
	oSFX.waterBurstSndLoop = true;
	if(global.screenShake){
		screen_shake(3);//subtle shake during extending
	}
	//Active burst phase
	burstTimer++;
	if(burstTimer >= burstTime){
		burstActive = false;
		retracting = true;
		if(instance_exists(damageInst)){
			instance_destroy(damageInst);
			damageInst = noone;
		}
	}
}else if(retracting){
	oSFX.waterBurstSndLoop = true;
	if(global.screenShake){
		screen_shake(2);//subtle shake during extending
	}
	//Retract phase
	retractLength -= 32;
	if(retractLength <= 0){
		retractLength = 0;
		retracting = false;
		waiting = true;
		repeatTimer = 0;
	}
}