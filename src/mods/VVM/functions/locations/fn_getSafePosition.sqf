/* Name: fn_getSafePosition.sqf
Description: https://community.bistudio.com/wiki/BIS_fnc_findSafePos
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/09/10 Updated: 2016/09/10 Version: 0.0.1
Dependencies: n/a
Arguments: index name (default) TYPE {Required} min,max "values"
  d  debug     (false)   BOOLEAN {N} false,true "Disabled","Enabled"
  p  position  ([0,0,0]) ARRAY   {Y} *          "[x,y,z]"
  dn min_dist  (0)       SCALAR  {N} *          "Minimum Distance In Metres From Postion"
  dx max_dist  (2)       SCALAR  {N} *          "Maximum Distance In Metres From Postion"
  do obj_dist  (1)       SCALAR  {N} *          "Minimum Distance In Metres From Nearest Object"
  w  water     (0)       SCALAR  {N} 0,2        "Not On Water","Can Be On Water","Must Be On Water"
  g  gradient  (0)       SCALAR  {N} *          "Maximum Terrain Gradient In Metres"
  s  shore     (0)       SCALAR  {N} 0,1        "Can Be On Shoreline","Must Be On Shoreline"
  b  blacklist ([[],[]]) ARRAY   {N} *          "Top-left and bottom-right coordinates of blacklisted area"
  dp default   ([[],[]]) ARRAY   {N} *          "default positions"
Returns: ARRAY on success. FALSE on failure.
Usage: _safe_position = [["p",[0,0,0]]] call vvMOD_fnc_getSafePosition;
*/
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false;};
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false;};
private ["_debug","_name","_position","_rotation","_size","_text","_alpha","_brush","_colour","_shape","_type","_brushes","_colours","_shapes","_types","_return"];
{ if (_x isEqualType []) then {
    if (_x select 0 isEqualType "") then {
      switch (toLower (_x select 0)) do {
        case "d": {_debug = [_x select 1] param [0,false,[true]];};
        case "n": {_name = [_x select 1] param [0,false,[""]];};
        case "p": {_position = [_x select 1] param [0,false,[[]],[2,3]];};
        case "r": {_rotation = [_x select 1] param [0,0,[0]];};
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
    };
  };
} forEach ["_debug","_rotation","_size","_text","_alpha","_brush","_colour","_shape","_type"];
if (_debug) then {
  { diag_log format ["# %1 # %2 # %3 # _param %4 = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_forEachIndex,_x];
  } forEach [_debug,_name,_position,_rotation,_size,_text,_alpha,_brush,_colour,_shape,_type];
};
_return = [_position,_min_dist,_max_dist,_obj_dist,_water,_gradient,_shore,_blacklist,_default] call BIS_fnc_findSafePos;
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_name,_position,_rotation,_size,_text,_alpha,_brush,_colour,_shape,_type,_brushes,_colours,_shapes,_types];
_return;
