/* Name: fn_createVVS.sqf
Description: Creates a virtual vehicle spawner container and helipad.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/19 Updated: 2016/08/19 Version: 0.0.1
Dependencies: VVM_fnc_createMarker, VVS_fnc_openVVS
Arguments: index name (default) TYPE {Required} min,max "values"
  d debug    (false)   BOOLEAN {N} false,true "Disabled","Enabled"
  p position ([0,0,0]) ARRAY   {Y} *          "[x,y,z]"
  r rotation (0)       SCALAR  {N} 0,359      "Degrees"
  t type     (0)       SCALAR  {N} 0,6        "All","Car","Air","Ship","Armored","Autonomous","Support"
Returns: OBJECT on success. FALSE on failure.
Usage: [["p",[0,0,0]]] call VVM_fnc_createVVS;
*/
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false;};
if !(_this isEqualType []) exitWith {["%1 Function called without array.",time] call BIS_fnc_error;false;};
private ["_debug","_position","_rotation","_type","_return","_pad"];
{ if (_x isEqualType []) then {
    if (_x select 0 isEqualType "") then {
      switch (toLower (_x select 0)) do {
        case "d": {_debug = [_x select 1] param [0,false,[true]];};
        case "p": {_position = [_x select 1] param [0,false,[[]],[2,3]];};
        case "r": {_rotation = [_x select 1] param [0,0,[0]];};
        case "t": {_type = [_x select 1] param [0,0,[0]];};
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
    };
  };
} forEach ["_debug","_rotation","_type","_side"];
if (_debug) then {
  { diag_log format ["# %1 # %2 # %3 # _param %4 = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_forEachIndex,_x];
  } forEach [_debug,_position,_rotation,_type];
};
_crates = ["Land_Cargo40_red_F","Land_Cargo40_blue_F","Land_Cargo40_military_green_F","Land_Cargo40_yellow_F"];
_crate = _crates select 2;
_types = ["All","Car","Air","Ship","Armored","Autonomous","Support"];
_type = _types select _type;
_return = createVehicle [_crate,_position,[],0,"CAN_COLLIDE"];
_return setDir _rotation;
clearWeaponCargo _return;
clearMagazineCargo _return;
clearItemCargo _return;
clearBackpackCargo _return;
_return allowDamage false;
_position = _return getPos [15,getDir _return];
_pad = createVehicle ["Land_JumpTarget_F",_position,[],0,"CAN_COLLIDE"];
_name = format ["Marker_%1_%2_%3_%4",time,_position select 0,_position select 1,_position select 2];
_marker = [["n",_name],["p",_position],["a",0],["ty",0]] call VVM_fnc_createMarker;
[_return,["Virtual Vehicle Spawner",VVS_fnc_openVVS,[_name,"All"]]] remoteExec ["addAction",0,true];
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_position,_rotation,_type,_crates,_crate,_pad,_name,_marker];
_return;
