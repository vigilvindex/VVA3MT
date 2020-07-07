_key = "SPAR17"; // https://armedassault.fandom.com/wiki/SPAR-16_series/SPAR-16_5.56_mm
_year = 2004; // https://en.wikipedia.org/wiki/Heckler_%26_Koch_HK416
_sides = [WEST,EAST,INDEPENDENT];
_content = ["Vanilla","Apex"];
_type = "Designated Marksman Rifle";
_factions = ["NATO","CTRG","GENDARMERIE","SYNDIKAT"];
_camo = ["Black","Sand","Khaki"];
_variants = [
	"arifle_SPAR_03_blk_F", // 0 Black
	"arifle_SPAR_03_snd_F", // 1 Sand
	"arifle_SPAR_03_khk_F" // 2 Khaki
];
_magazines = [
	"20Rnd_762x51_Mag" // 0 Black
];
_tracers = [];
_grenades = [];
_flares = [];
_smokes = [];
_accessories = [
	"acc_pointer_IR", // 0
	"acc_flashlight" // 1
];
_bipods = [
	"bipod_01_F_blk", // 0 Black NATO
	"bipod_01_F_snd", // 1 Sand NATO
	"bipod_01_F_khk" // 2 Khaki NATO
];
_muzzles = [
	"muzzle_snds_B", // 0 Black 7.62 mm
	"muzzle_snds_B_snd_F", // 1 Sand 7.62 mm
	"muzzle_snds_B_khk_F" // 2 Khaki 7.62 mm
];
_optics = [
	"optic_Aco", // 0 Black
	"optic_ERCO_blk_F", // 1 Black
	"optic_ERCO_snd_F", // 2 Sand
	"optic_ERCO_khk_F", // 3 Khaki
	"optic_SOS", // 4 Black
	"optic_SOS_khk_F" // 5 Khaki
];
_return = [_variants,_magazines,_tracers,_grenades,_flares,_smokes,_accessories,_bipods,_muzzles,_optics];
_return;
