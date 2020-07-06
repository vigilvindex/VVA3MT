/* Name: fn_createGarage.sqf
Description: Creates a virtual garage container. https://community.bistudio.com/wiki/Arsenal
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/19 Updated: 2016/08/19 Version: 0.0.1
Dependencies: n/a
Arguments: index name (default) TYPE {Required} min,max "values"
  d debug    (false)   BOOLEAN {N} false,true "Disabled","Enabled"
  p position ([0,0,0]) ARRAY   {Y} *          "[x,y,z]"
  r rotation (0)       SCALAR  {N} 0,359      "Degrees"
  t type     (0)       SCALAR  {N} 0,2        "All Weapons","Side/Faction Weapons"
  s side     (0)       SCALAR  {N} 0,3        "East","West","Independent","Civilian"
Returns: OBJECT on success. FALSE on failure.
Usage: [["p",[0,0,0]]] call VVM_fnc_createAmmoBox;
*/
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false;};
if !(_this isEqualType []) exitWith {["%1 Function called without array.",time] call BIS_fnc_error;false;};
private ["_debug","_position","_rotation","_type","_side","_return","_pad"];
{ if (_x isEqualType []) then {
    if (_x select 0 isEqualType "") then {
      switch (toLower (_x select 0)) do {
        case "d": {_debug = [_x select 1] param [0,false,[true]];};
        case "p": {_position = [_x select 1] param [0,false,[[]],[2,3]];};
        case "r": {_rotation = [_x select 1] param [0,0,[0]];};
        case "t": {_type = [_x select 1] param [0,0,[0]];};
        case "s": {_side = [_x select 1] param [0,0,[0]];};
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
      case 2: {_type = 0;};
      case 3: {_side = 0;};
    };
  };
} forEach ["_debug","_rotation","_type","_side"];
if (_debug) then {
  { diag_log format ["# %1 # %2 # %3 # _param %4 = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_forEachIndex,_x];
  } forEach [_debug,_position,_rotation,_type,_side];
};
_crates = ["Land_Cargo40_red_F","Land_Cargo40_blue_F","Land_Cargo40_military_green_F","Land_Cargo40_yellow_F"];
_crate = _crates select _side;
_type = [true,false] select (_type == 0);
_return = createVehicle [_crate,_position,[],0,"CAN_COLLIDE"];
_return setDir _rotation;
clearWeaponCargo _return;
clearMagazineCargo _return;
clearItemCargo _return;
clearBackpackCargo _return;
_return allowDamage false;
_position = _return getPos [20,getDir _return];
_pad = createVehicle ["Land_HelipadEmpty_F",_position,[],0,"CAN_COLLIDE"];
[_return,["Garage",{["Open",[true,_this select 3]] call BIS_fnc_garage;},_pad]] remoteExec ["addAction",0,true];
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_position,_rotation,_type,_side,_crates,_crate];
_return;
