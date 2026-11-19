///oSkeleton Alarm 0 Event
/*This object represents a Skeleton.*/
//This event is responsible for creating a path for the skeleton to track the player.

if(instance_exists(oPauseMenu)){
    exit;
}

//Reset the current path by deleting the previous one and creating a new path.
if(path_exists(path)){
	path_delete(path);
}
path = path_add();

if(instance_exists(oPauseMenu)){//Keep: the fast variants lose their speed after a pause without this (cause not fully understood)
	pathspeed = 0;
}else{
	pathspeed = 0.5;
}

if(instance_exists(oPlayer)){
	target_x = oPlayer.x;//old coordinate target based solely on player
	target_y = oPlayer.y;//old coordinate target based solely on player
	//target_x = round(oPlayer.x / 16) * 16;//offsets the target slightly toward the center of the nearest grid cell
	//target_y = round(oPlayer.y / 16) * 16;//adds padding to the player's target position

	//Attempt to find path using grid
	if(mp_grid_path(oSetupPathway.grid, path, x, y, target_x, target_y, choose(0, 1))){
		path_start(path, pathspeed, path_action_stop, true);
		usingPathfinding = true;
		//alarm_set(0, 120);//Retry later to keep updating the path
		alarm_set(0, calc_path_delay);
    }else{
        usingPathfinding = false;
		alarm_set(0, 15);//Retry in 15 steps (~0.25 seconds)
        //Optional: Log if path fails
        //show_debug_message("Skeleton failed to find path at: " + string(x) + "," + string(y));
    }
}