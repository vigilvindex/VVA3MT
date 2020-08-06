_key = "T55"; // https://armedassault.fandom.com/wiki/T-55_(Global_Mobilization)
_year = 1949; // https://en.wikipedia.org/wiki/T-54/T-55
_sides = [EAST];
_name = "T-55";
_factions = ["East Germany","Poland"];
_content = ["GM"];
_type = "Main Battle Tank";
_amphibious = false;
_variants = [
	"gm_gc_army_t55",			// 0 T-55 Main Battle Tank Tracked
	"gm_gc_army_t55_oli",		// 1 Olive
	"gm_gc_army_t55_ols",		// 2 Olive Mud
	"gm_gc_army_t55_olw",		// 3 Olive Chalk
	"gm_gc_army_t55_un",		// 4 White
	"gm_gc_army_t55_wdl",		// 5 Woodland
	"gm_gc_army_t55_win",		// 6 Winter
	"gm_gc_army_t55a",			// 7 T-55A Main Battle Tank Tracked
	"gm_gc_army_t55_oli",		// 8 Olive
	"gm_gc_army_t55_ols",		// 9 Olive Mud
	"gm_gc_army_t55_olw",		// 10 Olive Chalk
	"gm_gc_army_t55_un",		// 11 White
	"gm_gc_army_t55_wdl",		// 12 Woodland
	"gm_gc_army_t55_win",		// 13 Winter
	"gm_gc_army_t55ak",			// 14 T-55AK Main Battle Tank Tracked
	"gm_gc_army_t55ak_oli",		// 15 Olive
	"gm_gc_army_t55ak_ols",		// 16 Olive Mud
	"gm_gc_army_t55ak_olw",		// 17 Olive Chalk
	"gm_gc_army_t55ak_un",		// 18 White
	"gm_gc_army_t55ak_wdl",		// 19 Woodland
	"gm_gc_army_t55ak_win",		// 20 Winter
	"gm_gc_army_t55am2",		// 21 T-55AM2 Main Battle Tank Tracked
	"gm_gc_army_t55am2_oli",	// 22 Olive
	"gm_gc_army_t55am2_ols",	// 23 Olive Mud
	"gm_gc_army_t55am2_olw",	// 23 Olive Chalk
	"gm_gc_army_t55am2_un",		// 24 White
	"gm_gc_army_t55am2_wdl",	// 25 Woodland
	"gm_gc_army_t55am2_win",	// 26 Winter
	"gm_gc_army_t55am2b",		// 27 T-55AM2B Main Battle Tank Tracked
	"gm_gc_army_t55am2b_oli",	// 28 Olive
	"gm_gc_army_t55am2b_ols",	// 29 Olive Mud
	"gm_gc_army_t55am2b_olw",	// 30 Olive Chalk
	"gm_gc_army_t55am2b_un",	// 31 White
	"gm_gc_army_t55am2b_wdl",	// 32 Woodland
	"gm_gc_army_t55am2b_win",	// 33 Winter
	"gm_pl_army_t55",			// 34 T-55 Main Battle Tank Tracked
	"gm_pl_army_t55_oli",		// 35 Olive
	"gm_pl_army_t55_ols",		// 36 Olive Mud
	"gm_pl_army_t55_olw",		// 37 Olive Chalk
	"gm_pl_army_t55_inv",		// 38 Invasion Stripes
	"gm_pl_army_t55a",			// 39 T-55A Main Battle Tank Tracked
	"gm_pl_army_t55a_oli",		// 40 Olive
	"gm_pl_army_t55a_ols",		// 41 Olive Mud
	"gm_pl_army_t55a_olw",		// 42 Olive Chalk
	"gm_pl_army_t55a_inv",		// 43 Invasion Stripes
	"gm_pl_army_t55ak",			// 44 T-55AD1 Main Battle Tank Tracked
	"gm_pl_army_t55ak_oli",		// 45 Olive
	"gm_pl_army_t55ak_ols",		// 46 Olive Mud
	"gm_pl_army_t55ak_olw",		// 47 Olive Chalk
	"gm_pl_army_t55ak_inv"		// 48 Invasion Stripes
];
_components = [
	"MainTurret_SearchLight_cover_unhide",		// 0
	"MainTurret_Optic_cover_unhide",			// 1
	"CommanderTurret_SearchLight_cover_unhide",	// 2
	"buoy_01_unhide",							// 3
	"camoNet_01_unhide",						// 4
	"camoNet_02_unhide",						// 5
	"turretBox_01_unhide",						// 6
	"turretBox_02_unhide",						// 7
	"fender_01_unhide",							// 8
	"fender_02_unhide",							// 9
	"woodenBeam_01_unhide",						// 10
	"snorkel_01_unhide",						// 11
	"snorkel_02_unhide",						// 12
	"rearbar_01_unhide",						// 13
	"barrelHolder_01_unhide",					// 14
	"barrel_01_unhide",							// 15
	"barrel_02_unhide",							// 16
	"storageBox_01_unhide",						// 17
	"storageBox_02_unhide"						// 18
];
_textures = [];
_pylons  = [];
_pylonMagazines = [];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
