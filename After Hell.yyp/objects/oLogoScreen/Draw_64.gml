var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

var _progress = 1 - (alarm[0] / themeFrames);
_progress = clamp(_progress, 0, 1);

//var _barW = 300;
var _barW = 1280;
var _barH = 12;
var _bx = _gw / 2 - _barW / 2;
//var _by = _gh - 80;
var _by = _gh - 40;

//Background
draw_set_alpha(0.5);
draw_rectangle_color(_bx, _by, _bx + _barW, _by + _barH, c_black, c_black, c_black, c_black, false);
//draw_set_alpha(1);

//Fill
draw_rectangle_color(_bx, _by, _bx + _barW * _progress, _by + _barH, c_white, c_white, c_white, c_white, false);

//Outline
//draw_rectangle_color(_bx, _by, _bx + _barW, _by + _barH, c_white, c_white, c_white, c_white, true);
//draw_set_alpha(1);

//Loading text
//draw_set_font(global.font_main);
//draw_set_halign(fa_center);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_set_color(c_white);

var _a = 0.5 + 0.5 * dsin(current_time / 4);
draw_set_alpha(_a);
//draw_text_transformed(_bx + _barW / 2, _by - 8, "Loading...", 2, 2, 0);
draw_text_transformed(_bx + _barW, _by - 8, "Loading...", 2, 2, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);