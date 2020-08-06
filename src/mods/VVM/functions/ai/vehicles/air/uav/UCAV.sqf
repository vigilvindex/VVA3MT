_key = "UCAV"; // https://armedassault.fandom.com/wiki/UCAV_Sentinel
_year = 2011; // https://en.wikipedia.org/wiki/Northrop_Grumman_X-47B
_sides = [WEST];
_name = "AL6";
_factions = ["NATO"];
_content = ["Jets"];
_type = "UAV / UCAV";
_amphibious = false;
_variants = [
	"B_UAV_05_F" // 0
];
_pylons  = [
	"pylon1",	// 0
	"pylon2"	// 1
];
_pylonMagazines = [
	"PylonMissile_Missile_AGM_02_x2",		// 0
	"PylonMissile_Bomb_GBU12_x1",			// 1
	"PylonMissile_1Rnd_BombCluster_01_F",	// 2
	"PylonMissile_1Rnd_BombCluster_03_F",	// 3
	"PylonMissile_Missile_HARM_INT_x1",		// 4
	"PylonRack_Bomb_SDB_x4"					// 5
];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
