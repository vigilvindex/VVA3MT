_key = "AH99"; // https://armedassault.fandom.com/wiki/AH-99_Blackfoot
_year = 1996; // https://en.wikipedia.org/wiki/Boeing–Sikorsky_RAH-66_Comanche
_sides = [WEST];
_name = "AH-99";
_factions = ["NATO"];
_content = ["Vanilla"];
_type = "Reconnaissance Attack Helicopter";
_amphibious = false;
_variants = [
	"B_Heli_Attack_01_dynamicLoadout_F",	// 0
	"B_Heli_Attack_01_F"					// 1
];
_pylons  = [
	"PylonLeft1",	// 0 Outer Left Pylon - Any
	"PylonLeft2",	// 1 Middle Left Pylon - ASRAAM / Scalpel
	"PylonLeft3",	// 2 Inner Left Pylon - Any
	"PylonRight1",	// 3 Inner Right Pylon - Any
	"PylonRight2",	// 4 Middle Right Pylon - ASRAAM / Scalpel
	"PylonRight3"	// 5 Outer Right Pylon - Any
];
_pylonMagazines = [
	"PylonMissile_1Rnd_AAA_missiles",	// 0 CAS ASRAAM
	"PylonMissile_1Rnd_LG_scalpel",		// 1 AT Scalpel
	"PylonRack_12Rnd_PG_missiles",		// 2 AT DAGR
	"PylonRack_12Rnd_missiles"			// 3 CAS DAG
];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
