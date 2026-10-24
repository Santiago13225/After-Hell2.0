//Draw warning flash
if(!burstActive && !retracting && !waiting && !extending && flashVisible){
	draw_set_alpha(0.5);
	draw_set_color(c_red);

	if(burstDir == 0){//right
		draw_rectangle(
			x, y - burstWidth/2,
			x + burstLength, y + burstWidth/2,
			false
		);
	}else{//left
		draw_rectangle(
			x - burstLength, y - burstWidth/2,
			x, y + burstWidth/2,
			false
		);
	}

	draw_set_alpha(1);
	draw_set_color(c_white);
}

//Draw water burst
if(extending || burstActive || retracting){
	var _currentLength = burstActive ? burstLength : (extending ? extendLength : retractLength);
	var _frameSize = sprite_get_height(sWaterBurstHorizontal); // use height since frames are horizontal

	if(burstDir == 0){//right
		//Front frame grows rightward
		var _frontWidth = min(_currentLength, _frameSize);
		draw_sprite_part(sWaterBurstHorizontal, 0 + animFrame, 0, 0, _frontWidth, _frameSize, x, y - burstWidth/2);

		//Middle frames
		var _filledLength = _frameSize;
		while(_filledLength + _frameSize <= _currentLength - _frameSize){
			draw_sprite_ext(sWaterBurstHorizontal, 2 + animFrame, x + _filledLength, y - burstWidth/2, 1, 1, 0, c_white, 1);
			_filledLength += _frameSize;
		}

		//End frame
		if(_currentLength >= _frameSize * 2){
			draw_sprite_ext(sWaterBurstHorizontal, 4 + animFrame, x + _filledLength, y - burstWidth/2, 1, 1, 0, c_white, 1);
		}
	/*}else{//left
		//Front frame grows leftward
		var _frontWidth = min(_currentLength, _frameSize);
		draw_sprite_part(sWaterBurstHorizontal, 0 + animFrame, _frameSize - _frontWidth, 0, _frontWidth, _frameSize, x - _frontWidth, y - burstWidth/2);

		//Middle frames
		var _filledLength = _frameSize;
		while(_filledLength + _frameSize <= _currentLength - _frameSize){
			draw_sprite_ext(sWaterBurstHorizontal, 2 + animFrame, x - _filledLength - _frameSize, y - burstWidth/2, 1, 1, 0, c_white, 1);
			_filledLength += _frameSize;
		}

		//End frame
		if(_currentLength >= _frameSize * 2){
			draw_sprite_ext(sWaterBurstHorizontal, 4 + animFrame, x - _filledLength - _frameSize, y - burstWidth/2, 1, 1, 0, c_white, 1);
		}
	}*/
	}else{//left
		//Front frame grows leftward - flipped horizontally
		var _frontWidth = min(_currentLength, _frameSize);
		draw_sprite_ext(sWaterBurstHorizontal, 0 + animFrame, x, y - burstWidth/2, -(_frontWidth / _frameSize), 1, 0, c_white, 1);

		//Middle frames - flipped
		var _filledLength = _frameSize;
		while(_filledLength + _frameSize <= _currentLength - _frameSize){
			draw_sprite_ext(sWaterBurstHorizontal, 2 + animFrame, x - _filledLength, y - burstWidth/2, -1, 1, 0, c_white, 1);
			_filledLength += _frameSize;
		}

		//End frame - flipped
		if(_currentLength >= _frameSize * 2){
			draw_sprite_ext(sWaterBurstHorizontal, 4 + animFrame, x - _filledLength, y - burstWidth/2, -1, 1, 0, c_white, 1);
		}
	}
}