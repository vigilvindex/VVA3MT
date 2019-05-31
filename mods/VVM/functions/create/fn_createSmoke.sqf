/* Name: fn_createSmoke.sqf
Description: Creates a type of smoke at a given position.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/12 Updated: 2016/08/15 Version: 0.0.1
Dependencies: n/a
Arguments: index name (default) TYPE {Required} min,max "values"
  d debug    (false)   BOOLEAN {N} false,true "Disabled","Enabled"
  p position ([0,0,0]) ARRAY   {Y} *          "[x,y,z]"
  c colour   (0)       SCALAR  {N} 0,5        "Red","Blue","Green","Yellow","White","Random"
Returns: OBJECT on success. FALSE on failure.
Usage: _object = [DEBUG,TYPE,POSITION] call VVM_fnc_createSmoke;
*/
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false;};
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false;};
private ["_debug","_position","_colour","_colours","_return"];
{ if (_x isEqualType []) then {
    if (_x select 0 isEqualType "") then {
      switch (toLower (_x select 0)) do {
        case "d": {_debug = [_x select 1] param [0,false,[true]];};
        case "p": {_position = [_x select 1] param [0,false,[[]],[2,3]];};
        case "c": {_colour = [_x select 1] param [0,0,[0]];};
      };
    };
  };
} forEach _this;
if (isNil "_position") exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
if (_position isEqualType false) exitWith {["%1 Function called without required argument type.",time] call BIS_fnc_error;false;};
{ if (isNil _x) then {
    switch (_forEachIndex) do {
      case 0: {_debug = false;};
      case 1: {_colour = 0;};
    };
  };
} forEach ["_debug","_colour"];
if (_debug) then {
  { diag_log format ["# %1 # %2 # %3 # _param %4 = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_forEachIndex,_x];
  } forEach [_debug,_position,_colour];
};
_colours = ["SmokeShellRed","SmokeShellBlue","SmokeShellGreen","SmokeShellYellow","SmokeShell"];
_colour = [_colours select floor random 4,_colours select _colour] select (_colour >= 0 && _colour <= 4);
_return = createVehicle [_colour,_position,[],0,"CAN_COLLIDE"];
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_position,_colour,_colours];
_return;
