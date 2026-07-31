//constructor template for weapons
//function create_weapon(_sprite = sPistol, _weaponLength = 0, _bulletObj = oBullet, _cooldown = 9, _bulletNum = 1, _spread = 0, _pickupSprite = sPistolPickup) constructor{
//function create_weapon(_name = "Unknown", _sprite = sPistol, _weaponLength = 0, _bulletObj = oBullet, _cooldown = 9, _bulletNum = 1, _spread = 0, _pickupSprite = sPistolPickup, _ammo = 0) constructor{//old ammo system
//function create_weapon(_name = "Unknown", _sprite = sPistol, _weaponLength = 0, _bulletObj = oBullet, _cooldown = 9, _bulletNum = 1, _spread = 0, _pickupSprite = sPistolPickup, _ammo = 0, _magSize = 10, _reloadTime = 180) constructor{
//function create_weapon(_name = "Unknown", _sprite = sPistol, _weaponLength = 0, _bulletObj = oBullet, _cooldown = 9, _bulletNum = 1, _spread = 0, _pickupSprite = sPistolPickup, _ammo = 0, _magSize = 10, _reloadTime = 180, _reloadSound = sndReload) constructor{
function create_weapon(_name = "Unknown", _sprite = sPistol, _weaponLength = 0, _bulletObj = oBullet, _cooldown = 9, _bulletNum = 1, _spread = 0, _pickupSprite = sPistolPickup, _magSize = 10, _reloadTime = 180, _reloadSound = sndReload) constructor{	
	name = _name;//<-- add this
	sprite = _sprite;
	length = _weaponLength;
	bulletObj = _bulletObj;
	cooldown = _cooldown;
	bulletNum = _bulletNum;
	spread = _spread;
	pickupSprite = _pickupSprite;
	//ammo = _ammo;//new!
	magSize = _magSize;
	reloadTime = _reloadTime;
	reloadSound = _reloadSound;
}

//the player's weapon inventory
global.PlayerWeapons = array_create(0);
//global.PlayerAmmo = array_create(0);
global.PlayerMag = array_create(0);
global.PlayerReserve = array_create(0);

