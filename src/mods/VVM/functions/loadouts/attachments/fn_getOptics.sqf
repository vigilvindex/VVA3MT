private ["_return","_select"];
_select = [];
_return = [
	// Vanilla
	"optic_Aco", // C-More Railway (Red)
	"optic_ACO_grn", // C-More Railway (Green)
	"optic_ACO_grn_smg", // C-More Railway SMG (Green)
	"optic_Aco_smg", // C-More Railway SMG (Red)
	"optic_AMS", // US Optics MR-10 (Black)
	"optic_AMS_khk", // US Optics MR-10 (Khaki)
	"optic_AMS_snd", // US Optics MR-10 (Sand)
	"optic_Arco", // ELCAN SpecterOS (Tan)
	"optic_Arco_AK_arid_F", // ARCO AK (Arid)
	"optic_Arco_AK_blk_F", // ARCO AK (Black)
	"optic_Arco_AK_lush_F", // ARCO AK (Lush)
	"optic_Arco_arid_F", // ARCO (Arid)
	"optic_Arco_blk_F", // ELCAN SpecterOS (Black)
	"optic_Arco_ghex_F", // ELCAN SpecterOS (Green Hex)
	"optic_Arco_lush_F", // ARCO (Lush)
	"optic_DMS", // Burris XTR II
	"optic_DMS_ghex_F", // Burris XTR II (Green Hex)
	"optic_DMS_weathered_F", // DMS (Old)
	"optic_DMS_weathered_Kir_F", // DMS Kir (Old)
	"optic_ERCO_blk_F", // SIG BRAVO4 / ROMEO3 (Black)
	"optic_ERCO_khk_F", // SIG BRAVO4 / ROMEO3 (Khaki)
	"optic_ERCO_snd_F", // SIG BRAVO4 / ROMEO3 (Sand)
	"optic_Hamr", // Leupold Mark 4 HAMR
	"optic_Hamr_khk_F", // Leupold Mark 4 HAMR (Khaki)
	"optic_Holosight", // EOTech XPS3 (Tan)
	"optic_Holosight_arid_F", // Mk17 Holosight (Arid)
	"optic_Holosight_blk_F", // EOTech XPS3 (Black)
	"optic_Holosight_khk_F", // EOTech XPS3 (Khaki)
	"optic_Holosight_lush_F", // Mk17 Holosight (Lush)
	"optic_Holosight_smg", // EOTech XPS3 SMG (Tan)
	"optic_Holosight_smg_blk_F", // EOTech XPS3 SMG (Black)
	"optic_Holosight_smg_khk_F", // EOTech XPS3 SMG (Khaki)
	"optic_ico_01_black_f", // Promet Modular Sight (Black)
	"optic_ico_01_camo_f", // Promet Modular Sight (Camo)
	"optic_ico_01_f", // Promet Modular Sight
	"optic_ico_01_sand_f", // Promet Modular Sight (Sand)
	"optic_KHS_blk", // KAHLES Helia (Black)
	"optic_KHS_hex", // KAHLES Helia (Hex)
	"optic_KHS_old", // KAHLES Helia (Old)
	"optic_KHS_tan", // KAHLES Helia (Tan)
	"optic_LRPS", // Nightforce NXS
	"optic_LRPS_ghex_F", // Nightforce NXS (Green Hex)
	"optic_LRPS_tna_F", // Nightforce NXS (Jungle)
	"optic_MRCO", // IOR-Valdada Pitbull 2
	"optic_MRD", // MRD
	"optic_MRD_black", // MRD (Black)
	"optic_Nightstalker", // Nightstalker
	"optic_NVS", // NVS
	"optic_SOS", // MOS
	"optic_SOS_khk_F", // MOS (Khaki)
	"optic_tws", // TWS
	"optic_tws_mg", // TWS MG
	"optic_Yorris", // Burris FastFire 2
	// GM
	"gm_c79a1_blk", // C79A1
	"gm_c79a1_oli", // C79A1 (Olive)
	"gm_feroz24_blk", // Fero Z-24
	"gm_feroz24_des", // Fero Z-24 (Tan)
	"gm_feroz2x17_pzf44_2_blk", // Fero Z 2x17
	"gm_feroz2x17_pzf44_2_des", // Fero Z 2x17 (Tan)
	"gm_feroz2x17_pzf44_2_win", // Fero Z 2x17 (Winter)
	"gm_feroz2x17_pzf84_blk", // Fero Z 2x17
	"gm_feroz2x17_pzf84_des", // Fero Z 2x17 (Tan)
	"gm_feroz2x17_pzf84_win", // Fero Z 2x17 (Winter)
	"gm_pgo7v_blk", // PGO-7V
	"gm_pso1_gry", // PSO-1
	"gm_zfk4x25_blk", // ZFK 4x25
	"gm_zvn64_rear_ak", // ZVN-64 Rear Sight
	"gm_zvn64_rear_rpk", // ZVN-69 Rear Sight
	// RHS
	"rhs_acc_1p29", // 1P29
	"rhs_acc_1p63", // 1P63
	"rhs_acc_1p78", // 1P78
	"rhs_acc_1p87", // 1P87
	"rhs_acc_1pn34", // 1PN34
	"rhs_acc_1pn93_1", // 1PN93-1
	"rhs_acc_1pn93_2", // 1PN93-2
	"rhs_acc_dh520x56", // DH 5-20x56
	"rhs_acc_ekp1", // EKP-1S-03
	"rhs_acc_ekp8_02", // EKP-8-02
	"rhs_acc_ekp8_18", // EKP-8-18
	"rhs_acc_nita", // NIT-A
	"rhs_acc_okp7_dovetail", // OKP7
	"rhs_acc_okp7_picatinny", // OKP7 (Picatinny)
	"rhs_acc_pgo7v", // PGO-7V
	"rhs_acc_pgo7v2", // PGO-7V2
	"rhs_acc_pgo7v3", // PGO-7V3
	"rhs_acc_pkas", // PK-AS
	"rhs_acc_pso1m2", // PSO-1M2
	"rhs_acc_pso1m21", // PSO-1M2-1
	"rhs_acc_rakursPM", // 1P76 Rakurs-PM
	"rhs_optic_maaws", // M3 MAAWS sight
	"rhs_weap_optic_smaw", // SMAW sight
	"rhsgref_acc_l1a1_anpvs2", // AN/PVS-2
	"rhsgref_acc_l1a1_l2a2", // L2A2 SUIT
	"rhsgref_acc_RX01_camo", // RX01 Camo Reflex
	"rhsgref_acc_RX01_NoFilter_camo", // RX01 Camo (w/o Filter)
	"rhsgref_mg42_acc_AAsight", // MG42 AA Sight
	"rhsusf_acc_ACOG", // M150 RCO
	"rhsusf_acc_ACOG2", // M150 RCO (ARD)
	"rhsusf_acc_ACOG2_USMC", // AN/PVQ-31A (ARD)
	"rhsusf_acc_ACOG3", // M150 RCO (ARD/Lens Cover)
	"rhsusf_acc_ACOG3_USMC", // AN/PVQ-31A (ARD/Lens Cover)
	"rhsusf_acc_ACOG_anpvs27", // M150 RCO + AN/PVS-27
	"rhsusf_acc_ACOG_d", // TA31RCO (Desert)
	"rhsusf_acc_ACOG_MDO", // SU-260/P (MDO)
	"rhsusf_acc_ACOG_RMR", // TA31RCO-RMR
	"rhsusf_acc_ACOG_USMC", // AN/PVQ-31A RCO
	"rhsusf_acc_ACOG_wd", // TA31RCO (Woodland)
	"rhsusf_acc_anpas13gv1", // AN/PAS-13G(V)1
	"rhsusf_acc_anpvs27", // AN/PVS-27
	"rhsusf_acc_compm4", // M68 CCO
	"rhsusf_acc_ELCAN", // M145 MGO
	"rhsusf_acc_ELCAN_ard", // M145 MGO (ARD)
	"rhsusf_acc_EOTECH", // EXPS3
	"rhsusf_acc_eotech_552", // M552 CCO
	"rhsusf_acc_eotech_552_d", // M552 CCO (Desert)
	"rhsusf_acc_eotech_552_wd", // M552 CCO (Woodland)
	"rhsusf_acc_eotech_xps3", // XPS3
	"rhsusf_acc_g33_T1", // G33 + SU-278/PVS
	"rhsusf_acc_g33_xps3", // G33 + XPS3
	"rhsusf_acc_g33_xps3_tan", // G33 + XPS3 (Tan)
	"rhsusf_acc_LEUPOLDMK4", // Mk. 4 ER/T 3.5-10x M3
	"rhsusf_acc_LEUPOLDMK4_2", // Mk. 4 ER/T 6.5-20x M5
	"rhsusf_acc_LEUPOLDMK4_2_d", // Mk. 4 M5 (Desert)
	"rhsusf_acc_LEUPOLDMK4_2_mrds", // Mk. 4 M5 (MRDS)
	"rhsusf_acc_LEUPOLDMK4_d", // Mk. 4 M3 (Desert)
	"rhsusf_acc_LEUPOLDMK4_wd", // Mk. 4 M3 (Woodland)
	"rhsusf_acc_M2A1", // M2A1 GL Sight
	"rhsusf_acc_M8541", // M8541
	"rhsusf_acc_M8541_low", // M8541 (low mount)
	"rhsusf_acc_M8541_low_d", // M8541 (low mount/Desert)
	"rhsusf_acc_M8541_low_wd", // M8541 (low mount/Woodland)
	"rhsusf_acc_M8541_mrds", // M8541 (MRDS)
	"rhsusf_acc_mrds", // MRDS
	"rhsusf_acc_mrds_c", // MRDS Coyote
	"rhsusf_acc_mrds_fwd", // MRDS (Forward)
	"rhsusf_acc_mrds_fwd_c", // MRDS Coyote (Forward)
	"rhsusf_acc_premier", // M8541A SSDS
	"rhsusf_acc_premier_anpvs27", // M8541A + AN/PVS-27
	"rhsusf_acc_premier_low", // M8541A (low mount)
	"rhsusf_acc_premier_mrds", // M8541A SSDS (MRDS)
	"rhsusf_acc_RM05", // RM05 RMR LT726
	"rhsusf_acc_RM05_fwd", // RM05 RMR LT726 (Forward)
	"rhsusf_acc_RX01", // RX01 Reflex
	"rhsusf_acc_RX01_NoFilter", // RX01 (w/o Filter)
	"rhsusf_acc_RX01_NoFilter_tan", // RX01 Tan (w/o Filter)
	"rhsusf_acc_RX01_tan", // RX01 Tan Reflex
	"rhsusf_acc_su230", // SU-230/PVS
	"rhsusf_acc_su230_c", // SU-230/PVS Coyote
	"rhsusf_acc_su230_mrds", // SU-230/PVS MRDS
	"rhsusf_acc_su230_mrds_c", // SU-230/PVS MRDS Coyote
	"rhsusf_acc_su230a", // SU-230A/PVS
	"rhsusf_acc_su230a_c", // SU-230A/PVS Coyote
	"rhsusf_acc_su230a_mrds", // SU-230A/PVS MRDS
	"rhsusf_acc_su230a_mrds_c", // SU-230A/PVS MRDS Coyote
	"rhsusf_acc_T1_high", // SU-278/PVS LT660
	"rhsusf_acc_T1_low", // SU-278/PVS LT661
	"rhsusf_acc_T1_low_fwd", // SU-278/PVS LT661 (Forward)
	// 3CB
	"UK3CB_BAF_Kite", // KITE
	"UK3CB_BAF_MaxiKite", // KITE (MAXIKITE)
	"UK3CB_BAF_SpecterLDS", // LDS (without Reflex)
	"UK3CB_BAF_SUIT", // SUIT L2A2
	"UK3CB_BAF_SUSAT", // SUSAT L9A1
	"UK3CB_BAF_TA31F", // Trijicon ACOG TA31F
	"UK3CB_BAF_TA31F_Hornbill", // Trijicon ACOG TA31F Hornbill
	"UK3CB_BAF_TA648", // Trijicon ACOG TA648RMR
	"UK3CB_BAF_TA648_308", // Trijicon ACOG TA648RMR-308
	"uk3cb_fnfal_suit", // SUIT
	"uk3cb_optic_artel_m14", // Redfield AR-TEL
	"uk3cb_optic_PVS4M14", // AN/PVS4(M14-Mount)
	// CUP
	"CUP_optic_1p63", // 1P63
	"CUP_optic_AC11704_Black", // AC11704 Reflex Sight (black)
	"CUP_optic_AC11704_Coyote", // AC11704 Reflex Sight (Coyote)
	"CUP_optic_AC11704_Jungle", // AC11704 Reflex Sight (Jungle)
	"CUP_optic_AC11704_OD", // AC11704 Reflex Sight (OD)
	"CUP_optic_AC11704_Tan", // AC11704 Reflex Sight (Tan)
	"CUP_optic_ACOG", // Trijicon ACOG TA31F (Reflex)
	"CUP_optic_ACOG2", // Trijicon ACOG TA31F
	"CUP_optic_ACOG_Reflex_Desert", // Trijicon ACOG TA31F (Reflex/Desert)
	"CUP_optic_ACOG_Reflex_Wood", // Trijicon ACOG TA31F (Reflex/Woodland)
	"CUP_optic_ACOG_TA01B_Black", // Trijicon ACOG TA01B
	"CUP_optic_ACOG_TA01B_Coyote", // Trijicon ACOG TA01B (Coyote)
	"CUP_optic_ACOG_TA01B_OD", // Trijicon ACOG TA01B (OD)
	"CUP_optic_ACOG_TA01B_RMR_Black", // Trijicon ACOG TA01B (RMR)
	"CUP_optic_ACOG_TA01B_RMR_Coyote", // Trijicon ACOG TA01B (RMR/Coyote)
	"CUP_optic_ACOG_TA01B_RMR_OD", // Trijicon ACOG TA01B (RMR/OD)
	"CUP_optic_ACOG_TA01B_RMR_Tan", // Trijicon ACOG TA01B (RMR/Tan)
	"CUP_optic_ACOG_TA01B_RMR_Tropic", // Trijicon ACOG TA01B (RMR/Tropic)
	"CUP_optic_ACOG_TA01B_Tan", // Trijicon ACOG TA01B (Tan)
	"CUP_optic_ACOG_TA01B_Tropic", // Trijicon ACOG TA01B (Tropic)
	"CUP_optic_ACOG_TA01NSN_OD", // Trijicon ACOG TA01NSN (OD)
	"CUP_optic_ACOG_TA01NSN_RMR_Black", // Trijicon ACOG TA01NSN (RMR)
	"CUP_optic_ACOG_TA01NSN_RMR_Coyote", // Trijicon ACOG TA01NSN (RMR/Coyote)
	"CUP_optic_ACOG_TA01NSN_RMR_OD", // Trijicon ACOG TA01NSN (RMR/OD)
	"CUP_optic_ACOG_TA01NSN_RMR_Tan", // Trijicon ACOG TA01NSN (RMR/Tan)
	"CUP_optic_ACOG_TA01NSN_RMR_Tropic", // Trijicon ACOG TA01NSN (RMR/Tropic)
	"CUP_optic_ACOG_TA01NSN_Tan", // Trijicon ACOG TA01NSN (Tan)
	"CUP_optic_ACOG_TA01NSN_Tropic", // Trijicon ACOG TA01NSN (Tropic)
	"CUP_optic_ACOG_TA31_KF", // Trijicon ACOG TA31F (killFlash/Black)
	"CUP_optic_ACOG_TA31_KF_Desert", // Trijicon ACOG TA31F (killFlash/Desert)
	"CUP_optic_ACOG_TA31_KF_Wood", // Trijicon ACOG TA31F (killFlash/Woodland)
	"CUP_optic_AIMM_COMPM2_BLK", // M68 CCO + AimM (Black)
	"CUP_optic_AIMM_COMPM2_OD", // M68 CCO + AimM (OD)
	"CUP_optic_AIMM_COMPM2_TAN", // M68 CCO + AimM (Coyote)
	"CUP_optic_AIMM_COMPM4_BLK", // Aimpoint CompM4 + AimM (Black)
	"CUP_optic_AIMM_M68_BLK", // M68 CCO + AimM (QRP/Black)
	"CUP_optic_AIMM_M68_OD", // M68 CCO + AimM (QRP/OD)
	"CUP_optic_AIMM_M68_TAN", // M68 CCO + AimM (QRP/Desert)
	"CUP_optic_AIMM_MARS_BLK", // MARS + AimM (Black)
	"CUP_optic_AIMM_MARS_OD", // MARS + AimM (OD)
	"CUP_optic_AIMM_MARS_TAN", // MARS + AimM (Desert)
	"CUP_optic_AIMM_MICROT1_BLK", // Aimpoint Micro T-1 + AimM (Black)
	"CUP_optic_AIMM_MICROT1_OD", // Aimpoint Micro T-1 + AimM (OD)
	"CUP_optic_AIMM_MICROT1_TAN", // Aimpoint Micro T-1 + AimM (Coyote)
	"CUP_optic_AIMM_ZDDOT_BLK", // Meopta ZD-Dot + AimM
	"CUP_optic_AN_PAS_13c1", // AN/PAS 13C1 TWS
	"CUP_optic_AN_PAS_13c2", // AN/PAS 13C2 HTWS
	"CUP_optic_AN_PVS_10", // AN/PVS-10 NVS
	"CUP_optic_AN_PVS_10_black", // AN/PVS-10 NVS (Black)
	"CUP_optic_AN_PVS_10_od", // AN/PVS-10 NVS (OD)
	"CUP_optic_AN_PVS_4", // AN/PVS-4 NVS
	"CUP_optic_AN_PVS_4_M14", // AN/PVS-4 NVS (M14)
	"CUP_optic_AN_PVS_4_M16", // AN/PVS-4 NVS (M16)
	"CUP_optic_CompM2_Black", // M68 CCO (Black)
	"CUP_optic_CompM2_Coyote", // M68 CCO (Coyote)
	"CUP_optic_CompM2_Desert", // M68 CCO (Desert)
	"CUP_optic_CompM2_low", // M68 CCO (QRP/Black)
	"CUP_optic_CompM2_low_coyote", // M68 CCO (QRP/Coyote)
	"CUP_optic_CompM2_low_OD", // M68 CCO (QRP/OD)
	"CUP_optic_CompM2_OD", // M68 CCO (OD)
	"CUP_optic_CompM2_Woodland", // M68 CCO (Woodland)
	"CUP_optic_CompM2_Woodland2", // M68 CCO (Woodland 2)
	"CUP_optic_CompM4", // Aimpoint CompM4 (Black)
	"CUP_optic_CWS", // CWS
	"CUP_optic_ekp_8_02", // EKP-8-02
	"CUP_optic_Elcan", // Elcan SpecterOS4x (Black)
	"CUP_optic_Elcan_Coyote", // Elcan SpecterOS4x (Coyote)
	"CUP_optic_Elcan_OD", // Elcan SpecterOS4x (OD)
	"CUP_optic_Elcan_reflex", // Elcan SpecterOS4x (RMR Reflex/Black)
	"CUP_optic_Elcan_reflex_Coyote", // Elcan SpecterOS4x (RMR Reflex/Coyote)
	"CUP_optic_Elcan_reflex_OD", // Elcan SpecterOS4x (RMR Reflex/OD)
	"CUP_optic_Elcan_SpecterDR", // Elcan SpecterDR 1x/4x (Tan)
	"CUP_optic_Elcan_SpecterDR_black", // Elcan SpecterDR 1x/4x (Black)
	"CUP_optic_Elcan_SpecterDR_coyote", // Elcan SpecterDR 1x/4x (Coyote)
	"CUP_optic_Elcan_SpecterDR_KF", // Elcan SpecterDR 1x/4x (killFlash/Tan)
	"CUP_optic_Elcan_SpecterDR_KF_black", // Elcan SpecterDR 1x/4x (killFlash/Black)
	"CUP_optic_Elcan_SpecterDR_KF_coyote", // Elcan SpecterDR 1x/4x (killFlash/Coyote)
	"CUP_optic_Elcan_SpecterDR_KF_od", // Elcan SpecterDR 1x/4x (killFlash/OD)
	"CUP_optic_Elcan_SpecterDR_KF_RMR", // Elcan SpecterDR 1x/4x (Reflex/killFlash/Tan)
	"CUP_optic_Elcan_SpecterDR_KF_RMR_black", // Elcan SpecterDR 1x/4x (Reflex/killFlash/Black)
	"CUP_optic_Elcan_SpecterDR_KF_RMR_coyote", // Elcan SpecterDR 1x/4x (Reflex/killFlash/Coyote)
	"CUP_optic_Elcan_SpecterDR_KF_RMR_od", // Elcan SpecterDR 1x/4x (Reflex/killFlash/OD)
	"CUP_optic_Elcan_SpecterDR_od", // Elcan SpecterDR 1x/4x (OD)
	"CUP_optic_Elcan_SpecterDR_RMR", // Elcan SpecterDR 1x/4x (Reflex/Tan)
	"CUP_optic_Elcan_SpecterDR_RMR_black", // Elcan SpecterDR 1x/4x (Reflex/Black)
	"CUP_optic_Elcan_SpecterDR_RMR_coyote", // Elcan SpecterDR 1x/4x (Reflex/Coyote)
	"CUP_optic_Elcan_SpecterDR_RMR_od", // Elcan SpecterDR 1x/4x (Reflex/OD)
	"CUP_optic_ElcanM145", // Elcan M145
	"CUP_optic_Eotech533", // EOTech 553 (Tan)
	"CUP_optic_Eotech533Grey", // EOTech 553 (Gray)
	"CUP_optic_Eotech553_Black", // EOTech 553 (Black)
	"CUP_optic_Eotech553_Coyote", // EOTech 553 (Coyote)
	"CUP_optic_Eotech553_OD", // EOTech 553 (OD)
	"CUP_optic_G33_HWS_BLK", // EOTech 553 + G33 (Black)
	"CUP_optic_G33_HWS_COYOTE", // EOTech 553 + G33 (Coyote)
	"CUP_optic_G33_HWS_OD", // EOTech 553 + G33 Magnifier (OD)
	"CUP_optic_G33_HWS_TAN", // EOTech 553 + G33 (Desert)
	"CUP_optic_G36DualOptics", // G36 3.5x Dual Optics sight
	"CUP_optic_G36DualOptics_3D", // G36 3.5x Dual Optics sight (3D)
	"CUP_optic_G36DualOptics_desert", // G36 3.5x Dual Optics sight (Desert)
	"CUP_optic_G36DualOptics_desert_3D", // G36 3.5x Dual Optics sight (Desert) (3D)
	"CUP_optic_G36DualOptics_wood", // G36 3.5x Dual Optics sight (Woodland)
	"CUP_optic_G36DualOptics_wood_3D", // G36 3.5x Dual Optics sight (Woodland) (3D)
	"CUP_optic_G36Optics", // G36 3.5x Optics sight
	"CUP_optic_G36Optics15x", // G36 1.5x Optics sight
	"CUP_optic_G36Optics15x_3D", // G36 1.5x Optics sight (3D)
	"CUP_optic_G36Optics15x_desert", // G36 1.5x Optics sight (Desert)
	"CUP_optic_G36Optics15x_desert_3D", // G36 1.5x Optics sight (Desert) (3D)
	"CUP_optic_G36Optics15x_wood", // G36 1.5x Optics sight (Woodland)
	"CUP_optic_G36Optics15x_wood_3D", // G36 1.5x Optics sight (Woodland) (3D)
	"CUP_optic_G36Optics_3D", // G36 3.5x Optics sight (3D)
	"CUP_optic_G36Optics_desert", // G36 3.5x Optics sight (Desert)
	"CUP_optic_G36Optics_desert_3D", // G36 3.5x Optics sight (Desert) (3D)
	"CUP_optic_G36Optics_Holo", // G36 3.5x Optics sight/EOTech 552
	"CUP_optic_G36Optics_Holo_3D", // G36 3.5x Optics sight/EOTech 552 (3D)
	"CUP_optic_G36Optics_Holo_desert", // G36 3.5x Optics sight/EOTech 552 (Desert)
	"CUP_optic_G36Optics_Holo_desert_3D", // G36 3.5x Optics sight/EOTech 552 (Desert) (3D)
	"CUP_optic_G36Optics_Holo_wood", // G36 3.5x Optics sight/EOTech 552 (Woodland)
	"CUP_optic_G36Optics_Holo_wood_3D", // G36 3.5x Optics sight/EOTech 552 (Woodland) (3D)
	"CUP_optic_G36Optics_RDS", // G36 3.5x Optics sight/Z-Point
	"CUP_optic_G36Optics_RDS_3D", // G36 3.5x Optics sight/Z-Point (3D)
	"CUP_optic_G36Optics_RDS_desert", // G36 3.5x Optics sight/Z-Point (Desert)
	"CUP_optic_G36Optics_RDS_desert_3D", // G36 3.5x Optics sight/Z-Point (Desert) (3D)
	"CUP_optic_G36Optics_RDS_wood", // G36 3.5x Optics sight/Z-Point (Woodland)
	"CUP_optic_G36Optics_RDS_wood_3D", // G36 3.5x Optics sight/Z-Point (Woodland) (3D)
	"CUP_optic_G36Optics_wood", // G36 3.5x Optics sight (Woodland)
	"CUP_optic_G36Optics_wood_3D", // G36 3.5x Optics sight (Woodland) (3D)
	"CUP_optic_GOSHAWK", // Goshawk TWS
	"CUP_optic_GOSHAWK_RIS", // Goshawk TWS (RIS)
	"CUP_optic_GrozaScope", // PO4x34
	"CUP_optic_HensoldtZO", // Hensoldt ZO
	"CUP_optic_HensoldtZO_coyote", // Hensoldt ZO (Coyote)
	"CUP_optic_HensoldtZO_desert", // Hensoldt ZO (Desert)
	"CUP_optic_HensoldtZO_hex", // Hensoldt ZO (Hex)
	"CUP_optic_HensoldtZO_low", // Hensoldt ZO (Low)
	"CUP_optic_HensoldtZO_low_coyote", // Hensoldt ZO (Low/Coyote)
	"CUP_optic_HensoldtZO_low_desert", // Hensoldt ZO (Low/Desert)
	"CUP_optic_HensoldtZO_low_hex", // Hensoldt ZO (Low/Hex)
	"CUP_optic_HensoldtZO_low_od", // Hensoldt ZO (Low/OD)
	"CUP_optic_HensoldtZO_low_RDS", // Hensoldt ZO (Low/RDS)
	"CUP_optic_HensoldtZO_low_RDS_coyote", // Hensoldt ZO (Low/RDS/Coyote)
	"CUP_optic_HensoldtZO_low_RDS_desert", // Hensoldt ZO (Low/RDS/Desert)
	"CUP_optic_HensoldtZO_low_RDS_hex", // Hensoldt ZO (Low/RDS/Hex)
	"CUP_optic_HensoldtZO_low_RDS_od", // Hensoldt ZO (Low/RDS/OD)
	"CUP_optic_HensoldtZO_od", // Hensoldt ZO (OD)
	"CUP_optic_HensoldtZO_RDS", // Hensoldt ZO (RDS)
	"CUP_optic_HensoldtZO_RDS_coyote", // Hensoldt ZO (RDS/Coyote)
	"CUP_optic_HensoldtZO_RDS_desert", // Hensoldt ZO (RDS/Desert)
	"CUP_optic_HensoldtZO_RDS_hex", // Hensoldt ZO (RDS/Hex)
	"CUP_optic_HensoldtZO_RDS_od", // Hensoldt ZO (RDS/OD)
	"CUP_optic_HoloBlack", // EOTech 551 (Black)
	"CUP_optic_HoloDesert", // EOTech 551 (Desert)
	"CUP_optic_HoloWdl", // EOTech 551 (Woodland)
	"CUP_optic_Kobra", // Kobra Reflex Sight
	"CUP_optic_Leupold_VX3", // Leupold VX-3 4.5-14x50mm
	"CUP_optic_LeupoldM3LR", // Leupold Mark 4 3-9x36mm MR/T
	"CUP_optic_LeupoldMk4", // Leupold Mark 4 10x40mm LR/T
	"CUP_optic_LeupoldMk4_10x40_LRT_Desert", // Leupold Mark 4 10x40mm LR/T (Desert)
	"CUP_optic_LeupoldMk4_10x40_LRT_Woodland", // Leupold Mark 4 10x40mm LR/T (Woodland)
	"CUP_optic_LeupoldMk4_20x40_LRT", // Leupold Mark 4 6.5-20x50mm LR/T
	"CUP_optic_LeupoldMk4_25x50_LRT", // Leupold Mark 4 8.5-25x50 LR/T (Black)
	"CUP_optic_LeupoldMk4_25x50_LRT_DESERT", // Leupold Mark 4 8.5-25x50 LR/T (Desert)
	"CUP_optic_LeupoldMk4_25x50_LRT_SNOW", // Leupold Mark 4 8.5-25x50 LR/T (Snow)
	"CUP_optic_LeupoldMk4_25x50_LRT_WOODLAND", // Leupold Mark 4 8.5-25x50 LR/T (Woodland)
	"CUP_optic_LeupoldMk4_CQ_T", // Leupold Mk4 CQ/T 1-3x14mm
	"CUP_optic_LeupoldMk4_MRT_tan", // Leupold Mark 4 2.5-8x36mm MR/T (Tan)
	"CUP_optic_MAAWS_Scope", // MAAWS optical sight
	"CUP_optic_MARS", // MARS
	"CUP_optic_MARS_OD", // MARS (Olive)
	"CUP_optic_MARS_tan", // MARS (Tan)
	"CUP_optic_MicroT1", // Aimpoint Micro T-1
	"CUP_optic_MicroT1_coyote", // Aimpoint Micro T-1 (Coyote)
	"CUP_optic_MicroT1_low", // Aimpoint Micro T-1 (Low)
	"CUP_optic_MicroT1_low_coyote", // Aimpoint Micro T-1 (Low/Coyote)
	"CUP_optic_MicroT1_low_OD", // Aimpoint Micro T-1 (Low/OD)
	"CUP_optic_MicroT1_OD", // Aimpoint Micro T-1 (OD)
	"CUP_optic_MRad", // Meopta Rapid Acquisition Dot
	"CUP_optic_no23mk2", // No.32 MK II
	"CUP_optic_NSPU", // NSPU Scope / 1PN34
	"CUP_optic_NSPU_RPG", // NSPU (1PN24)
	"CUP_optic_PechenegScope", // Pecheneg 1P78 Scope
	"CUP_optic_PEM", // PE
	"CUP_optic_PGO7V", // PGO-7V
	"CUP_optic_PGO7V2", // PGO-7V2
	"CUP_optic_PGO7V3", // PGO-7V3
	"CUP_optic_PSO_1", // PSO-1 Scope
	"CUP_optic_PSO_1_1", // PSO-1-1 Scope
	"CUP_optic_PSO_1_1_open", // PSO-1-1 Scope (w/o eyepiece)
	"CUP_optic_PSO_1_AK", // PSO-1 Scope (AK)
	"CUP_optic_PSO_1_AK_open", // PSO-1 Scope (w/o eyepiece/AK)
	"CUP_optic_PSO_1_open", // PSO-1 Scope (w/o eyepiece)
	"CUP_optic_PSO_3", // PSO-3 Scope
	"CUP_optic_PSO_3_open", // PSO-3 Scope (w/o eyepiece)
	"CUP_optic_RCO", // Trijicon ACOG TA01NSN
	"CUP_optic_RCO_desert", // Trijicon ACOG TA01NSN (Coyote)
	"CUP_optic_Remington", // Scope for Remington 700
	"CUP_optic_SB_11_4x20_PM", // Schmidt and Bender 1.1-4x20 PM ShortDot
	"CUP_optic_SB_11_4x20_PM_od", // Schmidt and Bender 1.1-4x20 PM ShortDot (OD)
	"CUP_optic_SB_11_4x20_PM_tan", // Schmidt and Bender 1.1-4x20 PM ShortDot (Tan)
	"CUP_optic_SB_3_12x50_PMII", // Schmidt and Bender 3-12x50 PM II
	"CUP_optic_SB_3_12x50_PMII_Tan", // Schmidt and Bender 3-12x50 PM II (Tan)
	"CUP_optic_SMAW_Scope", // SMAW Optical Scope
	"CUP_optic_SUSAT", // SUSAT L9A1
	"CUP_optic_TrijiconRx01_black", // Trijicon Rx01 (Black)
	"CUP_optic_TrijiconRx01_desert", // Trijicon Rx01 (Desert)
	"CUP_optic_TrijiconRx01_kf_black", // Trijicon Rx01 (killFlash/Black)
	"CUP_optic_TrijiconRx01_kf_desert", // Trijicon Rx01 (killFlash/Desert)
	"CUP_optic_TrijiconRx01_kf_od", // Trijicon Rx01 (killFlash/OD)
	"CUP_optic_TrijiconRx01_od", // Trijicon Rx01 (OD)
	"CUP_optic_VortexRazor_UH1_Black", // Vortex Razor UH-1 (Black)
	"CUP_optic_VortexRazor_UH1_Coyote", // Vortex Razor UH-1 (Coyote)
	"CUP_optic_VortexRazor_UH1_Khaki", // Vortex Razor UH-1 (Khaki)
	"CUP_optic_VortexRazor_UH1_OD", // Vortex Razor UH-1 (OD)
	"CUP_optic_VortexRazor_UH1_Tan", // Vortex Razor UH-1 (Tan)
	"CUP_optic_ZDDot", // Meopta ZD-Dot
	"CUP_optic_ZeissZPoint", // Zeiss Z-Point
	"CUP_optic_ZeissZPoint_desert", // Zeiss Z-Point (Desert)
	"CUP_optic_ZeissZPoint_hex", // Zeiss Z-Point (Hex)
	"CUP_optic_ZeissZPoint_wood", // Zeiss Z-Point (Woodland)
	// ACE
	"ACE_optic_Arco_2D", // ELCAN SpecterOS (2D)
	"ACE_optic_Arco_PIP", // ARCO (PIP)
	"ACE_optic_Hamr_2D", // Leupold Mark 4 HAMR (2D)
	"ACE_optic_Hamr_PIP", // RCO (PIP)
	"ACE_optic_LRPS_2D", // Nightforce NXS (2D)
	"ACE_optic_LRPS_PIP", // LRPS (PIP)
	"ACE_optic_MRCO_2D", // IOR-Valdada Pitbull 2 (2D)
	"ACE_optic_SOS_2D", // MOS (2D)
	"ACE_optic_SOS_PIP", // MOS (PIP)
	// RKSL
	"RKSL_optic_EOT552", // EOTech 552.A65/1
	"RKSL_optic_EOT552_C", // EOTech 552.A65/1 (Coyote)
	"RKSL_optic_EOT552X", // EOTech 552.XR308
	"RKSL_optic_EOT552X_C", // EOTech 552.XR308 (Coyote)
	"RKSL_optic_LDS", // LDS
	"RKSL_optic_LDS_C", // LDS (Coyote)
	"RKSL_optic_PMII_312", // S+B 3-12x50 PM II
	"RKSL_optic_PMII_312_des", // S+B 3-12x50 PM II (D)
	"RKSL_optic_PMII_312_sunshade", // S+B 3-12x50 PM II (sunshade)
	"RKSL_optic_PMII_312_sunshade_des", // S+B 3-12x50 PM II (sunshade) (D)
	"RKSL_optic_PMII_312_sunshade_wdl", // S+B 3-12x50 PM II (sunshade) (W)
	"RKSL_optic_PMII_312_wdl", // S+B 3-12x50 PM II (W)
	"RKSL_optic_PMII_525", // S+B 5-25x56 PM II
	"RKSL_optic_PMII_525_des", // S+B 5-25x56 PM II (D)
	"RKSL_optic_PMII_525_wdl", // S+B 5-25x56 PM II (W)
	"RKSL_optic_RMR_HG", // RMR (Handgun)
	"RKSL_optic_RMR_HG_FDE", // RMR (Handgun) (FDE)
	"RKSL_optic_RMR_MS19", // RMR (MS19)
	"RKSL_optic_RMR_MS19_FDE", // RMR (MS19) (FDE)
	"RKSL_optic_RMR_RM33", // RMR (RM33)
	"RKSL_optic_RMR_RM33_FDE" // RMR (RM33) (FDE)
];
if ((!isNil "_this") AND (count _this > 0)) then {{_select pushBackUnique (_return select _x)} forEach _this;_return = _select;};
_return;
