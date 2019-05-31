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
  case "altis": {_map_center = [15073.771,15255.088];};
  case "stratis": {_map_center = [4054.6255,4357.8535];};
  case "tanoa": {_map_center = [7228,6987];};
};
if (_debug) then {
  diag_log format ["# %1 # _map_center = %2 #",time,_map_center];
  _marker = [_debug,"_map_center_position_marker","Map Center Position",[_map_center select 0,_map_center select 1,0],[1,1],0,1,"Default","ICON","mil_dot"] call VVM_fnc_createMarker;
};
_map_center
