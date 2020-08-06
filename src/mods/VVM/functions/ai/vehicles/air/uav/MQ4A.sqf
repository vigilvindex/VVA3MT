_key = "MQ4A"; // https://armedassault.fandom.com/wiki/MQ4A_Greyhawk
_year = 2007; // https://en.wikipedia.org/wiki/General_Atomics_MQ-9_Reaper
_sides = [WEST,EAST,INDEPENDENT];
_name = "MQ-4A / K40";
_factions = ["NATO","CSAT","AAF"];
_content = ["Vanilla"];
_type = "UAV / UCAV";
_amphibious = false;
_variants = [
	"B_UAV_02_dynamicLoadout_F",	// 0 Blue
	"B_UAV_02_F",					// 1
	"B_UAV_02_CAS_F",				// 2
	"O_UAV_02_dynamicLoadout_F",	// 3 Grey Hex
	"O_UAV_02_F",					// 4
	"O_UAV_02_CAS_F",				// 5
	"I_UAV_02_dynamicLoadout_F",	// 6 Digital Grey
	"I_UAV_02_F",					// 7
	"I_UAV_02_CAS_F"				// 8
];
_pylons  = [
	"pylons1",	// 0
	"pylons2"	// 1
];
_pylonMagazines = [
	"PylonRack_1Rnd_Missile_AA_04_F",		// 0
	"PylonRack_1Rnd_AAA_missiles",			// 1
	"PylonRack_1Rnd_LG_scalpel",			// 2
	"PylonRack_3Rnd_LG_scalpel",			// 3
	"PylonRack_7Rnd_Rocket_04_HE_F",		// 4
	"PylonRack_7Rnd_Rocket_04_AP_F",		// 5
	"PylonRack_12Rnd_PG_missiles",			// 6
	"PylonRack_12Rnd_missiles",				// 7
	"PylonMissile_1Rnd_Bomb_04_F",			// 8
	"PylonMissile_1Rnd_Mk82_F",				// 9
	"PylonMissile_1Rnd_BombCluster_01_F",	// 10
	"PylonMissile_1Rnd_BombCluster_03_F"	// 11
];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
