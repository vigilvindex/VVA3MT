private ["_return","_select"];
_select = [];
_return = [
	// Vanilla
	"muzzle_snds_338_black",	// Sound Suppressor (.338, Black)
	"muzzle_snds_338_green",	// Sound Suppressor (.338, Green)
	"muzzle_snds_338_sand",		// Sound Suppressor (.338, Sand)
	"muzzle_snds_570",			// Sound Suppressor (5.7 mm)
	"muzzle_snds_58_blk_F",		// Stealth Sound Suppressor (5.8 mm, Black)
	"muzzle_snds_58_ghex_F",	// Stealth Sound Suppressor (5.8 mm, Green Hex)
	"muzzle_snds_58_hex_F",		// Stealth Sound Suppressor (5.8 mm, Hex)
	"muzzle_snds_65_TI_blk_F",	// Stealth Sound Suppressor (6.5 mm, Black)
	"muzzle_snds_65_TI_ghex_F",	// Stealth Sound Suppressor (6.5 mm, Green Hex)
	"muzzle_snds_65_TI_hex_F",	// Stealth Sound Suppressor (6.5 mm, Hex)
	"muzzle_snds_93mmg",		// Sound Suppressor (9.3mm, Black)
	"muzzle_snds_93mmg_tan",	// Sound Suppressor (9.3mm, Tan)
	"muzzle_snds_acp",			// Sound Suppressor (.45 ACP)
	"muzzle_snds_B",			// Sound Suppressor (7.62 mm)
	"muzzle_snds_B_arid_F",		// Sound Suppressor (7.62 mm, Arid)
	"muzzle_snds_B_khk_F",		// Sound Suppressor (7.62 mm, Khaki)
	"muzzle_snds_B_lush_F",		// Sound Suppressor (7.62 mm, Lush)
	"muzzle_snds_B_snd_F",		// Sound Suppressor (7.62 mm, Sand)
	"muzzle_snds_H",			// Sound Suppressor (6.5 mm)
	"muzzle_snds_H_khk_F",		// Sound Suppressor (6.5 mm, Khaki)
	"muzzle_snds_H_MG",			// Sound Suppressor MG
	"muzzle_snds_H_MG_blk_F",	// Sound Suppressor MG
	"muzzle_snds_H_MG_khk_F",	// Sound Suppressor MG
	"muzzle_snds_H_snd_F",		// Sound Suppressor (6.5 mm, Sand)
	"muzzle_snds_L",			// Sound Suppressor (9 mm)
	"muzzle_snds_M",			// Sound Suppressor (5.56 mm)
	"muzzle_snds_m_khk_F",		// Sound Suppressor (5.56 mm, Khaki)
	"muzzle_snds_m_snd_F",		// Sound Suppressor (5.56 mm, Sand)
	// Contact
	"muzzle_antenna_01_f",		// SD Military Antenna (78-89 MHz)
	"muzzle_antenna_02_f",		// SD Experimental Antenna (390-500 MHz)
	"muzzle_antenna_03_f",		// SD Jammer Antenna (433 MHz)
	// GM
	"gm_bayonet_6x3_blk",			// 6H3 (Black)
	"gm_bayonet_6x3_wud",			// 6H3
	"gm_suppressor_safloryt_blk",	// Safloryt
	// RHS
	"rhs_acc_6p9_suppressor",	// 6P9 Supressor
	"rhs_acc_ak5",				// DPM-AK-5
	"rhs_acc_dtk", // DTK
	"rhs_acc_dtk1", // DTK-1
	"rhs_acc_dtk1983", // DTK (1983)
	"rhs_acc_dtk1l", // DТК-1L
	"rhs_acc_dtk1p", // DTK-1P
	"rhs_acc_dtk2", // DTK-2
	"rhs_acc_dtk3", // DTK-3
	"rhs_acc_dtk4long", // DTK-4 (7.62)
	"rhs_acc_dtk4screws", // DTK-4 (7.62)М
	"rhs_acc_dtk4short", // DTK-4 (5.45)
	"rhs_acc_dtkakm", // DTK
	"rhs_acc_pbs1", // PBS-1
	"rhs_acc_pbs4", // PBS-4
	"rhs_acc_pgs64", // PG S64
	"rhs_acc_pgs64_74u", // PG S64
	"rhs_acc_pgs64_74un", // PG S64
	"rhs_acc_tgpa", // TGP-A
	"rhs_acc_tgpv",							// TGP-V
	"rhs_acc_tgpv2",						// TGP-V2
	"rhs_acc_uuk",							// AK74M UKK
	"rhsgref_acc_falMuzzle_l1a1",			// L1A1 SLR Flash Hider
	"rhsgref_acc_zendl",					// Zendl compensator
	"rhsgref_sdn6_suppressor",				// AAC 762-SDN-6 (cover)
	"rhsusf_acc_aac_762sd_silencer",		// AAC 762-SD
	"rhsusf_acc_aac_762sdn6_silencer",		// AAC 762-SDN-6
	"rhsusf_acc_aac_m14dcqd_silencer",		// M14 DCQD
	"rhsusf_acc_aac_m14dcqd_silencer_d",	// M14 DCQD (Desert)
	"rhsusf_acc_aac_m14dcqd_silencer_wd",	// M14 DCQD (Woodland)
	"rhsusf_acc_aac_scarh_silencer", // AAC SCAR-H SD
	"rhsusf_acc_ARDEC_M240", // ARDEC 4-Prong
	"rhsusf_acc_m14_flashsuppresor", // M14 SOCOM Flash Hider
	"rhsusf_acc_M2010S", // TiTan
	"rhsusf_acc_M2010S_d", // TiTan (Desert)
	"rhsusf_acc_M2010S_sa", // TiTan (Semi-arid)
	"rhsusf_acc_M2010S_wd", // TiTan (Woodland)
	"rhsusf_acc_m24_muzzlehider_black", // M24 15OX. Flash Hider
	"rhsusf_acc_m24_muzzlehider_d", // M24 15OX. Flash Hider (Desert)
	"rhsusf_acc_m24_muzzlehider_wd", // M24 15OX. Flash Hider (Woodland)
	"rhsusf_acc_m24_silencer_black", // M24 Supressor
	"rhsusf_acc_m24_silencer_d", // M24 Supressor (Desert)
	"rhsusf_acc_m24_silencer_wd", // M24 Supressor (Woodland)
	"rhsusf_acc_nt4_black", // NT4 QDSS (Black)
	"rhsusf_acc_nt4_tan", // NT4 QDSS (Tan)
	"rhsusf_acc_omega9k", // SILENCERCO OMEGA 9K
	"rhsusf_acc_rotex5_grey", // Rotex-5 (Grey)
	"rhsusf_acc_rotex5_tan", // Rotex-5 (Tan)
	"rhsusf_acc_rotex_mp7", // Rotex-II (Black)
	"rhsusf_acc_rotex_mp7_aor1", // Rotex-II (AOR1)
	"rhsusf_acc_rotex_mp7_desert", // Rotex-II (Desert)
	"rhsusf_acc_rotex_mp7_winter", // Rotex-II (Winter)
	"rhsusf_acc_SF3P556", // SF3P-556-1/2-28
	"rhsusf_acc_SFMB556", // SFMB-556-1/2-28
	"rhsusf_acc_SR25S", // SR-25 Rifle Suppressor
	"rhsusf_acc_SR25S_d", // SR-25 Rifle Suppressor (Desert)
	"rhsusf_acc_SR25S_wd", // SR-25 Rifle Suppressor (Woodland)
	// 3CB
	"UK3CB_BAF_BFA_L110", // Blank Fire Adaptor (L110)
	"UK3CB_BAF_BFA_L129", // Blank Fire Adaptor (L129)
	"UK3CB_BAF_BFA_L7", // Blank Fire Adaptor (L7)
	"UK3CB_BAF_BFA_L85", // Blank Fire Adaptor (L85)
	"UK3CB_BAF_SFFH", // Surefire Flash Hider
	"UK3CB_BAF_Silencer_L105A1", // Suppressor (L105A1)
	"UK3CB_BAF_Silencer_L110", // Suppressor (L110)
	"UK3CB_BAF_Silencer_L115A3", // Suppressor (L115 / L129)
	"UK3CB_BAF_Silencer_L85", // Suppressor (L85)
	"UK3CB_BAF_Silencer_L91A1", // Suppressor (L91A1)
	"uk3cb_muzzle_snds_M14", // M14 Suppressor
	// CUP
	"CUP_acc_bfa", // BFA
	"CUP_acc_sffh", // Surefire FlashHider
	"CUP_muzzle_Bizon", // PBS-1 Silencer
	"CUP_muzzle_mfsup_Flashhider_545x39_Black", // Flash Hider (5.45x39mm/Black)
	"CUP_muzzle_mfsup_Flashhider_545x39_OD", // Flash Hider (5.45x39mm/OD)
	"CUP_muzzle_mfsup_Flashhider_545x39_Tan", // Flash Hider (5.45x39mm/Tan)
	"CUP_muzzle_mfsup_Flashhider_556x45_Black", // Flash Hider (5.56x45mm/Black)
	"CUP_muzzle_mfsup_Flashhider_556x45_OD", // Flash Hider (5.56x45mm/OD)
	"CUP_muzzle_mfsup_Flashhider_556x45_Tan", // Flash Hider (5.56x45mm/Tan)
	"CUP_muzzle_mfsup_Flashhider_762x39_Black", // Flash Hider (7.62x39mm/Black)
	"CUP_muzzle_mfsup_Flashhider_762x39_OD", // Flash Hider (7.62x39mm/OD)
	"CUP_muzzle_mfsup_Flashhider_762x39_Tan", // Flash Hider (7.62x39mm/Tan)
	"CUP_muzzle_mfsup_Flashhider_762x51_Black", // Flash Hider (7.62x51mm/Black)
	"CUP_muzzle_mfsup_Flashhider_762x51_OD", // Flash Hider (7.62x51mm/OD)
	"CUP_muzzle_mfsup_Flashhider_762x51_Tan", // Flash Hider (7.62x51mm/Tan)
	"CUP_muzzle_mfsup_Flashhider_PK_Black", // Flash Hider (PK 7.62x54mm/Black)
	"CUP_muzzle_mfsup_Flashhider_PK_OD", // Flash Hider (PK 7.62x54mm/OD)
	"CUP_muzzle_mfsup_Flashhider_PK_Tan", // Flash Hider (PK 7.62x54mm/Tan)
	"CUP_muzzle_mfsup_Flashhider_West_Base", // Flash hider
	"CUP_muzzle_mfsup_SCAR_H", // Mk 17 Flash Hider
	"CUP_muzzle_mfsup_SCAR_L", // Mk 16 Flash Hider
	"CUP_muzzle_mfsup_Suppressor_M107_Black", // M107 Suppressor .50 BMG (Black)
	"CUP_muzzle_mfsup_Suppressor_M107_Desert", // M107 Suppressor .50 BMG (Desert)
	"CUP_muzzle_mfsup_Suppressor_M107_Grey", // M107 Suppressor .50 BMG (Grey)
	"CUP_muzzle_mfsup_Suppressor_M107_Snow", // M107 Suppressor .50 BMG (Winter)
	"CUP_muzzle_mfsup_Suppressor_M107_Woodland", // M107 Suppressor .50 BMG (Woodland)
	"CUP_muzzle_mfsup_Suppressor_Mac10", // MAC-10 Suppressor
	"CUP_muzzle_PB6P9", // PB 6P9 silencer
	"CUP_muzzle_PBS4", // PBS-4 silencer
	"CUP_muzzle_snds_68SPC", // Sound Suppressor (6.8 SPC)
	"CUP_muzzle_snds_AWM", // Silencer L115A1/AWM
	"CUP_muzzle_snds_G36_black", // G36 Silencer (Black)
	"CUP_muzzle_snds_G36_desert", // G36 Silencer (Desert)
	"CUP_muzzle_snds_G36_hex", // G36 Silencer (Hex)
	"CUP_muzzle_snds_G36_wood", // G36 Silencer (Woodland)
	"CUP_muzzle_snds_groza", // OTs-14 silencer
	"CUP_muzzle_snds_KZRZP_AK545", // KZRZP (5.45x39mm)
	"CUP_muzzle_snds_KZRZP_AK545_desert", // KZRZP (5.45x39mm/Desert)
	"CUP_muzzle_snds_KZRZP_AK545_woodland", // KZRZP (5.45x39mm/Woodland)
	"CUP_muzzle_snds_KZRZP_AK762", // KZRZP (7.62x39mm)
	"CUP_muzzle_snds_KZRZP_AK762_desert", // KZRZP (7.62x39mm/Desert)
	"CUP_muzzle_snds_KZRZP_AK762_woodland", // KZRZP (7.62x39mm/Woodland)
	"CUP_muzzle_snds_KZRZP_PK", // KZRZP (PK 7.62x54mm)
	"CUP_muzzle_snds_KZRZP_PK_desert", // KZRZP (PK 7.62x54mm/Desert)
	"CUP_muzzle_snds_KZRZP_PK_woodland", // KZRZP (PK 7.62x54mm/Woodland)
	"CUP_muzzle_snds_KZRZP_SVD", // KZRZP (SVD 7.62x54R)
	"CUP_muzzle_snds_KZRZP_SVD_desert", // KZRZP (SVD 7.62x54R/Desert)
	"CUP_muzzle_snds_KZRZP_SVD_woodland", // KZRZP (SVD 7.62x54R/Woodland)
	"CUP_muzzle_snds_L85", // L85 Silencer
	"CUP_muzzle_snds_M110", // M110 Suppressor (Tan)
	"CUP_muzzle_snds_M110_black", // M110 Suppressor (Black)
	"CUP_muzzle_snds_M110_woodland", // M110 Suppressor(Woodland)
	"CUP_muzzle_snds_M14", // Silencer (M14)
	"CUP_muzzle_snds_M16", // QDSS NT4 5.56mm Suppressor (Black)
	"CUP_muzzle_snds_M16_camo", // QDSS NT4 5.56mm Suppressor (Woodland)
	"CUP_muzzle_snds_M16_coyote", // QDSS NT4 5.56mm Suppressor (Coyote)
	"CUP_muzzle_snds_M16_desert", // QDSS NT4 5.56mm Suppressor (Desert)
	"CUP_muzzle_snds_M9", // Silencer (M9)
	"CUP_muzzle_snds_MicroUzi", // Silencer (MicroUZI)
	"CUP_muzzle_snds_Mk12", // Mk 12 SPR Silencer
	"CUP_muzzle_snds_mk23", // Knight Armaments Offensive Handgun Suppressor
	"CUP_muzzle_snds_MP7", // Sound Suppressor (4.6 mm)
	"CUP_muzzle_snds_SA61", // Silencer Sa-61
	"CUP_muzzle_snds_SCAR_H", // Mk 17 Silencer
	"CUP_muzzle_snds_SCAR_L", // Mk 16 Silencer
	"CUP_muzzle_snds_SR3M", // Silencer SR-3M
	"CUP_muzzle_snds_XM8", // XM8 Silencer
	"CUP_muzzle_TGPA", // TGP-A silencer
	"CUP_muzzle_TGPA_desert", // TGP-A silencer (Desert)
	"CUP_muzzle_TGPA_woodland", // TGP-A silencer (Woodland)
	// ACE
	"ACE_muzzle_mzls_338", // Flash Suppressor (.338)
	"ACE_muzzle_mzls_93mmg", // Flash Suppressor (9.3 mm)
	"ACE_muzzle_mzls_B", // Flash Suppressor (7.62 mm)
	"ACE_muzzle_mzls_H", // Flash Suppressor (6.5 mm)
	"ACE_muzzle_mzls_L", // Flash Suppressor (5.56 mm)
	"ACE_muzzle_mzls_smg_01", // Flash Suppressor (.45 ACP)
	"ACE_muzzle_mzls_smg_02" // Flash Suppressor (9 mm)
];
if ((!isNil "_this") AND (count _this > 0)) then {{_select pushBackUnique (_return select _x)} forEach _this;_return = _select;};
_return;
