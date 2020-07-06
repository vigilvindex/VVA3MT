/* Name: fn_createFlagpole.sqf
Description: Creates a flag pole.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/09 Updated: 2016/08/15 Version: 0.0.1
Dependencies: n/a
Arguments: index name (default) TYPE {Required} min,max "values"
  d debug    (false)   BOOLEAN {N} false,true "Disabled","Enabled"
  p position ([0,0,0]) ARRAY   {Y} *          "[x,y,z]"
  r rotation (0)       SCALAR  {N} 0,360      "Degrees"
  c colour   (0)       SCALAR  {N} 0,3        "Red","Blue","Green","White"
Returns: OBJECT on success. FALSE on failure.
Usage: [["p",[0,0,0]]] call VVM_fnc_createFlagpole;
*/
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false;};
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false;};
private ["_debug","_position","_rotation","_colour","_colours","_return"];
{ if (_x isEqualType []) then {
    if (_x select 0 isEqualType "") then {
      switch (toLower (_x select 0)) do {
        case "d": {_debug = [_x select 1] param [0,false,[true]];};
        case "p": {_position = [_x select 1] param [0,false,[[]],[2,3]];};
        case "r": {_rotation = [_x select 1] param [0,0,[0]];};
        case "c": {_colour = [_x select 1] param [0,0,[0]];};
      };
    };
  };
} forEach _this;
if (isNil "_position") exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
if (_position isEqualType false) exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
{ if (isNil _x) then {
    switch (_forEachIndex) do {
      case 0: {_debug = false;};
      case 1: {_rotation = 0;};
      case 2: {_colour = 0;};
    };
  };
} forEach ["_debug","_rotation","_colour"];
if (_debug) then {
  { diag_log format ["# %1 # %2 # %3 # _param %4 = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_forEachIndex,_x];
  } forEach [_debug,_position,_rotation,_colour];
};
_colours = ["Flag_Red_F","Flag_Blue_F","Flag_Green_F","Flag_White_F"];
_colour = _colours select _colour;
_return = createVehicle [_colour,_position,[],0,"NONE"];
_return setDir _rotation;
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_position,_rotation,_colour,_colours];
_return;
