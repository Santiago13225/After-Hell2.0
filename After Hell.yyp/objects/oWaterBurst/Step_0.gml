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
		//audio_play_sound(sndWaterWarning, 8, true);
		//oSFX.waterBurstWarningSnd = true;
	//}

	if(warningTimer >= warningTime){
		//Start extending
		extending = true;
		flashVisible = false;
		extendLength = 0;

		//Create damage instance
		damageInst = instance_create_depth(x, y, depth - 1, oEnvironmentDamage);
		with(damageInst){
			damage = 250;
			sprite_index = sDamageRect;

			//Only vertical now
			image_xscale = other.burstWidth;
			image_yscale = 1;
			x -= other.burstWidth / 2;
			/*if(other.burstDir == 270 || other.burstDir == 90){//vertical
				image_xscale = other.burstWidth;
				image_yscale = 1;
				x -= other.burstWidth / 2;
			}else if(other.burstDir == 180){//left
				image_xscale = 1;
				image_yscale = other.burstWidth;
				y -= other.burstWidth / 2;
			}else{//right
				image_xscale = 1;
				image_yscale = other.burstWidth;
				y -= other.burstWidth / 2;
			}*/
		}
	}
}else if(extending){
	//Play burst sound when extending starts
	//oSFX.waterBurstSnd = true;
	oSFX.waterBurstSndLoop = true;//Play the water burst sound loop.

	if(global.screenShake){
		screen_shake(2);//subtle shake during extending
	}

	//Extend phase - water grows toward end
	extendLength += extendSpeed;

	//Update damage instance size
	if(instance_exists(damageInst)){
		if(burstDir == 270 || burstDir == 90){//vertical
			damageInst.image_yscale = extendLength;
		}/*else if(burstDir == 180){//left
			damageInst.image_xscale = extendLength;
			damageInst.x = x - extendLength;
		}else{//right
			damageInst.image_xscale = extendLength;
		}*/
	}

	if(extendLength >= burstLength){
		extendLength = burstLength;
		extending = false;
		burstActive = true;
		burstTimer = 0;
		retractLength = burstLength;
	}
}else if(burstActive){
	oSFX.waterBurstSndLoop = true;//Play the water burst sound loop.
	if(global.screenShake){
		screen_shake(3);//subtle shake during extending
	}
	//Active burst phase
	burstTimer++;
	if(burstTimer >= burstTime){
		burstActive = false;
		retracting = true;
		//Destroy damage instance when burst ends
		if(instance_exists(damageInst)){
			instance_destroy(damageInst);
			damageInst = noone;
		}
	}
}else if(retracting){
	oSFX.waterBurstSndLoop = true;//Play the water burst sound loop.
	if(global.screenShake){
		screen_shake(2);//subtle shake during extending
	}
	//Retract phase - shrink water back toward pipe
	retractLength -= 32;//retract speed
	if(retractLength <= 0){
		retractLength = 0;
		retracting = false;
		waiting = true;
		repeatTimer = 0;
	}
}