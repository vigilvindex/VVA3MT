/* Name: fn_getMapSize.sqf
 * Description: Calculates size of map and returns the value as an number.
 * Author: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2013/08/07
 * Returns: Number (0.0)
 * Arguments:
 *   0 - Debug: (boolean) true/false
 * Example:
 *   _map_size = [false] call VVM_fnc_getMapSize;
 * TODO:
 *  - Remove get map center function dependency and replace with worldSize https://community.bistudio.com/wiki/worldSize
 */
private["_debug","_map_center","_map_size"];
_debug = _this select 0;
_map_center = [_debug] call VVM_fnc_getMapCenterPosition;
_map_size = ((_map_center select 0) max (_map_center select 1)) * 1.2;
if (_debug) then { diag_log format ["#%1# vv_fnc_get_map_size.sqf # _map_size = %2 #",time,_map_size]; };
_map_size
