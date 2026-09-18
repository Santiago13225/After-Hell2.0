if(instance_exists(oPauseMenu2) || instance_exists(oVictoryScreen2) || instance_exists(oGameOverScreen2)){
	exit;
}

var _guiW = display_get_gui_width();
var _guiH = display_get_gui_height();

var _totalW = cols * cell_size + (cols - 1) * padding;
var _totalH = rows * cell_size + (rows - 1) * padding;
var _startX = _guiW / 2 - _totalW / 2;
var _startY = _guiH / 2 - _totalH / 2 - 150;

var lines = [
	[0, 1, 2],
	[3, 4, 5],
	[6, 7, 8],
	[0, 3, 6],
	[1, 4, 7],
	[2, 5, 8],
	[0, 4, 8],
	[2, 4, 6]
];

for(var row = 0; row < rows; row++){
	for(var col = 0; col < cols; col++){
		var _cellX = _startX + col * (cell_size + padding);
		var _cellY = _startY + row * (cell_size + padding);
		var _index = row * cols + col;

		if(covered || fading){
			//Draw cover fading out
			draw_sprite_ext(sScratchcardCover, 0, _cellX, _cellY, 1, 1, 0, c_white, fade_alpha);
		}//else{
		if(!covered){
			//Draw symbols fading in
			draw_sprite_ext(sScratchcardSymbols, symbols[_index], _cellX, _cellY, 1, 1, 0, c_white, 1 - fade_alpha);
		}
	}
}

//Draw matching line flashes
if(!covered && !fading && payout > 0 && flash_visible){
	draw_set_color(c_lime);
	draw_set_alpha(0.5);

	for(var i = 0; i < array_length(matching_lines); i++){
		var _line = lines[matching_lines[i]];
		for(var j = 0; j < 3; j++){
			var _idx = _line[j];
			var _col = _idx mod cols;
			var _row = _idx div cols;
			var _cellX = _startX + _col * (cell_size + padding);
			var _cellY = _startY + _row * (cell_size + padding);
			draw_rectangle(_cellX, _cellY, _cellX + cell_size, _cellY + cell_size, false);
		}
	}
	draw_set_alpha(1);
	draw_set_color(c_white);
}

//Draw scratch card frame
draw_sprite_ext(sScratchcardFrame, 0, _startX, _startY, 1, 1, 0, c_white, 1);

//Draw payout text when revealed
if(!covered && !fading && checked && payout > 0){
	draw_set_font(global.font_main);
	draw_set_halign(fa_center);
	draw_set_color(c_yellow);
	draw_text_transformed(_guiW / 2, _startY - _totalH, "Win! $" + string(payout), 2, 2, 0);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
}else if(!covered && !fading && checked && payout == 0){
	draw_set_font(global.font_main);
	draw_set_halign(fa_center);
	draw_set_color(c_red);
	draw_text_transformed(_guiW / 2, _startY - _totalH, "No win. Better luck next time!", 2, 2, 0);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
}