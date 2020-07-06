/* Name: fn_getSkillMM.sqf
Description: Returns an array of min,max skill numbers.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/23 Updated: 2016/08/23 Version: 0.0.1
Dependencies: n/a
Arguments: index name (default) TYPE {Required} min,max "values"
  d debug (false) BOOLEAN {N} false,true "Disabled","Enabled"
  s skill (5) SCALAR {N} 0,5 "Low","Medium","High","Ultra","Godlike","Random"
Returns: OBJECT on success. FALSE on failure.
Usage: _skill = [["d",false],["s",5]] call vvMOD_fnc_getSkillMM;
*/
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false;};
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false;};
private ["_debug","_skill","_return"];
{ if (_x isEqualType []) then {
    if (_x select 0 isEqualType "") then {
      switch (toLower (_x select 0)) do {
        case "d": {_debug = [_x select 1] param [0,false,[true]];};
        case "s": {_skill = [_x select 1] param [0,5,[0]];};
      };
    };
  };
} forEach _this;
{ if (isNil _x) then {
    switch (_forEachIndex) do {
      case 0: {_debug = false;};
      case 1: {_skill = 5;};
    };
  };
} forEach ["_debug","_skill"];
if (_debug) then {
  { diag_log format ["# %1 # %2 # %3 # _param %4 = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_forEachIndex,_x];
  } forEach [_debug,_skill];
};
_return = [];
switch (_skill) do {
  case 0: {_return set [0,0.1];_return set [1,0.25];};
  case 1: {_return set [0,0.25];_return set [1,0.5];};
  case 2: {_return set [0,0.5];_return set [1,0.75];};
  case 3: {_return set [0,0.75];_return set [1,0.99];};
  case 4: {_return set [0,0.99];_return set [1,1];};
  case 5: {_return set [0,0.1];_return set [1,1];};
};
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_skill];
_return;
