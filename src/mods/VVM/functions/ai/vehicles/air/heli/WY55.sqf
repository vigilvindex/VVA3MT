_key = "WY55"; // https://armedassault.fandom.com/wiki/WY-55_Hellcat
_year = 2014; // https://en.wikipedia.org/wiki/AgustaWestland_AW159_Wildcat
_sides = [INDEPENDENT];
_name = "PO-30";
_factions = ["AAF","LDF"];
_content = ["Vanilla","Contact"];
_type = "Utility Helicopter";
_amphibious = false;
_variants = [
	"I_Heli_light_03_dynamicLoadout_F",		// 0
	"I_Heli_light_03_F",					// 1
	"I_Heli_light_03_unarmed_F",			// 2
	"I_E_Heli_light_03_dynamicLoadout_F",	// 3
	"I_E_Heli_light_03_unarmed_F"			// 4 
];
_pylons  = [
	"PylonLeft1",
	"PylonRight1"
];
_pylonMagazines = [
	"PylonRack_1Rnd_AAA_missiles",
	"PylonMissile_1Rnd_LG_scalpel",
	"PylonRack_3Rnd_LG_scalpel",
	"PylonRack_4Rnd_LG_scalpel",
	"PylonRack_7Rnd_Rocket_04_HE_F",
	"PylonRack_7Rnd_Rocket_04_AP_F",
	"PylonRack_12Rnd_PG_missiles",
	"PylonRack_12Rnd_missiles",
	"PylonWeapon_300Rnd_20mm_shells"
];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
