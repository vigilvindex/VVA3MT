/* Name: vv_fnc_get_map_center_position.sqf
 * Description: Returns the center position for the map as an array.
 * Author: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2013/08/29
 * Returns: Array [x,y]
 * Arguments:
 *   0 - Debug: (boolean) true/false
 * Example:
 *   _map_center = [false] call VVM_fnc_getMapCenterPosition;
 */
private["_debug","_world_name","_map_center"];
_debug = _this select 0;
// Get World Name
_world_name = worldName;
if (_debug) then {diag_log format ["# %1 # _world_name = %2",time,_world_name];};
switch (toLower(_world_name)) do {
  case "altis": {_map_center = [15500,15500];};
  case "chernarus": {_map_center = [8000,8000];};
  case "chernarus_summer": {_map_center = [8000,8000];};
  case "chernarus_winter": {_map_center = [8000,8000];};
  case "cup_chernarus_a3": {_map_center = [8000,8000];};
  case "enoch": {_map_center = [6500,6500];};
  case "gm_weferlingen_summer": {_map_center = [10300,10300];};
  case "gm_weferlingen_winter": {_map_center = [10300,10300];};
  case "malden": {_map_center = [6400,6400];};
  case "rhspkl": {_map_center = [4000,4000];};
  case "rof_mok": {_map_center = [12300,12300];};
  case "stratis": {_map_center = [4100,4100];};
  case "takistan": {_map_center = [6500,6500];};
  case "tanoa": {_map_center = [7700,7700];};
  case "vr": {_map_center = [4100,4100];};
};
if (_debug) then {
  diag_log format ["# %1 # _map_center = %2 #",time,_map_center];
  _marker = [_debug,"_map_center_position_marker","Map Center Position",[_map_center select 0,_map_center select 1,0],[1,1],0,1,"Default","ICON","mil_dot"] call VVM_fnc_createMarker;
};
_map_center
