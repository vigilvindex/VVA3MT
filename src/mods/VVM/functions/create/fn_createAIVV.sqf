/* Name: fn_createAIVV.sqf
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2020/06/01 Updated: 2020/06/01 Version: 0.0.1
Dependencies: n/a
Returns: OBJECT on success. FALSE on failure.
Usage: _marker = [["n","VVAIEASTCSAT"],["p",[0,0,0]]] call VVM_fnc_createVVAI;
Description: Creates VV AI system.
Arguments: index name (default) TYPE {Required} min,max "values"
  d  debug    (false)   BOOLEAN {N} false,true "Disabled","Enabled"
  n  name     ("Name")  STRING  {Y} *          "Name"
  p  position ([0,0,0]) ARRAY   {Y} *          "[x,y,z]"
  r  rotation (0)       SCALAR  {N} 0,360      "Degrees"
  s  side
  f  faction
  g  groups
  u  units

Populate or reinforce AI HQ.
1 - Spawn a transport helicopter out of sight and sound, far away from all players.
2 - Fill the transport helicopter with AI to be transported to the disembark location.
3 - Send the transport helicopter to disembark passengers at disembark location.
4 - Once all passengers are disembarked send transport helicopter back to original location and delete.
5 - Each disembarked AI should go to their sleeping bag and go into a sleep state.

Create HQ.
1 - Create flagpole, HALO & teleport options.
2 - Create arsenal, loadouts for roles.
3 - Create garage, vehilcle pool, helipads, repair pool.
4 - Create helipad air disemark location.
5 - Create cargo cabins with sleeping bags in them for AI to sleep.
6 - Create medical, graveyard.
7 - Create logistics, supplies, ammo, fuel.
8 - Create walls, watch towers, guard posts.
9 - Create entrance/exit gates.
10 - Create defences, guards and patrols.

VVAI_SIDE_AA_UNITS
VVAI_SIDE_AIR_UNITS
VVAI_SIDE_AIRPORT
VVAI_SIDE_ALLIES
VVAI_SIDE_ARMY_UNITS
VVAI_SIDE_ARTY_REQUESTS
VVAI_SIDE_AT_UNITS
VVAI_SIDE_BASES
VVAI_SIDE_BEDS [Obj,Obj,Obj] - Array of sleeping bags for a given side.
VVAI_SIDE_CAS_UNITS
VVAI_SIDE_CAS_REQUESTS
VVAI_SIDE_COMMAND
VVAI_SIDE_CONTACT_REPORTS
VVAI_SIDE_ENEMIES
VVAI_SIDE_ENGINEER_UNITS
VVAI_SIDE_EOD_UNITS
VVAI_SIDE_FUEL
VVAI_SIDE_GROUP_LIMIT 10 - How many AI groups for a given side can have at any given time.
VVAI_SIDE_GROUPS
VVAI_SIDE_HELICOPTERS
VVAI_SIDE_HQ [0,0,0] - Location for HQ of a given side. This is where spawned AI will be disembarked via air or vehicle.
VVAI_SIDE_INTEL
VVAI_SIDE_LOCATIONS
VVAI_SIDE_LOGISTICS
VVAI_SIDE_MARKERS
VVAI_SIDE_MEDIC_UNITS
VVAI_SIDE_MEDIVAC_REQUESTS
VVAI_SIDE_MORTAR_UNITS
VVAI_SIDE_NAVY_UNITS
VVAI_SIDE_OBJECTIVES
VVAI_SIDE_OPERATIONS
VVAI_SIDE_PATROLS
VVAI_SIDE_PLANES
VVAI_SIDE_POSTS
VVAI_SIDE_RECON_UNITS
VVAI_SIDE_RECON_REQUESTS
VVAI_SIDE_RECREATION
VVAI_SIDE_REINFORCEMENT_REQUESTS
VVAI_SIDE_RESOURCES
VVAI_SIDE_REST
VVAI_SIDE_ROTA
VVAI_SIDE_SAPPER_UNITS
VVAI_SIDE_SEAPORT
VVAI_SIDE_SHIFTS
VVAI_SIDE_SHIPS
VVAI_SIDE_SNIPER_UNITS
VVAI_SIDE_SPAWN_LOC [0,0,0] - Location AI spawns at for a given side. Will be off map, in air or on sea, so can never be seen by players.
VVAI_SIDE_SPECOPS_UNITS
VVAI_SIDE_SUPPLIES
VVAI_SIDE_TANKS
VVAI_SIDE_TRANSPORT_UNITS
VVAI_SIDE_TRANSPORT_REQUESTS
VVAI_SIDE_UNITS
VVAI_SIDE_VEHICLES
VVAI_SIDE_WAYPOINTS

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
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_name,_position,_rotation,_size,_text,_alpha,_brush,_colour,_shape,_type,_brushes,_colours,_shapes,_types];
_return;
