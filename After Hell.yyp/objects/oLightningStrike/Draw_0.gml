/*draw_self();
draw_sprite_ext(sLightningStrike, image_index, x, y - 8, 1, 1, 0, c_white, 1);//we use image index as beam and beam end are synced
*/

//Strike end sprite with alpha mask
//Draw strike end sprite
draw_self();
//Draw lightning beam
//draw_sprite_ext(sLightningStrike, image_index, x, y - 8, 1, 1, 0, c_white, 1);
gpu_set_blendenable(false);
gpu_set_colorwriteenable(false, false, false, true);
draw_set_alpha(0);
var x1 = x - sprite_xoffset;
var y1 = y - sprite_yoffset;
//Mask for strike end
draw_rectangle(x1, y1, x1 + sprite_width, y1 + sprite_height, false);
//Mask for lightning beam
/*var _lw = sprite_get_width(sLightningStrike);
var _lh = sprite_get_height(sLightningStrike);
var _lx = x - sprite_get_xoffset(sLightningStrike);
var _ly = (y - 8) - sprite_get_yoffset(sLightningStrike);
draw_rectangle(_lx, _ly, _lx + _lw, _ly + _lh, false);*/
draw_set_alpha(1);
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendenable(true);
//Lightning strike beam drawn normally, no silhouette
draw_sprite_ext(sLightningStrike, image_index, x, y - 8, 1, 1, 0, c_white, 1);