_key = "FA181"; // https://armedassault.fandom.com/wiki/F/A-181_Black_Wasp_II
_year = 1995; // https://en.wikipedia.org/wiki/Boeing_F/A-18E/F_Super_Hornet
_sides = [WEST];
_name = "F/A-181";
_factions = ["NATO"];
_content = ["Jets"];
_type = "Stealth Air Superiority Fighter";
_amphibious = false;
_variants = [
	"B_Plane_Fighter_01_F",			// 0
	"B_Plane_Fighter_01_Stealth_F",	// 1
	"B_Plane_Fighter_01_Cluster_F"	// 2
];
_pylons  = [
	"pylon1",			// 0
	"pylon2",			// 1
	"pylon3",			// 2
	"pylon4",			// 3
	"pylonBayRight1",	// 4
	"pylonBayLeft1",	// 5
	"pylonBayCenter1",	// 6
	"pylonBayCenter2",	// 7
	"pylonBayCenter3",	// 8
	"pylonBayCenter4",	// 9
	"pylonBayCenter5",	// 10
	"pylonBayCenter6"	// 11
];
_pylonMagazines = [
	"PylonRack_Missile_AMRAAM_D_x1",		// 0 Pylons 1 & 2
	"PylonRack_Missile_AMRAAM_D_x2",		// 1 Pylons 1 & 2
	"PylonRack_Missile_BIM9X_x1",			// 2 Pylons 1 & 2
	"PylonRack_Missile_BIM9X_x2",			// 3 Pylons 1 & 2
	"PylonRack_Missile_AGM_02_x1",			// 4 Pylons 1 & 2
	"PylonMissile_Bomb_GBU12_x1",			// 5 Pylons 1 & 2
	"PylonMissile_1Rnd_BombCluster_03_F",	// 6 Pylons 1 & 2
	"PylonRack_Missile_AMRAAM_D_x1",		// 7 Pylons 3 & 4
	"PylonRack_Missile_AMRAAM_D_x2",		// 8 Pylons 3 & 4
	"PylonRack_Missile_BIM9X_x1",			// 9 Pylons 3 & 4
	"PylonRack_Missile_BIM9X_x2",			// 10 Pylons 3 & 4
	"PylonRack_Missile_AGM_02_x1",			// 11 Pylons 3 & 4
	"PylonRack_Missile_AGM_02_x2",			// 12 Pylons 3 & 4
	"PylonMissile_Bomb_GBU12_x1",			// 13 Pylons 3 & 4
	"PylonRack_Bomb_GBU12_x2",				// 14 Pylons 3 & 4
	"PylonMissile_1Rnd_BombCluster_01_F",	// 15 Pylons 3 & 4
	"PylonRack_2Rnd_BombCluster_01_F",		// 16 Pylons 3 & 4
	"PylonMissile_1Rnd_BombCluster_03_F",	// 17 Pylons 3 & 4
	"PylonRack_2Rnd_BombCluster_03_F",		// 18 Pylons 3 & 4
	"PylonRack_Missile_HARM_x1",			// 19 Pylons 3 & 4
	"PylonRack_Bomb_SDB_x4",				// 20 Pylons 3 & 4
	"PylonMissile_Missile_BIM9X_x1",		// 21 Pylons 5 & 6
	"PylonMissile_Missile_AMRAAM_D_INT_x1",	// 22 Pylons 7 & 8
	"PylonMissile_Missile_AMRAAM_D_INT_x1",	// 23 Pylons 9 & 10
	"PylonRack_Bomb_SDB_x4",				// 24 Pylons 9 & 10
	"PylonMissile_Missile_AMRAAM_D_INT_x1",	// 25 Pylons 11 & 12
	"PylonMissile_Bomb_GBU12_x1",			// 26 Pylons 11 & 12
	"PylonMissile_1Rnd_BombCluster_01_F",	// 27 Pylons 11 & 12
	"PylonMissile_1Rnd_BombCluster_03_F"	// 28 Pylons 11 & 12
];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
