if(global.gimmickIndex == 1){
	instance_destroy();
	exit;
}

strikeTimer = 0;
strikeTime = irandom_range(180, 360);//adjust to taste
maxSimultaneousStrikes = 30;//adjust to taste