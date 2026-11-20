///oDarkMinion Create Event
/*This object represents a Dark Minion.*/
//This event is responsible for creating some variables for the dark minion specified.

event_inherited();//Inherit the parent event.

wasPaused = false;

//Movement Variables
spd = 0;//Dark minion's initial speed.
chaseSpd = .9;//Speed used when chasing a target.
dir = 0;//Direction the dark minion is facing.
xspd = 0;//Horizontal speed.
yspd = 0;//Vertical speed.

pathspeed = 0.9;

face = 1;//Default facing direction (1 for right).

//State Machine
state = 0;//Dark minion's current state.
//^Spawn from mausoleum state(*might be deprecated).
//Note: State values represent different states like spawning or shooting.
fadeSpd = 1/15;//Speed at which the dark minion fades in.
emergeSpd = .25;//Speed at which the dark minion emerges.

//Shooting State
//cooldownTime = 4*60;//Cooldown time between shots (*in frames).
//shootTimer = irandom(cooldownTime);//Initial shoot timer.
windupTime = 60;//Time taken for weapon windup.
recoverTime = 45;//Time taken to recover after shooting.
bulletInst = noone;//Reference to the bullet instance.

bulletXoff = 5;//Bullet's horizontal offset from the dark minion.
bulletYoff = -8;//Bullet's vertical offset from the dark minion.

shootTimer = 0;
cooldownTime = irandom_range(3 * 60, 7 * 60);//random between 3 and 7 seconds

path = path_add();//Initialize a path for the dark minion.

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