_return = [
	"ATMine_Range_Mag",						// 0
	"APERSMine_Range_Mag",					// 1
	"APERSBoundingMine_Range_Mag",			// 2
	"APERSTripMine_Wire_Mag", 				// 3
	"ClaymoreDirectionalMine_Remote_Mag",	// 4
	"SLAMDirectionalMine_Wire_Mag",			// 5
	"APERSMineDispenser_Mag",				// 6
	"gm_mine_at_dm21",						// 7
	"gm_mine_at_tm46",						// 8
	"gm_mine_ap_dm31"						// 9
];
_return;
/*
"ACE_FlareTripMine_Mag", // Tripwire Flare
"APERSBoundingMine_Range_Mag", // M26 Anti-Personnel Bounding Mine
"APERSMine_Range_Mag", // VS-50 Anti-Personnel Mine
"APERSMineDispenser_Mag", // APERS Mine Dispenser
"APERSTripMine_Wire_Mag", // PMR-3 Anti-Personnel Tripwire Mine
"ATMine_Range_Mag", // M15 Anti-Tank Mine
"ClaymoreDirectionalMine_Remote_Mag", // M18A1 Claymore
"CUP_IED_V1_M", // Small IED (Urban)
"CUP_IED_V2_M", // Large IED (Urban)
"CUP_IED_V3_M", // Small IED (Dug-in)
"CUP_IED_V4_M", // Large IED (Dug-in)
"CUP_Mine_M", // AT-15 Anti-Tank Mine
"CUP_MineE_M", // TM46 Anti-Tank Mine
"DemoCharge_Remote_Mag", // M112 Demolition Block
"Drone_Range_Mag", // AT Mine
"Drone_Range_Mag_dummy", // AT Mine
"gm_explosive_petn_charge", // PETN Charge
"gm_explosive_petn_charge_base", // M183 Demolition Charge Assembly
"gm_explosive_plnp_charge", // PLNP Charge
"gm_explosive_plnp_charge_base", // M183 Demolition Charge Assembly
"gm_explosiveRemoteMagazine_base", // M183 Demolition Charge Assembly
"gm_mine_ap_dm31", // AP Mine DM31
"gm_mine_at_dm21", // AT Mine DM21
"gm_mine_at_mn111", // MN 111
"gm_mine_at_tm46", // AT Mine TM46
"IEDLandBig_Remote_Mag", // Large IED (Dug-in)
"IEDLandSmall_Remote_Mag", // Small IED (Dug-in)
"IEDUrbanBig_Remote_Mag", // Large IED (Urban)
"IEDUrbanSmall_Remote_Mag", // Small IED (Urban)
"rhs_charge_M2tet_x2_mag", // Tetrytol Charge (2.5lb Placed)
"rhs_ec200_mag", // TNT charge 200g. (camo)
"rhs_ec200_sand_mag", // TNT charge 200g.
"rhs_ec400_mag", // TNT charge 400g. (camo)
"rhs_ec400_sand_mag", // TNT charge 400g.
"rhs_ec75_mag", // TNT charge (75g. camo)
"rhs_ec75_sand_mag", // TNT charge 75g.
"rhs_mag_mine_pfm1", // PFM-1
"rhs_mag_mine_ptm1", // PTM-1
"rhs_mine_a200_bz_mag", // Beh.Schu.Mi.A200 (B.Z.) AP Mine
"rhs_mine_a200_dz35_mag", // Beh.Schu.Mi.A200 (D.Z.35) AP Mine
"rhs_mine_glasmine43_bz_mag", // Gl.Mi.43 (B.Z.) AP Mine
"rhs_mine_glasmine43_hz_mag", // Gl.Mi.43 (H.Z.44) AP Mine
"rhs_mine_M19_mag", // M19
"rhs_mine_m2a3b_press_mag", // M2A3B APB Mine
"rhs_mine_m2a3b_trip_mag", // M2A3B (Tripwire) APB Mine
"rhs_mine_m3_pressure_mag", // M3 AP Mine
"rhs_mine_M3_tripwire_mag", // M3 (Tripwire) AP Mine
"rhs_mine_M7A2_mag", // M7A2 AP Mine
"rhs_mine_mk2_pressure_mag", // Mk 2 AP Mine
"rhs_mine_Mk2_tripwire_mag", // Mk 2 (Tripwire) AP Mine
"rhs_mine_msk40p_blue_mag", // MSK-40P (Blue)
"rhs_mine_msk40p_green_mag", // MSK-40P (Green)
"rhs_mine_msk40p_red_mag", // MSK-40P (Red)
"rhs_mine_msk40p_white_mag", // MSK-40P (White)
"rhs_mine_ozm72_a_mag", // OZM-72 (10m)
"rhs_mine_ozm72_b_mag", // OZM-72 (20m)
"rhs_mine_ozm72_c_mag", // OZM-72 (remote)
"rhs_mine_pmn2_mag", // PMN-2
"rhs_mine_sm320_green_mag", // SM-320 (Green)
"rhs_mine_sm320_red_mag", // SM-320 (Red)
"rhs_mine_sm320_white_mag", // SM-320 (White)
"rhs_mine_smine35_press_mag", // S.Mi.35 (S.Mi.Z.35) APB Mine
"rhs_mine_smine35_trip_mag", // S.Mi.35 (W) APB Mine
"rhs_mine_smine44_press_mag", // S.Mi.44 (S.Mi.Z.35) APB Mine
"rhs_mine_smine44_trip_mag", // S.Mi.44 (S.Mi.Z.44) APB Mine
"rhs_mine_stockmine43_2m_mag", // St.Mi.43/I (2m) AP Mine
"rhs_mine_stockmine43_4m_mag", // St.Mi.43/II (4m) AP Mine
"rhs_mine_TM43_mag", // Tellermine 43
"rhs_mine_tm62m_mag", // TM-62M
"rhssaf_mine_mrud_a_mag", // MRUD (3m)
"rhssaf_mine_mrud_b_mag", // MRUD (6m)
"rhssaf_mine_mrud_c_mag", // MRUD (10m)
"rhssaf_mine_mrud_d_mag", // MRUD (remote)
"rhssaf_mine_pma3_mag", // PMA-3
"rhssaf_mine_tma4_mag", // TMA-4
"rhssaf_tm100_mag", // TM-100
"rhssaf_tm200_mag", // TM-200
"rhssaf_tm500_mag", // TM-500
"rhsusf_m112_mag", // M112
"rhsusf_m112x4_mag", // M112 (x4)
"rhsusf_mine_m14_mag", // M14
"rhsusf_mine_m49a1_10m_mag", // M49A1 (10m)
"rhsusf_mine_m49a1_3m_mag", // M49A1 (3m)
"rhsusf_mine_m49a1_6m_mag", // M49A1 (6m)
"SatchelCharge_Remote_Mag", // M183 Demolition Charge Assembly
"SLAMDirectionalMine_Wire_Mag", // M4A1 SLAM
"TrainingMine_Mag", // Training Mine
*/
