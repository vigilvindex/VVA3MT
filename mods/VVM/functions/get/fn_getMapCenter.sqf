/* Name: vv_fnc_get_map_center.sqf
 * Description: Returns the center position for the map as an array.
 * Author: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2013/08/07
 * Returns: Array [x,y]
 * Arguments:
 *   0 - Debug: (boolean) true/false
 * Example:
 *   _map_center = [false] call VVM_fnc_getMapCenter;
 * TODO:
 *  - Remove create marker function dependency.
 */
private["_debug","_map_center"];
_debug = _this select 0;
_map_center = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
if (_debug) then {
  diag_log format ["# %1 # custom_function_get_map_center: _map_center = %2 #",time,_map_center];
  _marker = [["d",_debug],["n","_map_center_marker"],["t","Map Center"],["p",[_map_center select 0,_map_center select 1,0]]] call VVM_fnc_createMarker;
};
_map_center
