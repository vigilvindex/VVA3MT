_key = "A164"; // https://armedassault.fandom.com/wiki/A-164_Wipeout
_year = 1977; // https://en.wikipedia.org/wiki/Fairchild_Republic_A-10_Thunderbolt_II
_sides = [WEST];
_name = "A-164";
_factions = ["NATO"];
_content = ["Vanilla"];
_type = "Ground Attack Craft";
_amphibious = false;
_variants = [
	"B_Plane_CAS_01_dynamicLoadout_F",	// 0
	"B_Plane_CAS_01_F",					// 1
	"B_Plane_CAS_01_Cluster_F"			// 2
];
_pylons  = [
	"Pylons1",
	"Pylons2",
	"Pylons3",
	"Pylons4",
	"Pylons5",
	"Pylons6",
	"Pylons7",
	"Pylons8",
	"Pylons9",
	"Pylons10"
];
_pylonMagazines = [
	"PylonRack_1Rnd_Missile_AA_04_F",		// 0 Pylons 1 & 10
	"PylonRack_1Rnd_AAA_missiles",			// 1 Pylons 1 & 10
	"PylonRack_1Rnd_LG_scalpel",			// 2 Pylons 1 & 10
	"PylonRack_3Rnd_LG_scalpel",			// 3 Pylons 1 & 10
	"PylonRack_7Rnd_Rocket_04_HE_F",		// 4 Pylons 1 & 10
	"PylonRack_7Rnd_Rocket_04_AP_F",		// 5 Pylons 1 & 10
	"PylonRack_12Rnd_PG_missiles",			// 6 Pylons 1 & 10
	"PylonRack_12Rnd_missiles",				// 7 Pylons 1 & 10
	"PylonMissile_1Rnd_Bomb_04_F",			// 8 Pylons 1 & 10
	"PylonMissile_1Rnd_Mk82_F",				// 9 Pylons 1 & 10
	"PylonMissile_1Rnd_BombCluster_03_F",	// 10 Pylons 1 & 10
	"PylonRack_1Rnd_Missile_AA_04_F",		// 11 Pylons 2 & 9
	"PylonRack_1Rnd_AAA_missiles",			// 12 Pylons 2 & 9
	"PylonRack_1Rnd_Missile_AGM_02_F",		// 13 Pylons 2 & 9
	"PylonRack_1Rnd_LG_scalpel",			// 14 Pylons 2 & 9
	"PylonRack_3Rnd_LG_scalpel",			// 15 Pylons 2 & 9
	"PylonRack_7Rnd_Rocket_04_HE_F",		// 16 Pylons 2 & 9
	"PylonRack_7Rnd_Rocket_04_AP_F",		// 17 Pylons 2 & 9
	"PylonRack_12Rnd_PG_missiles",			// 18 Pylons 2 & 9
	"PylonRack_12Rnd_missiles",				// 19 Pylons 2 & 9
	"PylonMissile_1Rnd_Bomb_04_F",			// 20 Pylons 2 & 9
	"PylonMissile_1Rnd_Mk82_F",				// 21 Pylons 2 & 9
	"PylonMissile_1Rnd_BombCluster_01_F",	// 22 Pylons 2 & 9
	"PylonMissile_1Rnd_BombCluster_03_F",	// 23 Pylons 2 & 9
	"PylonRack_1Rnd_Missile_AA_04_F",		// 24 Pylons 3-8
	"PylonRack_1Rnd_AAA_missiles",			// 25 Pylons 3-8
	"PylonRack_1Rnd_Missile_AGM_02_F",		// 26 Pylons 3-8
	"PylonRack_3Rnd_Missile_AGM_02_F",		// 27 Pylons 3-8
	"PylonRack_1Rnd_LG_scalpel",			// 28 Pylons 3-8
	"PylonRack_3Rnd_LG_scalpel",			// 29 Pylons 3-8
	"PylonRack_7Rnd_Rocket_04_HE_F",		// 30 Pylons 3-8
	"PylonRack_7Rnd_Rocket_04_AP_F",		// 31 Pylons 3-8
	"PylonRack_12Rnd_PG_missiles",			// 32 Pylons 3-8
	"PylonRack_12Rnd_missiles",				// 33 Pylons 3-8
	"PylonMissile_1Rnd_Bomb_04_F",			// 34 Pylons 3-8
	"PylonMissile_1Rnd_Mk82_F",				// 35 Pylons 3-8
	"PylonMissile_1Rnd_BombCluster_01_F",	// 36 Pylons 3-8
	"PylonMissile_1Rnd_BombCluster_03_F"	// 37 Pylons 3-8
];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
