event_inherited();

//In oLightningStrike's Create event, add:
depth = -bbox_top;

//audio_play_sound(sndLightningStrike, 10, false);
oSFX.lightningStrikeSnd = true;
if(global.screenShake){
	screen_shake(8);//Screen shake.
}
damage = 16;
alarm[0] = 60;