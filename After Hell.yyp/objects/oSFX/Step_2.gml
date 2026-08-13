///oSFX End Step Event
/*This object represents a SFX object.*/
//This event is responsible for handling the SFX object end step behavior.

//Get the volume
var _sfxVol = global.SFX_VOL * global.MASTER_VOL;
//global.sfxvolume
//Pickup sound//Call:oSFX.pickupSnd = true;
if(pickupSnd == true){
	var _snd = audio_play_sound(sndPickup, 8, false);//Play sound.
	//audio_sound_gain(_snd, _sfxVol, 1000);//1000 takes 1000 ms (*1 sec) to bring the sound vol from m0 to _sfxVol
	audio_sound_gain(_snd, _sfxVol, 0);
	pickupSnd = false;//Reset the pickup variable.
}

//Click sound
if(clickSnd == true){
	var _snd = audio_play_sound(sndClick, 4, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	clickSnd = false;//Reset the pickup variable.
}

//Beep sound
if(beepSnd == true){
	var _snd = audio_play_sound(sndBeep, 4, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	beepSnd = false;//Reset the pickup variable.
}

//Win sound
if(winSnd == true){
	var _snd = audio_play_sound(sndVictory, 10, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	winSnd = false;//Reset the pickup variable.
}

//Pistol sound
if(pistolSnd == true){
	var _snd = audio_play_sound(sndShot, 8, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	pistolSnd = false;//Reset the pickup variable.
}

//Raygun sound
if(raygunSnd == true){
	var _snd = audio_play_sound(sndRGBlast, 8, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	raygunSnd = false;//Reset the pickup variable.
}

//Sniper sound
if(sniperSnd == true){
	var _snd = audio_play_sound(sndSniperBlast, 8, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	sniperSnd = false;//Reset the pickup variable.
}

//Shotgun sound
if(shotgunSnd == true){
	var _snd = audio_play_sound(sndSGBlast, 8, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	shotgunSnd = false;//Reset the pickup variable.
}

//Assault sound
if(assaultSnd == true){
	var _snd = audio_play_sound(sndAssault, 8, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	assaultSnd = false;//Reset the pickup variable.
}

//Smg sound
if(smgSnd == true){
	var _snd = audio_play_sound(sndSMG, 8, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	smgSnd = false;//Reset the pickup variable.
}

//Lmg sound
if(lmgSnd == true){
	var _snd = audio_play_sound(sndLMG, 7, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	lmgSnd = false;//Reset the pickup variable.
}

//Bazooka sound
if(bazookaSnd == true){
	var _snd = audio_play_sound(sndRocket, 8, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	bazookaSnd = false;//Reset the pickup variable.
}

//Enemy bullet impact sound
if(enemybulletimpactSnd == true){
	var _snd = audio_play_sound(snd8BitExplosion2, 6, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	enemybulletimpactSnd = false;//Reset the pickup variable.
}

//Explosion sound
if(explosionSnd == true){
	var _snd = audio_play_sound(sndExplosion, 8, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	explosionSnd = false;//Reset the pickup variable.
}

//Earthquake sound
if(earthquakeSnd == true){
	var _snd = audio_play_sound(sndEarthquake, 8, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	earthquakeSnd = false;//Reset the pickup variable.
}

//Cock sound
if(cockSnd == true){
	var _snd = audio_play_sound(sndCock, 8, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	cockSnd = false;//Reset the pickup variable.
}

//Ammo sound
if(ammoSnd == true){
	var _snd = audio_play_sound(sndAmmo, 8, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	ammoSnd = false;//Reset the pickup variable.
}

//Fire sound
if(fireSnd == true){
	var _snd = audio_play_sound(sndFire, 6, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	fireSnd = false;//Reset the pickup variable.
}

//Enemy hit sound
if(enemyhitSnd == true){
	var _snd = audio_play_sound(sndFleshHit, 6, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	enemyhitSnd = false;//Reset the pickup variable.
}

//Player hit sound
if(playerhitSnd == true){
	var _snd = audio_play_sound(sndHit, 10, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	playerhitSnd = false;//Reset the pickup variable.
}

//Empty sound
if(emptySnd == true){
	var _snd = audio_play_sound(sndEmpty, 8, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	emptySnd = false;//Reset the pickup variable.
}

//Money sound
if(moneySnd == true){
	var _snd = audio_play_sound(sndMoney, 8, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	moneySnd = false;//Reset the pickup variable.
}

//Reload sound
if(reloadSnd == true){
	var _snd = audio_play_sound(sndReload, 8, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	reloadSnd = false;//Reset the pickup variable.
}

//Splatter sound
if(splatterSnd == true){
	var _snd = audio_play_sound(sndSplatter, 8, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	splatterSnd = false;//Reset the pickup variable.
}

//Throw sound
if(throwSnd == true){
	var _snd = audio_play_sound(sndThrow, 6, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	throwSnd = false;//Reset the pickup variable.
}

//Wrong sound
if(wrongSnd == true){
	var _snd = audio_play_sound(sndWrong, 4, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	wrongSnd = false;//Reset the pickup variable.
}

//Buy sound
if(buySnd == true){
	var _snd = audio_play_sound(sndBuy, 10, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	buySnd = false;//Reset the pickup variable.
}

//Broke sound
if(brokeSnd == true){
	var _snd = audio_play_sound(sndNoMoney, 10, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 0);
	brokeSnd = false;//Reset the pickup variable.
}

//win sound
/*
if htSnd == true
{
	//play sound
	var _snd = audio_play_sound(global.MUSIC, 8, false);
	audio_sound_gain(_snd, _sfxVol, 1000);
	
	//reset variable
	htSnd = false;
}*/

//Looping SFX example
//House
//Turn sound effect on and store the instance of the sound
if(houseSndLoop == true && !audio_is_playing(houseSndLoopInst)){
	houseSndLoopInst = audio_play_sound(sndHouseTheme1, 8, true);
}

//Turn sound effect off
if(houseSndLoop == false && audio_is_playing(houseSndLoopInst)){
	audio_stop_sound(houseSndLoopInst);
}
houseSndLoop = false;
//oSFX.houseSndloop = true;

//See 34:36 of sound video on YouTube!

//Island
if(beachSndLoop == true){//Start the loop and turn up the volume
	if(!audio_is_playing(beachSndLoopInst)){//Play the sound
		beachSndLoopInst = audio_play_sound(sndWind, 6, true);
	}
	if(beachSndLoopVol < 1){//Raise the volume
		beachSndLoopVol += beachSndLoopVolSpd;
	}else{
		beachSndLoopVol = 1;
	}
}
	if(beachSndLoop == false){//Fade out and turn off
		if(beachSndLoopVol > 0){//Lower the volume
			beachSndLoopVol -= beachSndLoopVolSpd;
		}else{
			beachSndLoopVol = 0;
		}
		if(beachSndLoopVol <= 0){//Stop the sound if the gain is 0
			audio_stop_sound(beachSndLoopInst);
		}
	}
	if(audio_is_playing(beachSndLoopInst)){//Set the volume
		audio_sound_gain(beachSndLoopInst, beachSndLoopVol * _sfxVol, 0);
	}
	beachSndLoop = false;//Reset variable
	
//Temple
if(templeSndLoop == true){//Start the loop and turn up the volume
	if(!audio_is_playing(templeSndLoopInst)){//Play the sound
		templeSndLoopInst = audio_play_sound(sndTempleAmbience, 6, true);
	}
	if(templeSndLoopVol < 1){//Raise the volume
		templeSndLoopVol += templeSndLoopVolSpd;
	}else{
		templeSndLoopVol = 1;
	}
}
	if(templeSndLoop == false){//Fade out and turn off
		if(templeSndLoopVol > 0){//Lower the volume
			templeSndLoopVol -= templeSndLoopVolSpd;
		}else{
			templeSndLoopVol = 0;
		}
		if(templeSndLoopVol <= 0){//Stop the sound if the gain is 0
			audio_stop_sound(templeSndLoopInst);
		}
	}
	if(audio_is_playing(templeSndLoopInst)){//Set the volume
		audio_sound_gain(templeSndLoopInst, templeSndLoopVol * _sfxVol, 0);
	}
	templeSndLoop = false;//Reset variable
	
//Casino
if(casinoSndLoop == true){//Start the loop and turn up the volume
	if(!audio_is_playing(casinoSndLoopInst)){//Play the sound
		casinoSndLoopInst = audio_play_sound(sndSlotMachine, 6, true);
	}
	if(casinoSndLoopVol < 1){//Raise the volume
		casinoSndLoopVol += casinoSndLoopVolSpd;
	}else{
		casinoSndLoopVol = 1;
	}
}
	if(casinoSndLoop == false){//Fade out and turn off
		if(casinoSndLoopVol > 0){//Lower the volume
			casinoSndLoopVol -= casinoSndLoopVolSpd;
		}else{
			casinoSndLoopVol = 0;
		}
		if(casinoSndLoopVol <= 0){//Stop the sound if the gain is 0
			audio_stop_sound(casinoSndLoopInst);
		}
	}
	if(audio_is_playing(casinoSndLoopInst)){//Set the volume
		audio_sound_gain(casinoSndLoopInst, casinoSndLoopVol * _sfxVol, 0);
	}
	casinoSndLoop = false;//Reset variable