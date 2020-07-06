/* Name: fn_getWeapon.sqf
Description: Returns an array of relevant classnames for a specified weapon.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2020/06/24 Updated: 2020/06/24 Version: 0.0.1
Dependencies: n/a
Arguments: index name     (default) TYPE    {Required} min,max    "values"
           d     debug    (false)   BOOLEAN {N}        false,true "Disabled","Enabled"
           w     weapon   ("")      STRING  {Y}        *          ""
Returns: ARRAY on success. FALSE on failure.
Usage: _result = [["w","KATIBA"]] call VVLO_fnc_getWeapon;
*/
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false;};
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false;};
private ["_debug","_weapon","_weapons","_return"];
{ if (_x isEqualType []) then {
    if (_x select 0 isEqualType "") then {
      switch (toLower (_x select 0)) do {
        case "d": {_debug = [_x select 1] param [0,false,[true]];};
        case "w": {_weapon = [_x select 1] param [0,"",[""]];};
      };
    };
  };
} forEach _this;
if (isNil "_weapon") exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
if (_weapon isEqualType false) exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
{ if (isNil _x) then {
    switch (_forEachIndex) do {
      case 0: {_debug = false;};
    };
  };
} forEach ["_debug"];
if (_debug) then {
  { diag_log format ["# %1 # %2 # %3 # _param %4 = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_forEachIndex,_x];
  } forEach [_debug,_weapon];
};
switch (toUpperANSI _weapon) do {
	case "TITAN": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\launchers\aa\TITAN.sqf";};
	case "9M135": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\launchers\at\9M135.sqf";};
	case "MAAWS": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\launchers\at\MAAWS.sqf";};
	case "PCML": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\launchers\at\PCML.sqf";};
	case "RPG7": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\launchers\at\RPG7.sqf";};
	case "RPG42": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\launchers\at\RPG42.sqf";};
	case "TITANC": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\launchers\at\TITANC.sqf";};
	case "GM6LYNX": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\amr\GM6LYNX.sqf";};
	case "TYPE115": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\amr\TYPE115.sqf";};
	case "AK12": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\ar\AK12.sqf";};
	case "AKM": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\ar\AKM.sqf";};
	case "AKS74U": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\ar\AKS74U.sqf";};
	case "CAR95": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\ar\CAR95.sqf";};
	case "KATIBA": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\ar\KATIBA.sqf";};
	case "MK20": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\ar\MK20.sqf";};
	case "MX": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\ar\MX.sqf";};
	case "PROMET": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\ar\PROMET.sqf";};
	case "SDAR": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\ar\SDAR.sqf";};
	case "SPAR16": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\ar\SPAR16.sqf";};
	case "TRG": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\ar\TRG.sqf";};
	case "ASP1": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\dmr\ASP1.sqf";};
	case "CMR76": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\dmr\CMR76.sqf";};
	case "CYRUS": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\dmr\CYRUS.sqf";};
	case "M320": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\dmr\M320.sqf";};
	case "MAR10": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\dmr\MAR10.sqf";};
	case "MK1": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\dmr\MK1.sqf";};
	case "MK14": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\dmr\MK14.sqf";};
	case "MK18": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\dmr\MK18.sqf";};
	case "MXM": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\dmr\MXM.sqf";};
	case "RAHIM": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\dmr\RAHIM.sqf";};
	case "SPAR17": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\dmr\SPAR17.sqf";};
	case "NAVID": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\hmg\NAVID.sqf";};
	case "SPMG": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\hmg\SPMG.sqf";};
	case "LIM85": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\lmg\LIM85.sqf";};
	case "MK200": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\lmg\MK200.sqf";};
	case "ZAFIR": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\lmg\ZAFIR.sqf";};
	case "CAR951": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\lsw\CAR951.sqf";};
	case "MXSW": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\lsw\MXSW.sqf";};
	case "RPK12": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\lsw\RPK12.sqf";};
	case "SPAR16S": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\lsw\SPAR16S.sqf";};
	case "KOZLICE": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\shotgun\KOZLICE.sqf";};
	case "ADR97": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\smg\ADR97.sqf";};
	case "PDW2000": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\smg\PDW2000.sqf";};
	case "PROTECTOR": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\smg\PROTECTOR.sqf";};
	case "STING": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\smg\STING.sqf";};
	case "VERMIN": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\primary\smg\VERMIN.sqf";};
	case "4FIVE": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\secondary\handgun\4FIVE.sqf";};
	case "ACPC2": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\secondary\handgun\ACPC2.sqf";};
	case "PM": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\secondary\handgun\PM.sqf";};
	case "PO7": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\secondary\handgun\PO7.sqf";};
	case "ROOK": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\secondary\handgun\ROOK.sqf";};
	case "ZUBR": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\secondary\handgun\ZUBR.sqf";};
	case "STARTER": {_return = call compile preprocessFileLineNumbers "mods\VVLO\functions\gear\weapons\types\secondary\pistol\STARTER.sqf";};
	default {_return = false;};
};
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_weapon];
_return;
