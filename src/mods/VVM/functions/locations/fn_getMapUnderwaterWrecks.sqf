/* Name: fn_getMapUnderwaterWrecks.sqf
 * Description: Returns an array of all underwater wreck positions.
 * Author: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2013/08/07
 * Returns: Array [x,y,z]
 * Arguments:
 *   0 - Debug: (boolean) true/false
 * Example:
 *    _underwater_wrecks = [false] call VVM_fnc_getMapUnderwaterWrecks;
 * TODO:
 */
private ["_debug","_map_center","_map_size","_underwater_wreck_types","_underwater_wreck_objects","_underwater_wreck_positions","_x"];
_debug = _this select 0;
_map_center = [_debug] call VVM_fnc_getMapCenter;
_map_size = [_debug] call VVM_fnc_getMapSize;
_underwater_wreck_types = ["Land_Wreck_Traw_F","Land_Wreck_Traw2_F","Land_UWreck_MV22_F","Land_UWreck_FishingBoat_F"];
_underwater_wreck_objects = [];
{ _underwater_wreck_objects set [count _underwater_wreck_objects,(_map_center nearObjects [_x,_map_size])]; } forEach _underwater_wreck_types;
if (_debug) then {
  diag_log format ["#%1# vv_fnc_get_map_underwater_wrecks.sqf # _underwater_wreck_objects : %2 #",time,count _underwater_wreck_objects];
  { diag_log format ["#%1# vv_fnc_get_map_underwater_wrecks.sqf # %2 #",time,_x]; } forEach _underwater_wreck_objects;
};
_underwater_wreck_positions = [];
  { {_underwater_wreck_positions set [count _underwater_wreck_positions,(getPos _x)];} forEach _x;
  } forEach _underwater_wreck_objects;
  if (_debug) then {
  diag_log format ["#%1# vv_fnc_get_map_underwater_wrecks.sqf # _underwater_wreck_positions : %2 #",time,count _underwater_wreck_positions];
  { diag_log format ["#%1# vv_fnc_get_map_underwater_wrecks.sqf # %2 #",time,_x]; } forEach _underwater_wreck_positions;
};
_underwater_wreck_positions
