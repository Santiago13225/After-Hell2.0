//draw_sprite_part(sprite_index, image_index, 0, y1, sprite_width, sprite_height/img, x, y);
//draw_sprite_part(sprite_index, image_index, 0, y1 - sprite_height, sprite_width, sprite_height/img, x, y);
/*for(var i = 0; i < 3; i++){
	var _drawX = x + i * (reel_width + reel_gap);
	draw_sprite_part(sprite_index, image_index, 0, y1[i], sprite_width, sprite_height/img, _drawX, y);
	draw_sprite_part(sprite_index, image_index, 0, y1[i] - sprite_height, sprite_width, sprite_height/img, _drawX, y);
}*/

///Draw GUI event
/*var _symHeight = sprite_height / img;

for(var i = 0; i < 3; i++){
	var _drawX = x_gui + i * (reel_width + reel_gap);
	draw_sprite_part(sprite_index, image_index, 0, y1[i], sprite_width, _symHeight, _drawX, y_gui);
	draw_sprite_part(sprite_index, image_index, 0, y1[i] - sprite_height, sprite_width, _symHeight, _drawX, y_gui);
}*/

if(instance_exists(oPauseMenu2) || instance_exists(oVictoryScreen2) || instance_exists(oGameOverScreen2)){
	exit;
}

///Draw GUI event
var _guiW = display_get_gui_width();
var _guiH = display_get_gui_height();
var _symHeight = sprite_height / img;
var _totalWidth = 3 * reel_width + 2 * reel_gap;

//Center the slots on the GUI
var _startX = _guiW / 2 - _totalWidth / 2;
var _startY = _guiH / 2 - _symHeight / 2 - 120;

for(var i = 0; i < 3; i++){
	var _drawX = _startX + i * (reel_width + reel_gap);
	draw_sprite_part(sprite_index, image_index, 0, y1[i], sprite_width, _symHeight, _drawX, _startY);
	//draw_sprite_part_ext(sprite_index, image_index, 0, y1[i], sprite_width, _symHeight, _drawX, _startY, _scale, _scale, c_white, 1);
	draw_sprite_part(sprite_index, image_index, 0, y1[i] - sprite_height, sprite_width, _symHeight, _drawX, _startY);
	//draw_sprite_part_ext(sprite_index, image_index, 0, y1[i] - sprite_height, sprite_width, _symHeight, _drawX, _startY, _scale, _scale, c_white, 1);
}

//Draw frame on top of reels
draw_sprite_ext(sSlotFrame, 0, _startX - 22, _startY - 16, 1, 1, 0, c_white, 1);