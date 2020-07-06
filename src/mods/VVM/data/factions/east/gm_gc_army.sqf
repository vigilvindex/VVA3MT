_name = "East Germany";
_classname = "gm_gc_army";

_units = [
	["Anti-Tank Assistant",				"gm_gc_army_antitank_assistant_mpiak74n_rpg7_80_str"],
	["Anti-Tank",						"gm_gc_army_antitank_mpiak74n_rpg7_80_str"],
	["ATGM Gunner", 					"gm_gc_army_antitank_mpiak74n_fagot_80_str"],
	["Crew", 							"gm_gc_army_crew_mpiaks74nk_80_blk"],
	["Demolition", 						"gm_gc_army_demolition_mpiaks74n_80_str"],
	["Engineer", 						"gm_gc_army_engineer_mpiaks74n_80_str"],
	["Grenadier", 						""],
	["Heavy Anti-Tank Assistant",		""],
	["Heavy Anti-Tank", 				""],
	["Light Machine Gunner Assistant",	"gm_gc_army_machinegunner_assistant_mpiak74n_lmgrpk74_80_str"],
	["Light Machine Gunner", 			"gm_gc_army_machinegunner_lmgrpk74_80_str"],
	["Machine Gunner Assistant", 		"gm_gc_army_machinegunner_assistant_mpiak74n_pk_80_str"],
	["Machine Gunner", 					"gm_gc_army_machinegunner_pk_80_str"],
	["Medic", 							""],
	["Officer", 						"gm_gc_army_officer_pm_80_str"],
	["Pilot",							""],
	["Platoon Leader", 					""],
	["Rifleman", 						"gm_gc_army_rifleman_mpiak74n_80_str"],
	["Squad Leader", 					"gm_gc_army_squadleader_mpiak74n_80_str"]
];

_groups = ["gm_antiair","gm_armored","gm_borgerguards","gm_infantry","gm_motorizedinfantry","gm_recon","gm_supply"];
_antiair = ["gm_platoon_gm_gc_army_btr60pu12_oli_gm_gc_army_zsu234v1_oli","gm_platoon_gm_gc_army_zsu234v1_oli"];
_armored = ["gm_platoon_gm_gc_army_t55a_oli"];
_borderguards = ["gm_gc_bgs_infantry_post_str"];
_infantry = ["gm_gc_army_infantry_squad_str","gm_ge_army_infantry_atgmgroup_str","gm_ge_army_infantry_atgroup_str","gm_ge_army_infantry_mggroup_str"];
_motorizedinfantry = ["gm_gc_army_motorizedinfantly_squad_bmp1sp2","gm_gc_army_motorizedinfantly_squad_btr60pb","gm_gc_army_motorizedinfantly_squad_ural4320_cargo"];
_recon = ["gm_platoon_gm_gc_army_brdm2_oli"];
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
		["BMP-1 SP-2", "APC", "gm_gc_army_bmp1sp2"],
		["T-55A", "Main Battle Tank", "gm_gc_army_t55a"],
		["ZSU-23-4V1", "Anti-Air", "gm_gc_army_zsu234v1"]
	]],
	["Wheeled", [
		["SPW-40P2", "Scout Car", "gm_gc_army_brdm2"]
	]]
];