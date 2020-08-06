// _brdm = "BRDM2" call VVM_fnc_getVehicle;
// diag_log format ["# %1 # fn_getVehicle.sqf _this = %2 #",time,_this];
private _return = [];
switch (toUpperANSI _this) do {
	// AIR - HELI
	case "AH9": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\heli\AH9.sqf"};
	case "AH99": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\heli\AH99.sqf"};
	case "CH49": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\heli\CH49.sqf"};
	case "CH53G": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\heli\CH53G.sqf"};
	case "CH67": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\heli\CH67.sqf"};
	case "MH9": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\heli\MH9.sqf"};
	case "MI2": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\heli\MI2.sqf"};
	case "MI48": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\heli\MI48.sqf"};
	case "MI290": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\heli\MI290.sqf"};
	case "PAH1": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\heli\PAH1.sqf"};
	case "PO30": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\heli\PO30.sqf"};
	case "UH80": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\heli\UH80.sqf"};
	case "VBH1": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\heli\VBH1.sqf"};
	case "WY55": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\heli\WY55.sqf"};
	// AIR - PLANE
	case "A143": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\plane\A143.sqf"};
	case "A149": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\plane\A149.sqf"};
	case "A164": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\plane\A164.sqf"};
	case "CBTT": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\plane\CBTT.sqf"};
	case "DO28": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\plane\DO28.sqf"};
	case "FA181": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\plane\FA181.sqf"};
	case "L410": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\plane\L410.sqf"};
	case "TO199": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\plane\TO199.sqf"};
	case "TO201": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\plane\TO201.sqf"};
	case "V44": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\plane\V44.sqf"};
	case "Y32": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\plane\Y32.sqf"};
	// AIR - UAV
	case "AL6": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\uav\AL6.sqf"};
	case "AR2": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\uav\AR2.sqf"};
	case "Demining": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\uav\Demining.sqf"};
	case "KH3A": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\uav\KH3A.sqf"};
	case "MQ4A": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\uav\MQ4A.sqf"};
	case "MQ12": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\uav\MQ12.sqf"};
	case "UCAV": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\air\uav\UCAV.sqf"};
	// LAND - AA
	case "AWC302": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\aa\AWC302.sqf"};
	case "FPZ1A1": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\aa\FPZ1A1.sqf"};
	case "IFV6A": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\aa\IFV6A.sqf"};
	case "ZSU23": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\aa\ZSU23.sqf"};
	case "ZSU39": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\aa\ZSU39.sqf"};
	// LAND - APC
	case "AFV4": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\apc\AFV4.sqf"};
	case "AMV7": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\apc\AMV7.sqf"};
	case "BMP1": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\apc\BMP1.sqf"};
	case "BRDM2": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\apc\BRDM2.sqf"};
	case "BTR60": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\apc\BTR60.sqf"};
	case "BTRK": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\apc\BTRK.sqf"};
	case "CRV6E": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\apc\CRV6E.sqf"};
	case "FV720": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\apc\FV720.sqf"};
	case "IFV6C": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\apc\IFV6C.sqf"};
	case "M113": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\apc\M113.sqf"};
	case "MSE3": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\apc\MSE3.sqf"};
	case "RMGS": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\apc\RMGS.sqf"};
	case "SKOT2A": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\apc\SKOT2A.sqf"};
	case "SPZ2A": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\apc\SPZ2A.sqf"};
	case "TPZ1A0": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\apc\TPZ1A0.sqf"};
	// LAND - ARTY
	case "2S9": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\arty\2S9.sqf"};
	case "M4": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\arty\M4.sqf"};
	case "M5": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\arty\M5.sqf"};
	case "ZMRL": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\arty\ZMRL.sqf"};
	// LAND - CAR

	// LAND - TANK
	case "AWC301": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\tank\AWC301.sqf"};
	case "BPZ2A0": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\tank\BPZ2A0.sqf"};
	case "KPZ1A": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\tank\KPZ1A.sqf"};
	case "M2A": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\tank\M2A.sqf"};
	case "MBT52": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\tank\MBT52.sqf"};
	case "PT76B": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\tank\PT76B.sqf"};
	case "T55": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\tank\T55.sqf"};
	case "T100": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\tank\T100.sqf"};
	case "T140": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\tank\T140.sqf"};
	// LAND - TURRET

	// LAND - UGV
	case "ED1": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\ugv\ED1.sqf"};
	case "UGV": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\land\ugv\UGV.sqf"};
	// SEA - BOAT
	case "ASSAULT": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\sea\boat\ASSAULT.sqf"};
	case "MOTOR": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\sea\boat\MOTOR.sqf"};
	case "RHIB": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\sea\boat\RHIB.sqf"};
	case "SCOOTER": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\sea\boat\SCOOTER.sqf"};
	case "SPEED": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\sea\boat\SPEED.sqf"};
	// SEA - STATIC
	case "Freedom": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\sea\static\Freedom.sqf"};
	case "Liberty": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\sea\static\Liberty.sqf"};
	case "Proteus": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\sea\static\Proteus.sqf"};
	case "Trawler": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\sea\static\Trawler.sqf"};
	// SEA - SUB
	case "SDV": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\ai\vehicles\sea\sub\SDV.sqf"};
};
_return;
