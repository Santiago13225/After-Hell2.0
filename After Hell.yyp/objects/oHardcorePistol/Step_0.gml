///oHardcorePistol Step Event
/*This object represents the hardcore pistol.*/
//This event is responsible for handling hardcore pistol object behavior.

//Pause Self
if(screen_pause()){
	exit;
}

//Float in place
//floatDir += floatSpd;
//y = ystart + lengthdir_y(2, floatDir);
//y = ystart + dsin(floatDir)*2;//alternative to line above

sprite_index = item.sprite;

var _radius = 32;
if(global.magnet){
	_radius = 256;
}

if(instance_exists(oPlayer)){
	var _dist = point_distance(x, y, oPlayer.x, oPlayer.y);

	if(_dist < _radius){
		//calculate direction to player
		var _dir = point_direction(x, y, oPlayer.x, oPlayer.y);
		//var _spd = 1;
		//calculate speed (faster when closer)
		var _spd = lerp(0.5, 3, 1 - (_dist / _radius));//Faster when closer
		//update x and y positions based on the direction and speed
		x += lengthdir_x(_spd, _dir);
		y += lengthdir_y(_spd, _dir);
	}
}

//Assign item to weapon
//Add weapon to player's list
if(place_meeting(x, y, oPlayer)){
	//array_push(global.PlayerWeapons, weapon);
    if(item_add(item) == true){
        //Add the weapon to global.PlayerWeapons
        //array_push(global.PlayerWeapons, weapon);
		array_push(global.PlayerWeapons,  global.WeaponList.hpistol);
		array_push(global.PlayerMag, global.WeaponList.hpistol.magSize);//full mag
		array_push(global.PlayerReserve, -1);//unlimited reserve
        //Set as the player's weapon
        audio_play_sound(sndReload, 8, false);
        oPlayer.selectedWeapon = array_length(global.PlayerWeapons) - 1;
        instance_destroy();//Destroy the object.
    }
}