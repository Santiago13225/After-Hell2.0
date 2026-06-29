function select_slot(){
	//11.8% seven
	//35.3% cherry
	//17.6% bar
	//23.5% skull
	//11.8% chest
	
	var _odds = [
		{item: 0, chance: 11.8},
		{item: 1, chance: 35.3},
		{item: 2, chance: 17.6},
		{item: 3, chance: 13.5},
		{item: 4, chance: 11.8}
	];
	
	var _total_odds = 0;
	for(var i = 0; i < array_length(_odds); i++){
		_total_odds += _odds[i].chance;
	}
	
	randomize();
	var _num = random(_total_odds);
	
	for(var i = 0; i < array_length(_odds); i++){
		if(_nums < _odds[i].chance){
			return _odds[i].item;
		}
		_num -= _odds[i].chance;
	}
}

function check_slots(){
	var _first_slot = 0;
	var _second_slot = 0;
	var _third_slot = 0;
	
	with(obj_slots){

	}

	with(obj_slots){
		alarm[1] = 2;
	}

	with(obj_coinslot){
		alarm[0] = 10;
	}

}