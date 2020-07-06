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
Usage: [["w","KATIBA"]] call VVLO_fnc_getWeapon;
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
_weapons = [
	["TITAN","mods\VVLO\functions\loadouts\gear\weapons\types\launchers\aa\TITAN.sqf"],
	["9M135","mods\VVLO\functions\loadouts\gear\weapons\types\launchers\at\9M135.sqf"],
	["MAAWS","mods\VVLO\functions\loadouts\gear\weapons\types\launchers\at\MAAWS.sqf"],
	["PCML","mods\VVLO\functions\loadouts\gear\weapons\types\launchers\at\PCML.sqf"],
	["RPG7","mods\VVLO\functions\loadouts\gear\weapons\types\launchers\at\RPG7.sqf"],
	["RPG42","mods\VVLO\functions\loadouts\gear\weapons\types\launchers\at\RPG42.sqf"],
	["TITANC","mods\VVLO\functions\loadouts\gear\weapons\types\launchers\at\TITANC.sqf"],
	["GM6LYNX","mods\VVLO\functions\loadouts\gear\weapons\types\primary\amr\GM6LYNX.sqf"],
	["TYPE115","mods\VVLO\functions\loadouts\gear\weapons\types\primary\amr\TYPE115.sqf"],
	["AK12","mods\VVLO\functions\loadouts\gear\weapons\types\primary\ar\AK12.sqf"],
	["AKM","mods\VVLO\functions\loadouts\gear\weapons\types\primary\ar\AKM.sqf"],
	["AKS74U","mods\VVLO\functions\loadouts\gear\weapons\types\primary\ar\AKS74U.sqf"],
	["CAR95","mods\VVLO\functions\loadouts\gear\weapons\types\primary\ar\CAR95.sqf"],
	["KATIBA","mods\VVLO\functions\loadouts\gear\weapons\types\primary\ar\KATIBA.sqf"],
	["MK20","mods\VVLO\functions\loadouts\gear\weapons\types\primary\ar\MK20.sqf"],
	["MX","mods\VVLO\functions\loadouts\gear\weapons\types\primary\ar\MX.sqf"],
	["PROMET","mods\VVLO\functions\loadouts\gear\weapons\types\primary\ar\PROMET.sqf"],
	["SDAR","mods\VVLO\functions\loadouts\gear\weapons\types\primary\ar\SDAR.sqf"],
	["SPAR16","mods\VVLO\functions\loadouts\gear\weapons\types\primary\ar\SPAR16.sqf"],
	["TRG","mods\VVLO\functions\loadouts\gear\weapons\types\primary\ar\TRG.sqf"],
	["ASP1","mods\VVLO\functions\loadouts\gear\weapons\types\primary\dmr\ASP1.sqf"],
	["CMR76","mods\VVLO\functions\loadouts\gear\weapons\types\primary\dmr\CMR76.sqf"],
	["CYRUS","mods\VVLO\functions\loadouts\gear\weapons\types\primary\dmr\CYRUS.sqf"],
	["M320","mods\VVLO\functions\loadouts\gear\weapons\types\primary\dmr\M320.sqf"],
	["MAR10","mods\VVLO\functions\loadouts\gear\weapons\types\primary\dmr\MAR10.sqf"],
	["MK1","mods\VVLO\functions\loadouts\gear\weapons\types\primary\dmr\MK1.sqf"],
	["MK14","mods\VVLO\functions\loadouts\gear\weapons\types\primary\dmr\MK14.sqf"],
	["MK18","mods\VVLO\functions\loadouts\gear\weapons\types\primary\dmr\MK18.sqf"],
	["MXM","mods\VVLO\functions\loadouts\gear\weapons\types\primary\dmr\MXM.sqf"],
	["RAHIM","mods\VVLO\functions\loadouts\gear\weapons\types\primary\dmr\RAHIM.sqf"],
	["SPAR17","mods\VVLO\functions\loadouts\gear\weapons\types\primary\dmr\SPAR17.sqf"],
	["NAVID","mods\VVLO\functions\loadouts\gear\weapons\types\primary\hmg\NAVID.sqf"],
	["SPMG","mods\VVLO\functions\loadouts\gear\weapons\types\primary\hmg\SPMG.sqf"],
	["LIM85","mods\VVLO\functions\loadouts\gear\weapons\types\primary\lmg\LIM85.sqf"],
	["MK200","mods\VVLO\functions\loadouts\gear\weapons\types\primary\lmg\MK200.sqf"],
	["ZAFIR","mods\VVLO\functions\loadouts\gear\weapons\types\primary\lmg\ZAFIR.sqf"],
	["CAR951","mods\VVLO\functions\loadouts\gear\weapons\types\primary\lsw\CAR951.sqf"],
	["MXSW","mods\VVLO\functions\loadouts\gear\weapons\types\primary\lsw\MXSW.sqf"],
	["RPK12","mods\VVLO\functions\loadouts\gear\weapons\types\primary\lsw\RPK12.sqf"],
	["SPAR16S","mods\VVLO\functions\loadouts\gear\weapons\types\primary\lsw\SPAR16S.sqf"],
	["KOZLICE","mods\VVLO\functions\loadouts\gear\weapons\types\primary\shotgun\KOZLICE.sqf"],
	["ADR97","mods\VVLO\functions\loadouts\gear\weapons\types\primary\smg\ADR97.sqf"],
	["PDW2000","mods\VVLO\functions\loadouts\gear\weapons\types\primary\smg\PSW2000.sqf"],
	["PROTECTOR","mods\VVLO\functions\loadouts\gear\weapons\types\primary\smg\PROTECTOR.sqf"],
	["STING","mods\VVLO\functions\loadouts\gear\weapons\types\primary\smg\STING.sqf"],
	["VERMIN","mods\VVLO\functions\loadouts\gear\weapons\types\primary\smg\VERMIN.sqf"],
	["4FIVE","mods\VVLO\functions\loadouts\gear\weapons\types\secondary\handgun\4FIVE.sqf"],
	["ACPC2","mods\VVLO\functions\loadouts\gear\weapons\types\secondary\handgun\ACPC2.sqf"],
	["PM","mods\VVLO\functions\loadouts\gear\weapons\types\secondary\handgun\PM.sqf"],
	["PO7","mods\VVLO\functions\loadouts\gear\weapons\types\secondary\handgun\PO7.sqf"],
	["ROOK","mods\VVLO\functions\loadouts\gear\weapons\types\secondary\handgun\ROOK.sqf"],
	["ZUBR","mods\VVLO\functions\loadouts\gear\weapons\types\secondary\handgun\ZUBR.sqf"],
	["STARTER","mods\VVLO\functions\loadouts\gear\weapons\types\secondary\pistol\STARTER.sqf"]
];
{if (toLower _x select 0 == toLower _weapon) then {_return = call compile preprocessFileLineNumbers _x select 1}} forEach _weapons;
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_weapons];
_return;
