if(global.dialog_active == false){//If dialog is not active.
	gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);//We use bm_dest_alpha for the source color and bm_inv_dest_alpha for the destination color.
	gpu_set_alphatestenable(true);//Turn on alpha testing. This makes it so that there will be a cutoff value at which all alpha values will be set to 0.
	//The default for the line above is 0, so if anything has an alpha of 0, it is not going to be drawn.
	//Draw Silhouette
	gpu_set_fog(true, merge_color(c_black, c_red, 0.5), 0, 1);//Enable fog, set merged color, start and end distance set at default values of 0 and 1.
	//gpu_set_fog(true, c_red, 0, 1);
	draw_self();//Draw sprite.
	gpu_set_fog(false, c_white, 0, 0);//When we are done, we turn the fog back off.
	gpu_set_alphatestenable(false);//Turn off alpha testing.
	gpu_set_blendmode(bm_normal);//Turn off the blend mode. Reset it back to normal.
}