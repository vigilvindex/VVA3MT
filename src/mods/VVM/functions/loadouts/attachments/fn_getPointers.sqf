private ["_return","_select"];
_select = [];
_return = [
	// Vanilla
	"acc_pointer_IR",			// 0 Laser Pointer (red)
	"acc_flashlight",			// 1 UTG Defender 126
	"acc_flashlight_pistol",	// 2 Pistol Flashlight
	"acc_flashlight_smg_01",	// 3 UTG Defender 126
	"acc_esd_01_flashlight",	// 4 SD Flashlight
	// GM
	"gm_zvn64_front",			// 5 ZVN-64/69 Front Post
	// RHS
	"rhs_acc_2dpZenit",					// 6 2DP
	"rhs_acc_2dpZenit_ris",				// 7 2DP (RIS)
	"rhs_acc_at4_handler",				// 8 AT-4 Peep hole handler
	"rhs_acc_perst1ik",					// 9 Perst-1IK
	"rhs_acc_perst1ik_ris",				// 10 Perst-1IK (RIS)
	"rhs_acc_perst3",					// 11 Perst-3
	"rhs_acc_perst3_2dp_h",				// 12 Perst-3/2DP (Laser)
	"rhs_acc_perst3_2dp_light_h",		// 13 Perst-3/2DP (Light)
	"rhs_acc_perst3_top",				// 14 Perst-3 (Top)
	"rhs_item_flightrecorder", 			// 15 Flight recorder
	"rhsgref_K98k_acc_sighthood_add",	// 16 K98k Sight Hood
	"rhsusf_acc_anpeq15",				// 17 AN/PEQ-15/M952V (Laser)
	"rhsusf_acc_anpeq15_bk",			// 18 AN/PEQ-15/M952V Black (Laser)
	"rhsusf_acc_anpeq15_bk_light",		// 19 AN/PEQ-15/M952V Black (Light)
	"rhsusf_acc_anpeq15_bk_top",		// 20 AN/PEQ-15 Black (Top)
	"rhsusf_acc_anpeq15_light",			// 21 AN/PEQ-15/M952V (Light)
	"rhsusf_acc_anpeq15_top",			// 22 AN/PEQ-15 (Top)
	"rhsusf_acc_anpeq15_wmx",			// 23 AN/PEQ-15 + WMX (laser)
	"rhsusf_acc_anpeq15_wmx_light",		// 24 AN/PEQ-15 + WMX (light)
	"rhsusf_acc_anpeq15A",				// 25 AN/PEQ-15A
	"rhsusf_acc_anpeq15side",			// 26 AN/PEQ-15
	"rhsusf_acc_anpeq15side_bk",		// 27 AN/PEQ-15 Black
	"rhsusf_acc_anpeq16a",				// 28 AN/PEQ-16A (Laser)
	"rhsusf_acc_anpeq16a_light",		// 29 AN/PEQ-16A (Light)
	"rhsusf_acc_anpeq16a_light_top",	// 30 AN/PEQ-16A (Top/Light)
	"rhsusf_acc_anpeq16a_top",			// 31 AN/PEQ-16A (Top/Laser)
	"rhsusf_acc_M952V",					// 32 M952V
	"rhsusf_acc_wmx",					// 33 WMX Flashlight
	"rhsusf_acc_wmx_bk",				// 34 WMX Flashlight (Black)
	// 3CB
	"UK3CB_BAF_Flashlight_L105A1",		// 35 Flashlight (L105A1)
	"UK3CB_BAF_Flashlight_L131A1",		// 36 Flashlight (L131A1)
	"UK3CB_BAF_Flashlight_L91A1",		// 37 Surefire Weapon light
	"UK3CB_BAF_L105A1_LLM_FL_G",		// 38 Steiner DBAL-PL
	"UK3CB_BAF_L105A1_LLM_FL_R",		// 39 Steiner DBAL-PL
	"UK3CB_BAF_L105A1_LLM_IR_G",		// 40 Steiner DBAL-PL (Green)
	"UK3CB_BAF_L105A1_LLM_IR_R",		// 41 Steiner DBAL-PL (Red)
	"UK3CB_BAF_L105A1_LLM_VL_G",		// 42 Steiner DBAL-PL
	"UK3CB_BAF_L105A1_LLM_VL_R",		// 43 Steiner DBAL-PL
	"UK3CB_BAF_Laser_L131A1",			// 44 Glock-17 Laser(IR)
	"UK3CB_BAF_LLM_Flashlight_Black",	// 45 LLM Mk3 Flashlight (Black)
	"UK3CB_BAF_LLM_Flashlight_Tan",		// 46 LLM Mk3 Flashlight (Tan)
	"UK3CB_BAF_LLM_IR_Black",			// 47 LLM Mk3 IR (Black)
	"UK3CB_BAF_LLM_IR_Tan",				// 48 LLM Mk3 IR (Tan)	
	// CUP
	"CUP_acc_ANPEQ_15",							// 49 AN/PEQ-15 Laser (Tan)
	"CUP_acc_ANPEQ_15_Black",					// 50 AN/PEQ-15 Laser (Black)
	"CUP_acc_ANPEQ_15_Black_Top",				// 51 AN/PEQ-15 Laser (Top/Black)
	"CUP_acc_ANPEQ_15_Flashlight_Black_L",		// 52 AN/PEQ-15 Laser + Flashlight (Black)
	"CUP_acc_ANPEQ_15_Flashlight_OD_L",			// 53 AN/PEQ-15 Laser + Flashlight (OD)
	"CUP_acc_ANPEQ_15_Flashlight_Tan_L",		// 54 AN/PEQ-15 Laser + Flashlight (Tan)
	"CUP_acc_ANPEQ_15_OD",						// 55 AN/PEQ-15 Laser (OD)
	"CUP_acc_ANPEQ_15_OD_Top",					// 56 AN/PEQ-15 Laser (OD/Top)
	"CUP_acc_ANPEQ_15_Tan_Top",					// 57 AN/PEQ-15 Laser (Top/Tan)
	"CUP_acc_ANPEQ_15_Top_Flashlight_Black_L",	// 58 AN/PEQ-15 Laser + Flashlight (Top/Black)
	"CUP_acc_ANPEQ_15_Top_Flashlight_OD_L",		// 59 AN/PEQ-15 Laser + Flashlight (Top/OD)
	"CUP_acc_ANPEQ_15_Top_Flashlight_Tan_L",	// 60 AN/PEQ-15 Laser + Flashlight (Top/Tan)
	"CUP_acc_ANPEQ_2_Black_Top",				// 61 AN/PEQ-2 Laser (Top/Black)
	"CUP_acc_ANPEQ_2_camo",						// 62 AN/PEQ-2 Laser (OD)
	"CUP_acc_ANPEQ_2_Coyote_Top",				// 63 AN/PEQ-2 Laser (Top/Coyote)
	"CUP_acc_ANPEQ_2_desert",					// 64 AN/PEQ-2 Laser (Coyote)
	"CUP_acc_ANPEQ_2_Flashlight_Black_L",		// 65 AN/PEQ-2 Laser + Flashlight (Top/Black)
	"CUP_acc_ANPEQ_2_Flashlight_Coyote_L",		// 66 AN/PEQ-2 Laser + Flashlight (Top/Coyote)
	"CUP_acc_ANPEQ_2_Flashlight_OD_L",			// 67 AN/PEQ-2 Laser + Flashlight (Top/OD)
	"CUP_acc_ANPEQ_2_grey",						// 68 AN/PEQ-2 Laser (Black)
	"CUP_acc_ANPEQ_2_OD_Top",					// 69 AN/PEQ-2 Laser (Top/OD)
	"CUP_acc_CZ_M3X",							// 70 CZ M3X Pistol Flashlight/Laser
	"CUP_acc_Flashlight",						// 71 Flashlight (Black)
	"CUP_acc_Flashlight_desert",				// 72 Flashlight (Desert)
	"CUP_acc_Flashlight_MP5SD",					// 73 MP5SD6 Flashlight
	"CUP_acc_Flashlight_wdl",					// 74 Flashlight (Woodland)
	"CUP_acc_Glock17_Flashlight",				// 75 Glock 17 Flashlight
	"CUP_acc_LLM",								// 76 LLM MKIII
	"CUP_acc_LLM01_coyote_L",					// 77 LLM-01 (Coyote)
	"CUP_acc_LLM01_desert_L",					// 78 LLM-01 (Desert)
	"CUP_acc_LLM01_hex_L",						// 79 LLM-01 (Hex)
	"CUP_acc_LLM01_L",							// 80 LLM-01
	"CUP_acc_LLM01_od_L",						// 81 LLM-01 (OD)
	"CUP_acc_LLM_black",						// 82 LLM MKIII (Black)
	"CUP_acc_LLM_od",							// 83 LLM MKIII (OD)
	"CUP_acc_mk23_lam_f",						// 84 Prototype Laser Aiming Module
	"CUP_acc_MLPLS_Laser",						// 85 Pistol IR Laser Sight
	"CUP_acc_XM8_light_module",					// 86 XM8 Underbarrel Light Module
	"CUP_Mxx_camo",								// 87 M24/M40 camo
	"CUP_Mxx_camo_half",						// 88 M24/M40 camo half
	"CUP_SVD_camo_d",							// 89 SVD camo desert
	"CUP_SVD_camo_d_half",						// 90 SVD half camo desert
	"CUP_SVD_camo_g",							// 91 SVD camo green
	"CUP_SVD_camo_g_half",						// 92 SVD half camo green
	// ACE
	"ACE_acc_pointer_green"						// 93 Laser Pointer (green)
];
if ((!isNil "_this") AND (count _this > 0)) then {{_select pushBackUnique (_return select _x)} forEach _this;_return = _select;};
_return;
