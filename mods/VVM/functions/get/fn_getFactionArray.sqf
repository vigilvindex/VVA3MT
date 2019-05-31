/* Name: fn_getFactionArray.sqf
Description: Returns an array of faction classnames for a side.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/12 Updated: 2016/08/19 Version: 0.0.1
Dependencies: n/a
Arguments: index name (default) TYPE {Required} min,max "values"
  d debug    (false)   BOOLEAN {N} false,true "Disabled","Enabled"
  s side     (0)       SCALAR  {N} 0,3        "East","West","Independent","Civilian"
Returns: ARRAY on success. FALSE on failure.
Usage: [["s",1]] call VVM_fnc_getFactionArray;
*/
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false;};
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false;};
private ["_debug","_side","_return"];
{ if (_x isEqualType []) then {
    if (_x select 0 isEqualType "") then {
      switch (toLower (_x select 0)) do {
        case "d": {_debug = [_x select 1] param [0,false,[true]];};
        case "s": {_side = [_x select 1] param [0,0,[0]];};
      };
    };
  };
} forEach _this;
{ if (isNil _x) then {
    switch (_forEachIndex) do {
      case 0: {_debug = false;};
      case 1: {_side = 0;};
    };
  };
} forEach ["_debug","_side"];
if (_debug) then {
  { diag_log format ["# %1 # %2 # %3 # _param %4 = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_forEachIndex,_x];
  } forEach [_debug,_side];
};
switch (_side) do {
  case 0: {_return = ["OPF_F","OPF_T_F","OPF_V_F","OPF_G_F"];}; // CSAT // CSAT (Pacific) // Viper // FIA
  case 1: {_return = ["BLU_F","BLU_T_F","BLU_CTRG_F","BLU_G_F","BLU_GEN_F"];}; // NATO // NATO (Pacific) // CTRG // FIA // Gendarmerie
  case 2: {_return = ["IND_F","IND_G_F","IND_C_F"];}; // AAF // FIA // Syndikat
  case 3: {_return = ["CIV_F"];}; // Civilian
};
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_side];
_return;
