// _chemlights = 0 call VVM_fnc_getMagazines; _explosives = 1 call VVM_fnc_getMagazines;
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
			"DemoCharge_Remote_Mag", // 0
			"SatchelCharge_Remote_Mag" // 1
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
			"HandGrenade", // 0
			"MiniGrenade", // 1
			"B_IR_Grenade", // 2 NATO
			"O_IR_Grenade", // 3 CSAT
			"I_IR_Grenade", // 4 AAF
			"O_R_IR_Grenade", // 5 Spetsnaz
			"I_E_IR_Grenade" // 6 LDF
		];
	};
	case 4: { // Mines
		_return = [
			"ATMine_Range_Mag", // 0
			"APERSMine_Range_Mag", // 1
			"APERSBoundingMine_Range_Mag", // 2
			"APERSTripMine_Wire_Mag", // 3
			"ClaymoreDirectionalMine_Remote_Mag", // 4
			"SLAMDirectionalMine_Wire_Mag", // 5
			"APERSMineDispenser_Mag" // 6
		];
	};
	case 5: { // Smokes
		_return = [
			"SmokeShell", // 0
			"SmokeShellBlue", // 1
			"SmokeShellRed", // 2
			"SmokeShellGreen", // 3
			"SmokeShellYellow", // 4
			"SmokeShellOrange", // 5
			"SmokeShellPurple" // 6
		];
	};
	default {_return = null};
};
_return;
