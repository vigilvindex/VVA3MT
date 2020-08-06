_key = "A143"; // https://armedassault.fandom.com/wiki/A-143_Buzzard
_year = 2000; // https://en.wikipedia.org/wiki/Aero_L-159_Alca
_sides = [INDEPENDENT];
_name = "A-143";
_factions = ["AAF"];
_content = ["Vanilla"];
_type = "Light Attack Jet";
_amphibious = false;
_variants = [
	"I_Plane_Fighter_03_dynamicLoadout_F",	// 0
	"I_Plane_Fighter_03_CAS_F",				// 1
	"I_Plane_Fighter_03_AA_F",				// 2
	"I_Plane_Fighter_03_Cluster_F"			// 3
];
_pylons  = [
	"Pylons1",
	"Pylons2",
	"Pylons3",
	"Pylons4",
	"Pylons5",
	"Pylons6",
	"Pylons7"
];
_pylonMagazines = [
	"PylonRack_1Rnd_Missile_AA_04_F",		// 0 Pylons 1 & 7
	"PylonRack_1Rnd_AAA_missiles",			// 1 Pylons 1 & 7
	"PylonRack_1Rnd_GAA_missiles",			// 2 Pylons 1 & 7
	"PylonRack_1Rnd_LG_scalpel",			// 3 Pylons 1 & 7
	"PylonRack_7Rnd_Rocket_04_HE_F",		// 4 Pylons 1 & 7
	"PylonRack_7Rnd_Rocket_04_AP_F",		// 5 Pylons 1 & 7
	"PylonRack_12Rnd_PG_missiles",			// 6 Pylons 1 & 7
	"PylonRack_12Rnd_missiles",				// 7 Pylons 1 & 7
	"PylonRack_1Rnd_Missile_AA_04_F",		// 8 Pylons 2 & 6
	"PylonRack_1Rnd_AAA_missiles",			// 9 Pylons 2 & 6
	"PylonRack_1Rnd_GAA_missiles",			// 10 Pylons 2 & 6
	"PylonRack_1Rnd_LG_scalpel",			// 11 Pylons 2 & 6
	"PylonRack_3Rnd_LG_scalpel",			// 12 Pylons 2 & 6
	"PylonRack_7Rnd_Rocket_04_HE_F",		// 13 Pylons 2 & 6
	"PylonRack_7Rnd_Rocket_04_AP_F",		// 14 Pylons 2 & 6
	"PylonRack_12Rnd_PG_missiles",			// 15 Pylons 2 & 6
	"PylonRack_12Rnd_missiles",				// 16 Pylons 2 & 6
	"PylonRack_1Rnd_Missile_AA_04_F",		// 17 Pylons 3 & 5
	"PylonRack_1Rnd_AAA_missiles",			// 18 Pylons 3 & 5
	"PylonRack_1Rnd_GAA_missiles",			// 19 Pylons 3 & 5
	"PylonRack_1Rnd_Missile_AGM_02_F",		// 20 Pylons 3 & 5
	"PylonRack_1Rnd_LG_scalpel",			// 21 Pylons 3 & 5
	"PylonRack_3Rnd_LG_scalpel",			// 22 Pylons 3 & 5
	"PylonRack_7Rnd_Rocket_04_HE_F",		// 23 Pylons 3 & 5
	"PylonRack_7Rnd_Rocket_04_AP_F",		// 24 Pylons 3 & 5
	"PylonRack_12Rnd_PG_missiles",			// 25 Pylons 3 & 5
	"PylonRack_12Rnd_missiles",				// 26 Pylons 3 & 5
	"PylonMissile_1Rnd_Bomb_04_F",			// 27 Pylons 3 & 5
	"PylonMissile_1Rnd_Mk82_F",				// 28 Pylons 3 & 5
	"PylonMissile_1Rnd_BombCluster_01_F",	// 29 Pylons 3 & 5
	"PylonMissile_1Rnd_BombCluster_03_F",	// 30 Pylons 3 & 5
	"PylonWeapon_300Rnd_20mm_shells"		// 31 Pylon 4
];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
