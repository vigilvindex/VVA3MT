/* Name: vv_fnc_get_map_dynamic_roads.sqf
 * Description: Returns all roads within a given area as an array.
 * Authors: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2014/05/16
 * Arguments:
 *  0 - DEBUG boolean (true/false)
 *  1 - POSITION array [x,y,z]
 *  2 - RADIUS float (0.0)
 * Usage: _roads = [DEBUG,POSITION,RADIUS] call vv_fnc_get_map_dynamic_roads;
 * Example: _roads = [FALSE,[125.32,256.12,12],1000] call VVM_fnc_getMapDynamicRoads;
 */
private["_debug","_position","_radius","_roads"];
_debug = _this select 0;
_position = _this select 1;
_radius = _this select 2;
_roads = _position nearRoads _radius;
if (_debug) then {
  diag_log format["#%1# vv_fnc_get_map_dynamic_roads.sqf # _roads (%2)",time, count _roads];
  if ((count _roads) > 0) then {
    {
      diag_log format["#%1# vv_fnc_get_map_dynamic_roads.sqf # %2",time,getPos _x];
    } forEach _roads;
  };
};
_roads
