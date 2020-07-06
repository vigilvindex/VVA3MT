/* Name: fn_getMapMilitaryBuildings.sqf
 * Description: Returns all military buildings within a given area as an array.
 * Authors: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2013/09/05
 * Arguments:
 *  0 - DEBUG boolean (true/false)
 *  1 - POSITION array [x,y,z]
 *  2 - RADIUS float (0.0)
 * Usage: _military_buildings = [DEBUG,POSITION,RADIUS] call VVM_fnc_getMapMilitaryBuildings;
 * Example: _military_buildings = [FALSE,[125.32,256.12,12],1000] call VVM_fnc_getMapMilitaryBuildings;
 */
private["_debug","_position","_radius","_classnames","_military_buildings"];
_debug = _this select 0;
_position = _this select 1;
_radius = _this select 2;
_classnames = ["Land_Cargo_House_V1_F","Land_Cargo_House_V2_F","Land_Cargo_House_V3_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F","Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F","Land_MilOffices_V1_F","Land_i_Barracks_V1_F","Land_i_Barracks_V2_F"];
_military_buildings = nearestObjects [_position,_classnames,_radius];
if (_debug) then {
  diag_log format["#%1# vv_fnc_get_military_buildings.sqf # _military_buildings (%2)",time, count _military_buildings];
  if ((count _military_buildings) > 0) then {
    {
      diag_log format["#%1# vv_fnc_get_military_buildings.sqf # %2",time,getPos _x];
    } forEach _military_buildings;
  };
};
_military_buildings
