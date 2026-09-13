if(instance_exists(oPlayer)){
	//instance_create_layer(oPlayer.x, oPlayer.y, layer, oEffectDelayedShot);
	instance_create_depth(oPlayer.x, oPlayer.y, -oPlayer.bbox_top, oEffectDelayedShot);
	//loop
	alarm[0] = 30;
}