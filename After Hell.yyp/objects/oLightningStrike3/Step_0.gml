if(screen_pause()){
	//Save and freeze the alarm
	if(alarm[0] > 0){
		savedAlarm = alarm[0];
		alarm[0] = -1;//disable the alarm
	}
	exit;
}

//Restore alarm when unpaused
if(savedAlarm > 0 && alarm[0] == -1){
	alarm[0] = savedAlarm;
	savedAlarm = 0;
}