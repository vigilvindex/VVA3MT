_key = "AH9"; // https://armedassault.fandom.com/wiki/AH-9_Pawnee
_year = 1980; // https://en.wikipedia.org/wiki/MD_Helicopters_MH-6_Little_Bird
_sides = [WEST];
_name = "AH-9";
_factions = ["NATO"];
_content = ["Vanilla"];
_type = "Light Attack Helicopter";
_amphibious = false;
_variants = [
	"B_Heli_Light_01_dynamicLoadout_F",	// 0
	"B_Heli_Light_01_armed_F"			// 1
];
_pylons  = [
	"PylonLeft1",	// 0
	"PylonRight1"	// 1
];
_pylonMagazines = [
	"PylonRack_1Rnd_AAA_missiles",		// 0
	"PylonRack_1Rnd_LG_scalpel",		// 1
	"PylonRack_7Rnd_Rocket_04_HE_F",	// 2
	"PylonRack_7Rnd_Rocket_04_AP_F",	// 3
	"PylonRack_12Rnd_PG_missiles",		// 4
	"PylonRack_12Rnd_missiles"			// 5
];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
