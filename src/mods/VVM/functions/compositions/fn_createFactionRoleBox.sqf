/* Name: fn_createFactionRoleBox.sqf
Description: Creates a box with actions to select loadouts for a factions roles.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2020/07/25 Updated: 2020/07/25 Version: 0.0.1
Dependencies: n/a
Arguments: index name (default) TYPE {Required} min,max "values"
  d debug    (false)   BOOLEAN {N} false,true "Disabled","Enabled"
  p position ([0,0,0]) ARRAY   {Y} *          "[x,y,z]"
  r rotation (0)       SCALAR  {N} 0,359      "Degrees"
  f faction
  b box
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
_crates = ["Box_CSAT_Equip_F","Box_NATO_Equip_F","Box_AAF_Equip_F","Box_IDAP_Equip_F","Box_EAF_Equip_F"];
_crate = _crates select _side;
_type = [true,false] select (_type == 0);
_return = _crate createVehicle _position;
_return setDir _rotation;
clearWeaponCargo _return;
clearMagazineCargo _return;
clearItemCargo _return;
clearBackpackCargo _return;
_return allowDamage false;
_roles = [-1] call VVM_fnc_getRole;
{ [_return,[format ["NATO-%1-%2",(_x select 1),(_x select 2)],{[_this select 1,"NATO",_this select 3] call VVM_fnc_setLoadout;},(_x select 0)]] remoteExec ["addAction",0,true];
} forEach _roles;
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_position,_rotation,_type,_side];
_return;
