///oSkeleton Step Event
/*This object represents a Skeleton.*/
//This event is responsible for handling skeleton behavior.

var _paused = instance_exists(oScreenPause);

if(wasPaused && !_paused){//Detect unpause
	alarm[0] = irandom(60);//Re-randomize timing
}

wasPaused = _paused;//Store state

if(_paused){
	image_speed = 0;
	exit;
}else{
	image_speed = 1;
}

//Code Commands
var _wallCollisions = true;//Set wall collisions to true.
var _getDamage = true;//Set get damage to true.

//State Machine
switch(state){
	case -1://Spawn in from spawn object.
		//Fade In
		if(image_alpha < 1){
			spd = 0;//don't move while fading in
			image_alpha += fadeSpd;
			_wallCollisions = false;
			_getDamage = false;
		}else{
			//Fully visible, switch to chase state
			state = 0;
		}
	break;
	
	//Chase State
	case 0:
		if(instance_exists(oPlayer)){//If the player exists.
			dir = point_direction(x, y, oPlayer.x, oPlayer.y);//Get the player's direction.
		}
		spd = chaseSpd;//Set the chasing speed.
		if(!usingPathfinding){
			dumbChaseTimer++;
			if(dumbChaseTimer >= maxDumbChaseTime){
				dumbChaseTimer = 0;
				alarm_set(0, 1);//force immediate pathfinding retry
			}
			//Only run teleport behavior outside of tutorial
			if(room != rm_Tutorial_Level){
				if(!teleportTriggered){//Teleport timer
					teleportTimer++;
					if(teleportTimer >= teleportThreshold){
						teleportTriggered = true;
						//Create indicator at player's position
						if(instance_exists(oPlayer)){
							//Record player's position at this moment
							teleportTargetX = oPlayer.x;
							teleportTargetY = oPlayer.y;
							//Create indicator at that recorded position
							teleportIndicator = instance_create_depth(teleportTargetX, teleportTargetY, -oPlayer.bbox_top, oEnemyTeleportIndicator);
						}
					}
				}else{
					//Teleport when indicator is done
					if(!instance_exists(teleportIndicator)){
						//if(instance_exists(oPlayer)){
						//Poof at current position
						oSFX.smokePuffSnd = true;
						create_animated_vfx(sPoof, x, y, depth);
						//Teleport to player's last position
						x = teleportTargetX;
						y = teleportTargetY;
						//Poof at new position
						create_animated_vfx(sPoof, x, y, depth);
						//Reset everything
						teleportTimer = 0;
						teleportTriggered = false;
						teleportIndicator = noone;
						dumbChaseTimer = 0;
						//Force pathfinding retry
						alarm_set(0, 1);
						//}
					}
				}
			}
		}else{
			dumbChaseTimer = 0;
			//Cancel teleport if pathfinding resumes before threshold
			if(!teleportTriggered){
				teleportTimer = 0;
			}
			//If teleport was triggered, let it complete regardless
		}
	break;
}

if(!usingPathfinding){//Dumb chase: walk straight at the player
	xspd = lengthdir_x(spd, dir);
	yspd = lengthdir_y(spd, dir);
}else{//Pathfinding: the path moves the skeleton, so no extra movement
	xspd = 0;
	yspd = 0;
}

//Get the correct face
if(dir > 90 && dir < 270){
	face = -1;
}else{
	face = 1;
}

image_xscale = face;
//Collisions
//Wall collisions
if(_wallCollisions == true){//If skeleton can collide with walls
	if(place_meeting(x + xspd, y, oWall)){//If skeleton meets with wall horizontally.
		xspd = 0;//Set horizontal speed to 0.
	}
	if(place_meeting(x, y + yspd, oWall)){//If skeleton meets with wall vertically.
		yspd = 0;//Set vertical speed to 0.
	}
}
//Enemy Collisions
/*if place_meeting(x + xspd, y, oEnemyParent){//If skeleton meets with other enemies horizontally.
	xspd = 0;//Set horizontal speed to 0.
}
if place_meeting(x, y + yspd, oEnemyParent){//If skeleton meets with other enemies vertically.
	yspd = 0;//Set vertical speed to 0.
}*/

//Movement
x += xspd;//Move by horizontal speed.
y += yspd;//Move by vertical speed.

depth = -y;//Set the depth.

//Inherit the parent event
if(_getDamage == true){//If skeleton can get damaged.
	event_inherited();//Inherit getting damaged and dying behavior.
}