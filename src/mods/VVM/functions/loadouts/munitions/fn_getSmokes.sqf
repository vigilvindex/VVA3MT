_return = [
	"SmokeShell", 				// 0
	"SmokeShellBlue",			// 1
	"SmokeShellRed", 			// 2
	"SmokeShellGreen", 			// 3
	"SmokeShellYellow", 		// 4
	"SmokeShellOrange", 		// 5
	"SmokeShellPurple", 		// 6
	"gm_smokeshell_grn_dm21",	// 7
	"gm_smokeshell_red_dm23",	// 8
	"gm_smokeshell_yel_dm26",	// 9
	"gm_smokeshell_org_dm32",	// 10
	"gm_smokeshell_wht_dm25",	// 11
	"gm_smokeshell_grn_gc",		// 12
	"gm_smokeshell_blk_gc",		// 13
	"gm_smokeshell_red_gc",		// 14
	"gm_smokeshell_yel_gc",		// 15
	"gm_smokeshell_blu_gc",		// 16
	"gm_smokeshell_org_gc",		// 17
	"gm_smokeshell_wht_gc"		// 18
];
_return;
/*
"1Rnd_Smoke_Grenade_shell", // Smoke Round (White)
"1Rnd_SmokeBlue_Grenade_shell", // Smoke Round (Blue)
"1Rnd_SmokeGreen_Grenade_shell", // Smoke Round (Green)
"1Rnd_SmokeOrange_Grenade_shell", // Smoke Round (Orange)
"1Rnd_SmokePurple_Grenade_shell", // Smoke Round (Purple)
"1Rnd_SmokeRed_Grenade_shell", // Smoke Round (Red)
"1Rnd_SmokeYellow_Grenade_shell", // Smoke Round (Yellow)
"3Rnd_Smoke_Grenade_shell", // 3Rnd 3GL Smoke Rounds (White)
"3Rnd_SmokeBlue_Grenade_shell", // 3Rnd 3GL Smoke Rounds (Blue)
"3Rnd_SmokeGreen_Grenade_shell", // 3Rnd 3GL Smoke Rounds (Green)
"3Rnd_SmokeOrange_Grenade_shell", // 3Rnd 3GL Smoke Rounds (Orange)
"3Rnd_SmokePurple_Grenade_shell", // 3Rnd 3GL Smoke Rounds (Purple)
"3Rnd_SmokeRed_Grenade_shell", // 3Rnd 3GL Smoke Rounds (Red)
"3Rnd_SmokeYellow_Grenade_shell", // 3Rnd 3GL Smoke Rounds (Yellow)
"ACE_Chemlight_HiBlue", // Chemlight (Hi Blue)
"ACE_Chemlight_HiGreen", // Chemlight (Hi Green)
"ACE_Chemlight_HiRed", // Chemlight (Hi Red)
"ACE_Chemlight_HiWhite", // Chemlight (Hi White)
"ACE_Chemlight_HiYellow", // Chemlight (Hi Yellow)
"ACE_Chemlight_IR", // Chemlight (IR)
"ACE_Chemlight_Orange", // Chemlight (Orange)
"ACE_Chemlight_UltraHiOrange", // Chemlight (Ultra-Hi Orange)
"ACE_Chemlight_White", // Chemlight (White)
"ACE_CTS9", // CTS 7290 9-bang Flash Grenade
"ACE_HandFlare_Green", // M127A1 Hand Held Signal (Green)
"ACE_HandFlare_Red", // M127A1 Hand Held Signal (Red)
"ACE_HandFlare_White", // M127A1 Hand Held Signal (White)
"ACE_HandFlare_Yellow", // M127A1 Hand Held Signal (Yellow)
"ACE_M14", // AN-M14 Incendiary Grenade
"ACE_M84", // M84 Stun Grenade
"Chemlight_blue", // Chemlight (Blue)
"Chemlight_green", // Chemlight (Green)
"Chemlight_red", // Chemlight (Red)
"Chemlight_yellow", // Chemlight (Yellow)
"CUP_1Rnd_SMOKE_GP25_M", // VDG-40 White Smoke
"CUP_1Rnd_Smoke_M203", // M714 Smoke White
"CUP_1Rnd_SmokeGreen_GP25_M", // VDG-40 Smoke Green
"CUP_1Rnd_SmokeGreen_M203", // M715 Smoke Green
"CUP_1Rnd_SmokeRed_GP25_M", // VDG-40 Smoke Red
"CUP_1Rnd_SmokeRed_M203", // M713 Smoke Red
"CUP_1Rnd_SmokeYellow_GP25_M", // VDG-40 Smoke Yellow
"CUP_1Rnd_SmokeYellow_M203", // M716 Smoke Yellow
"CUP_6Rnd_Smoke_GP25", // 6 Rnd VDG-40 White Smoke
"CUP_6Rnd_Smoke_M203", // 6 Rnd M714 Smoke White
"CUP_6Rnd_SmokeGreen_GP25", // 6 Rnd VDG-40 Smoke Green
"CUP_6Rnd_SmokeGreen_M203", // 6 Rnd M715 Smoke Green
"CUP_6Rnd_SmokeRed_GP25", // 6 Rnd VDG-40 Smoke Red
"CUP_6Rnd_SmokeRed_M203", // 6 Rnd M713 Smoke Red
"CUP_6Rnd_SmokeYellow_GP25", // 6 Rnd VDG-40 Smoke Yellow
"CUP_6Rnd_SmokeYellow_M203", // 6 Rnd M716 Smoke Yellow
"gm_smokeshell_blk_gc", // Smoke Grenade (Black)
"gm_smokeshell_blu_gc", // Smoke Grenade (Blue)
"gm_smokeshell_grn_dm21", // Smoke Grenade DM21 (Green)
"gm_smokeshell_grn_gc", // Smoke Grenade (Green)
"gm_smokeshell_org_dm32", // Smoke Grenade DM32 (Orange)
"gm_smokeshell_org_gc", // Smoke Grenade (Orange)
"gm_smokeshell_red_dm23", // Smoke Grenade DM23 (Red)
"gm_smokeshell_red_gc", // Smoke Grenade (Red)
"gm_smokeshell_wht_dm25", // Smoke Grenade DM25 (White)
"gm_smokeshell_wht_gc", // Smoke Grenade (White)
"gm_smokeshell_yel_dm26", // Smoke Grenade DM26 (Yellow)
"gm_smokeshell_yel_gc", // Smoke Grenade (Yellow)
"rhs_GRD40_Green", // GRD-40 (Green)
"rhs_GRD40_Red", // GRD-40 (Red)
"rhs_GRD40_White", // GRD-40 (White)
"rhs_grenade_anm8_mag", // M8 Smoke Grenade
"rhs_grenade_nbhgr39_mag", // Nb.Hgr.39 (Early)
"rhs_grenade_nbhgr39B_mag", // Nb.Hgr.39B (Late)
"rhs_mag_an_m14_th3", // AN-M14 TH3 Incendenary Grenade
"rhs_mag_an_m8hc", // AN-M8HC White Smoke
"rhs_mag_m18_green", // M18 Green Smoke Grenade
"rhs_mag_m18_purple", // M18 Purple Smoke Grenade
"rhs_mag_m18_red", // M18 Red Smoke Grenade
"rhs_mag_m18_yellow", // M18 Yellow Smoke Grenade
"rhs_mag_m713_Red", // M713 Red Smoke Round
"rhs_mag_m714_White", // M714 White Smoke Round
"rhs_mag_m715_Green", // M715 Green Smoke Round
"rhs_mag_m716_yellow", // M716 Yellow Smoke Round
"rhs_mag_nspd", // NSP-D
"rhs_mag_rdg2_black", // RDG-2 (Black)
"rhs_mag_rdg2_white", // RDG-2 (White)
"rhssaf_mag_brd_m83_blue", // BRD M83 (Blue)
"rhssaf_mag_brd_m83_green", // BRD M83 (Green)
"rhssaf_mag_brd_m83_orange", // BRD M83 (Orange)
"rhssaf_mag_brd_m83_red", // BRD M83 (Red)
"rhssaf_mag_brd_m83_white", // BRD M83 (White)
"rhssaf_mag_brd_m83_yellow", // BRD M83 (Yellow)
"rhssaf_mag_brz_m88", // BRZ M88
"rhsusf_mag_6Rnd_M713_red", // 6Rnd. M713 Red Smoke Round
"rhsusf_mag_6Rnd_M714_white", // 6Rnd. M714 White Smoke Round
"rhsusf_mag_6Rnd_M715_green", // 6Rnd. M715 Green Smoke Round
"rhsusf_mag_6Rnd_M716_yellow", // 6Rnd. M716 Yellow Smoke Round
"SmokeShell", // M83 Smoke Grenade (White)
"SmokeShellBlue", // M18 Smoke Grenade (Blue)
"SmokeShellGreen", // M18 Smoke Grenade (Green)
"SmokeShellOrange", // M18 Smoke Grenade (Orange)
"SmokeShellPurple", // M18 Smoke Grenade (Purple)
"SmokeShellRed", // M18 Smoke Grenade (Red)
"SmokeShellYellow", // M18 Smoke Grenade (Yellow)
"UK3CB_BAF_SmokeShell", // L50A1 White Smoke Grenade
"UK3CB_BAF_SmokeShellBlue", // L71 Blue Smoke Grenade
"UK3CB_BAF_SmokeShellGreen", // L68 Green Smoke Grenade
"UK3CB_BAF_SmokeShellOrange", // L69 Orange Smoke Grenade
"UK3CB_BAF_SmokeShellPurple", // L101 Purple Smoke Grenade
"UK3CB_BAF_SmokeShellRed", // L70 Red Smoke Grenade
"UK3CB_BAF_SmokeShellYellow", // L100 Yellow Smoke Grenade
*/
