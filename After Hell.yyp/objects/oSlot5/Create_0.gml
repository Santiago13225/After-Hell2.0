result_display_time = 180;//3 seconds to display result before destroying
result_timer = 0;
result_done = false;
result_color = c_white;//default color
flash_timer = 0;
flash_visible = true;

y1 = [0, 0, 0];
run_speed = [0, 0, 0];
running = [false, false, false];
img = 5;//symbols per reel
stop_delays = [15, 30, 45];//frames until each reel stops
stop_timers = [-1, -1, -1];//countdown timers for each reel, -1 means not running

//x_gui = 400;//adjust to where you want the slots on screen
//y_gui = 300;//adjust to where you want the slots on screen

//Reel spacing
reel_width = sprite_width;//width of each reel
reel_gap = 10;//gap between reels

//Results
results = [-1, -1, -1];//symbol index for each reel when stopped
spinning = false;//is the machine currently spinning
payout = 0;

//spin_sound = sndSlotSpin;//sound that plays while spinning
//stop_sound = sndSlotStop;//sound that plays when a reel stops

/*function check_results(){//Based on bet of $50
	//Check for three of a kind
	if(results[0] == results[1] && results[1] == results[2]){
		switch(results[0]){
			case 0: show_debug_message("Common 1 - Three of a kind! Small win!"); break;//$100 - 2x bet
			case 1: show_debug_message("Common 2 - Three of a kind! Small win!"); break;//$150 - 3x bet
			case 2: show_debug_message("Medium 1 - Three of a kind! Medium win!"); break;//$250 - 5x bet
			case 3: show_debug_message("Medium 2 - Three of a kind! Medium win!"); break;//$500 - 10x bet
			case 4: show_debug_message("JACKPOT! Rare symbol - Big win!"); break;//$2500 - 50x bet
		}
	}
	//Check for two of a kind
	else if(results[0] == results[1] || results[1] == results[2] || results[0] == results[2]){
		show_debug_message("Two of a kind! Small consolation win!");//$?? - ???
	}else{
		show_debug_message("No match. Better luck next time!");
	}
	result_done = true;//start the display timer
}*/

function check_results(){
	var bet = 50;
	payout = 0;

	//Check for three of a kind
	if(results[0] == results[1] && results[1] == results[2]){
		switch(results[0]){
			case 0:
				payout = 100;
				//show_debug_message("Common 1 - Three of a kind! Small win! - 2x Bet! - $100");
				break;//Common 1 - 2x bet
			case 1:
				payout = 150;
				//show_debug_message("Common 2 - Three of a kind! Small win! - 3x Bet! - $150");
				break;//Common 2 - 3x bet
			case 2:
				payout = 250;
				//show_debug_message("Medium 1 - Three of a kind! Medium win! - 5x Bet! - $250");
				break;//Medium 1 - 5x bet
			case 3:
				payout = 500;
				//show_debug_message("Medium 2 - Three of a kind! Medium win! - 10x Bet! - $500"); 
				break;//Medium 2 - 10x bet
			case 4:
				payout = 2500;
				//show_debug_message("Rare - JACKPOT! Big win! - 50x Bet! - $2500");
				break;//Jackpot - 50x bet
		}
	}else{//Check for two of a kind
		//Find which symbol matched and which two reels matched
		var matchSymbol = -1;
		if(results[0] == results[1]){
			matchSymbol = results[0];
		}else if(results[1] == results[2]){
			matchSymbol = results[1];
		}else if(results[0] == results[2]){
			matchSymbol = results[0];
		}

		if(matchSymbol != -1){
			switch(matchSymbol){
				case 0:
					payout = 25;
					//show_debug_message("Common 1 - Two of a kind! Small consolation win! - .5x Bet! - $25");
					break;//Two common 1
				case 1:
					payout = 25;
					//show_debug_message("Common 2 - Two of a kind! Small consolation win! - .5x Bet! - $25");
					break;//Two common 2
				case 2:
					payout = 50;
					//show_debug_message("Medium 1 - Two of a kind! Small consolation win! - 1x Bet! - $50");
					break;//Two medium 1
				case 3:
					payout = 50;
					//show_debug_message("Medium 2 - Two of a kind! Small consolation win! - 1x Bet! - $50");
					break;//Two medium 2
				case 4:
					payout = 150;
					//show_debug_message("Rare - Two of a kind! Small win! - 3x Bet! - $150");
					break;//Two rare
			}
		}
	}

	//Apply payout
	if(payout > 0){
		//if(!audio_is_playing(sndBuy)){
		oSFX.buySnd = true;
		//audio_play_sound(sndBuy, 10, false);
		//instance_destroy(oTextbox2);
		//}
		oHUD2.playerScore += payout;
		oHUD2.playerTotalScore += payout;
		//show_debug_message("Win! Payout: $" + string(payout));
		result_color = c_lime;//green for win
	}else{
		//oHUD2.playerScore -= bet;
		//if(!audio_is_playing(sndWrong)){
		oSFX.wrongSnd = true;
		//audio_play_sound(sndWrong, 10, false);
		//instance_destroy(oTextbox2);
		//}
		//show_debug_message("No match. Lost $" + string(bet));
		result_color = c_red;//red for loss
	}

	result_done = true;//start display timer
}