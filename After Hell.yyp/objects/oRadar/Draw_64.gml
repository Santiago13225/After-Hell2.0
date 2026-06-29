if(!instance_exists(oPlayer)) {
    instance_destroy();//no player → no need for map overlay
    exit;
}

//Redeclare variables to be used in local scope so you can use them in the "with" statement below
var _guiwidth = guiwidth;
var _guiheight = guiheight;
var _centerx = x;
var _centery = y;
var _radarsize = radarsize;
//var _radar_scale = radarscale / (radarsize);//local var for use in with()
var _radar_scale = radar_scale;

if(instance_exists(oPlayer)){
	//1. REBUILD SURFACE (ONLY WHEN NEEDED)
	if(global.radar_dirty || !surface_exists(radar_surface)) {
		if(surface_exists(radar_surface)) {
			surface_free(radar_surface);
		}

		//Surface covers the whole room in radar space
        var _surf_w = room_width * _radar_scale;
        var _surf_h = room_height * _radar_scale;

		radar_surface = surface_create(_surf_w, _surf_h);
		surface_set_target(radar_surface);
		draw_clear_alpha(c_black, 0);

		with(oWall) {//MOVE YOUR WALL DRAWING HERE (ONLY RUNS RARELY)
			var cell = 8;

			var x1 = bbox_left;
			var y1 = bbox_top;
			var x2 = bbox_right;
			var y2 = bbox_bottom;

			for(var wx = x1; wx < x2; wx += cell) {
				for(var wy = y1; wy < y2; wy += cell) {
					//var rx = (wx / room_width * _guiwidth);
					//var ry = (wy / room_height * _guiheight);
					//draw_rectangle(rx, ry, rx + cell * 0.5, ry + cell * 0.5, false);
					var rx = wx * _radar_scale;
                    var ry = wy * _radar_scale;
                    draw_rectangle(rx, ry, rx + cell * _radar_scale, ry + cell * _radar_scale, false);
				}
			}
		}

		//Draw warp blocks as red outlines
		/*draw_set_color(c_red);
		with(oWarpBlock) {
			var rx1 = bbox_left * _radar_scale;
			var ry1 = bbox_top * _radar_scale;
			var rx2 = bbox_right * _radar_scale;
			var ry2 = bbox_bottom * _radar_scale;
			draw_rectangle(rx1, ry1, rx2, ry2, false);//true = outline only
		}
		draw_set_color(c_white);//reset color back to white for walls*/

		surface_reset_target();
		global.radar_dirty = false;
	}
if(!show_full_map){
	//global.dialog_active = false;//Enable silhouette drawing.
	//draw radar outline circle
	draw_set_alpha(0.5);
	draw_circle_color(_centerx, _centery, _radarsize, c_lime, c_lime, 0);
	draw_set_alpha(1);

	//====================================================
	// DRAW RADAR TO MASK SURFACE
	//====================================================
	if(!surface_exists(radar_mask_surface)) {
		radar_mask_surface = surface_create(_radarsize * 2, _radarsize * 2);
	}

	surface_set_target(radar_mask_surface);
	draw_clear_alpha(c_black, 0);

	//----------------------------------------------------
	// 1. DRAW SOLID WHITE CIRCLE
	//----------------------------------------------------
	draw_set_color(c_white);
	draw_circle(_radarsize, _radarsize, _radarsize, false);

	//----------------------------------------------------
	// 2. KEEP ONLY PIXELS INSIDE CIRCLE
	//----------------------------------------------------
	gpu_set_blendmode_ext(bm_dest_color, bm_zero);

	//Player position on radar texture
	//var px = oPlayer.x / room_width * _guiwidth;
	//var py = oPlayer.y / room_height * _guiheight;
	var px = oPlayer.x * _radar_scale;
	var py = oPlayer.y * _radar_scale;

	//Draw radar map INTO the circle
	draw_surface_part(
		radar_surface,
		px - _radarsize,
		py - _radarsize,
		_radarsize * 2,
		_radarsize * 2,
		0,
		0
	);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();

	//----------------------------------------------------
	// 3. DRAW FINISHED RADAR
	//----------------------------------------------------
	draw_surface(
		radar_mask_surface,
		_centerx - _radarsize,
		_centery - _radarsize
	);

	with(oMusicBlockHouse){
		//Get the wall position to draw on the radar
		//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
		//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
		var xx = _centerx + (x - oPlayer.x) * _radar_scale;
		var yy = _centery + (y - oPlayer.y) * _radar_scale;

		//Draw the walls within the radar circle
		if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
			draw_sprite_ext(sMusicBlockTile, 5, xx, yy, 1, 1 , 0, c_white, 1);
		}
	}

	with(oMusicBlockFacility){
		//Get the wall position to draw on the radar
		//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
		//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
		var xx = _centerx + (x - oPlayer.x) * _radar_scale;
		var yy = _centery + (y - oPlayer.y) * _radar_scale;

		//Draw the walls within the radar circle
		if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
			draw_sprite_ext(sMusicBlockTile, 5, xx, yy, 1, 1 , 0, c_white, 1);
		}
	}

	with(oMusicBlockTemple){
		//Get the wall position to draw on the radar
		//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
		//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
		var xx = _centerx + (x - oPlayer.x) * _radar_scale;
		var yy = _centery + (y - oPlayer.y) * _radar_scale;

		//Draw the walls within the radar circle
		if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
			draw_sprite_ext(sMusicBlockTile, 5, xx, yy, 1, 1 , 0, c_white, 1);
		}
	}

	with(oMusicBlockOverlook){
		//Get the wall position to draw on the radar
		//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
		//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
		var xx = _centerx + (x - oPlayer.x) * _radar_scale;
		var yy = _centery + (y - oPlayer.y) * _radar_scale;

		//Draw the walls within the radar circle
		if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
			draw_sprite_ext(sMusicBlockTile, 5, xx, yy, 1, 1 , 0, c_white, 1);
		}
	}

	with(oMusicBlockTestLevel){
		//Get the wall position to draw on the radar
		//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
		//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
		var xx = _centerx + (x - oPlayer.x) * _radar_scale;
		var yy = _centery + (y - oPlayer.y) * _radar_scale;

		//Draw the walls within the radar circle
		if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
			draw_sprite_ext(sMusicBlockTile, 5, xx, yy, 1, 1 , 0, c_white, 1);
		}
	}

	with(oAssaultWallbuy2){
		//Get the wall position to draw on the radar
		//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
		//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
		var xx = _centerx + (x - oPlayer.x) * _radar_scale;
		var yy = _centery + (y - oPlayer.y) * _radar_scale;

		//Draw the walls within the radar circle
		if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
			draw_sprite_ext(sAssaultWallbuy2, 0, xx, yy, 1, 1 , 0, c_white, 1);
		}
	}

	with(oBazookaWallbuy2){
		//Get the wall position to draw on the radar
		//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
		//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
		var xx = _centerx + (x - oPlayer.x) * _radar_scale;
		var yy = _centery + (y - oPlayer.y) * _radar_scale;

		//Draw the walls within the radar circle
		if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
			draw_sprite_ext(sBazookaWallbuy2, 0, xx, yy, 1, 1 , 0, c_white, 1);
		}
	}

	with(oLMGWallbuy2){
		//Get the wall position to draw on the radar
		//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
		//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
		var xx = _centerx + (x - oPlayer.x) * _radar_scale;
		var yy = _centery + (y - oPlayer.y) * _radar_scale;

		//Draw the walls within the radar circle
		if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
			draw_sprite_ext(sLMGWallbuy2, 0, xx, yy, 1, 1 , 0, c_white, 1);
		}
	}

	with(oRaygunWallbuy2){
		//Get the wall position to draw on the radar
		//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
		//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
		var xx = _centerx + (x - oPlayer.x) * _radar_scale;
		var yy = _centery + (y - oPlayer.y) * _radar_scale;

		//Draw the walls within the radar circle
		if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
			draw_sprite_ext(sRaygunWallbuyAlt2, 0, xx, yy, 1, 1 , 0, c_white, 1);
		}
	}

	with(oShotgunWallbuy2){
		//Get the wall position to draw on the radar
		//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
		//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
		var xx = _centerx + (x - oPlayer.x) * _radar_scale;
		var yy = _centery + (y - oPlayer.y) * _radar_scale;

		//Draw the walls within the radar circle
		if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
			draw_sprite_ext(sShotgunWallbuy2, 0, xx, yy, 1, 1 , 0, c_white, 1);
		}
	}

	with(oSMGWallbuy2){
		//Get the wall position to draw on the radar
		//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
		//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);	
		var xx = _centerx + (x - oPlayer.x) * _radar_scale;
		var yy = _centery + (y - oPlayer.y) * _radar_scale;

		//Draw the walls within the radar circle
		if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
			draw_sprite_ext(sSMGWallbuy2, 0, xx, yy, 1, 1 , 0, c_white, 1);
		}
	}

	with(oSniperWallbuy2){
		//Get the wall position to draw on the radar
		//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
		//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
		var xx = _centerx + (x - oPlayer.x) * _radar_scale;
		var yy = _centery + (y - oPlayer.y) * _radar_scale;

		//Draw the walls within the radar circle
		if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
			draw_sprite_ext(sSniperWallbuy2, 0, xx, yy, 1, 1 , 0, c_white, 1);
		}
	}

	with(oMedkitWallbuy3){
		//Get the wall position to draw on the radar
		//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
		//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
		var xx = _centerx + (x - oPlayer.x) * _radar_scale;
		var yy = _centery + (y - oPlayer.y) * _radar_scale;

		//Draw the walls within the radar circle
		if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
			draw_sprite_ext(sMedkitWallbuy, 1, xx, yy, 1, 1 , 0, c_white, 1);
		}
	}

	with(oArmoryAugmentor2){
		//Get the wall position to draw on the radar
		//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
		//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
		var xx = _centerx + (x - oPlayer.x) * _radar_scale;
		var yy = _centery + (y - oPlayer.y) * _radar_scale;

		//Draw the walls within the radar circle
		if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
			//draw_sprite_ext(sBanner3, 0, xx, yy, 1, 1 , 0, c_white, 1);
			draw_sprite_ext(sArmoryAugmentor2, 1, xx, yy, 1, 1 , 0, c_white, 1);
		}
	}

	with(oWarpBlock){
		//Get the wall position to draw on the radar
		//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
		//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);

		//Find the center of the warp block in room space
		var _mid_x = (bbox_left + bbox_right) * 0.5;
		var _mid_y = (bbox_top + bbox_bottom) * 0.5;

		var xx = _centerx + (_mid_x - oPlayer.x) * _radar_scale;
		var yy = _centery + (_mid_y - oPlayer.y) * _radar_scale;

		//Draw the walls within the radar circle
		if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
			//draw_sprite_ext(sBanner3, 0, xx, yy, 1, 1 , 0, c_white, 1);
			draw_sprite_ext(sDoorSign2, 0, xx, yy, 1, 1 , 0, c_white, 1);
		}
	}

	with(oDebris){
		//Get the wall position to draw on the radar
		//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
		//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);

		//Find the center of the warp block in room space
		var _mid_x = (bbox_left + bbox_right) * 0.5;
		var _mid_y = (bbox_top + bbox_bottom) * 0.5;

		var xx = _centerx + (_mid_x - oPlayer.x) * _radar_scale;
		var yy = _centery + (_mid_y - oPlayer.y) * _radar_scale;

		//Draw the walls within the radar circle
		if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
			//draw_sprite_ext(sBanner3, 0, xx, yy, 1, 1 , 0, c_white, 1);
			draw_sprite_ext(sLock, 0, xx, yy, 1, 1 , 0, c_white, 1);
		}
	}

	with(oEnemyParent){
		//Get the enemy position to draw on the radar
		//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
		//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
		var xx = _centerx + (x - oPlayer.x) * _radar_scale;
		var yy = _centery + (y - oPlayer.y) * _radar_scale;

		//Draw the enemies within the radar circle
		if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
			draw_circle_color(xx, yy, 7.5, c_red, c_red, 0);
		}
	}

	//draw center player position
	draw_circle_color(_centerx, _centery, 7.5, c_blue, c_blue, 0);
	}
}

