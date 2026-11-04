draw_self();
draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, angle, image_blend, image_alpha);

gpu_set_blendenable(false);
gpu_set_colorwriteenable(false, false, false, true);
draw_set_alpha(0);
var x1 = x-sprite_xoffset;
var y1 = y-sprite_yoffset;
draw_rectangle(x1, y1, x1 + sprite_width, y1 + sprite_height, false);
draw_set_alpha(1);
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendenable(true);

draw_circle(x, y, sightRange, 1);