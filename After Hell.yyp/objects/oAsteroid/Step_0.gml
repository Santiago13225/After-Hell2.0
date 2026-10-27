if(screen_pause()){
	exit;
}

//Lifetime countdown
timer++;
if(timer >= lifetime){
	create_animated_vfx(sPoof, x, y, depth - 50);//Shoot burst.
	//destroy = true;
	instance_destroy();
}

//Movement
xspd = lengthdir_x(spd, dir);//Set x-speed.
yspd = lengthdir_y(spd, dir);//Set y-speed.
x += xspd;//Movement along the x-axis.
y += yspd;//Movement along the y-axis.

depth = -y;//Update the depth.

//Destroy when out of room bounds with padding
var _pad = 16;
if(bbox_right < -_pad || bbox_left > room_width + _pad || bbox_bottom < -_pad || bbox_top > room_height + _pad){
	//instance_destroy();
	destroy = true;//Destroy the bullet.
}

if(hitConfirm == true && playerDestroy == true){
	destroy = true;
}

if(destroy == true){
	create_animated_vfx(sShootBurst, x, y, depth - 50);
	//audio_play_sound(snd8BitExplosion2, 8, false);
	oSFX.enemybulletimpactSnd = true;
	instance_destroy();
}

//Wall collision
/*if(place_meeting(x, y, oSolidWall)){
	destroy = true;
}*/

//Environment Collision
if(place_meeting(x, y, oEnvironmentDamage)){//If it touches ...
	destroy = true;//Destroy the bullet.
}

//Rotate sprite for visual effect
image_angle += 3;//spin as it flies