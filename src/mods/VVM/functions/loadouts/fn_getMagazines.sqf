// _chemlights = 0 call VVM_fnc_getMagazines; _explosives = 1 call VVM_fnc_getMagazines;
// diag_log format ["# %1 #% 2 # %3 # VVM_fnc_getMagazines _this = %4 #",time,__FILE__ select [count PATH],__LINE__,_this];
private _return = [];
switch (_this) do {
	case 0: { // Chemlights
		_return = [
			"Chemlight_blue", // 0
			"Chemlight_green", // 1
			"Chemlight_red", // 2
			"Chemlight_yellow" // 3
		];
	};
	case 1: { // Explosives
		_return = [
			"DemoCharge_Remote_Mag", 	// 0
			"SatchelCharge_Remote_Mag", // 1
			"gm_explosive_petn_charge",	// 2
			"gm_explosive_plnp_charge"	// 3
		];
	};
	case 2: { // Flares
		_return = [
			"FlareWhite_F", // 0
			"FlareGreen_F", // 1
			"FlareRed_F", // 2
			"FlareYellow_F" // 3
		];
	};
	case 3: { // Grenades
		_return = [
			"HandGrenade", 					// 0
			"MiniGrenade", 					// 1
			"B_IR_Grenade", 				// 2 NATO
			"O_IR_Grenade", 				// 3 CSAT
			"I_IR_Grenade", 				// 4 AAF
			"O_R_IR_Grenade", 				// 5 Spetsnaz
			"I_E_IR_Grenade", 				// 6 LDF
			"gm_handgrenade_frag_dm51",		// 7
			"gm_handgrenade_frag_dm51a1",	// 8
			"gm_handgrenade_pracfrag_dm58",	// 9
			"gm_handgrenade_conc_dm51",		// 10
			"gm_handgrenade_conc_dm51a1",	// 11
			"gm_handgrenade_pracconc_dm58",	// 12
			"gm_handgrenade_frag_rgd5"		// 13
		];
	};
	case 4: { // Mines
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
	};
	case 5: { // Smokes
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
	};
};
_return;
