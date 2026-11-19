/// @function scr_text(_text, [_instant])
/// @param {string} text
/// @param [instant]  If true, text appears instantly
/// @description Adds a page of text to the textbox. Must be called from inside the oTextbox instance (create_textbox does this with "with").
function scr_text(_text){
	var _instant = false;
	if(argument_count > 1){
		_instant = argument[1];
	}

	text[page_number] = _text;
	text_instant[page_number] = _instant;
	page_number++;
}

/// @function				scr_option(_option, _link_id);
/// @param {string} option	The string used to describe dialog options in selection.			
/// @param {string} link_id	The identifier for the linked action when this option is chosen.
/// @description			Create dialog based on the option that the player chooses. Must be called from inside the oTextbox instance.
function scr_option(_option, _link_id){
	option[option_number] = _option;//Store the option's text.
	option_link_id[option_number] = _link_id;//Store the link identifier.
	option_number++;//Increment the option number for the next option.
}

/// @function				create_textbox(_text_id);
/// @param {string} text_id	The string used to identify which dialog to print out.
/// @description				Create the textbox to be shown in game.
function create_textbox(_text_id){
	with(instance_create_depth(0, 0, -9999, oTextbox)){//Create textbox instance at a certain depth.
		scr_game_text(_text_id);//Call the scr_game_text function.
	}
}