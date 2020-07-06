_key = "AK12"; // https://armedassault.fandom.com/wiki/AK-12_series/AK-12_7.62_mm
_year = 2018; // https://en.wikipedia.org/wiki/AK-12
_sides = [EAST,WEST,INDEPENDENT];
_content = ["Vanilla","Apex","Contact"];
_type = "Assault Rifle";
_factions = ["FIA","SPETSNAZ"];
_variants = [
	"arifle_AK12_F", // 0 Black
	"arifle_AK12_arid_F", // 1 Arid
	"arifle_AK12_lush_F", // 2 Lush
	"arifle_AK12_GL_F", // 3 GL Black
	"arifle_AK12_GL_arid_F", // 4 GL Arid
	"arifle_AK12_GL_lush_F", // 5 GL Lush
	"arifle_AK12U_F", // 6 Carbine Black
	"arifle_AK12U_arid_F", // 7 Carbine Arid
	"arifle_AK12U_lush_F" // 8 Carbine Lush
];
_magazines = [
	"30Rnd_762x39_AK12_Mag_F", // 0 Black
	"30Rnd_762x39_AK12_Arid_Mag_F", // 1 Arid
	"30Rnd_762x39_AK12_Lush_Mag_F" // 2 Lush
];
_tracers = [
	"30Rnd_762x39_AK12_Mag_Tracer_F", // 0 Black
	"30Rnd_762x39_AK12_Arid_Mag_Tracer_F", // 1 Arid
	"30Rnd_762x39_AK12_Lush_Mag_Tracer_F" // 2 Lush
];
_grenades = [
	"1Rnd_HE_Grenade_shell" // 0
];
_smokes = [
	"1Rnd_Smoke_Grenade_shell", // 0
	"1Rnd_SmokeRed_Grenade_shell", // 1
	"1Rnd_SmokeGreen_Grenade_shell", // 2
	"1Rnd_SmokeYellow_Grenade_shell", // 3
	"1Rnd_SmokePurple_Grenade_shell", // 4
	"1Rnd_SmokeBlue_Grenade_shell", // 5
	"1Rnd_SmokeOrange_Grenade_shell" // 6
];
_flares = [
	"UGL_FlareWhite_F", // 0
	"UGL_FlareGreen_F", // 1
	"UGL_FlareRed_F", // 2
	"UGL_FlareYellow_F", // 3
	"UGL_FlareCIR_F" // 4
];
_accessories = [
	"acc_pointer_IR", // 0
	"acc_flashlight" // 1
];
_bipods = [];
_muzzles = [
	"muzzle_snds_B", // 0 Black
	"muzzle_snds_B_arid_F", // 1 Arid
	"muzzle_snds_B_lush_F", // 2 Lush
	"muzzle_snds_B_khk_F", // 3 Khaki
	"muzzle_snds_B_snd_F" // 4 Sand
];
_optics = [
	["optic_Arco_AK_blk_F","ARCO AK (Black)"], // 0
	["optic_Arco_AK_arid_F","ARCO AK (Arid)"], // 1
	["optic_Arco_AK_lush_F","ARCO AK (Lush)"], // 2
	["optic_Holosight_blk_F","Mk17 Holosight (Black)"], // 3
	["optic_Holosight_arid_F","Mk17 Holosight (Arid)"], // 4
	["optic_Holosight_lush_F","Mk17 Holosight (Lush)"], // 5
	["optic_Holosight_khk_F","Mk17 Holosight (Khaki)"] // 6
];
_return = [_variants,_magazines,_tracers,_grenades,_flares,_smokes,_accessories,_bipods,_muzzles,_optics];
_return;
