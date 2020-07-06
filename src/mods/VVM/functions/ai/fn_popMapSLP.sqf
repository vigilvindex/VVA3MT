/* Name: vv_fnc_populate_map_slp.sqf
 * Description: Populates the map with triggers, markers, and groups of enemy AI using SLP Spawn.
 * Author: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2013/08/07
 * Usage: fun = [] call vv_fnc_populate_map_slp;
 * Returns: Nothing.
 * Arguments: None.
 * Example: fun = [] call vv_fnc_populate_map_slp;
 * TODO:
 *   - Add grid markers and triggers within area markers.
 *   - Check variable scopes.
 *   - Grids
        _area_grids = [];
        _area_grids = [false,[_position_x,_position_y,_radius_x,_radius_y]] call custom_function_create_grids;
        _area_grid_number = 1;
        {
            _grid_name = format["%1_GRID_%2",_area_marker_name,_area_grid_number];
            _area_grid_number = _area_grid_number + 1;
            _grid_marker = [_debug,_grid_name,_grid_name,[((_x select 0) + 50),((_x select 1) + 50)],[50,50],0,1,"Default","RECTANGLE","Empty","DiagGrid"] spawn custom_function_create_marker;
        } forEach _area_grids;
 */
private["_path","_debug","_functions","_locations","_name","_type","_position","_radius_x","_radius_y","_angle","_position_x","_position_y","_position_z","_area_marker_name","_area_marker","_area_grids","_area_grid_number","_grid_name","_grid_maker","_grid_east_capture_trigger","_grid_west_capture_trigger","_area_trigger","_area_ai_trigger"];
for [{_i = 0},{_i < count(paramsArray)},{_i = _i + 1}] do {
  call compile format ["%1 = %2",(configName ((missionConfigFile >> "Params") select _i)),(paramsArray select _i)];
};
_debug = true;
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
            _area_marker = [_debug,_area_marker_name,_area_marker_name,[_position_x,_position_y],[_radius_x,_radius_y],_angle,1,"ColorBlack","ELLIPSE","Border"] spawn VVM_fnc_createMarker;
            _area_west_control_trigger_name = format["%1_%2_west_capture_trigger",_type,_name];
            _area_west_control_trigger = [
                _debug,_area_west_control_trigger_name,_area_west_control_trigger_name,[_position_x,_position_y],[_radius_x,_radius_y,_angle,false],
                ["WEST SEIZED","WEST D",true],
                ["this",format["'%1' setmarkercolor 'ColorBLUFOR'; '%1' setmarkeralpha 1;",_area_marker_name],""],
                [5,5,5,true]
            ] spawn VVM_fnc_createTrigger;
            _area_east_control_trigger_name = format["%1_%2_east_capture_trigger",_type,_name];
            _area_east_control_trigger = [
                _debug,_area_east_control_trigger_name,_area_east_control_trigger_name,[_position_x,_position_y],[_radius_x,_radius_y,_angle,false],
                ["EAST SEIZED","EAST D",true],
                ["this",format["'%1' setmarkercolor 'ColorOPFOR'; '%1' setmarkeralpha 1;",_area_marker_name],""],
                [5,5,5,true]
            ] spawn VVM_fnc_createTrigger;
            _area_ai_trigger_name = format["%1_%2_ai_trigger",_type,_name];
            _area_ai_trigger_building_spawn_init = format["0=['%1',[0,0,10],[['%2'],[5,10]],[%3,%4],[0,0],[0,0],[0,0],['building',100]] spawn SLP_spawn;",_name,_area_marker_name,VVLocTownBuildingInfGrpNum,VVLocTownBuildingInfGrpSize];
            _area_ai_trigger_patrol_spawn_init = format["0=['%1',[0,0,10],[['%2'],[5,10]],[%3,%4],[%5,%6],[%7,%8],[%9,%10],['patrol',100]] spawn SLP_spawn;",_name,_area_marker_name,VVLocTownPatrolInfGrpNum,VVLocTownPatrolInfGrpSize,VVLocTownPatrolVehGrpNum,VVLocTownPatrolVehGrpSize,VVLocTownPatrolArmGrpNum,VVLocTownPatrolArmGrpSize,VVLocTownPatrolAirGrpNum,VVLocTownPatrolAirGrpSize];
            _area_ai_trigger = [
                _debug,_area_ai_trigger_name,_area_ai_trigger_name,[_position_x,_position_y],[_radius_x,_radius_y,_angle,false],
                ["ANY","PRESENT",true],
                ["(player distance thistrigger) < viewDistance",format["%1 %2",_area_ai_trigger_building_spawn_init,_area_ai_trigger_patrol_spawn_init],""],
                [1,1,1,false]
            ] spawn VVM_fnc_createTrigger;
        };
        case "camp": {
            _area_marker_name = format["%1_%2",_type,_name];
            _area_marker = [_debug,_area_marker_name,_area_marker_name,[_position_x,_position_y],[_radius_x,_radius_y],_angle,1,"ColorBlack","ELLIPSE","Border"] spawn VVM_fnc_createMarker;
            _area_west_control_trigger_name = format["%1_%2_west_capture_trigger",_type,_name];
            _area_west_control_trigger = [
                _debug,_area_west_control_trigger_name,_area_west_control_trigger_name,[_position_x,_position_y],[_radius_x,_radius_y,_angle,false],
                ["WEST SEIZED","WEST D",true],
                ["this",format["'%1' setmarkercolor 'ColorBLUFOR'; '%1' setmarkeralpha 1;",_area_marker_name],""],
                [5,5,5,true]
            ] spawn VVM_fnc_createTrigger;
            _area_east_control_trigger_name = format["%1_%2_east_capture_trigger",_type,_name];
            _area_east_control_trigger = [
                _debug,_area_east_control_trigger_name,_area_east_control_trigger_name,[_position_x,_position_y],[_radius_x,_radius_y,_angle,false],
                ["EAST SEIZED","EAST D",true],
                ["this",format["'%1' setmarkercolor 'ColorOPFOR'; '%1' setmarkeralpha 1;",_area_marker_name],""],
                [5,5,5,true]
            ] spawn VVM_fnc_createTrigger;
            _area_ai_trigger_name = format["%1_%2_ai_trigger",_type,_name];
            _area_ai_trigger_building_spawn_init = format["0=['%1',[0,0,10],[['%2'],[5,10]],[%3,%4],[0,0],[0,0],[0,0],['building',100]] spawn SLP_spawn;",_name,_area_marker_name,VVLocCampBuildingInfGrpNum,VVLocCampBuildingInfGrpSize];
            _area_ai_trigger_patrol_spawn_init = format["0=['%1',[0,0,10],[['%2'],[5,10]],[%3,%4],[%5,%6],[%7,%8],[%9,%10],['patrol',100]] spawn SLP_spawn;",_name,_area_marker_name,VVLocCampPatrolInfGrpNum,VVLocCampPatrolInfGrpSize,VVLocCampPatrolVehGrpNum,VVLocCampPatrolVehGrpSize,VVLocCampPatrolArmGrpNum,VVLocCampPatrolArmGrpSize,VVLocCampPatrolAirGrpNum,VVLocCampPatrolAirGrpSize];
            _area_ai_trigger = [
                _debug,_area_ai_trigger_name,_area_ai_trigger_name,[_position_x,_position_y],[_radius_x,_radius_y,_angle,false],
                ["ANY","PRESENT",true],
                ["(player distance thistrigger) < viewDistance",format["%1 %2",_area_ai_trigger_building_spawn_init,_area_ai_trigger_patrol_spawn_init],""],
                [1,1,1,false]
            ] spawn VVM_fnc_createTrigger;
        };
        case "radio": {
            _area_marker_name = format["%1_%2",_type,_name];
            _area_marker = [_debug,_area_marker_name,_area_marker_name,[_position_x,_position_y],[_radius_x,_radius_y],_angle,1,"ColorBlack","ELLIPSE","Border"] spawn VVM_fnc_createMarker;
            _area_west_control_trigger_name = format["%1_%2_west_capture_trigger",_type,_name];
            _area_west_control_trigger = [
                _debug,_area_west_control_trigger_name,_area_west_control_trigger_name,[_position_x,_position_y],[_radius_x,_radius_y,_angle,false],
                ["WEST SEIZED","WEST D",true],
                ["this",format["'%1' setmarkercolor 'ColorBLUFOR'; '%1' setmarkeralpha 1;",_area_marker_name],""],
                [5,5,5,true]
            ] spawn VVM_fnc_createTrigger;
            _area_east_control_trigger_name = format["%1_%2_east_capture_trigger",_type,_name];
            _area_east_control_trigger = [
                _debug,_area_east_control_trigger_name,_area_east_control_trigger_name,[_position_x,_position_y],[_radius_x,_radius_y,_angle,false],
                ["EAST SEIZED","EAST D",true],
                ["this",format["'%1' setmarkercolor 'ColorOPFOR'; '%1' setmarkeralpha 1;",_area_marker_name],""],
                [5,5,5,true]
            ] spawn VVM_fnc_createTrigger;
            _area_ai_trigger_name = format["%1_%2_ai_trigger",_type,_name];
            _area_ai_trigger_building_spawn_init = format["0=['%1',[0,0,10],[['%2'],[5,10]],[%3,%4],[0,0],[0,0],[0,0],['building',100]] spawn SLP_spawn;",_name,_area_marker_name,VVLocRadioBuildingInfGrpNum,VVLocRadioBuildingInfGrpSize];
            _area_ai_trigger_patrol_spawn_init = format["0=['%1',[0,0,10],[['%2'],[5,10]],[%3,%4],[%5,%6],[%7,%8],[%9,%10],['patrol',100]] spawn SLP_spawn;",_name,_area_marker_name,VVLocRadioPatrolInfGrpNum,VVLocRadioPatrolInfGrpSize,VVLocRadioPatrolVehGrpNum,VVLocRadioPatrolVehGrpSize,VVLocRadioPatrolArmGrpNum,VVLocRadioPatrolArmGrpSize,VVLocRadioPatrolAirGrpNum,VVLocRadioPatrolAirGrpSize];
            _area_ai_trigger = [
                _debug,_area_ai_trigger_name,_area_ai_trigger_name,[_position_x,_position_y],[_radius_x,_radius_y,_angle,false],
                ["ANY","PRESENT",true],
                ["(player distance thistrigger) < viewDistance",format["%1 %2",_area_ai_trigger_building_spawn_init,_area_ai_trigger_patrol_spawn_init],""],
                [1,1,1,false]
            ] spawn VVM_fnc_createTrigger;
        };
        case "airstrip": {
            _area_marker_name = format["%1_%2",_type,_name];
            _area_marker = [_debug,_area_marker_name,_area_marker_name,[_position_x,_position_y],[_radius_x,_radius_y],_angle,1,"ColorBlack","ELLIPSE","Border"] spawn VVM_fnc_createMarker;
            _area_west_control_trigger_name = format["%1_%2_west_capture_trigger",_type,_name];
            _area_west_control_trigger = [
                _debug,_area_west_control_trigger_name,_area_west_control_trigger_name,[_position_x,_position_y],[_radius_x,_radius_y,_angle,false],
                ["WEST SEIZED","WEST D",true],
                ["this",format["'%1' setmarkercolor 'ColorBLUFOR'; '%1' setmarkeralpha 1;",_area_marker_name],""],
                [5,5,5,true]
            ] spawn VVM_fnc_createTrigger;
            _area_east_control_trigger_name = format["%1_%2_east_capture_trigger",_type,_name];
            _area_east_control_trigger = [
                _debug,_area_east_control_trigger_name,_area_east_control_trigger_name,[_position_x,_position_y],[_radius_x,_radius_y,_angle,false],
                ["EAST SEIZED","EAST D",true],
                ["this",format["'%1' setmarkercolor 'ColorOPFOR'; '%1' setmarkeralpha 1;",_area_marker_name],""],
                [5,5,5,true]
            ] spawn VVM_fnc_createTrigger;
            _area_ai_trigger_name = format["%1_%2_ai_trigger",_type,_name];
            _area_ai_trigger_building_spawn_init = format["0=['%1',[0,0,10],[['%2'],[5,10]],[%3,%4],[0,0],[0,0],[0,0],['building',100]] spawn SLP_spawn;",_name,_area_marker_name,VVLocAirstripBuildingInfGrpNum,VVLocAirstripBuildingInfGrpSize];
            _area_ai_trigger_patrol_spawn_init = format["0=['%1',[0,0,10],[['%2'],[5,10]],[%3,%4],[%5,%6],[%7,%8],[%9,%10],['patrol',100]] spawn SLP_spawn;",_name,_area_marker_name,VVLocAirstripPatrolInfGrpNum,VVLocAirstripPatrolInfGrpSize,VVLocAirstripPatrolVehGrpNum,VVLocAirstripPatrolVehGrpSize,VVLocAirstripPatrolArmGrpNum,VVLocAirstripPatrolArmGrpSize,VVLocAirstripPatrolAirGrpNum,VVLocAirstripPatrolAirGrpSize];
            _area_ai_trigger = [
                _debug,_area_ai_trigger_name,_area_ai_trigger_name,[_position_x,_position_y],[_radius_x,_radius_y,_angle,false],
                ["ANY","PRESENT",true],
                ["(player distance thistrigger) < viewDistance",format["%1 %2",_area_ai_trigger_building_spawn_init,_area_ai_trigger_patrol_spawn_init],""],
                [1,1,1,false]
            ] spawn VVM_fnc_createTrigger;
        };
        case "outpost": {
            _area_marker_name = format["%1_%2",_type,_name];
            _area_marker = [_debug,_area_marker_name,_area_marker_name,[_position_x,_position_y],[_radius_x,_radius_y],_angle,1,"ColorBlack","ELLIPSE","Border"] spawn VVM_fnc_createMarker;
            _area_west_control_trigger_name = format["%1_%2_west_capture_trigger",_type,_name];
            _area_west_control_trigger = [
                _debug,_area_west_control_trigger_name,_area_west_control_trigger_name,[_position_x,_position_y],[_radius_x,_radius_y,_angle,false],
                ["WEST SEIZED","WEST D",true],
                ["this",format["'%1' setmarkercolor 'ColorBLUFOR'; '%1' setmarkeralpha 1;",_area_marker_name],""],
                [5,5,5,true]
            ] spawn VVM_fnc_createTrigger;
            _area_east_control_trigger_name = format["%1_%2_east_capture_trigger",_type,_name];
            _area_east_control_trigger = [
                _debug,_area_east_control_trigger_name,_area_east_control_trigger_name,[_position_x,_position_y],[_radius_x,_radius_y,_angle,false],
                ["EAST SEIZED","EAST D",true],
                ["this",format["'%1' setmarkercolor 'ColorOPFOR'; '%1' setmarkeralpha 1;",_area_marker_name],""],
                [5,5,5,true]
            ] spawn VVM_fnc_createTrigger;
            _area_ai_trigger_name = format["%1_%2_ai_trigger",_type,_name];
            _area_ai_trigger_building_spawn_init = format["0=['%1',[0,0,10],[['%2'],[5,10]],[%3,%4],[0,0],[0,0],[0,0],['building',100]] spawn SLP_spawn;",_name,_area_marker_name,VVLocOutpostBuildingInfGrpNum,VVLocOutpostBuildingInfGrpSize];
            _area_ai_trigger_patrol_spawn_init = format["0=['%1',[0,0,10],[['%2'],[5,10]],[%3,%4],[%5,%6],[%7,%8],[%9,%10],['patrol',100]] spawn SLP_spawn;",_name,_area_marker_name,VVLocOutpostPatrolInfGrpNum,VVLocOutpostPatrolInfGrpSize,VVLocOutpostPatrolVehGrpNum,VVLocOutpostPatrolVehGrpSize,VVLocOutpostPatrolArmGrpNum,VVLocOutpostPatrolArmGrpSize,VVLocOutpostPatrolAirGrpNum,VVLocOutpostPatrolAirGrpSize];
            _area_ai_trigger = [
                _debug,_area_ai_trigger_name,_area_ai_trigger_name,[_position_x,_position_y],[_radius_x,_radius_y,_angle,false],
                ["ANY","PRESENT",true],
                ["(player distance thistrigger) < viewDistance",format["%1 %2",_area_ai_trigger_building_spawn_init,_area_ai_trigger_patrol_spawn_init],""],
                [1,1,1,false]
            ] spawn VVM_fnc_createTrigger;
        };
        case "farm": {
            _area_marker_name = format["%1_%2",_type,_name];
            _area_marker = [_debug,_area_marker_name,_area_marker_name,[_position_x,_position_y],[_radius_x,_radius_y],_angle,1,"ColorBlack","ELLIPSE","Border"] spawn VVM_fnc_createMarker;
            _area_west_control_trigger_name = format["%1_%2_west_capture_trigger",_type,_name];
            _area_west_control_trigger = [
                _debug,_area_west_control_trigger_name,_area_west_control_trigger_name,[_position_x,_position_y],[_radius_x,_radius_y,_angle,false],
                ["WEST SEIZED","WEST D",true],
                ["this",format["'%1' setmarkercolor 'ColorBLUFOR'; '%1' setmarkeralpha 1;",_area_marker_name],""],
                [5,5,5,true]
            ] spawn VVM_fnc_createTrigger;
            _area_east_control_trigger_name = format["%1_%2_east_capture_trigger",_type,_name];
            _area_east_control_trigger = [
                _debug,_area_east_control_trigger_name,_area_east_control_trigger_name,[_position_x,_position_y],[_radius_x,_radius_y,_angle,false],
                ["EAST SEIZED","EAST D",true],
                ["this",format["'%1' setmarkercolor 'ColorOPFOR'; '%1' setmarkeralpha 1;",_area_marker_name],""],
                [5,5,5,true]
            ] spawn VVM_fnc_createTrigger;
            _area_ai_trigger_name = format["%1_%2_ai_trigger",_type,_name];
            _area_ai_trigger_building_spawn_init = format["0=['%1',[0,0,10],[['%2'],[5,10]],[%3,%4],[0,0],[0,0],[0,0],['building',100]] spawn SLP_spawn;",_name,_area_marker_name,VVLocFarmBuildingInfGrpNum,VVLocFarmBuildingInfGrpSize];
            _area_ai_trigger_patrol_spawn_init = format["0=['%1',[0,0,10],[['%2'],[5,10]],[%3,%4],[%5,%6],[%7,%8],[%9,%10],['patrol',100]] spawn SLP_spawn;",_name,_area_marker_name,VVLocFarmPatrolInfGrpNum,VVLocFarmPatrolInfGrpSize,VVLocFarmPatrolVehGrpNum,VVLocFarmPatrolVehGrpSize,VVLocFarmPatrolArmGrpNum,VVLocFarmPatrolArmGrpSize,VVLocFarmPatrolAirGrpNum,VVLocFarmPatrolAirGrpSize];
            _area_ai_trigger = [
                _debug,_area_ai_trigger_name,_area_ai_trigger_name,[_position_x,_position_y],[_radius_x,_radius_y,_angle,false],
                ["ANY","PRESENT",true],
                ["(player distance thistrigger) < viewDistance",format["%1 %2",_area_ai_trigger_building_spawn_init,_area_ai_trigger_patrol_spawn_init],""],
                [1,1,1,false]
            ] spawn VVM_fnc_createTrigger;
        };
    };
} forEach (_locations);
