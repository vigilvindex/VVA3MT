_key = "TO199"; // https://armedassault.fandom.com/wiki/To-199_Neophron
_year = 1996; // https://en.wikipedia.org/wiki/Yakovlev_Yak-130
_sides = [EAST];
_name = "To-199";
_factions = ["CSAT"];
_content = ["Vanilla"];
_type = "Light Attack Jet";
_amphibious = false;
_variants = [
	"O_Plane_CAS_02_dynamicLoadout_F",	// 0
	"O_Plane_CAS_02_F",					// 1
	"O_Plane_CAS_02_Cluster_F"			// 2
];
_pylons  = [
	"Pylons1",	// 0
	"Pylons2",	// 1
	"Pylons3",	// 2
	"Pylons4",	// 3
	"Pylons5",	// 4
	"Pylons6",	// 5
	"Pylons7",	// 6
	"Pylons8",	// 7
	"Pylons9",	// 8
	"Pylons10"	// 9
];
_pylonMagazines = [
	"PylonMissile_1Rnd_LG_scalpel",				// 0 Pylons 1 & 10
	"PylonRack_1Rnd_Missile_AA_03_F",			// 1 Pylons 1 & 10
	"PylonMissile_1Rnd_LG_scalpel",				// 2 Pylons 2 & 9
	"PylonRack_3Rnd_LG_scalpel",				// 3 Pylons 2 & 9
	"PylonRack_4Rnd_LG_scalpel",				// 4 Pylons 2 & 9
	"PylonRack_20Rnd_Rocket_03_HE_F",			// 5 Pylons 2 & 9
	"PylonRack_20Rnd_Rocket_03_AP_F",			// 6 Pylons 2 & 9
	"PylonRack_19Rnd_Rocket_Skyfire",			// 7 Pylons 2 & 9
	"PylonRack_1Rnd_Missile_AA_03_F",			// 8 Pylons 2 & 9
	"PylonRack_1Rnd_Missile_AGM_01_F",			// 9 Pylons 2 & 9
	"PylonMissile_1Rnd_LG_scalpel",				// 10 Pylons 3-8
	"PylonRack_3Rnd_LG_scalpel",				// 11 Pylons 3-8
	"PylonRack_4Rnd_LG_scalpel",				// 12 Pylons 3-8
	"PylonRack_20Rnd_Rocket_03_HE_F",			// 13 Pylons 3-8
	"PylonRack_20Rnd_Rocket_03_AP_F",			// 14 Pylons 3-8
	"PylonRack_19Rnd_Rocket_Skyfire",			// 15 Pylons 3-8
	"PylonRack_1Rnd_Missile_AA_03_F",			// 16 Pylons 3-8
	"PylonRack_1Rnd_Missile_AGM_01_F",			// 17 Pylons 3-8
	"PylonMissile_1Rnd_Bomb_03_F",				// 18 Pylons 3-8
	"PylonMissile_1Rnd_BombCluster_02_cap_F"	// 19 Pylons 3-8
];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
