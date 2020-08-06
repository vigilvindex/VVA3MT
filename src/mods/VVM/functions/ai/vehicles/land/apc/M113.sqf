_key = "M113"; // https://armedassault.fandom.com/wiki/M113_(Global_Mobilization)
_year = 1960; // https://en.wikipedia.org/wiki/M113_armored_personnel_carrier
_sides = [WEST];
_name = "M113";
_factions = ["West Germany","Denmark"];
_content = ["GM"];
_type = "Modular Armoured Personnel Carrier";
_amphibious = true;
_variants = [
	"gm_dk_army_m113a1dk_apc",			// 0 M113 A1DK APC Tracked
	"gm_dk_army_m113a1dk_apc_des",		// 1 Desert
	"gm_dk_army_m113a1dk_apc_tan",		// 2 Tan
	"gm_dk_army_m113a1dk_apc_un",		// 3 White
	"gm_dk_army_m113a1dk_apc_wdl",		// 4 Woodland
	"gm_dk_army_m113a1dk_apc_win",		// 5 Winter
	"gm_dk_army_m113a1dk_command",		// 6 M113 A1DK Command APC Tracked
	"gm_dk_army_m113a1dk_command_des",	// 7 Desert
	"gm_dk_army_m113a1dk_command_tan",	// 8 Tan
	"gm_dk_army_m113a1dk_command_un",	// 9 White
	"gm_dk_army_m113a1dk_command_wdl",	// 10 Woodland
	"gm_dk_army_m113a1dk_command_win",	// 11 Winter
	"gm_dk_army_m113a1dk_engineer",		// 12 M113 A1DK Engineer APC Tracked
	"gm_dk_army_m113a1dk_engineer_des",	// 13 Desert
	"gm_dk_army_m113a1dk_engineer_tan",	// 14 Tan
	"gm_dk_army_m113a1dk_engineer_un",	// 15 White
	"gm_dk_army_m113a1dk_engineer_wdl",	// 16 Woodland
	"gm_dk_army_m113a1dk_engineer_win",	// 17 Winter
	"gm_dk_army_m113a1dk_medic",		// 18 M113 A1DK Medical APC Tracked
	"gm_dk_army_m113a1dk_medic_des",	// 19 Desert
	"gm_dk_army_m113a1dk_medic_tan",	// 20 Tan
	"gm_dk_army_m113a1dk_medic_un",		// 21 White
	"gm_dk_army_m113a1dk_medic_wdl",	// 22 Woodland
	"gm_dk_army_m113a1dk_medic_win",	// 23 Winter
	"gm_dk_army_m113a2dk",				// 24 M113 A1DK PNMK APC Tracked
	"gm_dk_army_m113a2dk_un",			// 25 Desert
	"gm_dk_army_m113a2dk_wdl",			// 26 Tan
	"gm_dk_army_m113a2dk_win",			// 27 White
	"gm_ge_army_m113a1g_apc",			// 28 M113 A1G APC Tracked
	"gm_ge_army_m113a1g_apc_des",		// 29 Desert
	"gm_ge_army_m113a1g_apc_oli",		// 30 Olive
	"gm_ge_army_m113a1g_apc_ols",		// 31 Olive Mud
	"gm_ge_army_m113a1g_apc_olw",		// 32 Olive Chalk
	"gm_ge_army_m113a1g_apc_trp",		// 33 Tropical
	"gm_ge_army_m113a1g_apc_un",		// 34 White
	"gm_ge_army_m113a1g_apc_wdl",		// 35 Woodland
	"gm_ge_army_m113a1g_apc_win",		// 36 Winter
	"gm_ge_army_m113a1g_apc_wiw",		// 37 Winter Alternative
	"gm_ge_army_m113a1g_apc_milan",		// 38 M113 A1G APC LATGM Tracked
	"gm_ge_army_m113a1g_apc_milan_des",	// 39 Desert
	"gm_ge_army_m113a1g_apc_milan_oli",	// 40 Olive
	"gm_ge_army_m113a1g_apc_milan_ols",	// 41 Olive Mud
	"gm_ge_army_m113a1g_apc_milan_olw",	// 42 Olive Chalk
	"gm_ge_army_m113a1g_apc_milan_trp",	// 43 Tropical
	"gm_ge_army_m113a1g_apc_milan_un",	// 44 White
	"gm_ge_army_m113a1g_apc_milan_wdl",	// 45 Woodland
	"gm_ge_army_m113a1g_apc_milan_win",	// 46 Winter
	"gm_ge_army_m113a1g_apc_milan_wiw",	// 47 Winter Alternative
	"gm_ge_army_m113a1g_command",		// 48 M113 A1G APC Command Tracked
	"gm_ge_army_m113a1g_command_des",	// 49 Desert
	"gm_ge_army_m113a1g_command_oli",	// 50 Olive
	"gm_ge_army_m113a1g_command_ols",	// 51 Olive Mud
	"gm_ge_army_m113a1g_command_olw",	// 52 Olive Chalk
	"gm_ge_army_m113a1g_command_trp",	// 53 Tropical
	"gm_ge_army_m113a1g_command_un",	// 54 White
	"gm_ge_army_m113a1g_command_wdl",	// 55 Woodland
	"gm_ge_army_m113a1g_command_win",	// 56 Winter
	"gm_ge_army_m113a1g_command_wiw",	// 57 Winter Alternative
	"gm_ge_army_m113a1g_medic"			// 58 M113 A1G APC Medical Tracked
];
_components = [
	"MachineGunTurret_01_addonarmor_01_unhide",
	"MachineGunTurret_01_addonarmor_02_unhide",
	"CamoNet_01_unhide",
	"CamoNet_02_unhide",
	"CamoNet_03_unhide",
	"Tarp_01_unhide",
	"ammo_01_unhide",
	"ammo_02_unhide",
	"ammo_03_unhide"
];
_textures = [];
_pylons  = [];
_pylonMagazines = [];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
