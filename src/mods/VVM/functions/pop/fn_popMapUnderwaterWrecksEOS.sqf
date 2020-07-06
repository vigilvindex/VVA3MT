/* Name: vv_fnc_populate_underwater_wrecks_eos.sqf
 * Description: Populates underwater wrecks on the map with EOS.
 * Author: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2013/08/07
 * Usage: fun = [] call vv_fnc_populate_underwater_wrecks_eos;
 * Returns: Nothing.
 * Arguments: None.
 * Example: fun = [] call vv_fnc_populate_underwater_wrecks_eos;
 */
private["_debug","_underwater_wrecks","_count","_position_x","_position_y","_position_z","_buoy","_crate","_marker_name","_marker","_area_ai_eos_init"];
_debug = false;
_underwater_wrecks = [_debug] call VVM_fnc_getMapUnderwaterWrecks;
_count = 1;
{
  _position_x = _x select 0;
  _position_y = _x select 1;
  _position_z = _x select 2;
  _buoy = "Land_BarrelWater_F" createVehicle [_position_x,_position_y,_position_z];
  _buoy setPosASLW [(_position_x + (10 + floor(random 11))),(_position_y + (10 + floor(random 11))),0];
  _crate = "B_supplyCrate_F" createVehicle [(_position_x - (10 + floor(random 11))),(_position_y - (10 + floor(random 11))),_position_z];
  _crate addAction ['Attach Explosives','scripts\UnderwaterSabotage.sqf',[],1,false,true,'','((_target distance _this) < 2)'];
  _marker_name = format["wreck_%1",_count];
  _marker = [_debug,_marker_name,_marker_name,[_position_x,_position_y],[100,100],0,0,"Default","ELLIPSE","Border"] call VVM_fnc_createMarker;
  _area_ai_eos_init = call compile format["[['%1'],[%2,%3,%4,%5,%6,%7],[%8,%9,%10],true] execVM 'modules\eos\eos_GearBox.sqf';",_marker_name,0,2,1,0,0,0,EosAiSideSwitch,EosAiSpawnDist,EosMarkerSwitch];
  _count = _count + 1;
} forEach _underwater_wrecks;
