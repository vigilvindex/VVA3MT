/* Name: fn_createBodylight.sqf
Description: Creates a chemlight and attaches it to shoulder of target.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/09 Updated: 2016/08/15 Version: 0.0.1
Dependencies: n/a
Arguments: index name (default) TYPE {Required} min,max "values"
  d debug    (false)   BOOLEAN {N} false,true "Disabled","Enabled"
  t target   (_object) OBJECT  {Y} *          ""
  c colour   (0)       INT     {N} 0,4        "Red","Blue","Green","Yellow","Random"
  p position (0)       INT     {N} 0,2        "LeftShoulder","RightShoulder","Random"
Returns: OBJECT on success. FALSE on failure.
Usage: [["t",_target]] call VVM_fnc_createBodylight;
Todo:
 - Action to choose chemlight colour.
 - Action to attach chemlight.
 - Action to remove chemlight.
 - Event handler for entering and leaving vehicles. getInMan getOutMan SeatSwitchedMan https://community.bistudio.com/wiki/addEventHandler
 - Update offset for vehicle types and positions.
*/
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false;};
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false;};
private ["_debug","_target","_colour","_position","_colours","_positions","_return"];
{ if (_x isEqualType []) then {
    if (_x select 0 isEqualType "") then {
      switch (toLower (_x select 0)) do {
        case "d": {_debug = [_x select 1] param [0,false,[true]];};
        case "t": {_target = [_x select 1] param [0,false,[objNull]];};
        case "c": {_colour = [_x select 1] param [0,0,[0]];};
        case "p": {_position = [_x select 1] param [0,0,[0]];};
      };
    };
  };
} forEach _this;
if (isNil "_target") exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
if (_target isEqualType false) exitWith {["%1 Function called without required argument type.",time] call BIS_fnc_error;false;};
{ if (isNil _x) then {
    switch (_forEachIndex) do {
      case 0: {_debug = false;};
      case 1: {_colour = 0;};
      case 2: {_position = 0;};
    };
  };
} forEach ["_debug","_colour","_position"];
if (_debug) then {
  { diag_log format ["# %1 # %2 # %3 # _param %4 = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_forEachIndex,_x];
  } forEach [_debug,_target,_colour,_position];
};
_colours = ["Chemlight_red","Chemlight_blue","Chemlight_green","Chemlight_yellow"];
_positions = ["LeftShoulder","RightShoulder"];
_colour = [_colours select floor random 3,_colours select _colour] select (_colour <= 3 && _colour >= 0);
_position = [_positions select floor random 1,_positions select _position] select (_position <= 1 && _position >= 0);
_return = createVehicle [_colour,[getpos _target select 0,getpos _target select 1,2],[],0,"CAN_COLLIDE"];
_return attachTo [_target, [0.12,0.06,-0.1], _position];
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_colour,_position,_colours,_positions];
_return;
