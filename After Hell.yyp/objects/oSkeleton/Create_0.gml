///oSkeleton Create Event
/*This object represents a Skeleton.*/
//This event is responsible for creating some variables for the skeleton specified.

/*Movement uses two modes:
  1. Pathfinding (preferred): Alarm 0 builds a grid path to the player and the skeleton follows it.
  2. Dumb chase (fallback): if no path can be found, it walks straight at the player and retries pathfinding.
If it stays in dumb chase for teleportThreshold steps (10 seconds), an indicator appears at the player's
position and the skeleton teleports there when the indicator finishes.*/

event_inherited();//Inherit the parent event.

wasPaused = false;

//Movement Variables
spd = 0;//Skeleton's initial speed.
chaseSpd = .5;//Speed used when chasing a target.
dir = 0;//Direction the skeleton is facing.
xspd = 0;//Horizontal speed.
yspd = 0;//Vertical speed.

pathspeed = 0.5;

face = 1;//Default facing direction (1 for right).

//State Machine
state = 0;//Skeleton's current state.
//^Spawn from mausoleum state(*might be deprecated).
//Note: State values represent different states like spawning or shooting.
fadeSpd = 1/15;//Speed at which the skeleton fades in.
emergeSpd = .25;//Speed at which the skeleton emerges.

//Shooting State
cooldownTime = 4*60;//Cooldown time between shots (*in frames).
shootTimer = irandom(cooldownTime);//Initial shoot timer.
windupTime = 60;//Time taken for weapon windup.
recoverTime = 45;//Time taken to recover after shooting.
bulletInst = noone;//Reference to the bullet instance.

bulletXoff = 5;//Bullet's horizontal offset from the skeleton.
bulletYoff = -8;//Bullet's vertical offset from the skeleton.

path = path_add();//Initialize a path for the skeleton.

if(instance_exists(oPlayer)){//If the player exists.
	target_x = oPlayer.x;//Set the target x-coordinate to the player's x-coordinate.
	target_y = oPlayer.y;//Set the target y-coordinate to the player's y-coordinate.
}

calc_path_delay = 30;
alarm[0] = irandom(60);
usingPathfinding = false;

dumbChaseTimer = 0;
maxDumbChaseTime = 30;//if in dumb chase for 30 frames, force retry

teleportTimer = 0;
teleportThreshold = 600;//10 seconds
teleportTriggered = false;
teleportIndicator = noone;
teleportTargetX = 0;
teleportTargetY = 0;