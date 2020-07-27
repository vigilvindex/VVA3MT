// _titan = "TITAN" call VVM_fnc_getWeapon;
diag_log format ["# %1 # fn_getWeapon.sqf _this = %2 #",time,_this];
private _return = [];
switch (toUpperANSI _this) do {
	// AA
	case "TITAN": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\launchers\aa\TITAN.sqf";};
	// AT
	case "9M135": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\launchers\at\9M135.sqf";};
	case "MAAWS": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\launchers\at\MAAWS.sqf";};
	case "PCML": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\launchers\at\PCML.sqf";};
	case "RPG7": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\launchers\at\RPG7.sqf";};
	case "RPG42": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\launchers\at\RPG42.sqf";};
	case "TITANC": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\launchers\at\TITANC.sqf";};
	// AMR
	case "GM6LYNX": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\amr\GM6LYNX.sqf";};
	case "TYPE115": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\amr\TYPE115.sqf";};
	// AR
	case "AK12": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\ar\AK12.sqf";};
	case "AKM": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\ar\AKM.sqf";};
	case "AKS74U": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\ar\AKS74U.sqf";};
	case "CAR95": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\ar\CAR95.sqf";};
	case "KATIBA": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\ar\KATIBA.sqf";};
	case "MK20": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\ar\MK20.sqf";};
	case "MX": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\ar\MX.sqf";};
	case "PROMET": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\ar\PROMET.sqf";};
	case "SDAR": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\ar\SDAR.sqf";};
	case "SPAR16": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\ar\SPAR16.sqf";};
	case "TRG": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\ar\TRG.sqf";};
	// DMR
	case "ASP1": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\dmr\ASP1.sqf";};
	case "CMR76": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\dmr\CMR76.sqf";};
	case "CYRUS": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\dmr\CYRUS.sqf";};
	case "M320": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\dmr\M320.sqf";};
	case "MAR10": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\dmr\MAR10.sqf";};
	case "MK1": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\dmr\MK1.sqf";};
	case "MK14": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\dmr\MK14.sqf";};
	case "MK18": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\dmr\MK18.sqf";};
	case "MXM": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\dmr\MXM.sqf";};
	case "RAHIM": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\dmr\RAHIM.sqf";};
	case "SPAR17": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\dmr\SPAR17.sqf";};
	// HMG
	case "NAVID": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\hmg\NAVID.sqf";};
	case "SPMG": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\hmg\SPMG.sqf";};
	// LMG
	case "LIM85": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\lmg\LIM85.sqf";};
	case "MK200": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\lmg\MK200.sqf";};
	case "ZAFIR": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\lmg\ZAFIR.sqf";};
	// LSW
	case "CAR951": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\lsw\CAR951.sqf";};
	case "MXSW": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\lsw\MXSW.sqf";};
	case "RPK12": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\lsw\RPK12.sqf";};
	case "SPAR16S": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\lsw\SPAR16S.sqf";};
	// Shotgun
	case "KOZLICE": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\shotgun\KOZLICE.sqf";};
	// SMG
	case "ADR97": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\smg\ADR97.sqf";};
	case "PDW2000": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\smg\PDW2000.sqf";};
	case "PROTECTOR": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\smg\PROTECTOR.sqf";};
	case "STING": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\smg\STING.sqf";};
	case "VERMIN": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\primary\smg\VERMIN.sqf";};
	// Handguns
	case "4FIVE": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\secondary\handgun\4FIVE.sqf";};
	case "ACPC2": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\secondary\handgun\ACPC2.sqf";};
	case "PM": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\secondary\handgun\PM.sqf";};
	case "PO7": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\secondary\handgun\PO7.sqf";};
	case "ROOK": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\secondary\handgun\ROOK.sqf";};
	case "ZUBR": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\secondary\handgun\ZUBR.sqf";};
	case "STARTER": {_return = call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\weapons\secondary\pistol\STARTER.sqf";};
};
_return;
