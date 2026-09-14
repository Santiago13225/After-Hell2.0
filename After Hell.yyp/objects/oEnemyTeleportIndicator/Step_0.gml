if(screen_pause()){
	exit;
}	
timer++;
if(timer >= lifetime){
	instance_destroy();
}