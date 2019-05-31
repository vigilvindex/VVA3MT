/* Name: fn_setPosition.sqf
Description: Sets the position of an object.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/11 Updated: 2016/08/11 Version: 0.0.1
Dependencies: VVM_fnc_createMarker
Arguments:  index name      (default) TYPE    {Required}  Min,Max     "Values"            URL
            0     debug     (false)   BOOL    {N}         false,true  "Disabled","False"
            1     object    (objNull) OBJECT  {Y}         *           ""
            2     position  ([0,0,0]) ARRAY   {Y}         *           [x,y,z]
            3     system    (0)       SCALAR  {N}         0,7         "ASL","ATL","ASLW","AGL","AGLS","World","Relative","Config","BIS_fnc_findSafePosition" https://community.bistudio.com/wiki/Position
            4     type      (0)       SCALAR  {N}         0,3         "underwater","sealevel","ground","air" https://community.bistudio.com/wiki/flyInHeight
            5     rotation  (0)       SCALAR  {N}         0,359       ""
            6     offset    (0)       SCALAR  {N}         *           ""
Returns: ARRAY position [x,y,z]
Usage: _position = [false,0,_object,0,_position,0,0] call VVM_fnc_setPosition;
Example: _position = [false,0,_object,0,_position,0,0] call VVM_fnc_setPosition;
Todo:
*/
params [
  ["_debug",false,[true]],
  ["_object",objNull,[objNull,grpNull]],
  ["_position",[0,0,0],[[]],3],
  ["_rotation",0,[0],359],
  ["_offset",0,[0]],
  ["_system",0,[0]],
  ["_type",0,[0]],
  ["_return",[0,0,0]],
  "_marker"
];
if (_debug) then {
  diag_log format ["# %1 # %2 # _target = %3 #",time,__FILE__,_object];
  diag_log format ["# %1 # %2 # _position = %3 #",time,__FILE__,_position];
  diag_log format ["# %1 # %2 # _rotation = %3 #",time,__FILE__,_rotation];
  diag_log format ["# %1 # %2 # _offset = %3 #",time,__FILE__,_offset];
  diag_log format ["# %1 # %2 # _system = %3 #",time,__FILE__,_system];
  diag_log format ["# %1 # %2 # _type = %3 #",time,__FILE__,_type];
};
switch (_system) do {
    case (0): {
      _object setFormDir _rotation; // https://community.bistudio.com/wiki/setFormDir
      _object setDir _rotation; // https://community.bistudio.com/wiki/setDir
      _object setPosASL [_position select 0, _position select 1, _position select 2]; // https://community.bistudio.com/wiki/setPosASL
    };
    case (1): {
      _object setFormDir _rotation;
      _object setDir _rotation;
      _object setPosATL [getPosATL _position select 0, (getPosATL _position select 1) - 10, getPosATL _position select 2]; // https://community.bistudio.com/wiki/setPosATL
    };
    case (2): {
      _object setFormDir _rotation;
      _object setDir _rotation;
      _object setPosASLW [_position select 0, _position select 1, -10]; // https://community.bistudio.com/wiki/setPosASLW
    };
    case (3): {};
    case (4): {
      _object setFormDir _rotation;
      _object setDir _rotation;
    	_offset = _position select 2;
    	if (isNil "_offset") then {_offset = 0};
    	_position set [2, worldSize];
    	_object setPosASL _position;
    	_position set [2, vectorMagnitude (_position vectorDiff getPosVisual _object) + _offset];
    	_object setPosASL _position;
    };
    case (5): {
      _object setFormDir _rotation;
      _object setDir _rotation;
      _object setPosWorld getPosWorld _position; // https://community.bistudio.com/wiki/setPosWorld
    };
    case (6): {};
    case (7): {};
    case (8): {};
};
if (_debug) then {
  diag_log format ["# %1 # %2 # _position = %3 #",time,__FILE__,_position];
  _marker = [_debug,"_debug_position_marker","debug_position_marker",[_position select 0,_position select 1,0],[1,1],0,1,"Default","ICON","mil_dot"] call VVM_fnc_createMarker;
};
{_x = nil;} forEach [_debug,_object,_position,_rotation,_offset,_system,_type];
_return
