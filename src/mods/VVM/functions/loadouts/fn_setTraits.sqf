/* Name: fn_setTraits.sqf; Description: Sets a units traits.; Authors: vigil.vindex@gmail.com; License: https://creativecommons.org/licenses/by-sa/4.0/; Created: 2016/08/23 Updated: 2016/08/23 Version: 0.0.1;
Dependencies: n/a;
Arguments: index name     (default)   TYPE    {Required} min,max    "values"
           d     debug    (false)     BOOLEAN {N}        false,true "Disabled","Enabled"
           u     unit 	  (ObjNull)   OBJECT  {Y}        *          ""
           t     traits   ([0,0,0,0]) ARRAY   {N}        0=OFF,1=ON "engineer","explosiveSpecialist","medic","UAVHacker"
Returns: BOOLEAN. TRUE on success. FALSE on failure.
Usage: [["u",UNIT],["t",[0,0,0,0]]] call VVLO_fnc_setTraits; */
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false;};
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false;};
private ["_debug","_unit","_traits","_traitkeys","_count","_return"];
{ if (_x isEqualType []) then {
    if (_x select 0 isEqualType "") then {
      switch (toLower (_x select 0)) do {
        case "d": {_debug = [_x select 1] param [0,false,[true]];};
        case "u": {_unit = [_x select 1] param [0,ObjNull,[ObjNull]];};
        case "t": {_traits = [_x select 1] param [0,[0,0,0,0],[[0]],[4]];};
      };
    };
  };
} forEach _this;
if (isNil "_unit") exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
if (_unit isEqualType false) exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
{ if (isNil _x) then {
    switch (_forEachIndex) do {
      case 0: {_debug = false;};
      case 1: {_traits = [0,0,0,0];};
    };
  };
} forEach ["_debug","_traits"];
if (_debug) then {
  { diag_log format ["# %1 # %2 # %3 # _param %4 = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_forEachIndex,_x];
  } forEach [_debug,_unit,_traits];
};
_traitkeys = ["engineer","explosiveSpecialist","medic","UAVHacker"];
_count = 0;
{ _unit setUnitTrait [_x,_traits select _count]; _count = _count + 1; } forEach _traitkeys;
_return = true;
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_traits,_traitkeys,_count];
_return;
