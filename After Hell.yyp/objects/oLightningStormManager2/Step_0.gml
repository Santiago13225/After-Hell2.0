if(screen_pause()){
	exit;
}

strikeTimer++;
if(strikeTimer >= strikeTime){
	strikeTimer = 0;
	strikeTime = irandom_range(180, 360);//randomize next strike time

	//Pick random number of simultaneous strikes
	//var _numStrikes = maxSimultaneousStrikes;
	var _numStrikes = irandom_range(maxSimultaneousStrikes - 5, maxSimultaneousStrikes);

	for(var i = 0; i < _numStrikes; i++){
		//Calculate total area across all strike zones
		var _totalArea = 0;
		with(oStrikeZone){
			_totalArea += (bbox_right - bbox_left) * (bbox_bottom - bbox_top);
		}

		if(_totalArea > 0){
			//Pick a random value within total area
			var _roll = irandom(_totalArea);
			var _cumulative = 0;
			var _strikeX = 0;
			var _strikeY = 0;

			with(oStrikeZone){
				var _area = (bbox_right - bbox_left) * (bbox_bottom - bbox_top);
				_cumulative += _area;
				if(_roll <= _cumulative){
					_strikeX = irandom_range(bbox_left, bbox_right);
					_strikeY = irandom_range(bbox_top, bbox_bottom);
					break;
				}
			}
			instance_create_depth(_strikeX, _strikeY, -1, oEffectDelayedShot2);
		}
	}
}