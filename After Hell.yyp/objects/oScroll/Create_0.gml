//Remember the previous control mode so the Step event can tell when it changes
previousMode = global.controllerMode;

//Hint text for keyboard and mouse players (the first entry is the heading)
//var scrollKeyboard = ... //We don't use var as using var in front of a variable keeps it local to one event
//a variable name without var makes it an instance variable, which can be read by the whole object
scrollKeyboard = [	"Hint:",
			"Use the \"WASD\" or arrow keys to navigate through the menu.",
			"Use [Space] to select, and use [Backspace] to go back.",
			"Use the left and right arrow keys to set the volume in the settings page of the menu.",
			"Use the left and right arrow keys to scroll through options in certain menu pages.",
			"The controller mode option in the settings page of the menu is locked until you connect a Bluetooth controller to your device."
		]

//Hint text for controller players
scrollController = [	"Hint:",
			"Use the left analog stick or d-pad to navigate through the menu.",
			"Use [@] to select, and use [#] to go back.",
			"Use the left and right d-pad buttons to set the volume in the settings page of the menu.",
			"Use the left and right d-pad buttons to scroll through options in certain menu pages.",
		]

// --- Initial setup
//Pick the hint text set that matches the current control mode
scroll = (global.controllerMode == 1) ? scrollController : scrollKeyboard;

//Number of lines in the active hint set
arraylength = array_length(scroll);

//Where each new line spawns (scrollX is just past the right edge of the screen)
scrollX = 640;
scrollY = 15;

//Steps until the next line spawns (it spawns when this drops below 0)
counter = 0;

//Index of the next line to spawn
line = 0;