/*//DEBUG: Draw full map in center of screen
if(keyboard_check(ord("M"))) { // Hold M to show full map
    var _scale = min(_guiwidth / (room_width * _radar_scale), _guiheight / (room_height * _radar_scale));
    var _sw = room_width * _radar_scale * _scale;
    var _sh = room_height * _radar_scale * _scale;
    var _sx = _guiwidth / 2 - _sw / 2;
    var _sy = _guiheight / 2 - _sh / 2;
    draw_surface_ext(radar_surface, _sx, _sy, _scale, _scale, 0, c_white, 0.8);
}*/

//DEBUG: Toggle full map display
if(global.controllerMode == 0){
	if(keyboard_check_pressed(ord("M"))){
		if(!instance_exists(oPauseMenu2) && !instance_exists(oScoreboard)){//if not the case that either the pause menu or the scoreboard exist
			audio_play_sound(sndBeep, 8, false);//beep
			show_full_map = !show_full_map;
			global.dialog_active = show_full_map || instance_exists(oPauseMenu2) || instance_exists(oScoreboard);
		}
	}
}else if(global.controllerMode == 1){
	if(gamepad_button_check_pressed(0, gp_face4)){
		if(!instance_exists(oPauseMenu2) && !instance_exists(oScoreboard)){//if not the case that either the pause menu or the scoreboard exist
			audio_play_sound(sndBeep, 8, false);//beep
			show_full_map = !show_full_map;
			global.dialog_active = show_full_map || instance_exists(oPauseMenu2) || instance_exists(oScoreboard);
		}
	}
}

