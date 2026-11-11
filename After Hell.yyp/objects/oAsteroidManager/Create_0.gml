if(global.gimmickIndex == 1){
	instance_destroy();
	exit;
}

spawnTimer = 0;
spawnTime = irandom_range(120, 300);//2-5 seconds between asteroids
maxSimultaneousAsteroids = 50;//adjust to taste