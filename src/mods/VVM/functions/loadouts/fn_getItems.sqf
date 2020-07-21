// _binoculars = 0 call VVM_fnc_getItems; _compasses = 1 call VVM_fnc_getItems;
// diag_log format ["# %1 #% 2 # %3 # VVM_fnc_getItems _this = %4 #",time,__FILE__ select [count PATH],__LINE__,_this];
private _return = [];
switch (_this) do {
	case 0: { // Binoculars
		_return = [
			"Binocular", // 0
			"Rangefinder", // 1
			"Laserdesignator_01", // 2 Sand
			"Laserdesignator_02", // 3 Hex
			"Laserdesignator_03", // 4 Olive
			"Laserdesignator_01_khk_F", // 5 Khaki
			"Laserdesignator_02_ghex_F" // 6 Green Hex
		];
	};
	case 1: {_return = ["ItemCompass"];}; // Compasses
	case 2: { // Facewear
		_return = [
			"G_B_Diving", // 0
			"H_BandMask_blk", // 1
			"H_BandMask_demon", // 2
			"H_BandMask_khk", // 3
			"H_BandMask_reaper", // 4
			"H_HeadSet_black_F", // 5
			"H_HeadSet_orange_F", // 6
			"H_HeadSet_red_F", // 7
			"H_HeadSet_white_F", // 8
			"H_HeadSet_yellow_F", // 9
			"H_Shemag_khk", // 10
			"H_Shemag_olive", // 11
			"H_Shemag_olive_hs", // 12
			"H_Shemag_tan", // 13
			"H_ShemagOpen_khk", // 14
			"H_ShemagOpen_tan", // 15
			"H_WirelessEarpiece_F" // 16
		];
	};
	case 3: { // Headgear
		_return = [
			"H_Bandanna_blu", // 0
			"H_Bandanna_camo", // 1 Woodland
			"H_Bandanna_cbr", // 2 Coyote
			"H_Bandanna_gry", // 3 Black
			"H_Bandanna_khk", // 4 Khaki
			"H_Bandanna_khk_hs", // 5 Khaki
			"H_Bandanna_mcamo", // 6 MTP
			"H_Bandanna_sand", // 7 Sand
			"H_Bandanna_sgg", // 8 Sage
			"H_Bandanna_surfer", // 9
			"H_Bandanna_surfer_blk", // 10
			"H_Bandanna_surfer_grn", // 11
			"H_Beret_02", // 12 NATO
			"H_Beret_blk", // 13 Black
			"H_Beret_blk_POLICE", // 14
			"H_Beret_brn_SF", // 15
			"H_Beret_Colonel", // 16 NATO
			"H_Beret_EAF_01_F", // 17 LDF
			"H_Beret_gen_F", // 18 Gendarmerie
			"H_Beret_grn", // 19 Green
			"H_Beret_grn_SF", // 20
			"H_Beret_ocamo", // 21 CSAT
			"H_Beret_red", // 22 Red
			"H_Booniehat_dgtl", // 23 AAF
			"H_Booniehat_dirty", // 24
			"H_Booniehat_eaf", // 25 LDF
			"H_Booniehat_grn", // 26 Green
			"H_Booniehat_indp", // 27 Khaki
			"H_Booniehat_khk", // 28 Khaki
			"H_Booniehat_khk_hs", // 29 Khaki
			"H_Booniehat_mcamo", // 30 MTP
			"H_Booniehat_mgrn", // 31 Green
			"H_Booniehat_oli", // 32 Olive
			"H_Booniehat_taiga", // 33
			"H_Booniehat_tan", // 34 Sand
			"H_Booniehat_tna_F", // 35 Tropic
			"H_Booniehat_wdl", // 36 Woodland
			"H_Cap_Black_IDAP_F", // 37
			"H_Cap_blk", // 38 Black
			"H_Cap_blk_CMMG", // 39
			"H_Cap_blk_ION", // 40
			"H_Cap_blk_Raven", // 41 AAF
			"H_Cap_blk_Syndikat_F", // 42 Black
			"H_Cap_blu", // 43
			"H_Cap_brn_SPECOPS", // 44 OPFOR
			"H_Cap_grn", // 45
			"H_Cap_grn_BI", // 46
			"H_Cap_grn_Syndikat_F", // 47
			"H_Cap_headphones", // 48
			"H_Cap_khaki_specops_UK", // 49
			"H_Cap_marshal", // 50
			"H_Cap_oli", // 51 Olive
			"H_Cap_oli_hs", // 52
			"H_Cap_oli_Syndikat_F", // 53
			"H_Cap_Orange_IDAP_F", // 54
			"H_Cap_police", // 55
			"H_Cap_press", // 56
			"H_Cap_red", // 57
			"H_Cap_surfer", // 57
			"H_Cap_tan", // 59
			"H_Cap_tan_specops_US", // 60 US MTP
			"H_Cap_tan_Syndikat_F", // 61 Tan
			"H_Cap_usblack", // 62 US Black
			"H_Cap_White_IDAP_F", // 63
			"H_Hat_blue", // 64
			"H_Hat_brown", // 65
			"H_Hat_camo", // 66
			"H_Hat_checker", // 67
			"H_Hat_grey", // 68
			"H_Hat_Safari_olive_F", // 69
			"H_Hat_Safari_sand_F", // 70
			"H_Hat_tan", // 71
			"H_MilCap_blue", // 72
			"H_MilCap_dgtl", // 73 AAF
			"H_MilCap_eaf", // 74 LDF
			"H_MilCap_gen_F", // 75 Gendarmerie
			"H_MilCap_ghex_F", // 76 Green Hex
			"H_MilCap_grn", // 77 Green
			"H_MilCap_gry", // 78 Grey
			"H_MilCap_mcamo", // 79 MTP
			"H_MilCap_ocamo", // 80 Hex
			"H_MilCap_oucamo", // 81 Urban
			"H_MilCap_rucamo", // 82 Russia
			"H_MilCap_taiga", // 83 Taiga
			"H_MilCap_tna_F", // 84 Tropic
			"H_MilCap_wdl", // 85 Woodland
			"H_StrawHat", // 86
			"H_StrawHat_dark", // 87
			"H_TurbanO_blk", // 88
			"H_Watchcap_blk", // 89
			"H_Watchcap_camo", // 90 Green
			"H_Watchcap_cbr", // 91 Coyote
			"H_Watchcap_khk", // 92 Khaki
			"H_Watchcap_sgg" // 93 Sage
		];
	};
	case 4: {_return = ["ItemMap"];}; // Maps
	case 5: { // Medical
		_return = [
			"FirstAidKit", // 0
			"Medikit", // 1
			"Item_AntidoteKit_01_F", // 2
			"Item_DeconKit_01_F" // 3
		];
	};
	case 6: { // NVGs
		_return = [
			"NVGoggles_OPFOR", // 0 Black
			"NVGoggles", // 1 Brown
			"NVGoggles_INDEP", // 2 Green
			"NVGoggles_tna_F", // 3 Tropic
			"NVGogglesB_blk_F", // 4 Black
			"NVGogglesB_grn_F", // 5 Green
			"NVGogglesB_gry_F", // 6 Grey
			"O_NVGoggles_hex_F", // 7 Hex
			"O_NVGoggles_urb_F", // 8 Urban
			"O_NVGoggles_ghex_F", // 9 Green Hex
			"O_NVGoggles_grn_F" // 10 Green
		];
	};
	case 7: {_return = ["ItemRadio"];}; // Radios
	case 8: { // Terminals
		_return = [
			"ItemGPS", // 0
			"B_UavTerminal", // 1 NATO
			"O_UavTerminal", // 2 CSAT
			"I_UavTerminal", // 3 AAF
			"C_UavTerminal", // 4 Civilian
			"I_E_UavTerminal" // 5 LDF
		];
	};
	case 9: { // Tools
		_return = [
			"MineDetector", // 0
			"ToolKit" // 1
		];
	};
	case 10: {_return = ["ItemWatch"];}; // Watches
};
_return;
