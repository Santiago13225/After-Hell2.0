//draw_set_font(global.fontHUD);

previousMode = global.controllerMode;

var scrollKeyboard = [	"Hint:",
			"Use the \"WASD\" or arrow keys to navigate through the menu.",
			"Use [Space] to select, and use [Backspace] to go back.",
			"Use the left and right arrow keys to set the volume in the settings page of the menu.",
			"Use the left and right arrow keys to scroll through options in certain menu pages.",
			"The controller mode option in the settings page of the menu is locked until you connect a Bluetooth controller to your device."
		]

var scrollController = [	"Hint:",
			"Use the left analog stick or d-pad to navigate through the menu.",
			"Use [@] to select, and use [#] to go back.",
			"Use the left and right d-pad buttons to set the volume in the settings page of the menu.",
			"Use the left and right d-pad buttons to scroll through options in certain menu pages.",
		]

// --- Initial setup
scroll = (global.controllerMode == 1) ? scrollController : scrollKeyboard;

arraylength = array_length(scroll);

scrollX = 640;
scrollY = 15;

counter = 0;
line = 0;