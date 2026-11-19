//Detect control mode changes mid-scroll
if(global.controllerMode != previousMode){//If the control mode changed while scrolling (controller connected or disconnected)
	previousMode = global.controllerMode;

	//Destroy all currently scrolling text
	with (oText) instance_destroy();

	//Switch to the matching hint text set
	scroll = (global.controllerMode == 1) ? scrollController : scrollKeyboard;

	//Reset all scroll variables. Restart the scroll from the first line
	arraylength = array_length(scroll);
	line = 0;
	counter = 0;
}

//Spawn the next line when the timer runs out
if(counter < 0){
	inst = instance_create_layer(scrollX, scrollY, "Instances", oText);
	inst.text = scroll[line];

	//Longer lines wait longer, so each one scrolls more thoroughly before the next appears
	counter = 30 + string_width(scroll[line]);
	line += 1;

	//After the last line, loop back to the start with an extra pause
	if(line >= arraylength){
		line = 0;
		counter += 100;
	}
}

//Count down one step
counter -= 1;