_key = "AKM"; // https://armedassault.fandom.com/wiki/AKM
_year = 1959; // https://en.wikipedia.org/wiki/AKM
_sides = [EAST,WEST,INDEPENDENT];
_content = ["Apex","GM"];
_type = "Assault Rifle";
_name = "AKM";
_factions = ["Syndikat","FIA","GENDARMERIE","Poland"];
_variants = [
	"arifle_AKM_FL_F",	// 0 (Apex)
	"gm_akm_wud",		// 1 (GM)
	"gm_akmn_wud"		// 2 (GM)
];
_magazines = [
	"30Rnd_762x39_Mag_F",					// 0 (Apex)
	"30Rnd_762x39_Mag_Green_F",				// 1 (Apex)
	"gm_30Rnd_762x39mm_b_M43_ak47_blk",		// 2 (GM)
	"gm_30Rnd_762x39mm_b_57N231_ak47_blk",	// 3 (GM)
	"gm_30Rnd_762x39mm_ap_7N23_ak47_blk",	// 4 (GM)
	"gm_75Rnd_762x39mm_b_M43_ak47_blk",		// 5 (GM)
	"gm_75Rnd_762x39mm_b_57N231_ak47_blk",	// 6 (GM)
	"gm_75Rnd_762x39mm_ap_7N23_ak47_blk"	// 7 (GM)
];
_tracers = [
	"30Rnd_762x39_Mag_Tracer_F",				// 0 (Apex)
	"30Rnd_762x39_Mag_Tracer_Green_F",			// 1 (Apex)
	"gm_30Rnd_762x39mm_b_t_M43_ak47_blk",		// 2 (GM)
	"gm_30Rnd_762x39mm_b_t_57N231P_ak47_blk",	// 3 (GM)
	"gm_75Rnd_762x39mm_b_t_M43_ak47_blk",		// 4 (GM)
	"gm_75Rnd_762x39mm_b_t_57N231P_ak47_blk"	// 5 (GM)
];
_grenades = [];
_smokes = [];
_flares = [];
_accessories = [];
_bipods = [];
_muzzles = [
	"gm_bayonet_6x3_wud",	// 0 (GM)
	"gm_bayonet_6x3_blk"	// 1 (GM)
];
_optics = [
	"gm_zvn64_rear_ak",	// 0 (GM)
	"gm_pgo7v_blk",		// 1 (GM)
	"gm_zfk4x25_blk",	// 2 (GM)
	"gm_zvn64_front"	// 3 (GM)
];
_return = [_variants,_magazines,_tracers,_grenades,_flares,_smokes,_accessories,_bipods,_muzzles,_optics];
_return;
