_key = "BMP1"; // https://armedassault.fandom.com/wiki/BMP-1_SP2
_year = 1966; // https://en.wikipedia.org/wiki/BMP-1
_sides = [EAST];
_name = "BMP-1";
_factions = ["East Germany"];
_content = ["GM"];
_type = "Infantry Fighting Vehicle";
_amphibious = false;
_variants = [
	"gm_gc_army_bmp1sp2",		// 0 BMP-1 SP-2	APC Tracked
	"gm_gc_army_bmp1sp2_oli",	// 1 Olive
	"gm_gc_army_bmp1sp2_ols",	// 2 Olive Mud
	"gm_gc_army_bmp1sp2_olw",	// 3 Olive Chalk
	"gm_gc_army_bmp1sp2_un",	// 4 White
	"gm_gc_army_bmp1sp2_wdl",	// 5 Woodland
	"gm_gc_army_bmp1sp2_win",	// 6 Winter
	"gm_pl_army_bmp1sp2",		// 7 BWP-1 APC Tracked
	"gm_pl_army_bmp1sp2_oli",	// 8 Olive
	"gm_pl_army_bmp1sp2_ols",	// 9 Olive Mud
	"gm_pl_army_bmp1sp2_olw",	// 10 Olive Chalk
	"gm_pl_army_bmp1sp2_inv"	// 11 Invasion Stripes
];
_components = [
	"spareTracks_1_1_unhide",
	"spareTracks_1_2_unhide",
	"spareTracks_2_1_unhide",
	"wheelChock_1_1_unhide",
	"wheelChock_1_2_unhide",
	"woodenBeam_01_unhide",
	"tarpRoll_01_unhide"
];
_textures = [];
_pylons  = [];
_pylonMagazines = [];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
