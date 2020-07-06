/* Name: vv_fnc_get_map_area.sqf
 * Description: Returns the area for the map as an array.
 * Author: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2013/08/31
 * Returns: Array [[x,y,z],[rx,ry]]
 * Arguments:
 *  _this select 0; DEBUG boolean (true/false)
 * Example:
 *   _map_area = [false] call VVM_fnc_getMapArea;
 */
private["_debug","_world_name","_map_area"];
_debug = _this select 0;
_world_name = toLower(worldName);
switch (_world_name) do {
  case "altis": {_map_area = [[15283.913,15421.917,0.031960852],[13500,11000]];};
  case "stratis": {_map_area = [[4321.8706,4116.7896,171.46429],[3000,4000]];};
  case "tanoa": {_map_area = [[4321.8706,4116.7896,171.46429],[3000,4000]];};
};
if (_debug) then {
  diag_log format ["# %1 # vv_fnc_get_map_area.sqf # _map_area = %2 #",time,_map_area];
};
_map_area
