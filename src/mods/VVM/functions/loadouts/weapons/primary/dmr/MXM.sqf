_key = "MXM"; // https://armedassault.fandom.com/wiki/MX_series
_year = 2010; // https://en.wikipedia.org/wiki/Remington_ACR
_sides = [WEST];
_content = ["Vanilla","Apex"];
_type = "Designated Marksman Rifle";
_factions = ["NATO","CTRG"];
_camo = ["Black","Sand","Khaki"];
_variants = [
	"arifle_MXM_Black_F", // 0 DMR Black
	"arifle_MXM_F", // 1 DMR Sand
	"arifle_MXM_khk_F" // 2 DMR Khaki
];
_magazines = [
	"30Rnd_65x39_caseless_black_mag", // 0 Black
	"30Rnd_65x39_caseless_mag", // 1 Sand
	"30Rnd_65x39_caseless_khaki_mag", // 2 Khaki
	"100Rnd_65x39_caseless_black_mag", // 3 Black
	"100Rnd_65x39_caseless_mag", // 4 Sand
	"100Rnd_65x39_caseless_khaki_mag" // 5 Khaki
];
_tracers = [
	"30Rnd_65x39_caseless_black_mag_Tracer", // 0 Black
	"30Rnd_65x39_caseless_mag_Tracer", // 1 Sand
	"30Rnd_65x39_caseless_khaki_mag_Tracer", // 2 Khaki
	"100Rnd_65x39_caseless_black_mag_tracer", // 3 Black
	"100Rnd_65x39_caseless_mag_Tracer", // 4 Sand
	"100Rnd_65x39_caseless_khaki_mag_tracer" // 5 Khaki
];
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
	"muzzle_snds_H", // 0 Black 6.5 mm
	"muzzle_snds_H_snd_F", // 1 Sand 6.5 mm
	"muzzle_snds_H_khk_F" // 2 Khaki 6.5 mm
];
_optics = [
	"optic_Aco", // 0 Black
	"optic_Holosight_blk_F", // 1 Black
	"optic_Holosight", // 2 Sand
	"optic_Holosight_khk_F", // 3 Khaki
	"optic_Hamr", // 4 Black
	"optic_Hamr_khk_F", // 5 Khaki
	"optic_SOS", // 6 Black
	"optic_SOS_khk_F" // 7 Khaki
];
_return = [_variants,_magazines,_tracers,_grenades,_flares,_smokes,_accessories,_bipods,_muzzles,_optics];
_return;
