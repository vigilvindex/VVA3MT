/* Name: fn_createMarker.sqf
Description: Creates a marker.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2013/08/07 Updated: 2016/08/24 Version: 0.0.1
Dependencies: n/a
Arguments: index name (default) TYPE {Required} min,max "values"
  d  debug    (false)   BOOLEAN {N} false,true "Disabled","Enabled"
  n  name     ("Name")  STRING  {Y} *          "Name"    http://community.bistudio.com/wiki/createMarker
  p  position ([0,0,0]) ARRAY   {Y} *          "[x,y,z]" http://community.bistudio.com/wiki/setMarkerPos
  r  rotation (0)       SCALAR  {N} 0,360      "Degrees" http://community.bistudio.com/wiki/setMarkerDir
  s  size     ([1,1])   ARRAY   {N} *          "[x,y]"   http://community.bistudio.com/wiki/setMarkerSize
  t  text     ("Text")  STRING  {N} *          "Text"    http://community.bistudio.com/wiki/setMarkerText
  a  alpha    (1)       SCALAR  {N} 0,1        "Alpha"   http://community.bistudio.com/wiki/setMarkerAlpha
  b  brush    (1)       SCALAR  {N} 0,10       "Brush"   http://community.bistudio.com/wiki/setMarkerBrush
  c  colour   (0)       SCALAR  {N} 0,25       "Colour"  http://community.bistudio.com/wiki/setMarkerColor
  sh shape    (0)       SCALAR  {N} 0,3        "Shape"   http://community.bistudio.com/wiki/setMarkerShape
  ty type     (14)      SCALAR  {N} 0,168      "Type"    http://community.bistudio.com/wiki/cfgMarkers
Returns: OBJECT on success. FALSE on failure.
Usage: _marker = [["n","Marker1"],["p",[0,0,0]]] call VVM_fnc_createMarker;
*/
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false;};
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false;};
private ["_debug","_name","_position","_rotation","_size","_text","_alpha","_brush","_colour","_shape","_type","_brushes","_colours","_shapes","_types","_return"];
{ if (_x isEqualType []) then {
    if (_x select 0 isEqualType "") then {
      switch (toLower (_x select 0)) do {
        case "d": {_debug = [_x select 1] param [0,false,[true]];};
        case "n": {_name = [_x select 1] param [0,false,[""]];};
        case "p": {_position = [_x select 1] param [0,false,[[]],[2,3]];};
        case "r": {_rotation = [_x select 1] param [0,0,[0]];};
        case "s": {_size = [_x select 1] param [0,[1,1],[[]],2];};
        case "t": {_text = [_x select 1] param [0,"",[""]];};
        case "a": {_alpha = [_x select 1] param [0,1,[0]];};
        case "b": {_brush = [_x select 1] param [0,1,[0]];};
        case "c": {_colour = [_x select 1] param [0,0,[0]];};
        case "sh": {_shape = [_x select 1] param [0,0,[0]];};
        case "ty": {_type = [_x select 1] param [0,14,[0]];};
      };
    };
  };
} forEach _this;
if (isNil "_position") exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
if (_position isEqualType false) exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
if (isNil "_name") exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
if (_name isEqualType false) exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
{ if (isNil _x) then {
    switch (_forEachIndex) do {
      case 0: {_debug = false;};
      case 1: {_rotation = 0;};
      case 2: {_size = [1,1];};
      case 3: {_text = "";};
      case 4: {_alpha = 1;};
      case 5: {_brush = 1;};
      case 6: {_colour = 0;};
      case 7: {_shape = 0;};
      case 8: {_type = 14;};
    };
  };
} forEach ["_debug","_rotation","_size","_text","_alpha","_brush","_colour","_shape","_type"];
if (_debug) then {
  { diag_log format ["# %1 # %2 # %3 # _param %4 = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_forEachIndex,_x];
  } forEach [_debug,_name,_position,_rotation,_size,_text,_alpha,_brush,_colour,_shape,_type];
};
_brushes = ["BDiagonal","Border","Cross","DiagGrid","FDiagonal","Grid","Horizontal","Solid","SolidBorder","SolidFull","Vertical"];
_colours = ["Default","ColorBlack","ColorBlue","ColorBrown","ColorGreen","ColorGrey","ColorKhaki","ColorOrange","ColorPink","ColorRed","ColorWhite","ColorYellow","ColorEAST","ColorWEST","ColorGUER","ColorCIV","ColorUNKNOWN","colorOPFOR","colorBLUFOR","colorIndependent","colorCivilian","Color1_FD_F","Color2_FD_F","Color3_FD_F","Color4_FD_F","Color5_FD_F"];
_shapes = ["ICON","RECTANGLE","ELLIPSE","POLYLINE"];
_types = ["Empty","hd_objective","hd_marker","hd_flag","hd_arrow","mil_arrow2","hd_ambush","hd_destroy","hd_start","hd_end","hd_pickup","hd_join","hd_warning","hd_unknown","hd_dot","mil_box","mil_triangle","mil_dot","mil_objective","mil_flag","mil_arrow","mil_ambush","mil_destroy","mil_start","mil_end","mil_pickup","mil_join","mil_warning","mil_unknown","b_unknown","o_unknown","n_unknown","b_inf","o_inf","n_inf","b_motor_inf","o_motor_inf","n_motor_inf","b_mech_inf","o_mech_inf","n_mech_inf","b_armor","o_armor","n_armor","b_recon","o_recon","n_recon","b_air","o_air","n_air","b_plane","o_plane","n_plane","b_uav","o_uav","n_uav","b_naval","o_naval","n_naval","b_med","o_med","n_med","b_art","o_art","n_art","b_hq","o_hq","n_hq","b_support","o_support","n_support","b_maint","o_maint","n_maint","b_service","o_service","n_service","b_installation","o_installation","n_installation","u_installation","c_unknown","c_car","c_ship","c_air","c_plane","group0","group1","group2","group3","group4","group5","group6","group7","group8","group9","group10","group11","respawn_unknown","respawn_inf","respawn_motor","respawn_armor","respawn_air","respawn_plane","respawn_naval","respawn_para","loc_Tree","loc_smallTree","loc_Bush","loc_Church","loc_Chapel","loc_Cross","loc_Rock","loc_Bunker","loc_Fountain","loc_ViewTower","loc_Lighthouse","loc_Quay","loc_Fuelstation","loc_Hospital","loc_BusStop","loc_Transmitter","loc_Stack","loc_Ruin","loc_Tourism","loc_WaterTower","loc_Power","loc_PowerSolar","loc_PowerWave","loc_PowerWind","flag_NATO","flag_CSAT","flag_AAF","flag_Altis","flag_AltisColonial","flag_FIA","flag_EU","flag_UN","flag_Belgium","flag_Canada","flag_Croatia","flag_CzechRepublic","flag_Denmark","flag_France","flag_Georgia","flag_Germany","flag_Greece","flag_Hungary","flag_Iceland","flag_Italy","flag_Luxembourg","flag_Netherlands","flag_Norway","flag_Poland","flag_Slovakia","flag_Slovenia","flag_Spain","flag_UK","flag_USA","select","waypoint","selector_selectable","selector_selectedEnemy","selector_selectedFriendly","selector_selectedMission","KIA","Minefield","MinefieldAP"];
_brush = _brushes select _brush;
_colour = _colours select _colour;
_shape = _shapes select _shape;
_type = _types select _type;
_return = createMarker [_name,_position];
_return setMarkerText _text;
_return setMarkerSize _size;
_return setMarkerDir _rotation;
_return setMarkerAlpha _alpha;
_return setMarkerColor _colour;
_return setMarkerShape _shape;
if (_shape == "ICON") then {
  _return setMarkerType _type;
}else{
  _return setMarkerBrush _brush;
};
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_name,_position,_rotation,_size,_text,_alpha,_brush,_colour,_shape,_type,_brushes,_colours,_shapes,_types];
_return;
