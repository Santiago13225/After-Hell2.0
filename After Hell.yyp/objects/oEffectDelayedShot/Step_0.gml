//Advance cloud animation manually
//cloud_image_index += cloud_image_speed;

//In oEffectDelayedShot's Step event, add:
depth = -bbox_top;

if(!strike_created){
	//Advance cloud animation, clamp to last frame
	cloud_image_index = min(cloud_image_index + cloud_image_speed, sprite_get_number(sCloudForming) - 1);
}else if(!strike_done){
	//Hold on last frame while strike is active
	cloud_image_index = sprite_get_number(sCloudForming) - 1;
}else{
	//Play backwards
	cloud_image_index -= reverse_cloud_image_speed;
	if(cloud_image_index <= 0){
		instance_destroy();
	}
}

//Only check for strike ending after it has been created
//if(strike_created && !instance_exists(oLightningStrike)){
//Only check for OUR specific strike ending
if(strike_created && !instance_exists(my_strike)){
	strike_done = true;
}