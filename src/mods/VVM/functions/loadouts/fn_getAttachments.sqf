// _accessories = 0 call VVM_fnc_getAttachments; _bipods = 1 call VVM_fnc_getAttchments;
_return = [];
switch (_this) do {
	case 0: { // Accessories
		_return = [
			"acc_pointer_IR", // 0
			"acc_flashlight", // 1
			"acc_flashlight_smg_01", // 2
			"acc_flashlight_pistol" // 3
		];
	};
	case 1: { // Bipods
		_return = [
			"bipod_01_F_blk", // 0 Black NATO
			"bipod_01_F_khk", // 1 Khaki NATO
			"bipod_01_F_mtp", // 2 MTP NATO
			"bipod_01_F_snd", // 3 Sand NATO
			"bipod_02_F_blk", // 4 Black CSAT
			"bipod_02_F_hex", // 5 Hex CSAT
			"bipod_02_F_tan", // 6 Tan CSAT
			"bipod_02_F_arid", // 7 Arid
			"bipod_02_F_lush", // 8 Lush
			"bipod_03_F_blk", // 9 Black AAF
			"bipod_03_F_oli" // 10 Olive AAF
		];
	};
	case 2: { // Muzzles
		_return = [
			"muzzle_snds_338_black", // 0 Black .338
			"muzzle_snds_338_green", // 1 Green .338
			"muzzle_snds_338_sand", // 2 Sand .338
			"muzzle_snds_570", // 3 Black 5.7 mm
			"muzzle_snds_58_blk_F", // 4 Black 5.8 mm
			"muzzle_snds_58_ghex_F", // 5 Green Hex 5.8 mm
			"muzzle_snds_58_hex_F", // 6 Hex 5.8 mm
			"muzzle_snds_58_wdm_F", // 7 Green 5.8 mm
			"muzzle_snds_65_TI_blk_F", // 8 Black 6.5 mm
			"muzzle_snds_65_TI_ghex_F", // 9 Green Hex 6.5 mm
			"muzzle_snds_65_TI_hex_F", // 10 Hex 6.5 mm
			"muzzle_snds_93mmg_tan", // 11 Tan 9.3mm
			"muzzle_snds_93mmg", // 12 Black 9.3mm
			"muzzle_snds_acp", // 13 Black .45 ACP
			"muzzle_snds_B_arid_F", // 14 Arid 7.62 mm
			"muzzle_snds_B_khk_F", // 15 Khaki 7.62 mm
			"muzzle_snds_B_lush_F", // 16 Lush 7.62 mm
			"muzzle_snds_B_snd_F", // 17 Sand 7.62 mm
			"muzzle_snds_B", // 18 Black 7.62 mm
			"muzzle_snds_H_khk_F", // 19 Khaki 6.5 mm
			"muzzle_snds_H_MG_blk_F", // 20 Black LMG 6.5 mm
			"muzzle_snds_H_MG_khk_F", // 21 Khaki LMG 6.5 mm
			"muzzle_snds_H_MG", // 22 LMG Sand 6.5 mm
			"muzzle_snds_H_snd_F", // 23 Sand 6.5 mm
			"muzzle_snds_H_SW", // 24 Black 6.5 mm
			"muzzle_snds_H", // 25 Black 6.5 mm
			"muzzle_snds_L", // 26 Black 9 mm
			"muzzle_snds_M", // 27 Black 5.56 mm
			"muzzle_snds_m_khk_F", // 28 Khaki 5.56 mm
			"muzzle_snds_m_snd_F" // 29 Sand 5.56 mm
		];
	};
	case 3: { // Optics
		_return = [
			"optic_ACO_grn_smg", // 0 Green
			"optic_ACO_grn", // 1 Green
			"optic_Aco_smg", // 2 Red
			"optic_Aco", // 3 Red
			"optic_AMS_khk", // 4 Khaki
			"optic_AMS_snd", // 5 Sand
			"optic_AMS", // 6 Black
			"optic_Arco_AK_arid_F", // 7 Arid
			"optic_Arco_AK_blk_F", // 8 Black
			"optic_Arco_AK_lush_F", // 9 Lush
			"optic_Arco_arid_F", // 10 Arid
			"optic_Arco_blk_F", // 11 Black
			"optic_Arco_ghex_F", // 12 Green Hex
			"optic_Arco_lush_F", // 13 Lush
			"optic_Arco", // 14
			"optic_DMS_ghex_F", // 15 Green Hex
			"optic_DMS_weathered_F", // 16
			"optic_DMS_weathered_Kir_F", // 17
			"optic_DMS", // 18
			"optic_ERCO_blk_F", // 19 Black
			"optic_ERCO_khk_F", // 20 Khaki
			"optic_ERCO_snd_F", // 21 Sand
			"optic_Hamr_khk_F", // 22 Khaki
			"optic_Hamr", // 23 Black
			"optic_Holosight_arid_F", // 24 Arid
			"optic_Holosight_blk_F", // 25 Black
			"optic_Holosight_khk_F", // 26 Khaki
			"optic_Holosight_lush_F", // 27 Lush
			"optic_Holosight_smg_blk_F", // 28 Black
			"optic_Holosight_smg_khk_F", // 29 Khaki
			"optic_Holosight_smg", // 30
			"optic_Holosight", // 31
			"optic_ico_01_black_f", // 32 Black
			"optic_ico_01_camo_f", // 33 Camo
			"optic_ico_01_f", // 34
			"optic_ico_01_sand_f", // 35 Sand
			"optic_KHS_blk", // 36 Black
			"optic_KHS_hex", // 37 Hex
			"optic_KHS_old", // 38
			"optic_KHS_tan", // 39 Tan
			"optic_LRPS_ghex_F", // 40 Green Hex
			"optic_LRPS_tna_F", // 41 Tropic
			"optic_LRPS", // 42
			"optic_MRCO", // 43
			"optic_MRD_black", // 44 Black
			"optic_MRD", // 45
			"optic_Nightstalker", // 46
			"optic_NVS", // 47
			"optic_SOS_khk_F", // 48 Khaki
			"optic_SOS", // 49
			"optic_tws_mg", // 50
			"optic_tws", // 51
			"optic_Yorris" // 52
		];
	};
	default {_return = null};
};
_return;
