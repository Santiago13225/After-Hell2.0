event_inherited();

if(global.gimmickIndex == 1){
	instance_destroy();
	exit;
}

damage = 5;//damage per hit; i-frames limit how fast it repeats
depth = -bbox_top;