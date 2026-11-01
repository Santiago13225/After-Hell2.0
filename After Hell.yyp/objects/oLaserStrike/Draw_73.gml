if(global.dialog_active == false){
	gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
	gpu_set_alphatestenable(true);
	gpu_set_fog(true, merge_color(c_black, c_red, 0.5), 0, 1);
	//Silhouette for strike end
	draw_self();
	//Silhouette for lightning beam
	//draw_sprite_ext(sLightningStrike, image_index, x, y - 8, 1, 1, 0, c_white, 1);
	gpu_set_fog(false, c_white, 0, 0);
	gpu_set_alphatestenable(false);
	gpu_set_blendmode(bm_normal);
}