depth = -bbox_top;

//Track settings - set these in the room editor creation code per instance
trackX1 = 1760;//left edge of track
trackX2 = 2704;//right edge of track
trackY = 736;//top of track
trackH = 32;//height of track
moveDir = -1;//-1 = moves left, 1 = moves right
//trainSpd = 60;// pixels per step - fast!

//Train settings - adjust these to tune behavior
var _carW = sprite_get_width(sSubwayTrain);
numMiddleCars = 58;//adjust to change train length
trainW = _carW * (numMiddleCars + 2);//front + middle + back
trainSpd = 30;//adjust to change train speed
trainDisplayTime = 5 * 60;//5 seconds - adjust to change how long train is active

//Warning phase
warningTime = 300;//5 seconds
warningTimer = 0;
flashTimer = 0;
flashVisible = false;

//Train phase
trainActive = false;
trainX = 0;
trainDisplayTimer = 0;

//Repeat interval
repeatTime = 600;//irandom_range(300, 600);//5-10 seconds between trains
repeatTimer = 0;
waiting = true;//start in waiting phase

//Damage instance
damageInst = noone;

//show_debug_message("carW: " + string(sprite_get_width(sSubwayTrain)) + " numMiddleCars: " + string(numMiddleCars) + " trainW: " + string(trainW));