//the weapons
global.WeaponList = {
	pistol : new create_weapon(
		"Pistol - MK.I",//<- name
		sPistol,
		sprite_get_bbox_right(sPistol) - sprite_get_xoffset(sPistol),
		oBullet,
		9,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sPistolPickup,
		//0,//ammo
		10,//mag size
		60//reload time
	),
	raygun : new create_weapon(
		"Raygun - MK.I",//<- name
		sRaygun2,
		sprite_get_bbox_right(sRaygun2) - sprite_get_xoffset(sRaygun2),
		oRayGunBlast,
		9,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sRaygunPickup2,
		//0,//ammo
		20,//mag size
		120//reload time
	),
	sniper : new create_weapon(
		"Sniper - MK.I",//<- name
		sSniper,
		sprite_get_bbox_right(sSniper) - sprite_get_xoffset(sSniper),
		oSniperBullet,
		80,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sSniperPickup,
		//0,//ammo
		5,//mag size
		150//reload time
	),
	shotgun : new create_weapon(
		"Shotgun - MK.I",//<- name
		sShotgun,
		sprite_get_bbox_right(sShotgun) - sprite_get_xoffset(sShotgun),
		oShotGunBullet,
		30,//weapon shot delay
		7,//7 shots
		45,//bullet spread angle
		sShotgunPickup,
		//0,//ammo
		8,//mag size
		120//reload time
	),
	assault : new create_weapon(
		"AR - MK.I",//<- name
		sAssault,//sprite
		sprite_get_bbox_right(sAssault) - sprite_get_xoffset(sAssault),//weapon length
		oAssaultBullet,//bullet object
		7,//weapon shot delay/cooldown
		1,//1 shot/bullet num
		0,//bullet spread angle
		sAssaultPickup,//pickup sprite
		//0,//ammo
		30,//mag size
		120//reload time
	),
	smg : new create_weapon(
		"SMG - MK.I",//<- name
		sSMG,
		sprite_get_bbox_right(sSMG) - sprite_get_xoffset(sSMG),
		oBullet,
		5,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sSMGPickup,
		//0,//ammo
		30,//mag size
		90//reload time
	),
	lmg : new create_weapon(
		"LMG - MK.I",//<- name
		sLMG,
		sprite_get_bbox_right(sLMG) - sprite_get_xoffset(sLMG),
		oLMGBullet,
		7,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sLMGPickup,
		//0,//ammo
		100,//mag size
		180//reload time
	),
	bazooka : new create_weapon(
		"Bazooka - MK.I",//<- name
		sBazooka,
		sprite_get_bbox_right(sBazooka) - sprite_get_xoffset(sBazooka),
		oRocket,
		12,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sBazookaPickup,
		//0,//ammo
		1,//mag size
		120//reload time
	),
	hpistol : new create_weapon(
		"Pistol - MK.II",//<- name
		sHardcorePistol,
		sprite_get_bbox_right(sHardcorePistol) - sprite_get_xoffset(sHardcorePistol),
		oHardcoreBullet,
		8,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sHardcorePistolPickup,
		//0,//ammo
		20,//mag size
		51//reload time
	),
	hraygun : new create_weapon(
		"Raygun - MK.II",//<- name
		sHardcoreRaygun2,
		sprite_get_bbox_right(sHardcoreRaygun2) - sprite_get_xoffset(sHardcoreRaygun2),
		oHardcoreRayGunBlast,
		8,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sHardcoreRaygunPickup2,
		//0,//ammo
		30,//mag size
		102//reload time
	),
	hsniper : new create_weapon(
		"Sniper - MK.II",//<- name
		sHardcoreSniper,
		sprite_get_bbox_right(sHardcoreSniper) - sprite_get_xoffset(sHardcoreSniper),
		oHardcoreSniperBullet,
		65,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sHardcoreSniperPickup,
		//0,//ammo
		10,//mag size
		128//reload time
	),
	hshotgun : new create_weapon(
		"Shotgun - MK.II",//<- name
		sHardcoreShotgun,
		sprite_get_bbox_right(sHardcoreShotgun) - sprite_get_xoffset(sHardcoreShotgun),
		oHardcoreShotGunBullet,
		25,//weapon shot delay
		14,//14 shots
		45,//bullet spread angle
		sHardcoreShotgunPickup,
		//0,//ammo
		12,//mag size
		102//reload time
	),
	hassault : new create_weapon(
		"AR - MK.II",//<- name
		sHardcoreAssault,
		sprite_get_bbox_right(sHardcoreAssault) - sprite_get_xoffset(sHardcoreAssault),
		oHardcoreAssaultBullet,
		6,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sHardcoreAssaultPickup,
		//0,//ammo
		45,//mag size
		102//reload time
	),
	hsmg : new create_weapon(
		"SMG - MK.II",//<- name
		sHardcoreSMG,
		sprite_get_bbox_right(sHardcoreSMG) - sprite_get_xoffset(sHardcoreSMG),
		oHardcoreBullet,
		4,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sHardcoreSMGPickup,
		//0,//ammo
		45,//mag size
		77//reload time
	),
	hlmg : new create_weapon(
		"LMG - MK.II",//<- name
		sHardcoreLMG,
		sprite_get_bbox_right(sHardcoreLMG) - sprite_get_xoffset(sHardcoreLMG),
		oHardcoreLMGBullet,
		6,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sHardcoreLMGPickup,
		//0,//ammo
		125,//mag size
		153//reload time
	),
	hbazooka : new create_weapon(
		"Bazooka - MK.II",//<- name
		sHardcoreBazooka,
		sprite_get_bbox_right(sHardcoreBazooka) - sprite_get_xoffset(sHardcoreBazooka),
		oHardcoreRocket,
		11,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sHardcoreBazookaPickup,
		//0,//ammo
		2,//mag size
		102//reload time
	),
	upistol : new create_weapon(
		"Pistol - MK.III",//<- name
		sUltraPistol,
		sprite_get_bbox_right(sUltraPistol) - sprite_get_xoffset(sUltraPistol),
		oUltraBullet,
		7,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sUltraPistolPickup,
		//0,//ammo
		30,//mag size
		43//reload time
	),
	uraygun : new create_weapon(
		"Raygun - MK.III",//<- name
		sUltraRaygun2,
		sprite_get_bbox_right(sUltraRaygun2) - sprite_get_xoffset(sUltraRaygun2),
		oUltraRayGunBlast,
		7,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sUltraRaygunPickup2,
		//0,//ammo
		40,//mag size
		87//reload time
	),
	usniper : new create_weapon(
		"Sniper - MK.III",//<- name
		sUltraSniper,
		sprite_get_bbox_right(sUltraSniper) - sprite_get_xoffset(sUltraSniper),
		oUltraSniperBullet,
		50,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sUltraSniperPickup,
		//0,//ammo
		15,//mag size
		109//reload time
	),
	ushotgun : new create_weapon(
		"Shotgun - MK.III",//<- name
		sUltraShotgun,
		sprite_get_bbox_right(sUltraShotgun) - sprite_get_xoffset(sUltraShotgun),
		oUltraShotGunBullet,
		20,//weapon shot delay
		21,//21 shots
		45,//bullet spread angle
		sUltraShotgunPickup,
		//0,//ammo
		16,//mag size
		87//reload time
	),
	uassault : new create_weapon(
		"AR - MK.III",//<- name
		sUltraAssault,
		sprite_get_bbox_right(sUltraAssault) - sprite_get_xoffset(sUltraAssault),
		oUltraAssaultBullet,
		5,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sUltraAssaultPickup,
		//0,//ammo
		60,//mag size
		87//reload time
	),
	usmg : new create_weapon(
		"SMG - MK.III",//<- name
		sUltraSMG,
		sprite_get_bbox_right(sUltraSMG) - sprite_get_xoffset(sUltraSMG),
		oUltraBullet,
		3,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sUltraSMGPickup,
		//0,//ammo
		60,//mag size
		65//reload time
	),
	ulmg : new create_weapon(
		"LMG - MK.III",//<- name
		sUltraLMG,
		sprite_get_bbox_right(sUltraLMG) - sprite_get_xoffset(sUltraLMG),
		oUltraLMGBullet,
		5,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sUltraLMGPickup,
		//0,//ammo
		150,//mag size
		130//reload time
	),
	ubazooka : new create_weapon(
		"Bazooka - MK.III",//<- name
		sUltraBazooka,
		sprite_get_bbox_right(sUltraBazooka) - sprite_get_xoffset(sUltraBazooka),
		oUltraRocket,
		10,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sUltraBazookaPickup,
		//0,//ammo
		3,//mag size
		87//reload time
	),
}