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
		//Pick a random strike zone
		var _zoneCount = instance_number(oStrikeZone);
		if(_zoneCount > 0){
			var _zone = instance_find(oStrikeZone, irandom(_zoneCount - 1));
			var _strikeX = irandom_range(_zone.bbox_left, _zone.bbox_right);
			var _strikeY = irandom_range(_zone.bbox_top, _zone.bbox_bottom);
			instance_create_depth(_strikeX, _strikeY, -1, oEffectDelayedShot2);
		}
	}
}