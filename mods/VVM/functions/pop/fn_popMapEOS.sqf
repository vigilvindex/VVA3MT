/* Name: vv_fnc_populate_map_eos.sqf
 * Description: Populates the map with triggers, markers, and groups of enemy AI with EOS.
 * Author: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2013/08/09
 * Usage: fun = [] call vv_fnc_populate_map_eos;
 * Returns: Nothing.
 * Arguments: None.
 * Example: fun = [] call vv_fnc_populate_map_eos;
 */
private["_debug","_locations","_name","_type","_position","_radius_x","_radius_y","_angle","_position_x","_position_y","_position_z","_area_marker_name","_area_marker","_area_eos_init"];
_debug = false;
_locations = [_debug] call VVM_fnc_getMapLocations;
{
  _name = _x select 0;
  _type = _x select 1;
  _position = _x select 2;
  _radius_x = _x select 3;
  _radius_y = _x select 4;
  _angle = _x select 5;
  _position_x = _position select 0;
  _position_z = _position select 1;
  _position_y = _position select 2;
  switch (_type) do {
    case "town": {
      _area_marker_name = format["%1_%2",_type,_name];
      _area_marker = [_debug,_area_marker_name,_area_marker_name,[_position_x,_position_y],[_radius_x,_radius_y],_angle,0,"Default","ELLIPSE","Border"] spawn VVM_fnc_createMarker;
      if ((EosDynamicSwitch) == 1) then {
        _area_eos_init = call compile format["[['%1'],[%2,%3,%4,%5,%6,%7],[%8,%9,%10],true] execVM 'modules\eos\eos_GearBox.sqf';",_area_marker_name,EosTownBuildingInfNum,EosTownPatrolInfNum,EosTownPatrolVehNum,EosTownPatrolArmNum,EosTownMortNum,EosTownPatrolArmNum,EosAiSideSwitch,EosAiSpawnDist,EosMarkerSwitch];
      }else{
        _area_eos_init = call compile format["[['%1'],[%2,%3,%4,%5,%6,%7],[%8,%9,%10],false] execVM 'modules\eos\eos_GearBox.sqf';",_area_marker_name,EosTownBuildingInfNum,EosTownPatrolInfNum,EosTownPatrolVehNum,EosTownPatrolArmNum,EosTownMortNum,EosTownPatrolArmNum,EosAiSideSwitch,EosAiSpawnDist,EosMarkerSwitch];
      };
    };
    case "camp": {
      _area_marker_name = format["%1_%2",_type,_name];
      _area_marker = [_debug,_area_marker_name,_area_marker_name,[_position_x,_position_y],[_radius_x,_radius_y],_angle,0,"Default","ELLIPSE","Border"] spawn VVM_fnc_createMarker;
      if ((EosDynamicSwitch) == 1) then {
        _area_eos_init = call compile format["[['%1'],[%2,%3,%4,%5,%6,%7],[%8,%9,%10],true] execVM 'modules\eos\eos_GearBox.sqf';",_area_marker_name,EosCampBuildingInfNum,EosCampPatrolInfNum,EosCampPatrolVehNum,EosCampPatrolArmNum,EosCampMortNum,EosCampPatrolArmNum,EosAiSideSwitch,EosAiSpawnDist,EosMarkerSwitch];
      }else{
        _area_eos_init = call compile format["[['%1'],[%2,%3,%4,%5,%6,%7],[%8,%9,%10],false] execVM 'modules\eos\eos_GearBox.sqf';",_area_marker_name,EosCampBuildingInfNum,EosCampPatrolInfNum,EosCampPatrolVehNum,EosCampPatrolArmNum,EosCampMortNum,EosCampPatrolArmNum,EosAiSideSwitch,EosAiSpawnDist,EosMarkerSwitch];
      };
    };
    case "radio": {
      _area_marker_name = format["%1_%2",_type,_name];
      _area_marker = [_debug,_area_marker_name,_area_marker_name,[_position_x,_position_y],[_radius_x,_radius_y],_angle,0,"Default","ELLIPSE","Border"] spawn VVM_fnc_createMarker;
      if ((EosDynamicSwitch) == 1) then {
        _area_eos_init = call compile format["[['%1'],[%2,%3,%4,%5,%6,%7],[%8,%9,%10],true] execVM 'modules\eos\eos_GearBox.sqf';",_area_marker_name,EosRadioBuildingInfNum,EosRadioPatrolInfNum,EosRadioPatrolVehNum,EosRadioPatrolArmNum,EosRadioMortNum,EosRadioPatrolArmNum,EosAiSideSwitch,EosAiSpawnDist,EosMarkerSwitch];
      }else{
        _area_eos_init = call compile format["[['%1'],[%2,%3,%4,%5,%6,%7],[%8,%9,%10],false] execVM 'modules\eos\eos_GearBox.sqf';",_area_marker_name,EosRadioBuildingInfNum,EosRadioPatrolInfNum,EosRadioPatrolVehNum,EosRadioPatrolArmNum,EosRadioMortNum,EosRadioPatrolArmNum,EosAiSideSwitch,EosAiSpawnDist,EosMarkerSwitch];
      };
    };
    case "airstrip": {
      _area_marker_name = format["%1_%2",_type,_name];
      _area_marker = [_debug,_area_marker_name,_area_marker_name,[_position_x,_position_y],[_radius_x,_radius_y],_angle,0,"Default","ELLIPSE","Border"] spawn VVM_fnc_createMarker;
      if ((EosDynamicSwitch) == 1) then {
        _area_eos_init = call compile format["[['%1'],[%2,%3,%4,%5,%6,%7],[%8,%9,%10],true] execVM 'modules\eos\eos_GearBox.sqf';",_area_marker_name,EosAirstripBuildingInfNum,EosAirstripPatrolInfNum,EosAirstripPatrolVehNum,EosAirstripPatrolArmNum,EosAirstripMortNum,EosAirstripPatrolArmNum,EosAiSideSwitch,EosAiSpawnDist,EosMarkerSwitch];
      }else{
        _area_eos_init = call compile format["[['%1'],[%2,%3,%4,%5,%6,%7],[%8,%9,%10],false] execVM 'modules\eos\eos_GearBox.sqf';",_area_marker_name,EosAirstripBuildingInfNum,EosAirstripPatrolInfNum,EosAirstripPatrolVehNum,EosAirstripPatrolArmNum,EosAirstripMortNum,EosAirstripPatrolArmNum,EosAiSideSwitch,EosAiSpawnDist,EosMarkerSwitch];
      };
    };
    case "outpost": {
      _area_marker_name = format["%1_%2",_type,_name];
      _area_marker = [_debug,_area_marker_name,_area_marker_name,[_position_x,_position_y],[_radius_x,_radius_y],_angle,0,"Default","ELLIPSE","Border"] spawn VVM_fnc_createMarker;
      if ((EosDynamicSwitch) == 1) then {
        _area_eos_init = call compile format["[['%1'],[%2,%3,%4,%5,%6,%7],[%8,%9,%10],true] execVM 'modules\eos\eos_GearBox.sqf';",_area_marker_name,EosOutpostBuildingInfNum,EosOutpostPatrolInfNum,EosOutpostPatrolVehNum,EosOutpostPatrolArmNum,EosOutpostMortNum,EosOutpostPatrolArmNum,EosAiSideSwitch,EosAiSpawnDist,EosMarkerSwitch];
      }else{
        _area_eos_init = call compile format["[['%1'],[%2,%3,%4,%5,%6,%7],[%8,%9,%10],false] execVM 'modules\eos\eos_GearBox.sqf';",_area_marker_name,EosOutpostBuildingInfNum,EosOutpostPatrolInfNum,EosOutpostPatrolVehNum,EosOutpostPatrolArmNum,EosOutpostMortNum,EosOutpostPatrolArmNum,EosAiSideSwitch,EosAiSpawnDist,EosMarkerSwitch];
      };
    };
    case "farm": {
      _area_marker_name = format["%1_%2",_type,_name];
      _area_marker = [_debug,_area_marker_name,_area_marker_name,[_position_x,_position_y],[_radius_x,_radius_y],_angle,0,"Default","ELLIPSE","Border"] spawn VVM_fnc_createMarker;
      if ((EosDynamicSwitch) == 1) then {
        _area_eos_init = call compile format["[['%1'],[%2,%3,%4,%5,%6,%7],[%8,%9,%10],true] execVM 'modules\eos\eos_GearBox.sqf';",_area_marker_name,EosFarmBuildingInfNum,EosFarmPatrolInfNum,EosFarmPatrolVehNum,EosFarmPatrolArmNum,EosFarmMortNum,EosFarmPatrolArmNum,EosAiSideSwitch,EosAiSpawnDist,EosMarkerSwitch];
      }else{
        _area_eos_init = call compile format["[['%1'],[%2,%3,%4,%5,%6,%7],[%8,%9,%10],false] execVM 'modules\eos\eos_GearBox.sqf';",_area_marker_name,EosFarmBuildingInfNum,EosFarmPatrolInfNum,EosFarmPatrolVehNum,EosFarmPatrolArmNum,EosFarmMortNum,EosFarmPatrolArmNum,EosAiSideSwitch,EosAiSpawnDist,EosMarkerSwitch];
      };
    };
  };
} forEach (_locations);
