///oSkeleton Draw Event
/*This object represents a Skeleton.*/
//This event is responsible for drawing the skeleton.

draw_sprite_ext(sprite_index, image_index, x, y, face, image_yscale, image_angle, image_blend, image_alpha);//Draw skeleton flipped the right way.

//Draw hp
var _healthPercent = hp / maxHp;//Grab percent of health as a variable.
var _hpImage = _healthPercent * (sprite_get_number(sEnemyHealth) - 1);//Grab health as an integer.
draw_sprite_ext(sEnemyHealth, _hpImage, x, y - sprite_height - 1, 1, image_yscale, image_angle, image_blend, image_alpha);//Draw health bar based on skeleton health.

//draw_text(x, y, string(hp));//Draw skeleton HP as text.
if(path_exists(path) && usingPathfinding){
	draw_path(path, x, y, 1);//Draw skeleton path.
}

gpu_set_blendenable(false);
gpu_set_colorwriteenable(false, false, false, true);
draw_set_alpha(0);
var x1 = x-sprite_xoffset;
var y1 = y-sprite_yoffset;
draw_rectangle(x1, y1, x1 + sprite_width, y1 + sprite_height, false);
draw_set_alpha(1);
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendenable(true);
//draw_text(x, y - 48, string(usingPathfinding));

if(!usingPathfinding){//Draw a red circle below the skeleton if it's not using pathfinding
	draw_set_color(c_red);
    draw_circle(x, y + 6, 4, false);//small red circle under the feet
	draw_set_color(c_white);
	draw_circle(x, y + 6, 4, true);//small red circle under the feet
}