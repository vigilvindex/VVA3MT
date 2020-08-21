_return = [
	"FlareWhite_F", // 0
	"FlareGreen_F", // 1
	"FlareRed_F", // 2
	"FlareYellow_F" // 3
];
_return;
/*
"3Rnd_UGL_FlareCIR_F", // 3Rnd 3GL Flares (IR)
"3Rnd_UGL_FlareGreen_F", // 3Rnd 3GL Flares (Green)
"3Rnd_UGL_FlareRed_F", // 3Rnd 3GL Flares (Red)
"3Rnd_UGL_FlareWhite_F", // 3Rnd 3GL Flares (White)
"3Rnd_UGL_FlareYellow_F", // 3Rnd 3GL Flares (Yellow)
"6Rnd_GreenSignal_F", // 6Rnd Signal Cylinder (Green)
"6Rnd_RedSignal_F", // 6Rnd Signal Cylinder (Red)
"8Rnd_82mm_Mo_Flare_white", // Flare (White)
"ACE_1Rnd_82mm_Mo_Illum", // 82mm Illumination Round
"ACE_40mm_Flare_green", // M661 Illumination Flare (Green)
"ACE_40mm_Flare_ir", // M992 Illumination IR Flare
"ACE_40mm_Flare_red", // M662 Illumination Flare (Red)
"ACE_40mm_Flare_white", // M583 Illumination Flare (White)
"ACE_HuntIR_M203", // HuntIR Round
"CUP_1Rnd_StarFlare_Green_M203", // M661 Green Star Parachute Round
"CUP_1Rnd_StarFlare_Red_M203", // M662 Red Star Parachute Round
"CUP_1Rnd_StarFlare_White_M203", // M583A1 White Star Parachute Round
"CUP_20Rnd_127mm_Mk45_ILLUM", // 20Rnd 127mm Mark 91 Illum-MT Magazine
"CUP_30Rnd_105mmILLUM_M119_M", // M314 Ilumination
"CUP_30Rnd_122mmILLUM_D30_M", // S-463 Ilumination
"CUP_6Rnd_FlareGreen_GP25_M", // 6 Rnd VGS-40 Flare Green
"CUP_6Rnd_FlareGreen_M203", // 6 Rnd M661 Flare Green
"CUP_6Rnd_FlareRed_GP25_M", // 6 Rnd VGS-40 Flare Red
"CUP_6Rnd_FlareRed_M203", // 6 Rnd M662 Flare Red
"CUP_6Rnd_FlareWhite_GP25_M", // 6 Rnd VGS-40 Flare White
"CUP_6Rnd_FlareWhite_M203", // 6 Rnd M583 Flare White
"CUP_6Rnd_FlareYellow_GP25_M", // 6 Rnd VGS-40 Flare Yellow
"CUP_6Rnd_FlareYellow_M203", // 6 Rnd M695 Flare Yellow
"CUP_8Rnd_82mm_Mo_Flare_white_veh", // Flare (White)
"CUP_FlareGreen_GP25_M", // VGS-40 Flare Green
"CUP_FlareGreen_M203", // M661 Flare Green
"CUP_FlareRed_GP25_M", // VGS-40 Flare Red
"CUP_FlareRed_M203", // M662 Flare Red
"CUP_FlareWhite_GP25_M", // VGS-40 Flare White
"CUP_FlareWhite_M203", // M583 Flare White
"CUP_FlareYellow_GP25_M", // VGS-40 Flare Yellow
"CUP_FlareYellow_M203", // M695 Flare Yellow
"CUP_IlumFlareGreen_GP25_M", // VG-40OP Illumination Flare (Green)
"CUP_IlumFlareRed_GP25_M", // VG-40OP Illumination Flare (Red)
"CUP_IlumFlareWhite_GP25_M", // VG-40OP Illumination Flare (White)
"FlareGreen_F", // Flare (Green)
"FlareRed_F", // Flare (Red)
"FlareWhite_F", // Flare (White)
"FlareYellow_F", // Flare (Yellow)
"rhs_grenade_mki_mag", // Mk 1 Illumination
"rhs_mag_155mm_485_2", // Illumination
"rhs_mag_3vs25m_10", // Flare 3VS25M
"rhs_mag_53_va_832a_10", // Agit. VA-832A
"rhs_mag_9m41_20", // 9M41 Flare
"rhs_mag_ILLUM_2a33", // 3VS-23 Flare
"rhs_mag_ILLUM_2a33_26", // 3VS-23 Flare
"rhs_mag_m314_ilum_4", // Illumination M314
"rhs_mag_M585_white", // M585 White Flare Round
"rhs_mag_m661_green", // M661 Green Flare Round
"rhs_mag_m662_red", // M662 Red Flare Round
"rhs_mag_nspn_green", // NSP-N (Green)
"rhs_mag_nspn_red", // NSP-N (Red)
"rhs_mag_nspn_yellow", // NSP-N (Yellow)
"rhs_mag_rsp30_green", // Flare Round (Green)
"rhs_mag_rsp30_red", // Flare Round (Red)
"rhs_mag_rsp30_white", // Flare Round (White)
"rhs_mag_s463", // 53-S-463
"rhs_mag_s463_2", // 53-S-463
"rhs_VG40OP_green", // VG-40OP (Green)
"rhs_VG40OP_red", // VG-40OP (Red)
"rhs_VG40OP_white", // VG-40OP (White)
"rhsusf_mag_6Rnd_M585_white", // 6Rnd. M585 White Flare Round
"rhsusf_mag_6Rnd_m661_green", // 6Rnd. M661 Green Flare Round
"rhsusf_mag_6Rnd_m662_red", // 6Rnd. M662 Red Flare Round
"UGL_FlareCIR_F", // Flare Round (IR)
"UGL_FlareGreen_F", // Flare Round (Green)
"UGL_FlareRed_F", // Flare Round (Red)
"UGL_FlareWhite_F", // Flare Round (White)
"UGL_FlareYellow_F", // Flare Round (Yellow)
"UK3CB_BAF_1Rnd_60mm_Mo_Flare_White", // 60mm White Flare
"UK3CB_BAF_1Rnd_81mm_Mo_Flare_White", // 81mm White Flare
"UK3CB_BAF_1Rnd_81mm_Mo_IRFlare_White", // 81mm IR Flare
"UK3CB_BAF_UGL_FlareCIR_F", // 40mm IR Flare (L123)
"UK3CB_BAF_UGL_FlareGreen_F", // 40mm Green Flare (L123)
"UK3CB_BAF_UGL_FlareRed_F", // 40mm Red Flare (L123)
"UK3CB_BAF_UGL_FlareWhite_F", // 40mm White Flare (L123)
"UK3CB_BAF_UGL_FlareYellow_F", // 40mm Yellow Flare (L123)
*/
