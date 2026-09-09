/*if(running == true){
	y1 += run_speed;
	y1 = y1 mod sprite_height;
}*/

if(screen_pause()){
	exit;
}

if(!instance_exists(oPlayer)){
	instance_destroy();
	exit;
}

//Destroy if victory or game over screen appears
if(instance_exists(oVictoryScreen2) || instance_exists(oGameOverScreen2)){
	instance_destroy();
	exit;
}

for(var i = 0; i < 3; i++){
	if(running[i]){
		y1[i] += run_speed[i];
		y1[i] = y1[i] mod sprite_height;

		//Play spin sound if not already playing
		/*if(!audio_is_playing(spin_sound)){
			audio_play_sound(spin_sound, 8, true);//true = looping
		}*/

		//Count down stop timer
		if(stop_timers[i] > 0){
			stop_timers[i]--;
		}

		//Stop the reel when timer reaches 0
		if(stop_timers[i] == 0){
			running[i] = false;
			stop_timers[i] = -1;

			//Snap to nearest symbol
			y1[i] -= y1[i] mod (sprite_height / img);

			//Record result (which symbol is showing)
			results[i] = floor(y1[i] / (sprite_height / img)) mod img;

			//Play stop sound
			//audio_play_sound(stop_sound, 8, false);
			oSFX.stopSnd = true;

			//Check if all reels have stopped
			if(!running[0] && !running[1] && !running[2]){
				spinning = false;
				check_results();
			}
		}
	}
}

if(result_done){
	result_timer++;
	if(result_timer >= result_display_time){
		instance_destroy();
	}
}