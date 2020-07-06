_name = "East Germany (Winter)";
_classname = "gm_gc_army_win";

_units = [
	["Anti-Tank Assistant",				"gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_win"],
	["Anti-Tank",						"gm_gc_army_antitank_mpiak74n_rpg7_80_win"],
	["ATGM Gunner", 					"gm_gc_army_antitank_mpiak74n_fagot_80_win"],
	["Crew", 							"gm_gc_army_crew_mpiaks74nk_80_blk"],
	["Demolition", 						"gm_gc_army_demolition_mpiaks74n_80_win"],
	["Engineer", 						"gm_gc_army_engineer_mpiaks74n_80_win"],
	["Grenadier", 						""],
	["Heavy Anti-Tank Assistant",		""],
	["Heavy Anti-Tank", 				""],
	["Light Machine Gunner Assistant",	"gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk74_80_win"],
	["Light Machine Gunner", 			"gm_gc_army_machinegunner_lmgrpk74_80_win"],
	["Machine Gunner Assistant", 		"gm_gc_army_machinegunner_assistant_mpiak74n_pk_80_win"],
	["Machine Gunner", 					"gm_gc_army_machinegunner_pk_80_win"],
	["Medic", 							""],
	["Officer", 						"gm_gc_army_officer_pm_80_win"],
	["Platoon Leader", 					""],
	["Rifleman", 						"gm_gc_army_rifleman_mpiak74n_80_win"],
	["Squad Leader", 					"gm_gc_army_squadleader_mpiak74n_80_win"]
];

_groups = ["gm_antiair","gm_armored","gm_borgerguards","gm_infantry","gm_motorizedinfantry","gm_recon","gm_supply"];
_antiair = ["gm_platoon_gm_gc_army_btr60pu12_olw_gm_gc_army_zsu234v1_olw","gm_platoon_gm_gc_army_zsu234v1_olw"];
_armored = ["gm_platoon_gm_gc_army_t55a_olw"];
_infantry = ["gm_gc_army_infantry_squad_win","gm_ge_army_infantry_atgmgroup_str","gm_ge_army_infantry_atgroup_str","gm_ge_army_infantry_mggroup_str"];
_motorizedinfantry = ["gm_gc_army_motorizedinfantly_squad_bmp1sp2","gm_gc_army_motorizedinfantly_squad_btr60pb","gm_gc_army_motorizedinfantly_squad_ural4320_cargo"];
_recon = ["gm_platoon_gm_gc_army_brdm2_olw"];
_supply = ["gm_ge_army_supply_team_01"];

_groups = [
	["Infantry", "gm_infantry", [
		["AT-Group", "gm_dk_army_infantry_atgroup_84_m84"],
		["MG_Group", "gm_dk_army_infantry_mggroup_84_m84"],
		["Squad", "gm_dk_army_infantry_squad_84_m84"]
	]]
];
_vehicles = [
	["Tracked", [
		["BPz 2A0", "Recovery Tank", "gm_dk_army_bpz2a0"],
		["KPz 1A3", "Main Battle Tank", "gm_dk_army_Leopard1a3"]
	]],
	["Wheeled", [
		["", "", ""]
	]]
];