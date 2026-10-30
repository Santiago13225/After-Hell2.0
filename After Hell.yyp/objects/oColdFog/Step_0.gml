if(screen_pause()){
	exit;
}

//Occasionally change drift direction
turnTimer++;
if(turnTimer >= turnTime){
	turnTimer = 0;
	turnTime = irandom_range(120, 300);
	dir += irandom_range(-60, 60);
}

//Move, but only if the new position is still inside a fog zone
var _nx = x + lengthdir_x(spd, dir);
var _ny = y + lengthdir_y(spd, dir);

depth = -y;//Update the depth.

//if(position_meeting(_nx, _ny, oColdFogZone)){
if(position_meeting(_nx, _ny, oColdFogZone) && !place_meeting(_nx, _ny, oSolidWall)){
	x = _nx;
	y = _ny;
}else{
	dir += 180 + irandom_range(-45, 45);//turn back toward the zone
}