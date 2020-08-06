_key = "PAH1"; // https://armedassault.fandom.com/wiki/PAH-1
_year = 1967; // https://en.wikipedia.org/wiki/MBB_Bo_105
_sides = [WEST];
_name = "PAH-1";
_factions = ["West Germany"];
_content = ["GM"];
_type = "Light Utility Helicopter";
_amphibious = false;
_variants = [
	"gm_ge_army_bo105p_pah1",		// 0 PAH-1 Anti-Tank Army
	"gm_ge_army_bo105p_pah1_n83",	// 1
	"gm_ge_army_bo105p_pah1_n84",	// 2
	"gm_ge_army_bo105p_pah1_oli",	// 3 Olive
	"gm_ge_army_bo105p_pah1_un",	// 4 White
	"gm_ge_army_bo105p_pah1a1",		// 5 PAH-1A1 Anti-Tank Army
	"gm_ge_army_bo105p_pah1a1_n83",	// 6
	"gm_ge_army_bo105p_pah1a1_n84",	// 7
	"gm_ge_army_bo105p_pah1a1_oli",	// 8 Olive
	"gm_ge_army_bo105p_pah1a1_un"	// 9 White
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
	"gm_1Rnd_hot_heat_dm72",				// 0
	"gm_1Rnd_hot_heat_dm72_blk",			// 1
	"gm_1Rnd_hot_heat_dm72_red",			// 2
	"gm_1Rnd_hot_heat_dm72_yel",			// 3
	"gm_1Rnd_hot_heat_dm102",				// 4
	"gm_1Rnd_hot_heat_dm102_blk",			// 5
	"gm_1Rnd_hot_heat_dm102_red",			// 6
	"gm_1Rnd_hot_heat_dm102_yel",			// 7
	"gm_1Rnd_hot_heat_dm102_hornetarrow",	// 8
	"gm_1Rnd_hot_heat_dm102_hornet"			// 9
];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
