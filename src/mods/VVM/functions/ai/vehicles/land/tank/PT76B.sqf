_key = "PT76B"; // https://armedassault.fandom.com/wiki/PT-76B
_year = 1951; // https://en.wikipedia.org/wiki/PT-76
_sides = [EAST];
_name = "PT-76B";
_factions = ["East Germany","Poland"];
_content = ["GM"];
_type = "Light Tank";
_amphibious = true;
_variants = [
	"gm_gc_army_pt76b",			// 0 PT-76B Light Tank Tracked
	"gm_gc_army_pt76b_oli",		// 1 Olive
	"gm_gc_army_pt76b_ols",		// 2 Olive Mud
	"gm_gc_army_pt76b_olw",		// 3 Olive Chalk
	"gm_gc_army_pt76b_un",		// 4 White
	"gm_gc_army_pt76b_wdl",		// 5 Woodland
	"gm_gc_army_pt76b_win",		// 6 Winter
	"gm_pl_army_pt76b",			// 7 PT-76B Light Tank Tracked
	"gm_pl_army_pt76b_oli",		// 8 Olive
	"gm_pl_army_pt76b_ols",		// 9 Olive Mud
	"gm_pl_army_pt76b_olw",		// 10 Olive Chalk
	"gm_pl_army_pt76b_inv"		// 11 Invasion Stripes
];
_components = [
	"CamoNet_01_unhide",
	"CamoNet_02_unhide"
];
_textures = [];
_pylons  = [];
_pylonMagazines = [];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
