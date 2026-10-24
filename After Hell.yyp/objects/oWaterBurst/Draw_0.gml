//Draw warning flash
if(!burstActive && !retracting && !waiting && flashVisible){
	draw_set_alpha(0.5);
	draw_set_color(c_red);

	var _dx = lengthdir_x(1, burstDir);
	var _dy = lengthdir_y(1, burstDir);

	if(burstDir == 270 || burstDir == 90){//vertical
		draw_rectangle(
			x - burstWidth/2, y + 64,
			x + burstWidth/2, y + 64 + burstLength * _dy,
			false
		);
	}/*else{//horizontal
		draw_rectangle(
			x, y - burstWidth/2,
			x + burstLength * _dx, y + burstWidth/2,
			false
		);
	}*/

	draw_set_alpha(1);
	draw_set_color(c_white);
}

if(extending || burstActive || retracting){
	var _currentLength = burstActive ? burstLength : (extending ? extendLength : retractLength);
	var _frameSize = sprite_get_width(sWaterBurst2);

	if(burstDir == 270){//downward
		//Front frame grows downward pixel by pixel
		var _frontHeight = min(_currentLength, _frameSize);
		draw_sprite_part(sWaterBurst2, 0 + animFrame, 0, 0, _frameSize, _frontHeight, x - burstWidth/2, y);

		//Middle frames
		var _filledLength = _frameSize;
		while(_filledLength + _frameSize <= _currentLength - _frameSize){
			draw_sprite_ext(sWaterBurst2, 2 + animFrame, x - burstWidth/2, y + _filledLength, 1, 1, 0, c_white, 1);
			_filledLength += _frameSize;
		}

		//End frame placed right after last middle frame
		if(_currentLength >= _frameSize * 2){
			draw_sprite_ext(sWaterBurst2, 4 + animFrame, x - burstWidth/2, y + _filledLength, 1, 1, 0, c_white, 1);
		}
	}/*else if(burstDir == 0){//right
		//Front frame grows rightward
		var _frontWidth = min(_currentLength, _frameSize);
		draw_sprite_part(sWaterBurst2, 0 + animFrame, 0, 0, _frontWidth, _frameSize, x, y - burstWidth/2);

		//Middle frames
		var _filledLength = _frameSize;
		while(_filledLength + _frameSize <= _currentLength - _frameSize){
			draw_sprite_ext(sWaterBurst2, 2 + animFrame, x + _filledLength, y - burstWidth/2, 1, 1, 90, c_white, 1);
			_filledLength += _frameSize;
		}

		//End frame
		if(_currentLength >= _frameSize * 2){
			draw_sprite_ext(sWaterBurst2, 4 + animFrame, x + _filledLength, y - burstWidth/2, 1, 1, 90, c_white, 1);
		}
	}else if(burstDir == 180){//left
		//Front frame grows leftward
		var _frontWidth = min(_currentLength, _frameSize);
		draw_sprite_part(sWaterBurst2, 0 + animFrame, _frameSize - _frontWidth, 0, _frontWidth, _frameSize, x - _frontWidth, y - burstWidth/2);

		//Middle frames
		var _filledLength = _frameSize;
		while(_filledLength + _frameSize <= _currentLength - _frameSize){
			draw_sprite_ext(sWaterBurst2, 2 + animFrame, x - _filledLength, y - burstWidth/2, 1, 1, 270, c_white, 1);
			_filledLength += _frameSize;
		}

		//End frame
		if(_currentLength >= _frameSize * 2){
			draw_sprite_ext(sWaterBurst2, 4 + animFrame, x - _filledLength, y - burstWidth/2, 1, 1, 270, c_white, 1);
		}
	}*/
}