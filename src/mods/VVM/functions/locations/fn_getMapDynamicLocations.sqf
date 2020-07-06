/* Name: vv_fnc_get_map_dynamic_locations.sqf
 * Description: Checks the map name and returns an array of locations for that map.
 * Author: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2013/08/07
 * Returns: array [NAME,TYPE,POSITION[x,y,z],RADIUS-X,RADIUS-Y,ANGLE]
 * Arguments:
 *   0: DEBUG (boolean) true/false
 * Example: _locations_array = [true] call VVM_fnc_getMapDynamicLocations;
 */
private ["_debug","_worldName","_locations"];
_debug = _this select 0;
// Get World Name
_worldName = worldName;
if (_debug) then {diag_log format ["#%1# vv_fnc_get_map_dynamic_locations.sqf # _worldName = %2",time,_worldName];};
// Get Map Center Position
_map_center = [_debug] call VVM_fnc_getMapCenter;
// Get Locations
_locations = nearestLocations[_map_center,["Airport","NameCity","NameMarine","NameLocal","NameVillage","NameCityCapital"],100000];
if (_debug) then {
  diag_log format ["#%1# vv_fnc_get_map_dynamic_locations.sqf # _locations = %2",time,count _locations];
  { diag_log format ["#%1# vv_fnc_get_map_dynamic_locations.sqf # %2",time,getPos _x]; } forEach _locations;
};
// Return array.
_locations
