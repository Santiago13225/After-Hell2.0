if(screen_pause()){
	exit;
}
if(!instance_exists(oPlayer)){
	instance_destroy();
	exit;
}
if(instance_exists(oVictoryScreen2) || instance_exists(oGameOverScreen2)){
	instance_destroy();
	exit;
}
if(covered){
	cover_timer--;
	if(cover_timer <= 0){
		fading = true;//start fading instead of instantly revealing
		covered = false;
		/*if(!checked){
			checked = true;
			check_scratch_results();
		}*/
	}
}else if(fading){
	fade_alpha -= fade_speed;
	if(fade_alpha <= 0){
		fade_alpha = 0;
		fading = false;
		if(!checked){
			checked = true;
			check_scratch_results();
		}
	}
}else{
	display_timer++;
	if(display_timer >= display_time){
		instance_destroy();
	}
}

//Flash timer
if(!covered && !fading && payout > 0){
	flash_timer++;
	if(flash_timer mod 30 == 0){
		flash_visible = !flash_visible;
	}
}