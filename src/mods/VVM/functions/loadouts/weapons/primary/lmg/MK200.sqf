_key = "MK200"; // https://armedassault.fandom.com/wiki/Mk200
_year = 1986; // https://en.wikipedia.org/wiki/Knight%27s_Armament_Company_LMG
_sides = [WEST,INDEPENDENT];
_content = ["Vanilla","Apex","Contact"];
_type = "Light Machine Gun";
_factions = ["FIA","GENDARMERIE","SYNDIKAT"];
_camo = ["Black","Sand"];
_variants = [
	"LMG_Mk200_black_F",	// 0 Black (Contact)
	"LMG_Mk200_F"			// 1 Sand (Vanilla)
];
_magazines = [
	"200Rnd_65x39_cased_Box" // 0
];
_tracers = [
	"200Rnd_65x39_cased_Box_Tracer", 		// 0 Yellow
	"200Rnd_65x39_cased_Box_Tracer_Red",	// 1 Red
	"200Rnd_65x39_cased_Box_Red"			// 2
];
_grenades = [];
_flares = [];
_smokes = [];
_accessories = [
	"acc_pointer_IR", // 0
	"acc_flashlight" // 1
];
_bipods = [
	"bipod_01_F_blk",	// 0 Black
	"bipod_01_F_snd"	// 1 Sand
];
_muzzles = [
	"muzzle_snds_h", // 0 Black (Vanilla)
	"muzzle_snds_h_sand_F", // 1 Sand (Apex)
	"muzzle_snds_h_khk_F" // 2 Khaki (Apex)
];
_optics = [
	"optic_Aco", // 0
	"optic_MRCO" // 1
];
_return = [_variants,_magazines,_tracers,_grenades,_flares,_smokes,_accessories,_bipods,_muzzles,_optics];
_return;
