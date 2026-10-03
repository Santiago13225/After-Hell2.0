if(screen_pause()){
	exit;
}

//Find closest enemy
var _closest = noone;
var _closestDist = sightRange;

with(oEnemyParent){
	var _dist = point_distance(x, y, other.x, other.y);
	if(_dist < _closestDist){
		//Check line of sight
		if(!collision_line(x, y, other.x, other.y, oSolidWall, false, true)){
			_closestDist = _dist;
			_closest = id;
		}
	}
}

//are we in range?
//if(distance_to_object(oEnemyParent) < sightRange){
//Target closest enemy
if(_closest != noone){
	//orient direction and turn around
	var lerpDirection = point_direction(x, y, _closest.x, _closest.y);
	//var lerpDirection = point_direction(x, y, oEnemyParent.x, oEnemyParent.y);
	angle += sin(degtorad(lerpDirection - angle)) * rotationSpeed;
	
	//is the angle near?
	if(abs(angle_difference(lerpDirection, angle)) < 15){
		shoot_timer--;
		if(shoot_timer <= 0){
			shoot_timer = shoot_time;
			//var bullet = instance_create_layer(x, y, layer, oTurretBullet);
			//var bullet = instance_create_layer(x, y, layer, oDiscProjectile);
			var bullet = instance_create_depth(x, y, depth, oDiscProjectile);
			//bullet.speed = 6;
			
			//if(instance_exists(oPlayer)){//If the player exists...
			//	dir = point_direction(x, y, oPlayer.x, oPlayer.y);//Get the player's direction.
			//}
			
			bullet.dir = angle;
			//bullet.state = 1;
			//oSFX.throwSnd = true;
			oSFX.pistolSnd = true;
		}
	}

}