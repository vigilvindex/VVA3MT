/* Name: vv_fnc_create_group.sqf
Description: Creates a group of AI.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/10 Updated: 2016/08/15 Version: 0.0.1
Dependencies: fn_getFactionArray.sqf, fn_getGroupTypes.sqf, fn_getGroupTypeClasses.sqf, fn_getSideArray.sqf, fn_getSkillMM.sqf
Arguments: index name (default) TYPE {Required} min,max "values"
  d  debug    (false)   BOOLEAN {N} false,true "Disabled","Enabled"
  s  skill    (5)       SCALAR  {N} 0,5        "Low","Medium","High","Ultra","Godlike","Random"
  p  position ([0,0,0]) ARRAY   {Y} *          "[x,y,z]"
  r  rotation (0)       SCALAR  {N} 0,360      "Degrees"
  n  mindist  (0)       SCALAR  {N} 0,*        "Meters"
  x  maxdist  (10)      SCALAR  {N} 0,*        "Meters"
  si side     (0)       SCALAR  {N} 0,3        "East","West","Independent","Civilian"
  f  faction  (0)       SCALAR  {N} 0,4        "CSAT,NATO,AAF,CIV","CSAT (Pacific),NATO (Pacific),FIA","Viper,CTRG,Syndikat","FIA,FIA","Gendarmerie"
  t  type     (0)       SCALAR  {N} 0,6        "Infantry","Motorized","Support","Mechanized","SpecOps","Armored","UInfantry"
  c  class    (0)       SCALAR  {N} 0,4        "Inf,InfAA,InfAT,InfRecon,InfSniper","Mot,MotAA,MotART,MotAT","Sup,SupART","Mech,MechAA,MechAT,MechSup","SpecOps,SpecOpsDivers,SpecOpsUAV,SpecOpsUGV","Arm,ArmAA,ArmART","UInf"
  sc subclass (0)       SCALAR  {N} 0,*        ""
Returns: OBJECT
Usage: _group = [["p",[0,0,0]]] call VVM_fnc_createGroup;
*/
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false;};
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false;};
private ["_debug","_skill","_position","_rotation","_mindist","_maxdist","_side","_faction","_type","_class","_subclass","_angle","_distance","_xpos","_ypos","_zpos","_xxpos","_yypos","_side_array","_factions","_types","_classes","_faction_name","_type_name","_class_name","_return"];
{ if (_x isEqualType []) then {
    if (_x select 0 isEqualType "") then {
      switch (toLower (_x select 0)) do {
        case "d": {_debug = [_x select 1] param [0,false,[true]];};
        case "s": {_skill = [_x select 1] param [0,5,[0]];};
        case "p": {_position = [_x select 1] param [0,false,[[]],[2,3]];};
        case "r": {_rotation = [_x select 1] param [0,0,[0]];};
        case "n": {_mindist = [_x select 1] param [0,0,[0]];};
        case "x": {_maxdist = [_x select 1] param [0,10,[0]];};
        case "si": {_side = [_x select 1] param [0,0,[0]];};
        case "f": {_faction = [_x select 1] param [0,0,[0]];};
        case "t": {_type = [_x select 1] param [0,0,[0]];};
        case "c": {_class = [_x select 1] param [0,0,[0]];};
        case "sc": {_subclass = [_x select 1] param [0,0,[0]];};
      };
    };
  };
} forEach _this;
if (isNil "_position") exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
if (_position isEqualType false) exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
{ if (isNil _x) then {
    switch (_forEachIndex) do {
      case 0: {_debug = false;};
      case 1: {_skill = 5;};
      case 2: {_rotation = 0;};
      case 3: {_mindist = 0;};
      case 4: {_maxdist = 10;};
      case 5: {_side = 0;};
      case 6: {_faction = 0;};
      case 7: {_type = 0;};
      case 8: {_class = 0;};
      case 9: {_subclass = 0;};
    };
  };
} forEach ["_debug","_skill","_rotation","_mindist","_maxdist","_side","_faction","_type","_class","_subclass"];
if (_debug) then {
  { diag_log format ["# %1 # %2 # %3 # _param %4 = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_forEachIndex,_x];
  } forEach [_debug,_skill,_position,_rotation,_mindist,_maxdist,_side,_faction,_type,_class,_subclass];
};
_angle = random 360;
if (_rotation != 0) then {_angle = (random 180) - _rotation;};
_distance = _mindist + random (_maxdist - _mindist);
_xpos = _position select 0;
_ypos = _position select 1;
if (count _position == 3) then {
  _zpos = _position select 2;
} else {
  _zpos = 0;
};
_xxpos = (_distance * cos _angle);
_yypos = (_distance * sin _angle);
_xpos = _xpos + _xxpos;
_ypos = _ypos + _yypos;
_position set [0,_xpos];
_position set [1,_ypos];
_position set [2,_zpos];
_skill = [["d",_debug],["s",_skill]] call VVM_fnc_getSkillMM;
_side_array = [["d",_debug],["s",_side]] call VVM_fnc_getSideArray;
_factions = [["d",_debug],["s",_side]] call VVM_fnc_getFactionArray;
_types = [["d",_debug],["s",_side],["f",_faction]] call VVM_fnc_getGroupTypes;
_classes = [["d",_debug],["s",_side],["f",_faction],["t",_type],["c",_class]] call VVM_fnc_getGroupTypeClasses;
// diag_log format ["#%1#%2#%3# _classes = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_classes];
_faction_name = _factions select _faction;
_type_name = _types select _type;
_class_name = _classes select _subclass;
_return = [
  _position,
  _side_array select 1,
  (configFile >> "CfgGroups" >> _side_array select 2 >> _faction_name >> _type_name >> _class_name),
  [],[],
  [_skill select 0,_skill select 1],
  [],[],
  _rotation
] call BIS_fnc_spawnGroup; // https://community.bistudio.com/wiki/BIS_fnc_spawnGroup
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_skill,_position,_rotation,_mindist,_maxdist,_side,_faction,_type,_class,_subclass,_angle,_distance,_xpos,_ypos,_zpos,_xxpos,_yypos,_side_array,_factions,_types,_classes,_faction_name,_type_name,_class_name];
_return;
