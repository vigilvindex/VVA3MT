_key = "TO201"; // https://armedassault.fandom.com/wiki/To-201_Shikra
_year = 2010; // https://en.wikipedia.org/wiki/Sukhoi_Su-57
_sides = [EAST];
_name = "To-201";
_factions = ["CSAT"];
_content = ["Jets"];
_type = "Stealth Air Superiority Fighter";
_amphibious = false;
_variants = [
	"O_Plane_Fighter_02_F",			// 0
	"O_Plane_Fighter_02_Stealth_F",	// 1
	"O_Plane_Fighter_02_Cluster_F"	// 2
];
_pylons  = [
	"pylons1",			// 0
	"pylons2",			// 1
	"pylons3",			// 2
	"pylons4",			// 3
	"pylons5",			// 4
	"pylons6",			// 5
	"pylonBayRight1",	// 6
	"pylonBayLeft1",	// 7
	"pylonBayRight2",	// 8
	"pylonBayLeft2",	// 9
	"pylonBayCenter1",	// 10
	"pylonBayCenter2",	// 11
	"pylonBayCenter3"	// 12
];
_pylonMagazines = [
	"PylonMissile_Missile_AA_R73_x1",			// 0 Pylons 1 & 2
	"PylonMissile_Missile_AA_R77_x1",			// 1 Pylons 1 & 2
	"PylonMissile_Missile_AA_R73_x1",			// 2 Pylons 3 & 4
	"PylonMissile_Missile_AA_R77_x1",			// 3 Pylons 3 & 4
	"PylonMissile_Missile_AGM_KH25_x1",			// 4 Pylons 3 & 4
	"PylonMissile_Bomb_KAB250_x1",				// 5 Pylons 3 & 4
	"PylonMissile_1Rnd_BombCluster_02_cap_F",	// 6 Pylons 3 & 4
	"PylonMissile_Missile_AA_R73_x1",			// 7 Pylons 5 & 6
	"PylonMissile_Missile_AA_R77_x1",			// 8 Pylons 5 & 6
	"PylonMissile_Missile_AGM_KH25_x1",			// 9 Pylons 5 & 6
	"PylonMissile_Bomb_KAB250_x1",				// 10 Pylons 5 & 6
	"PylonMissile_1Rnd_BombCluster_02_cap_F",	// 11 Pylons 5 & 6
	"PylonMissile_Missile_KH58_x1",				// 12 Pylons 5 & 6
	"PylonMissile_Missile_AA_R73_x1",			// 13 Pylons 7 & 8
	"PylonMissile_Missile_AA_R77_x1",			// 14 Pylons 9 & 10
	"PylonMissile_Missile_AA_R77_INT_x1",		// 15 Pylons 11 & 12
	"PylonMissile_Missile_AA_R77_INT_x1",		// 16 Pylon 13
	"PylonMissile_Missile_AGM_KH25_INT_x1",		// 17 Pylon 13
	"PylonMissile_Bomb_KAB250_x1",				// 18 Pylon 13
	"PylonMissile_1Rnd_BombCluster_02_cap_F",	// 19 Pylon 13
	"PylonMissile_Missile_KH58_INT_x1"			// 20 Pylon 13
];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
