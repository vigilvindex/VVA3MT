// Usage: _nato_co = ["NATO",0] call VVM_fnc_getFactionRole;
diag_log format ["# %1 #% 2 # %3 # VVM_fnc_getFactionRole _this = %4 #",time,__FILE__ select [count PATH],__LINE__,_this];
_return = [];
switch (toUpperANSI (_this select 0)) do {
	case "AAF": {_return = (_this select 1) call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\factions\indy\AAF.sqf"};
	case "CSAT": {_return = (_this select 1) call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\factions\east\CSAT.sqf"};
	case "FIA": {_return = (_this select 1) call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\factions\indy\FIA.sqf"};
	case "NATO": {_return = (_this select 1) call compile preprocessFileLineNumbers "mods\VVM\functions\loadouts\factions\west\NATO.sqf"};
	default {_return = null};
};
_return;
