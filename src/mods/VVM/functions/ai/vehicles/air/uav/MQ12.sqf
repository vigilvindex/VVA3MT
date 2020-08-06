_key = "MQ12"; // https://armedassault.fandom.com/wiki/MQ-12_Falcon
_year = 2009; // https://en.wikipedia.org/wiki/Northrop_Grumman_MQ-8_Fire_Scout
_sides = [WEST];
_name = "MQ-12";
_factions = ["NATO"];
_content = ["Apex"];
_type = "UAV / UCAV";
_amphibious = false;
_variants = [
	"B_T_UAV_03_dynamicLoadout_F"	// 0
];
_pylons  = [
	"Pylons1",	// 0
	"Pylons2",	// 1
	"Pylons3",	// 2
	"Pylons4"	// 3
];
_pylonMagazines = [
	"PylonMissile_1Rnd_LG_scalpel",		// 0
	"PylonRack_3Rnd_LG_scalpel",		// 1
	"PylonRack_7Rnd_Rocket_04_HE_F",	// 2
	"PylonRack_7Rnd_Rocket_04_AP_F",	// 3
	"PylonRack_12Rnd_PG_missiles",		// 4
	"PylonRack_12Rnd_missiles"			// 5
];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
