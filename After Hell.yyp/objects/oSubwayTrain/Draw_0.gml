//Draw warning flash
if(!trainActive && !waiting && flashVisible){
	draw_set_alpha(0.5);
	draw_set_color(c_red);
	draw_rectangle(trackX1, trackY, trackX2, trackY + trackH, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
}

//Draw train
/*if(trainActive){
	draw_sprite_stretched(sSubwayTrain, 0, trainX, trackY, trainW, trackH);
}*/

//Draw train
/*if(trainActive){
	var _carW = sprite_get_width(sSubwayTrain);
	var _numCars = 8;
	var _totalW = _carW * (_numCars + 2);

	if(moveDir == -1){
		//Moving left - front car on left side
		draw_sprite_ext(sSubwayTrain, 0, trainX, trackY, 1, 1, 0, c_white, 1);
		for(var i = 1; i <= _numCars; i++){
			draw_sprite_ext(sSubwayTrain, 1, trainX + _carW * i, trackY, 1, 1, 0, c_white, 1);
		}
		draw_sprite_ext(sSubwayTrain, 2, trainX + _carW * (_numCars + 1), trackY, 1, 1, 0, c_white, 1);
	}else{
		//Moving right - flip sprites horizontally
		draw_sprite_ext(sSubwayTrain, 0, trainX + _totalW, trackY, -1, 1, 0, c_white, 1);
		for(var i = 1; i <= _numCars; i++){
			draw_sprite_ext(sSubwayTrain, 1, trainX + _totalW - _carW * i, trackY, -1, 1, 0, c_white, 1);
		}
		draw_sprite_ext(sSubwayTrain, 2, trainX + _totalW - _carW * (_numCars + 1), trackY, -1, 1, 0, c_white, 1);
	}
}*/

//Draw train
/*if(trainActive){
	var _carW = sprite_get_width(sSubwayTrain);

	if(moveDir == -1){
		//Moving left
		draw_sprite_ext(sSubwayTrain, 0, trainX, trackY, 1, 1, 0, c_white, 1);
		for(var i = 1; i <= numMiddleCars; i++){
			draw_sprite_ext(sSubwayTrain, 1, trainX + _carW * i, trackY, 1, 1, 0, c_white, 1);
		}
		draw_sprite_ext(sSubwayTrain, 2, trainX + _carW * (numMiddleCars + 1), trackY, 1, 1, 0, c_white, 1);
	}else{
		//Moving right - flip sprites horizontally
		draw_sprite_ext(sSubwayTrain, 0, trainX + trainW, trackY, -1, 1, 0, c_white, 1);
		for(var i = 1; i <= numMiddleCars; i++){
			draw_sprite_ext(sSubwayTrain, 1, trainX + trainW - _carW * i, trackY, -1, 1, 0, c_white, 1);
		}
		draw_sprite_ext(sSubwayTrain, 2, trainX + trainW - _carW * (numMiddleCars + 1), trackY, -1, 1, 0, c_white, 1);
	}
}*/

//Draw train
/*if(trainActive){
	var _carW = sprite_get_width(sSubwayTrain);

	//Only draw train cars that are within the track boundaries
	if(moveDir == -1){
		//Moving left
		var _drawX = trainX;
		if(_drawX + trainW > trackX1 && _drawX < trackX2){
			draw_sprite_ext(sSubwayTrain, 0, _drawX, trackY, 1, 1, 0, c_white, 1);
			for(var i = 1; i <= numMiddleCars; i++){
				draw_sprite_ext(sSubwayTrain, 1, _drawX + _carW * i, trackY, 1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(sSubwayTrain, 2, _drawX + _carW * (numMiddleCars + 1), trackY, 1, 1, 0, c_white, 1);
		}
	}else{
		//Moving right
		var _drawX = trainX;
		if(_drawX + trainW > trackX1 && _drawX < trackX2){
			draw_sprite_ext(sSubwayTrain, 0, _drawX + trainW, trackY, -1, 1, 0, c_white, 1);
			for(var i = 1; i <= numMiddleCars; i++){
				draw_sprite_ext(sSubwayTrain, 1, _drawX + trainW - _carW * i, trackY, -1, 1, 0, c_white, 1);
			}
			draw_sprite_ext(sSubwayTrain, 2, _drawX + trainW - _carW * (numMiddleCars + 1), trackY, -1, 1, 0, c_white, 1);
		}
	}
}*/

//Draw train
if(trainActive){
	var _carW = sprite_get_width(sSubwayTrain);

	if(moveDir == -1){
		//Moving left - only draw cars within track boundaries
		for(var i = 0; i <= numMiddleCars + 1; i++){
			var _cx = trainX + _carW * i;
			if(_cx + _carW > trackX1 && _cx < trackX2){
				var _frame = 1;//middle car
				if(i == 0) _frame = 0;//front car
				if(i == numMiddleCars + 1) _frame = 2;//back car
				draw_sprite_ext(sSubwayTrain, _frame, _cx, trackY, 1, 1, 0, c_white, 1);
			}
		}
	}else{
		//Moving right - flip sprites horizontally, only draw within track boundaries
		for(var i = 0; i <= numMiddleCars + 1; i++){
			var _cx = trainX + trainW - _carW * i;
			if(_cx + _carW > trackX1 && _cx < trackX2){
				var _frame = 1;//middle car
				if(i == 0) _frame = 0;//front car
				if(i == numMiddleCars + 1) _frame = 2;//back car
				draw_sprite_ext(sSubwayTrain, _frame, _cx, trackY, -1, 1, 0, c_white, 1);
			}
		}
	}
}