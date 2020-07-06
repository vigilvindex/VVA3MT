/* Name: vv_fnc_populate_underwater_wrecks_slp.sqf
 * Description: Populates underwater wrecks on the map with SLP.
 * Author: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2013/08/07
 * Usage: fun = [] call vv_fnc_populate_underwater_wrecks_slp;
 * Returns: Nothing.
 * Arguments: None.
 * Example: fun = [] call vv_fnc_populate_underwater_wrecks_slp;
 */
private["_debug","_count","_wreck_names","_underwater_wrecks","_position","_position_x","_position_y","_position_z","_marker_name","_marker","_area_ai_trigger_name","_area_ai_trigger_patrol_spawn_init","_area_ai_trigger","_buoy","_crate"];
_debug = true;
_underwater_wrecks = [_debug] call VVM_fnc_getMapUnderwaterWrecks;
_count = 1;
{
  _position_x = _x select 0;
  _position_y = _x select 1;
  _position_z = _x select 2;
  _buoy = "BuoyBig" createVehicle [_position_x,_position_y,_position_z];
  _buoy setPosASLW [(_position_x + (10 + floor(random 11))),(_position_y + (10 + floor(random 11))),0];
  _crate = "B_supplyCrate_F" createVehicle [(_position_x - (10 + floor(random 11))),(_position_y - (10 + floor(random 11))),_position_z];
  _crate addAction ['Attach Explosives','scripts\UnderwaterSabotage.sqf',[],1,false,true,'','((_target distance _this) < 2)'];
  processInitCommands;
  _marker_name = format["wreck_%1",_count];
  _marker = [_debug,_marker_name,_marker_name,[_position_x,_position_y],[100,100],0,1,"Default","ELLIPSE","DiagGrid"] call VVM_fnc_createMarker;
  _area_ai_trigger_name = format["%1_ai_trigger",_marker_name];
  _area_ai_trigger_patrol_spawn_init = format["0=['%1',[0,3,10],[['%2'],[5,10]],[3,3],[],[],[],['UPSMON','%2']] spawn SLP_spawn;",_area_ai_trigger_name,_marker_name];
  _area_ai_trigger = [
    _debug,_area_ai_trigger_name,_area_ai_trigger_name,[_position_x,_position_y],[100,100,0,false],
    ["ANY","PRESENT",true],
    ["(player distance thistrigger) < viewDistance",format["%1",_area_ai_trigger_patrol_spawn_init],""],
    [1,1,1,false]
  ] call VVM_fnc_createTrigger;
  _count = _count + 1;
} forEach _underwater_wrecks;
