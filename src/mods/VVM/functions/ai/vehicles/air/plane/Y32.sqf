_key = "Y32"; // https://armedassault.fandom.com/wiki/Y-32_Xi%27an
_year = 2035;
_sides = [EAST];
_name = "Y-32";
_factions = ["CSAT"];
_content = ["Apex"];
_type = "VTOL Transport / Gunship";
_amphibious = false;
_variants = [
	"O_T_VTOL_02_infantry_dynamicLoadout_F",	// 0
	"O_T_VTOL_02_infantry_F",					// 1
	"O_T_VTOL_02_infantry_hex_F",				// 2
	"O_T_VTOL_02_infantry_ghex_F",				// 3
	"O_T_VTOL_02_infantry_grey_F",				// 4
	"O_T_VTOL_02_vehicle_dynamicLoadout_F",		// 5
	"O_T_VTOL_02_vehicle_F",					// 6
	"O_T_VTOL_02_vehicle_hex_F",				// 7
	"O_T_VTOL_02_vehicle_ghex_F",				// 8
	"O_T_VTOL_02_vehicle_grey_F"				// 9
];
_pylons  = [
	"PylonRight1",	// 0
	"PylonRight2",	// 1
	"PylonLeft2",	// 2
	"PylonLeft1"	// 3
];
_pylonMagazines = [
	"PylonMissile_1Rnd_LG_scalpel",				// 0
	"PylonRack_3Rnd_LG_scalpel",				// 1
	"PylonRack_4Rnd_LG_scalpel",				// 2
	"PylonRack_20Rnd_Rocket_03_HE_F",			// 3
	"PylonRack_20Rnd_Rocket_03_AP_F",			// 4
	"PylonRack_19Rnd_Rocket_Skyfire",			// 5
	"PylonRack_1Rnd_Missile_AA_03_F",			// 6
	"PylonRack_1Rnd_Missile_AGM_01_F",			// 7
	"PylonMissile_1Rnd_Bomb_03_F",				// 8
	"PylonMissile_1Rnd_BombCluster_02_cap_F"	// 9
];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
