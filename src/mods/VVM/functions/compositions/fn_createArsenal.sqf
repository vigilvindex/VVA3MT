/* Name: fn_createArsenal.sqf
Description: Creates a virtual arsenal box. https://community.bistudio.com/wiki/Arsenal
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
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false;};
private ["_debug","_position","_rotation","_type","_side","_return"];
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
if (_position isEqualType false) exitWith {["%1 Function called without required argument type.",time] call BIS_fnc_error;false;};
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
_crates = ["O_supplyCrate_F","B_supplyCrate_F","I_supplyCrate_F","IG_supplyCrate_F","C_supplyCrate_F"];
_crate = _crates select _side;
_type = [true,false] select (_type == 0);
_return = _crate createVehicle _position;
_return setDir _rotation;
clearWeaponCargo _return;
clearMagazineCargo _return;
clearItemCargo _return;
clearBackpackCargo _return;
_return allowDamage false;
[_return,["Arsenal",{["Open",true] call BIS_fnc_arsenal;}]] remoteExec ["addAction",0,true];
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_position,_rotation,_type,_side];
_return;
