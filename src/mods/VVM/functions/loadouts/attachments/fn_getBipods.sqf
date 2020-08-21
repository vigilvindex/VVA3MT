private ["_return","_select"];
_select = [];
_return = [
	// Vanilla
	"bipod_01_F_blk",					// 0 Bipod (Black) [NATO]
	"bipod_01_F_khk",					// 1 Bipod (Khaki) [NATO]
	"bipod_01_F_mtp",					// 2 Bipod (MTP) [NATO]
	"bipod_01_F_snd",					// 3 Bipod (Sand) [NATO]
	"bipod_02_F_blk",					// 4 Bipod (Black) [CSAT]
	"bipod_02_F_hex",					// 5 Bipod (Hex) [CSAT]
	"bipod_02_F_tan",					// 6 Bipod (Tan) [CSAT]
	"bipod_02_F_arid",					// 7 Bipod (Arid) [Spetsnaz]	
	"bipod_02_F_lush",					// 8 Bipod (Lush) [Spetsnaz]
	"bipod_03_F_blk",					// 9 Bipod (Black) [AAF]
	"bipod_03_F_oli",					// 10 Bipod (Olive) [AAF]
	"ChemicalDetector_01_black_F",		// 11 Chemical Detector (Cover, Black)
	"ChemicalDetector_01_olive_F",		// 12 Chemical Detector (Cover, Olive)
	"ChemicalDetector_01_tan_F",		// 13 Chemical Detector (Cover, Tan)
	// RHS
	"rhs_acc_grip_ffg2",				// 14 FFG-2
	"rhs_acc_grip_rk2",					// 15 RK-2
	"rhs_acc_grip_rk6",					// 16 RK-6
	"rhs_acc_harris_swivel",			// 17 Harris Bipod
	"rhsusf_acc_grip1",					// 18 Grip Pod
	"rhsusf_acc_grip2",					// 19 AFG Grip
	"rhsusf_acc_grip2_tan",				// 20 AFG Grip (Tan)
	"rhsusf_acc_grip2_wd",				// 21 AFG Grip (Woodland)
	"rhsusf_acc_grip3",					// 22 TD Vertical Grip
	"rhsusf_acc_grip3_tan",				// 23 TD Vertical Grip (Tan)
	"rhsusf_acc_grip4",					// 24 SAW Grip
	"rhsusf_acc_grip4_bipod",			// 25 SAW Grip & Bipod
	"rhsusf_acc_harris_bipod",			// 26 Harris Bipod
	"rhsusf_acc_harris_swivel",			// 27 Harris Bipod
	"rhsusf_acc_kac_grip",				// 28 KAC Vertical Grip
	"rhsusf_acc_kac_grip_saw_bipod",	// 29 KAC Grip & SAW Bipod
	"rhsusf_acc_m14_bipod",				// 30 Multipurpose Bipod
	"rhsusf_acc_rvg_blk",				// 31 RVG Grip (Black)
	"rhsusf_acc_rvg_de",				// 32 RVG Grip (Dark Earth)
	"rhsusf_acc_saw_bipod",				// 33 SAW Bipod
	"rhsusf_acc_saw_lw_bipod",			// 34 SAW Improved Bipod
	"rhsusf_acc_tacsac_blk",			// 35 Tac-Sac Grip (Black)
	"rhsusf_acc_tacsac_blue",			// 36 Tac-Sac Grip (Blue)
	"rhsusf_acc_tacsac_tan",			// 37 Tac-Sac Grip (Tan)
	"rhsusf_acc_tdstubby_blk",			// 38 TD Stubby Grip (Black)
	"rhsusf_acc_tdstubby_tan",			// 39 TD Stubby Grip (Tan)
	// 3CB
	"UK3CB_underbarrel_acc_afg",		// 40 A-grip (Black)
	"UK3CB_underbarrel_acc_afg_d",		// 41 A-grip (Desert)
	"UK3CB_underbarrel_acc_afg_g",		// 42 A-grip (Green)
	"UK3CB_underbarrel_acc_afg_t",		// 43 A-grip (Tan)
	"UK3CB_underbarrel_acc_afg_w",		// 44 A-grip (Winter)
	"UK3CB_underbarrel_acc_bipod",		// 45 Harris Bipod
	"UK3CB_underbarrel_acc_fgrip",		// 46 Folding-grip
	"UK3CB_underbarrel_acc_fgrip_bipod",// 47 Folding-grip and Harris Bipod
	"UK3CB_underbarrel_acc_grippod",	// 48 Grip-pod (Black)
	"UK3CB_underbarrel_acc_grippod_d",	// 49 Grip-pod (Desert)
	"UK3CB_underbarrel_acc_grippod_g",	// 50 Grip-pod (Green)
	"UK3CB_underbarrel_acc_grippod_t",	// 51 Grip-pod (Tan)
	"UK3CB_underbarrel_acc_grippod_w",	// 52 Grip-pod (Winter)
	// CUP
	"CUP_bipod_FNFAL",					// 53 Bipod FAL
	"CUP_bipod_G3",						// 54 G3 bipod (body mount)
	"CUP_Bipod_G36",					// 55 G36 Bipod
	"CUP_Bipod_G36_desert",				// 56 G36 Bipod (Desert)
	"CUP_Bipod_G36_wood",				// 57 G36 Bipod (Woodland)
	"CUP_bipod_G3SG1",					// 58 G3SG1 bipod
	"CUP_bipod_Harris_1A2_L",			// 59 Harris 1A2-L Bipod (worn)
	"CUP_bipod_Harris_1A2_L_BLK",		// 60 Harris 1A2-L Bipod
	"CUP_bipod_VLTOR_Modpod",			// 61 VLTOR Modpod Bipod (Tan)
	"CUP_bipod_VLTOR_Modpod_black",		// 62 VLTOR Modpod Bipod (Black)
	"CUP_bipod_VLTOR_Modpod_od"			// 63 VLTOR Modpod Bipod (OD)
];
if ((!isNil "_this") AND (count _this > 0)) then {{_select pushBackUnique (_return select _x)} forEach _this;_return = _select;};
_return;
