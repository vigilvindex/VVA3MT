/* Name: fn_createWaypoint.sqf
Description: Creates a waypoint for a group.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/10 Updated: 2016/08/23 Version: 0.0.1
Dependencies: n/a
Arguments: index name (default) TYPE {Required} min,max "values"
  d  debug             (false)         BOOLEAN      {N} false,true "Disabled","Enabled"
  g  group             (false)         GROUP        {Y} *          "Target Object" https://community.bistudio.com/wiki/addWaypoint
  t  target            (false)         ARRAY/OBJECT {Y} *          "[x,y,z]"
  r  radius            (0)             SCALAR       {N} 0,*        "Metres"
  n  name              ("name")        STRING       {N} *          "Name" https://community.bistudio.com/wiki/setWaypointName
  de description       ("description") STRING       {N} *          "Description" https://community.bistudio.com/wiki/setWaypointDescription
  ty type              (0)             SCALAR       {N} 0,21       "MOVE","DESTROY","GETIN","SAD","JOIN","LEADER","GETOUT","CYCLE","LOAD","UNLOAD","TR UNLOAD","HOLD","SENTRY","GUARD","TALK","SCRIPTED","SUPPORT","GETIN NEAREST","DISMISS","LOITER","AND","OR"  // https://community.bistudio.com/wiki/setWaypointType // https://community.bistudio.com/wiki/Waypoint_types
  s  speed             (0)             SCALAR       {N} 0,3        "UNCHANGED","LIMITED","NORMAL","FULL" https://community.bistudio.com/wiki/setWaypointSpeed
  f  formation         (0)             SCALAR       {N} 0,9        "NO CHANGE","COLUMN","STAG COLUMN","WEDGE","ECH LEFT","ECH RIGHT","VEE","LINE","FILE","DIAMOND" https://community.bistudio.com/wiki/setWaypointFormation
  b  behaviour         (0)             SCALAR       {N} 0,5        "UNCHANGED","CARELESS","SAFE","AWARE","COMBAT","STEALTH" https://community.bistudio.com/wiki/setWaypointBehaviour
  fb force_behaviour   (0)             SCALAR       {N} 0,1        "Disabled","Enabled" https://community.bistudio.com/wiki/setWaypointForceBehaviour
  c  combat_mode       (0)             SCALAR       {N} 0,5        "NO CHANGE","BLUE","GREEN","WHITE","YELLOW","RED" https://community.bistudio.com/wiki/ArmA:_AI_Combat_Modes#Engagement_rules https://community.bistudio.com/wiki/setWaypointCombatMode
  l  loiter_radius     (0)             SCALAR       {N} *          "Metres" https://community.bistudio.com/wiki/setWaypointLoiterRadius
  lt loiter_type       (0)             SCALAR       {N} 0,1        "CIRCLE","CIRCLE_L" https://community.bistudio.com/wiki/setWaypointLoiterType
  cr completion_radius (0)             SCALAR       {N} *          "Metres" https://community.bistudio.com/wiki/setWaypointCompletionRadius
  st statements        (["",""])       ARRAY        {N} *          "["",""]" https://community.bistudio.com/wiki/setWaypointStatements
  to timeouts          ([0,0,0])       ARRAY        {N} *          "[0,0,0]" https://community.bistudio.com/wiki/setWaypointTimeout
  i  index             (0)             SCALAR       {N} *          "Index"
  sy sync              ([])            ARRAY        {N} *          "" https://community.bistudio.com/wiki/synchronizeWaypoint
Returns: OBJECT on success. FALSE on failure.
Usage: _wp = [["g",_group],["t",_target]] call VVM_fnc_createWaypoint;
Todo:
 - Synchronize waypoint with an array of waypoints.
 - Waypoint queue positioning.
*/
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false;};
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false;};
private ["_debug","_group","_target","_radius","_name","_description","_type","_speed","_formation","_behaviour","_force_behaviour","_combat_mode","_loiter_radius","_loiter_type","_completion_radius","_statements","_timeouts","_index","_sync","_types","_speeds","_formations","_behaviours","_combat_modes","_loiter_types","_waypoints","_return"];
{ if (_x isEqualType []) then {
    if (_x select 0 isEqualType "") then {
      switch (toLower (_x select 0)) do {
        case "d": {_debug = [_x select 1] param [0,false,[true]];};
        case "g": {_group = [_x select 1] param [0,false,[grpNull]];};
        case "t": {_target = [_x select 1] param [0,false,[[],objNull]];};
        case "r": {_radius = [_x select 1] param [0,10,[0]];};
        case "n": {_name = [_x select 1] param [0,"",[""]];};
        case "de": {_description = [_x select 1] param [0,"",[""]];};
        case "ty": {_type = [_x select 1] param [0,0,[0]];};
        case "s": {_speed = [_x select 1] param [0,0,[0]];};
        case "f": {_formation = [_x select 1] param [0,0,[0]];};
        case "b": {_behaviour = [_x select 1] param [0,0,[0]];};
        case "fb": {_force_behaviour = [_x select 1] param [0,0,[0]];};
        case "c": {_combat_mode = [_x select 1] param [0,0,[0]];};
        case "l": {_loiter_radius = [_x select 1] param [0,100,[0]];};
        case "lt": {_loiter_type = [_x select 1] param [0,0,[0]];};
        case "cr": {_completion_radius = [_x select 1] param [0,10,[0]];};
        case "st": {_statements = [_x select 1] param [0,["true",""],[[]],2];};
        case "to": {_timeouts = [_x select 1] param [0,[5,10,6],[[]],3];};
        case "i": {_index = [_x select 1] param [0,0,[0]];};
        case "sy": {_sync = [_x select 1] param [0,[],[[]]];};
      };
    };
  };
} forEach _this;
if (isNil "_group") exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
if (_group isEqualType false) exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
if (isNil "_target") exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
if (_target isEqualType false) exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
{ if (isNil _x) then {
    switch (_forEachIndex) do {
      case 0: {_debug = false;};
      case 1: {_radius = 10;};
      case 2: {_name = "";};
      case 3: {_description = "";};
      case 4: {_type = 0;};
      case 5: {_speed = 0;};
      case 6: {_formation = 0;};
      case 7: {_behaviour = 0;};
      case 8: {_force_behaviour = 0;};
      case 9: {_combat_mode = 0;};
      case 10: {_loiter_radius = 100;};
      case 11: {_loiter_type = 0;};
      case 12: {_completion_radius = 10;};
      case 13: {_statements = ["true",""];};
      case 14: {_timeouts = [5,10,6];};
      case 15: {_index = 0;};
      case 16: {_sync = [];};
    };
  };
} forEach ["_debug","_radius","_name","_description","_type","_speed","_formation","_behaviour","_force_behaviour","_combat_mode","_loiter_radius","_loiter_type","_completion_radius","_statements","_timeouts","_index","_sync"];
if (_debug) then {
  { diag_log format ["# %1 # %2 # %3 # _param %4 = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_forEachIndex,_x];
  } forEach [_debug,_group,_target,_radius,_name,_description,_type,_speed,_formation,_behaviour,_force_behaviour,_combat_mode,_loiter_radius,_loiter_type,_completion_radius,_statements,_timeouts,_index,_sync];
};
_types = ["MOVE","DESTROY","GETIN","SAD","JOIN","LEADER","GETOUT","CYCLE","LOAD","UNLOAD","TR UNLOAD","HOLD","SENTRY","GUARD","TALK","SCRIPTED","SUPPORT","GETIN NEAREST","DISMISS","LOITER","AND","OR"];
_speeds = ["UNCHANGED","LIMITED","NORMAL","FULL"];
_formations = ["NO CHANGE","COLUMN","STAG COLUMN","WEDGE","ECH LEFT","ECH RIGHT","VEE","LINE","FILE","DIAMOND"];
_behaviours = ["UNCHANGED","CARELESS","SAFE","AWARE","COMBAT","STEALTH"];
_combat_modes = ["NO CHANGE","BLUE","GREEN","WHITE","YELLOW","RED"];
_loiter_types = ["CIRCLE","CIRCLE_L"];
_type = _types select _type;
_speed = _speeds select _speed;
_behaviour = _behaviours select _behaviour;
_combat_mode = _combat_modes select _combat_mode;
_formation = _formations select _formation;
_loiter_type = _loiter_types select _loiter_type;
_force_behaviour = [true,false] select (_force_behaviour == 0);
_waypoints = waypoints _group;
if (_debug) then {
  diag_log format ["# %1 # %2 # _waypoints (%3) #",time,__FILE__,count _waypoints];
  diag_log format ["# %1 # %2 # _waypoints = %3 #",time,__FILE__,_waypoints];
};
_index = (count _waypoints);
if (_debug) then {diag_log format ["# %1 # %2 # _index = %3 #",time,__FILE__,_index];};
_return = _group addWaypoint [_target,_radius,_index,_name];
if !(typeName _target == "OBJECT") then {_return setWaypointPosition [_target,_radius];};
_return setWaypointName _name;
_return setWaypointDescription _description;
_return setWaypointType _type;
_return setWaypointSpeed _speed;
_return setWaypointFormation _formation;
_return setWaypointBehaviour _behaviour;
_return setWaypointForceBehaviour _force_behaviour;
_return setWaypointCombatMode _combat_mode;
_return setWaypointLoiterRadius _loiter_radius;
_return setWaypointLoiterType _loiter_type;
_return setWaypointCompletionRadius _completion_radius;
_return setWaypointStatements _statements;
_return setWaypointTimeout _timeouts;
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_radius,_name,_description,_type,_speed,_formation,_behaviour,_force_behaviour,_combat_mode,_loiter_radius,_loiter_type,_completion_radius,_statements,_timeouts,_index,_sync,_types,_speeds,_formations,_behaviours,_combat_modes,_loiter_types,_waypoints];
_return;
