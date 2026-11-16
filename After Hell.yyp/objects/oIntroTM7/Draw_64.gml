///oIntroTM2 Draw GUI Event
/*This object represents an introTM2 object.*/
//This event is responsible for handling introTM2 object draw GUI behavior.
draw_sprite_ext(sPixel, 0, 0, 0, 5000, 240, 0, c_black, 1);
draw_sprite_ext(sPixel, 0, 0, 840, 5000, 240, 0, c_black, 1);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
//draw_set_font(fnt8Bit);
draw_set_font(global.font_main);

//draw_text(960, 840, print);
draw_text_transformed(960, 840, print, 2.5, 2.5, 0);

if(global.controllerMode == 0){
	draw_set_font(global.font_main);
	draw_text_transformed(960, 1040, "Hold [Space] to Skip", 2.5, 2.5, 0);
}else{
	draw_set_font(global.fontController);
	draw_text_transformed(960, 1040, "Hold [@] to Skip", 2.5, 2.5, 0);
}
draw_set_alpha(1);

//Calculate seconds remaining (using ceil to round up)
var seconds_left = ceil(skipTimer / 60);

//Draw the countdown text at the bottom of the screen (adjust x, y as needed)
draw_text_transformed(960, 200, "Match Starts In: " + string(seconds_left) + "s", 2.5, 2.5, 0);

//Draw loading bar
var _barWidth = 1800;
var _barHeight = 20;
var _barX = 960 - _barWidth/2;
var _barY = 1000;
var _progress = 1 - (skipTimer / (30 * 60));//fills from 0 to 1 as time passes

//Background bar
draw_set_alpha(0.5);
draw_set_color(c_dkgray);
draw_rectangle(_barX, _barY, _barX + _barWidth, _barY + _barHeight, false);

//Fill bar
draw_set_alpha(1);
draw_set_color(c_blue);
draw_rectangle(_barX, _barY, _barX + _barWidth * _progress, _barY + _barHeight, false);

//Reset color
draw_set_color(c_white);

//Draw skip bar
var _skipBarWidth = 1800;
var _skipBarHeight = 20;
var _skipBarX = 960 - _skipBarWidth/2;
var _skipBarY = 1000;//positioned below the loading bar
var _skipProgress = min(holdspace / 80, 1);//fills from 0 to 1 as holdspace increases

//Background bar
//draw_set_alpha(0.5);
//draw_set_color(c_dkgray);
//draw_rectangle(_skipBarX, _skipBarY, _skipBarX + _skipBarWidth, _skipBarY + _skipBarHeight, false);

//Fill bar
draw_set_alpha(1);
draw_set_color(c_yellow);
draw_rectangle(_skipBarX, _skipBarY, _skipBarX + _skipBarWidth * _skipProgress, _skipBarY + _skipBarHeight, false);

//Reset
draw_set_color(c_white);

draw_sprite_ext(sPixel, 0, 0, 0, 5000, 5000, 0, c_black, a);