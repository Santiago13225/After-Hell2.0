if(state == 0){
	draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_red, 0.8);
}else if((flashTimer div 6) mod 2 == 0){
	draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, 0.4);
}