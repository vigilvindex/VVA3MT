_key = "SPZ2A"; // https://armedassault.fandom.com/wiki/SpPz_2A1
_year = 1975; // https://en.wikipedia.org/wiki/Spähpanzer_Luchs
_sides = [WEST];
_name = "SpPz 2A";
_factions = ["West Germany"];
_content = ["GM"];
_type = "Armoured Fighting Vehicle";
_amphibious = true;
_variants = [
	"gm_ge_army_luchsa1",		// 0 SpPz 2A1
	"gm_ge_army_luchsa1_oli",	// 1 Olive
	"gm_ge_army_luchsa1_ols",	// 2 Olive Mud
	"gm_ge_army_luchsa1_olw",	// 3 Olive Winter
	"gm_ge_army_luchsa2",		// 4 SpPz 2A2
	"gm_ge_army_luchsa2_des",	// 4 Desert
	"gm_ge_army_luchsa2_oli",	// 5 Olive
	"gm_ge_army_luchsa2_ols",	// 6 Olive Mud
	"gm_ge_army_luchsa2_olw",	// 7 Olive Winter
	"gm_ge_army_luchsa2_trp",	// 8 Tropical
	"gm_ge_army_luchsa2_un",	// 9 White
	"gm_ge_army_luchsa2_wdl",	// 10 Woodland
	"gm_ge_army_luchsa2_win",	// 11 Winter
	"gm_ge_army_luchsa2_wiw"	// 12 Winter Alternative
];
_components = [
	"radio_03_unhide",
	"SignsExtraWide_unhide",
	"TurretBox_01_unhide",
	"CamoNet_01_unhide",
	"CamoNet_02_unhide",
	"beacon_01_org_unhide",
	"beacon_01_blu_unhide"
];
_textures = [];
_pylons  = [];
_pylonMagazines = [];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
