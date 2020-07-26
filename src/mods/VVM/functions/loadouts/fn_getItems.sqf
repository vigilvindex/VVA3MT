// _binoculars = 0 call VVM_fnc_getItems; _compasses = 1 call VVM_fnc_getItems;
// diag_log format ["# %1 #% 2 # %3 # VVM_fnc_getItems _this = %4 #",time,__FILE__ select [count PATH],__LINE__,_this];
private _return = [];
switch (_this) do {
	case 0: {
		_return = [								// Binoculars
			"Binocular",						// 0 (Vanilla)
			"Rangefinder",						// 1 (Vanilla)
			"Laserdesignator",					// 2 Sand (Vanilla)
			"Laserdesignator_01_khk_F",			// 3 Khaki (Apex)
			"Laserdesignator_02",				// 4 Hex (Mark)
			"Laserdesignator_02_ghex_F",		// 5 Green Hex (Apex)
			"Laserdesignator_03",				// 6 Olive (Mark)
			"gm_df7x40_blk",					// 7 Black (GM)
			"gm_ferod16_des",					// 8 Desert (GM)
			"gm_ferod16_oli",					// 9 Olive (GM)
			"gm_ferod16_win",					// 10 Winter(GM)
			"ACE_MX2A",							// 11 (ACE)
			"ace_dragon_sight",					// 12 (ACE)
			"ACE_VectorDay",					// 13 (ACE)
			"ACE_Vector",						// 14 (ACE)
			"ACE_Yardage450",					// 15 (ACE)
			"CUP_SOFLAM",						// 16 (CUP)
			"CUP_LRTV",							// 17 (CUP)
			"CUP_Vector21Nite",					// 18 (CUP)
			"rhs_pdu4",							// 19 (RHS AFRF)
			"rhs_tr8_periscope",				// 20 (RHS AFRF)
			"rhs_tr8_periscope_pip",			// 21 (RHS AFRF)
			"rhsusf_bino_lerca_1200_black",		// 22 (RHS USAF)
			"rhsusf_bino_lerca_1200_tan",		// 23 (RHS USAF)
			"rhsusf_bino_leopold_mk4",			// 24 (RHS USAF)
			"rhsusf_bino_m24",					// 25 (RHS USAF)
			"rhsusf_bino_m24_ARD",				// 26 (RHS USAF)
			"rhsusf_bino_Irf_Vector21",			// 27 (RHS USAF)
			"rhssaf_zrak_rd7j",					// 29 (RHS SAF)
			"UK3CB_BAF_Javelin_CLU",			// 30 (BAF)
			"UK3CB_BAF_Soflam_laserdesignator",	// 31 (BAF)
			"LIB_Binocular_US",					// 32 (IFA)
			"LIB_Binocular_UK",					// 33 (IFA)
			"LIB_Binocular_GER",				// 34 (IFA)
			"LIB_Binocular_SU"					// 35 (IFA)
		];
	};
	case 1: {
		_return = [						// Compasses
			"ItemCompass",				// 0 (Vanilla)
			"ge_gm_army_conat2",		// 1 (GM)
			"ge_gc_compass_f73",		// 2 (GM)
			"LIB_GER_ItemCompass",		// 3 (IFA)
			"LIB_GER_ItemCompass_deg"	// 4 (IFA)
		];
	};
	case 2: {
		_return = [							// Facewear
			"G_B_Diving",					// 0
			"H_BandMask_blk",				// 1
			"H_BandMask_demon",				// 2
			"H_BandMask_khk",				// 3
			"H_BandMask_reaper",			// 4
			"H_HeadSet_black_F",			// 5
			"H_HeadSet_orange_F",			// 6
			"H_HeadSet_red_F",				// 7
			"H_HeadSet_white_F",			// 8
			"H_HeadSet_yellow_F",			// 9
			"H_Shemag_khk",					// 10
			"H_Shemag_olive",				// 11
			"H_Shemag_olive_hs",			// 12
			"H_Shemag_tan",					// 13
			"H_ShemagOpen_khk",				// 14
			"H_ShemagOpen_tan",				// 15
			"H_WirelessEarpiece_F",			// 16
			"G_AirPurifyingRespirator_01_F"	// 17  (Contact)
		];
	};
	case 3: {
		_return = [						// Headgear
			"H_Bandanna_blu",			// 0
			"H_Bandanna_camo",			// 1 Woodland
			"H_Bandanna_cbr",			// 2 Coyote
			"H_Bandanna_gry",			// 3 Black
			"H_Bandanna_khk",			// 4 Khaki
			"H_Bandanna_khk_hs",		// 5 Khaki
			"H_Bandanna_mcamo",			// 6 MTP
			"H_Bandanna_sand",			// 7 Sand
			"H_Bandanna_sgg",			// 8 Sage
			"H_Bandanna_surfer",		// 9
			"H_Bandanna_surfer_blk",	// 10
			"H_Bandanna_surfer_grn",	// 11
			"H_Beret_02",				// 12 NATO
			"H_Beret_blk",				// 13 Black
			"H_Beret_blk_POLICE",		// 14
			"H_Beret_brn_SF",			// 15
			"H_Beret_Colonel",			// 16 NATO
			"H_Beret_EAF_01_F",			// 17 LDF
			"H_Beret_gen_F",			// 18 Gendarmerie
			"H_Beret_grn",				// 19 Green
			"H_Beret_grn_SF",			// 20
			"H_Beret_ocamo",			// 21 CSAT
			"H_Beret_red",				// 22 Red
			"H_Booniehat_dgtl",			// 23 AAF
			"H_Booniehat_dirty",		// 24
			"H_Booniehat_eaf",			// 25 LDF
			"H_Booniehat_grn",			// 26 Green
			"H_Booniehat_indp",			// 27 Khaki
			"H_Booniehat_khk",			// 28 Khaki
			"H_Booniehat_khk_hs",		// 29 Khaki
			"H_Booniehat_mcamo",		// 30 MTP
			"H_Booniehat_mgrn",			// 31 Green
			"H_Booniehat_oli",			// 32 Olive
			"H_Booniehat_taiga",		// 33
			"H_Booniehat_tan",			// 34 Sand
			"H_Booniehat_tna_F",		// 35 Tropic
			"H_Booniehat_wdl",			// 36 Woodland
			"H_Cap_Black_IDAP_F",		// 37
			"H_Cap_blk",				// 38 Black
			"H_Cap_blk_CMMG",			// 39
			"H_Cap_blk_ION",			// 40
			"H_Cap_blk_Raven",			// 41 AAF
			"H_Cap_blk_Syndikat_F",		// 42 Black
			"H_Cap_blu",				// 43
			"H_Cap_brn_SPECOPS",		// 44 OPFOR
			"H_Cap_grn",				// 45
			"H_Cap_grn_BI",				// 46
			"H_Cap_grn_Syndikat_F",		// 47
			"H_Cap_headphones",			// 48
			"H_Cap_khaki_specops_UK",	// 49
			"H_Cap_marshal",			// 50
			"H_Cap_oli",				// 51 Olive
			"H_Cap_oli_hs",				// 52
			"H_Cap_oli_Syndikat_F",		// 53
			"H_Cap_Orange_IDAP_F",		// 54
			"H_Cap_police",				// 55
			"H_Cap_press",				// 56
			"H_Cap_red",				// 57
			"H_Cap_surfer",				// 57
			"H_Cap_tan",				// 59
			"H_Cap_tan_specops_US",		// 60 US MTP
			"H_Cap_tan_Syndikat_F",		// 61 Tan
			"H_Cap_usblack",			// 62 US Black
			"H_Cap_White_IDAP_F",		// 63
			"H_Hat_blue",				// 64
			"H_Hat_brown",				// 65
			"H_Hat_camo",				// 66
			"H_Hat_checker",			// 67
			"H_Hat_grey",				// 68
			"H_Hat_Safari_olive_F",		// 69
			"H_Hat_Safari_sand_F",		// 70
			"H_Hat_tan",				// 71
			"H_MilCap_blue",			// 72
			"H_MilCap_dgtl",			// 73 AAF
			"H_MilCap_eaf",				// 74 LDF
			"H_MilCap_gen_F",			// 75 Gendarmerie
			"H_MilCap_ghex_F",			// 76 Green Hex
			"H_MilCap_grn",				// 77 Green
			"H_MilCap_gry",				// 78 Grey
			"H_MilCap_mcamo",			// 79 MTP
			"H_MilCap_ocamo",			// 80 Hex
			"H_MilCap_oucamo",			// 81 Urban
			"H_MilCap_rucamo",			// 82 Russia
			"H_MilCap_taiga",			// 83 Taiga
			"H_MilCap_tna_F",			// 84 Tropic
			"H_MilCap_wdl",				// 85 Woodland
			"H_StrawHat",				// 86
			"H_StrawHat_dark",			// 87
			"H_TurbanO_blk",			// 88
			"H_Watchcap_blk",			// 89
			"H_Watchcap_camo",			// 90 Green
			"H_Watchcap_cbr",			// 91 Coyote
			"H_Watchcap_khk",			// 92 Khaki
			"H_Watchcap_sgg"			// 93 Sage
		];
	};
	case 4: {_return = ["ItemMap"];}; // Maps
	case 5: {
		_return = [			// Medical
			"FirstAidKit",	// 0 (Vanilla)
			"Medikit"		// 1 (Vanilla)
		];
	};
	case 6: {
		_return = [					// NVGs
			"NVGoggles_OPFOR",		// 0 Black (Vanilla)
			"NVGoggles",			// 1 Brown (Vanilla)
			"NVGoggles_INDEP",		// 2 Green (Vanilla)
			"NVGoggles_tna_F",		// 3 Tropic (Apex)
			"NVGogglesB_blk_F",		// 4 ENVG-II Black (Apex)
			"NVGogglesB_grn_F",		// 5 ENVG-II Green (Apex)
			"NVGogglesB_gry_F",		// 6 ENVG-II Grey (Apex)
			"O_NVGoggles_hex_F",	// 7 Compact Hex (Apex)
			"O_NVGoggles_urb_F",	// 8 Compact Urban (Apex)
			"O_NVGoggles_ghex_F",	// 9 Compact Green Hex (Apex)
			"O_NVGoggles_grn_F"		// 10 Compact Green (Contact)
		];
	};
	case 7: {
		_return = [				// Radios
			"ItemRadio",		// 0 (Vanilla)
			"tf_anprc148jem",	// 1 (TFAR)
			"tf_anprc152",		// 2 (TFAR)
			"tf_anprc154",		// 3 (TFAR)
			"tf_fadak",			// 4 (TFAR)
			"tf_pnr1000a",		// 5 (TFAR)
			"tf_rf7800str"		// 6 (TFAR)
		];
	};
	case 8: {
		_return = [				// Terminals
			"ItemGPS",			// 0 (Vanilla)
			"B_UavTerminal",	// 1 NATO (Vanilla)
			"O_UavTerminal",	// 2 CSAT (Vanilla)
			"I_UavTerminal",	// 3 AAF (Vanilla)
			"C_UavTerminal",	// 4 Civilian (Orange)
			"I_E_UavTerminal"	// 5 LDF (Contact)
		];
	};
	case 9: {
		_return = [			// Tools
			"MineDetector",	// 0 (Vanilla)
			"ToolKit"		// 1 (Vanilla)
		];
	};
	case 10: {
		_return = [							// Watches
			"ItemWatch",					// 0 (Vanilla)
			"ChemicalDetector_01_watch_F",	// 1 (Contact)
			"gm_watch_kosei_80",			// 2 (GM)
			"ACE_Altimeter",				// 3 (ACE)
			"tf_microdagr",					// 4 (TFAR)
			"LIB_GER_ItemWatch"				// 5 (IFA)
		];
	};
};
_return;
