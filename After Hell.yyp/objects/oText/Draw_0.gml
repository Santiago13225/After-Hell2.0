//Use the controller button font in controller mode (it holds the [@] and [#] icons), otherwise the normal font
if(global.controllerMode == 1){
	draw_set_font(global.fontController);
}else{
	draw_set_font(global.font_main);
}
//Draw this line of the hint text
draw_text(x, y, text);
//Put the default font back so other objects aren't affected
draw_set_font(global.font_main);