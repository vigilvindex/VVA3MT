/* fn_createWall.sqf - Creates a wall. - vigil.vindex@gmail.com - https://creativecommons.org/licenses/by-sa/4.0/
Arguments: index name     (default) TYPE    {Required} min,max    "values"
           d     debug    (false)   BOOLEAN {N}        false,true "Disabled","Enabled"
           s     start 	  ([0,0,0]) ARRAY   {Y}        *          "[x,y,z]"
		       e     end 	    ([0,0,0]) ARRAY   {Y}        *          "[x,y,z]"
           r     rotation (0)       SCALAR  {N}        0,360      "Degrees"
		       h     height   (0)       SCALAR  {N}        *          "Meters"
		       t 	   type 	  (0)		    SCALAR  {N}        0,0        "Sandbag"
		       c	   class    (0)		    SCALAR  {N}        0,4        "Corner","End","Long","Round","Short"
           b     bend     (0)		    SCALAR  {N}        0,3        "None","Start","End","Both"
Returns: TRUE on success. ARRAY on failure.
Dependencies: VVM_fnc_createMarker
Usage: _wall = [["s",[1,1,0]],["e",[2,2,0]]] call VVM_fnc_createWall; */
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false;};
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false;};
private ["_debug","_start","_end","_rotation","_height","_type","_class","_return"];
{ if (_x isEqualType []) then { if (_x select 0 isEqualType "") then { switch (toLower (_x select 0)) do {
  case "d": {_debug     = [_x select 1] param [0,false,[true]];};
  case "s": {_start     = [_x select 1] param [0,false,[[]],[2,3]];};
  case "e": {_end       = [_x select 1] param [0,false,[[]],[2,3]];};
  case "r": {_rotation  = [_x select 1] param [0,false,[0]];};
  case "h": {_height    = [_x select 1] param [0,false,[0]];};
  case "t": {_type      = [_x select 1] param [0,false,[0]];};
  case "c": {_class     = [_x select 1] param [0,false,[0]];};
  case "b": {_bend      = [_x select 1] param [0,false,[0]];};
};};};} forEach _this;
if (isNil "_start") exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
if (_start isEqualType false) exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
if (isNil "_end") exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
if (_end isEqualType false) exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
{ if (isNil _x) then { switch (_forEachIndex) do {
  case 0: {_debug     = false;};
  case 1: {_rotation  = 0;};
  case 2: {_height    = 0;};
  case 3: {_type      = 0;};
  case 4: {_class     = 0;};
  case 5: {_bend      = 0;};
};};} forEach ["_debug","_rotation","_height","_type","_class","_bend"];
if (_debug) then {
  { diag_log format ["#%1#%2#%3# _param %4 = %5 #",
      time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,
      _forEachIndex,
      str _x
    ];
  } forEach [_debug,_start,_end,_rotation,_height,_type,_class,_bend];
};
if (_debug) then {
  _marker = [["n","START"],["t","START"],["p",_start],["c",0]] call VVM_fnc_createMarker;
  _marker = [["n","END"],["t","END"],["p",_end],["c",0]] call VVM_fnc_createMarker;
};
_types = [ // CLASSNAME                 // LENGTH   // DEPTH  // HEIGHT  // SIZE
  [ ["Land_BagFence_Short_F",           [1.98357,   0.528964, 0.906839], 2.15044],
    ["Land_BagFence_Round_F",           [2.85691,   1.08086,  0.916895], 3.00367],
    ["Land_BagFence_Long_F",            [3.1227,    0.510482, 0.916895], 3.22911],
    ["Land_BagFence_End_F",             [0.887875,  0.47966,  0.887636], 1.30118],
    ["Land_BagFence_Corner_F",          [1.25285,   0.997034, 0.948521], 1.77386] ],
  [ ["Land_BagFence_01_short_green_F",  [1.98797,   0.528964, 0.911905], 2.1533],
    ["Land_BagFence_01_round_green_F",  [2.85691,   1.08086,  0.920897], 3.00465],
    ["Land_BagFence_01_long_green_F",   [3.13125,   0.510482, 0.920897], 3.23829],
    ["Land_BagFence_01_end_green_F",    [0.887875,  0.47966,  0.887636], 1.30118],
    ["Land_BagFence_01_corner_green_F", [1.25584,   0.997034, 0.948521], 1.77183] ],
  [ ["Land_Mil_WallBig_4m_F",           [4.05205,   1.09571,  4.7439],   6.3161],
    ["Land_Mil_WallBig_Corner_F",       [1.53757,   1.53232,  4.72745],  5.20201] ],
  [ ["Land_SandbagBarricade_01_F",      [2.64018,   1.14481,  2.75504],  3.88323],
    ["Land_SandbagBarricade_01_half_F", [2.58915,   1.16291,  1.43316],  3.02928],
    ["Land_SandbagBarricade_01_hole_F", [2.6201,    1.14464,  2.75049],  3.93623] ]
];
_types = _types select _type;
diag_log format ["# %1 #",_types];
_types = [((_types select _type) select 0),((_types select _type) select 0)];
diag_log format ["# %1 #",_types];
_size = sizeOf ((_types select 0) select 0);
_return = createVehicle [((_types select _type) select 0),_start,[],0,"CAN_COLLIDE"];
_height = 0; _bend = 0;
_rotation = (_start getDir _end) + 45;
_dist = _start vectorDistance _end;
_return setDir _rotation;
_box = boundingBoxReal _return;
_box1 = _box select 1;
_wx = (_box1 select 0); _wy = (_box1 select 1);
_size = _wx * 2;
_count = _dist / (ceil _size) * 1.5;
_a = 0; _b = 0;
_marker = [["n",format["_wallmarker%1",str _a]],["p",_start],["s",[_wx,_wy]],["r",_rotation],["sh",1]] call VVM_fnc_createMarker;
for "_i" from 0 to (ceil _count) do {
  _pos = [_start select 0,((_start select 1) + (floor _size * _a)),_start select 2];
  if (_b == 0 ) then { 
    _return = createVehicle [_type select 0,_pos,[],0,"CAN_COLLIDE"]; _b = 1;
  } else {
    _return = createVehicle [_type select 1,_pos,[],0,"CAN_COLLIDE"]; _b = 0;
  };
  _return setDir _rotation;
  _box = boundingBoxReal _return;
  _box2 = _box select 1;
  _wx = _box2 select 0; _wy = _box2 select 1;
  _marker = [["n",format["_wallmarker%1_%2", str _count, str _a]],["p",_pos],["s",[_wx,_wy]],["r",_rotation],["sh",1]] call VVM_fnc_createMarker;
  _a = _a + 1;
  if (_a >= _count) exitwith {}
};
if (_debug) then { { diag_log format ["#%1#%2#%3# _x = %4 #",time,__FILE__ select [count PATH],__LINE__,_x]; } forEach [_size,_box,_dist,_count,_rotation]; };
if (_debug) then {diag_log format ["#%1#%2#%3# _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_start,_end,_rotation,_height,_type,_class,_bend];
_return;
