if(screen_pause()){
	exit;
}

if(!instance_exists(oPlayer)){
	exit;
}


//Record the player's position each frame
if(instance_exists(oPlayer)){
	array_push(trailX, oPlayer.x - 0.5);
	array_push(trailY, oPlayer.y);
}

//Keep only the last trailDelay frames
if(array_length(trailX) > trailDelay){
	array_delete(trailX, 0, 1);
	array_delete(trailY, 0, 1);
}

//Follow the player, limited to the holy zones
hoverTimer++;
var _bob = dsin(hoverTimer * 4) * 3;
//var _tx = oPlayer.x + offsetX;
//var _ty = oPlayer.y + offsetY + _bob;
var _tx = trailX[0];
var _ty = trailY[0] - 12 + _bob;//-12 keeps it hovering above the player's feet

var _nx = lerp(x, _tx, followLerp);
var _ny = lerp(y, _ty, followLerp);

if(position_meeting(_nx, _ny, oLightZone)){
//if(position_meeting(_nx, _ny, oLightZone) && !place_meeting(_nx, _ny, oSolidWall)){
	x = _nx;
	y = _ny;
}else if(position_meeting(_nx, y, oLightZone)){
	x = _nx;//slide along the edge horizontally
}else if(position_meeting(x, _ny, oLightZone)){
	y = _ny;//slide along the edge vertically
}

//depth = -bbox_top;
depth = -y;

//Find closest visible enemy
var _closest = noone;
var _closestDist = sightRange;

with(oEnemyParent){
	var _dist = point_distance(x, y, other.x, other.y);
	if(_dist < _closestDist){
		if(!collision_line(x, y, other.x, other.y, oSolidWall, false, true)){
			_closestDist = _dist;
			_closest = id;
		}
	}
}

//Shoot at it
if(_closest != noone){
	shoot_timer--;
	if(shoot_timer <= 0){
		shoot_timer = shoot_time;
		var bullet = instance_create_depth(x, y, depth, oLightProjectile);
		bullet.dir = point_direction(x, y, _closest.x, _closest.y);
		oSFX.pistolSnd = true;
	}
}