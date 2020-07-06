/* Name: vv_fnc_get_position_buildingpositions.sqf
 * Description: Returns the internal positions of a building as an array.
 * Author: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2013/09/07
 * Returns: Array [[x,y,z],[x,y,z]]
 * Arguments:
 *  _this select 0; DEBUG boolean (true/false)
 *  _this select 1; BUILDING object
 * Example:
 *   _building_positions = [false,_building] call vv_fnc_get_building_positions;
 */
private["_debug","_building","_building_positions","_run","_count","_building_position"];
_debug = _this select 0;
_building = _this select 1;
_building_positions = [];
_run = true;
_count = 0;
while {_run} do {
  _building_position = _building buildingPos _count;
  if (((_building_position select 0) == 0) && ((_building_position select 1) == 0) && ((_building_position select 2) == 0)) then {
    _run = false;
  }else{
    _building_positions set[_count,_building_position];
    _count = _count + 1;
  };
};
if (_debug) then {
  diag_log format["#%1# vv_fnc_get_building_positions.sqf # _building_positions (%2)",time,count _building_positions];
  if ((count _building_positions) > 0) then {
    {
      diag_log format["#%1# vv_fnc_get_building_positions.sqf # %2",time,_x];
    } forEach _building_positions;
  };
};
_building_positions
