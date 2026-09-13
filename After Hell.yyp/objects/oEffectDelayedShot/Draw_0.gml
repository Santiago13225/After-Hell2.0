//Draw ground indicator (default sprite)
//draw_self();

//Only draw indicator while strike hasn't been created yet
/*if(!strike_created){
	draw_self();
}

//Draw cloud forming animation on top
draw_sprite_ext(sCloudForming, floor(cloud_image_index), x, y - 8, 1, 1, 0, c_white, 1);*/

//Indicator with alpha mask
if(!strike_created){
	draw_self();
	//draw_sprite_ext(sCloudForming, floor(cloud_image_index), x, y - 8, 1, 1, 0, c_white, 1);
}
//draw_sprite_ext(sCloudForming, floor(cloud_image_index), x, y - 8, 1, 1, 0, c_white, 1);

gpu_set_blendenable(false);
gpu_set_colorwriteenable(false, false, false, true);
draw_set_alpha(0);
var x1 = x - sprite_xoffset;
var y1 = y - sprite_yoffset;
//Mask for indicator
draw_rectangle(x1, y1, x1 + sprite_width, y1 + sprite_height, false);
//Mask for cloud
/*var _cw = sprite_get_width(sCloudForming);
var _ch = sprite_get_height(sCloudForming);
var _cx = x - sprite_get_xoffset(sCloudForming);
var _cy = (y - 8) - sprite_get_yoffset(sCloudForming);
draw_rectangle(_cx, _cy, _cx + _cw, _cy + _ch, false);*/
draw_set_alpha(1);
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendenable(true);

//Cloud drawn normally, no silhouette
draw_sprite_ext(sCloudForming, floor(cloud_image_index), x, y - 8, 1, 1, 0, c_white, 1);