/* Name: vv_fnc_populate_civilian_cars.sqf
 * Description: Populates the map with empty civilian cars on roads.
 * Author: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2013/08/10
 * Returns: Nothing.
 * Arguments:
 *   0 - Debug: (boolean) true/false
 *   1 - Radius.
 *   2 - Limit.
 * Usage: [_debug,_radius,_limit] call vv_fnc_populate_civilian_cars;
 * Example: [true,100,20] call vv_fnc_populate_civilian_cars;
 */
if (!isserver) exitwith {};
private ["_debug","_radius","_limit","_classnames","_map_center","_roads","_vehicles","_x","_random_road","_position","_classname","_vehicle","_marker"];
_debug = _this select 0;
_radius = _this select 1;
_limit = _this select 2;
_classnames = ["C_Offroad_01_F"];
_map_center = [_debug] call VVM_fnc_getMapCenterPosition;
_roads = (_map_center nearRoads _radius);
_vehicles = floor(count _roads / 10);
if (_vehicles > _limit) then { _vehicles = _limit; };
for "_x" from 0 to (_vehicles) do {
  _random_road = _roads select floor(random count _roads);
  _roads = _roads - [_random_road];
  _position = [(getposatl _random_road select 0)-5 * sin(random 359),(getposatl _random_road select 1)-5 * cos(random 359)];
  _classname = _classnames select floor(random count _classnames);
  _vehicle = createVehicle [_classname,_position,[],0,"NONE"];
  _vehicle setFuel (0.3 + random 0.5);
  _vehicle setPosATL [getposatl _vehicle select 0,getposatl _vehicle select 1,0];
  _vehicle setvelocity [0,0,0];
  _vehicle setdir (getdir _random_road);
  if (_debug) then {
    diag_log format ["# %1 # vv_populate_civilian_cars.sqf : Vehicle spawned at %2! #",time,str(_position)];
    _marker = [_debug,str(_position),str(_position),[_position select 0,_position select 1,0],[1,1],0,1,"ColorBlue","ICON","mil_dot"] call VVM_fnc_createMarker;
  };
};
