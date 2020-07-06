/* Name: fn_getSideArray.sqf
Description: Returns an array of side number, side, and side name for a side.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/12 Updated: 2016/08/19 Version: 0.0.1
Dependencies: n/a
Arguments: index name (default) TYPE {Required} min,max "values"
  d debug    (false)   BOOLEAN {N} false,true "Disabled","Enabled"
  s side     (0)       SCALAR  {N} 0,3        "East","West","Independent","Civilian"
Returns: ARRAY on success. FALSE on failure.
Usage: [["s",1]] call vvMOD_fnc_getSideArray;
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
  case 0: {_return = [0,east,"East"];};
  case 1: {_return = [1,west,"West"];};
  case 2: {_return = [2,independent,"Independent"];};
  case 3: {_return = [3,civilian,"Civilian"];};
};
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_side];
_return;
