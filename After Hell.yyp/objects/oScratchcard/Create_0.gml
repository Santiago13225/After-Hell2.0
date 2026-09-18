//Grid
cols = 3;
rows = 3;
symbols = array_create(9, 0);//9 symbols in a 3x3 grid
num_symbols = 4;//common, medium, rare, jackpot

//Symbol weights (higher = more common)
//weights = [50, 30, 15, 5];//common, medium, rare, jackpot
//weights = [40, 25, 20, 15];//common, medium, rare, jackpot
weights = [35, 30, 25, 10];//common, medium, rare, jackpot
total_weight = 100;

//Generate random symbols
for(var i = 0; i < 9; i++){
	var _roll = irandom_range(1, total_weight);
	var _cumulative = 0;
	for(var j = 0; j < num_symbols; j++){
		_cumulative += weights[j];
		if(_roll <= _cumulative){
			symbols[i] = j;
			break;
		}
	}
}

//Display
cell_size = 32;
padding = 8;
covered = true;
cover_timer = 60;//1 second covered
display_timer = 0;
display_time = 180;//3 seconds revealed
result_done = false;

fade_alpha = 1;//start fully opaque for cover
fading = false;
fade_speed = 1/30;//fade over 0.5 seconds

//Results
payout = 0;
checked = false;

matching_lines = [];
flash_timer = 0;
flash_visible = true;

function check_scratch_results(){
	payout = 0;
	var bet = 50;

	//Payouts per symbol per matching line
	var line_payouts = [
		[0, 25],      //common - 2 of a kind, 3 of a kind
		[25, 50],     //medium
		[50, 100],    //rare
		[250, 500]    //jackpot
	];

	//Check all 8 lines
	var lines = [
		[0, 1, 2], //top row
		[3, 4, 5], //middle row
		[6, 7, 8], //bottom row
		[0, 3, 6], //left column
		[1, 4, 7], //middle column
		[2, 5, 8], //right column
		[0, 4, 8], //diagonal top-left to bottom-right
		[2, 4, 6]  //diagonal top-right to bottom-left
	];
    
	for(var i = 0; i < 8; i++){
		var _a = symbols[lines[i][0]];
		var _b = symbols[lines[i][1]];
		var _c = symbols[lines[i][2]];

		if(_a == _b && _b == _c){
			//Three of a kind on this line
			payout += line_payouts[_a][1];
			array_push(matching_lines, i);//store matching line index
		}/*else if(_a == _b || _b == _c || _a == _c){
			//Two of a kind on this line
			var _match = (_a == _b) ? _a : ((_b == _c) ? _b : _a);
			payout += line_payouts[_match][0];
		}*/
	}

	//Apply payout
	if(payout > 0){
		oSFX.buySnd = true;
		oHUD2.playerScore += payout;
		oHUD2.playerTotalScore += payout;
	}else{
		oSFX.wrongSnd = true;
	}
}