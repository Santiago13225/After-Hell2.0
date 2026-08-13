///oHardcoreRaygun Step Event
/*This object represents the hardcore raygun.*/
//This event is responsible for handling hardcore raygun object behavior.

//Pause Self
if(screen_pause()){
	exit;
}

//Float in place
//floatDir += floatSpd;
//y = ystart + lengthdir_y(2, floatDir);
//y = ystart + dsin(floatDir)*2;//alternative to line above

var _playerHas = false;
var _weaponPos = 0;

sprite_index = item.sprite;

var _size = array_length(global.PlayerWeapons);
for(var i = 0; i < _size; i++){
	//check if the weapon is already in the player's weapon list
	if(global.PlayerWeapons[i] == global.WeaponList.hraygun){
		_weaponPos = i;
		_playerHas = true;
		i += 99;
		//exit;
	}
}

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
		if(!_playerHas){
			array_push(global.PlayerWeapons,  global.WeaponList.hraygun);
			//array_push(global.PlayerAmmo, 0);
			array_push(global.PlayerMag, global.WeaponList.hraygun.magSize);//start with full mag
			array_push(global.PlayerReserve, 0);//start with no reserve
		}
		
		//Add ammo to reserve instead of mag
		global.PlayerReserve[array_length(global.PlayerReserve) - 1] += ammoAdd;
		//global.PlayerAmmo[array_length(global.PlayerAmmo) - 1] += ammoAdd;
		
        //Set as the player's weapon
		//audio_play_sound(sndReload, 8, false);
		oSFX.reloadSnd = true;
        oPlayer.selectedWeapon = array_length(global.PlayerWeapons) - 1;
        instance_destroy();//Destroy the object
    }
}