if(show_full_map){
	//global.dialog_active = true;//Disable silhouette drawing.
	if(instance_exists(oTextbox2)){
		instance_destroy(oTextbox2);
	}

	//Draw green background
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, _guiwidth, _guiheight, c_lime, c_lime, c_lime, c_lime, false);
	draw_set_alpha(1);

	var _scale = min(_guiwidth / (room_width * _radar_scale), _guiheight / (room_height * _radar_scale));
	var _sw = room_width * _radar_scale * _scale;
	var _sh = room_height * _radar_scale * _scale;
	var _sx = _guiwidth / 2 - _sw / 2;
	var _sy = _guiheight / 2 - _sh / 2;
	draw_surface_ext(radar_surface, _sx, _sy, _scale, _scale, 0, c_white, 1);

	//Helper scale combining both scales
	var _fs = _radar_scale * _scale;

	//Music blocks
	with(oMusicBlockHouse){ if(instance_exists(id)){ draw_sprite_ext(sMusicBlockTile, 5, _sx + x * _fs, _sy + y * _fs, 1, 1, 0, c_white, 1); } }
	with(oMusicBlockFacility){ if(instance_exists(id)){ draw_sprite_ext(sMusicBlockTile, 5, _sx + x * _fs, _sy + y * _fs, 1, 1, 0, c_white, 1); } }
	with(oMusicBlockTemple){ if(instance_exists(id)){ draw_sprite_ext(sMusicBlockTile, 5, _sx + x * _fs, _sy + y * _fs, 1, 1, 0, c_white, 1); } }
	with(oMusicBlockOverlook){ if(instance_exists(id)){ draw_sprite_ext(sMusicBlockTile, 5, _sx + x * _fs, _sy + y * _fs, 1, 1, 0, c_white, 1); } }
	with(oMusicBlockTestLevel){ if(instance_exists(id)){ draw_sprite_ext(sMusicBlockTile, 5, _sx + x * _fs, _sy + y * _fs, 1, 1, 0, c_white, 1); } }

	//Wallbuys
	with(oAssaultWallbuy2){ draw_sprite_ext(sAssaultWallbuy2, 0, _sx + x * _fs, _sy + y * _fs, 1, 1, 0, c_white, 1); }
	with(oBazookaWallbuy2){ draw_sprite_ext(sBazookaWallbuy2, 0, _sx + x * _fs, _sy + y * _fs, 1, 1, 0, c_white, 1); }
	with(oLMGWallbuy2){ draw_sprite_ext(sLMGWallbuy2, 0, _sx + x * _fs, _sy + y * _fs, 1, 1, 0, c_white, 1); }
	with(oRaygunWallbuy2){ draw_sprite_ext(sRaygunWallbuyAlt2, 0, _sx + x * _fs, _sy + y * _fs, 1, 1, 0, c_white, 1); }
	with(oShotgunWallbuy2){ draw_sprite_ext(sShotgunWallbuy2, 0, _sx + x * _fs, _sy + y * _fs, 1, 1, 0, c_white, 1); }
	with(oSMGWallbuy2){ draw_sprite_ext(sSMGWallbuy2, 0, _sx + x * _fs, _sy + y * _fs, 1, 1, 0, c_white, 1); }
	with(oSniperWallbuy2){ draw_sprite_ext(sSniperWallbuy2, 0, _sx + x * _fs, _sy + y * _fs, 1, 1, 0, c_white, 1); }
	with(oMedkitWallbuy3){ draw_sprite_ext(sMedkitWallbuy, 1, _sx + x * _fs, _sy + y * _fs, 1, 1, 0, c_white, 1); }
	with(oArmoryAugmentor2){ draw_sprite_ext(sArmoryAugmentor2, 1, _sx + x * _fs, _sy + y * _fs, 1, 1, 0, c_white, 1); }
    
	//Warp blocks
	with(oWarpBlock){
		var _mid_x = (bbox_left + bbox_right) * 0.5;
		var _mid_y = (bbox_top + bbox_bottom) * 0.5;
		draw_sprite_ext(sDoorSign2, 0, _sx + _mid_x * _fs, _sy + _mid_y * _fs, 1, 1, 0, c_white, 1);
	}

	//Debris
	with(oDebris){
		var _mid_x = (bbox_left + bbox_right) * 0.5;
		var _mid_y = (bbox_top + bbox_bottom) * 0.5;
		draw_sprite_ext(sLock, 0, _sx + _mid_x * _fs, _sy + _mid_y * _fs, 1, 1, 0, c_white, 1);
	}
    
	//Enemies
	with(oEnemyParent){
		draw_circle_color(_sx + x * _fs, _sy + y * _fs, 7.5, c_red, c_red, 0);
	}

	//Player
	draw_circle_color(_sx + oPlayer.x * _fs, _sy + oPlayer.y * _fs, 7.5, c_blue, c_blue, 0);
}