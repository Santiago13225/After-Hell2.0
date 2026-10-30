if(screen_pause()){
	exit;
}

spawnTimer++;
if(spawnTimer >= spawnTime){
	spawnTimer = 0;
	spawnTime = irandom_range(120, 300);

	//Spawn multiple asteroids per interval up to the max
	var _toSpawn = min(maxSimultaneousGusts - instance_number(oWindGust), irandom_range(15, 25));

	for(var i = 0; i < _toSpawn; i++){
		//Pick random side to spawn from
		var _side = irandom(3);//0=left, 1=right, 2=top, 3=bottom
		var _spawnX = 0;
		var _spawnY = 0;
		var _dir = 0;

		switch(_side){
			case 0://left - travels right
				_spawnX = -16;
				_spawnY = irandom_range(0, room_height);
				_dir = irandom_range(-20, 20);//slight angle variation
				break;
			case 1://right - travels left
				_spawnX = room_width + 16;
				_spawnY = irandom_range(0, room_height);
				_dir = 180 + irandom_range(-20, 20);
				break;
			case 2://top - travels down
				_spawnX = irandom_range(0, room_width);
				_spawnY = -16;
				_dir = 270 + irandom_range(-20, 20);
				break;
			case 3://bottom - travels up
				_spawnX = irandom_range(0, room_width);
				_spawnY = room_height + 16;
				_dir = 90 + irandom_range(-20, 20);
				break;
		}
		var _gust = instance_create_depth(_spawnX, _spawnY, -2000, oWindGust);
		_gust.dir = _dir;
	}
}