_key = "A149"; // https://armedassault.fandom.com/wiki/A-149_Gryphon
_year = 1996; // https://en.wikipedia.org/wiki/Saab_JAS_39_Gripen
_sides = [INDEPENDENT];
_name = "A-143";
_factions = ["AAF","LDF"];
_content = ["Jets"];
_type = "Multi-Role Fighter Jet";
_amphibious = false;
_variants = [
	"I_Plane_Fighter_04_F",			// 0
	"I_Plane_Fighter_04_Cluster_F"	// 1
];
_pylons  = [
	"Pylons1",	// 0
	"Pylons2",	// 1
	"Pylons3",	// 2
	"Pylons4",	// 3
	"Pylons5",	// 4
	"Pylons6"	// 5
];
_pylonMagazines = [
	"PylonRack_Missile_AMRAAM_C_x1",		// 0 Pylons 1 & 2
	"PylonMissile_Missile_BIM9X_x1",		// 1 Pylons 1 & 2
	"PylonRack_Missile_AMRAAM_C_x1",		// 2 Pylons 3 & 4
	"PylonRack_Missile_BIM9X_x1",			// 3 Pylons 3 & 4
	"PylonRack_Missile_AGM_02_x1",			// 4 Pylons 3 & 4
	"PylonRack_Missile_AMRAAM_C_x1",		// 5 Pylons 5 & 6
	"PylonRack_Missile_AMRAAM_C_x2",		// 6 Pylons 5 & 6
	"PylonRack_Missile_BIM9X_x1",			// 7 Pylons 5 & 6
	"PylonRack_Missile_BIM9X_x2",			// 8 Pylons 5 & 6
	"PylonRack_Missile_AGM_02_x1",			// 9 Pylons 5 & 6
	"PylonRack_Missile_AGM_02_x2",			// 10 Pylons 5 & 6
	"PylonMissile_Bomb_GBU12_x1",			// 11 Pylons 5 & 6
	"PylonMissile_1Rnd_BombCluster_01_F",	// 12 Pylons 5 & 6
	"PylonMissile_1Rnd_BombCluster_03_F"	// 13 Pylons 5 & 6
];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
