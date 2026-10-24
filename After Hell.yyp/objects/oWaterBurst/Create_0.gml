//Burst direction - set this in room editor creation code
//270 = down, 0 = right, 180 = left, 90 = up
depth = -2000;
burstDir = 270;//default facing down

//Burst width
burstWidth = 64;//4 tiles wide

//Burst length
burstLength = 0;

burstSoundInst = noone;

//Animation
animTimer = 0;
animSpeed = 10;
animFrame = 0;

//Warning phase
warningTime = 120;//2 seconds warning
warningTimer = 0;
flashTimer = 0;
flashVisible = false;

//Extend phase
extending = false;
extendLength = 0;
extendSpeed = 32;//pixels per step - adjust to taste

//Burst phase
burstActive = false;
burstTime = 60 * 5;//5 seconds active
burstTimer = 0;

//Retract phase
retracting = false;
retractLength = 0;

//Repeat interval
repeatTime = irandom_range(300, 600);
repeatTimer = 0;
waiting = true;

//Damage instance
damageInst = noone;