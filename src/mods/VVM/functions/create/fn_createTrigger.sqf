/* Name: fn_createTrigger.sqf
Description: Creates a trigger. http://community.bistudio.com/wiki/createTrigger
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2013/08/07 Updated: 2016/08/23 Version: 0.0.1
Dependencies: n/a
Arguments:
  index name (default) TYPE {Required} min,max "values"
  d  debug                  (false)   BOOLEAN {N} false,true "Disabled","Enabled"
  n  name                   ("Name")  STRING  {N} *          "Name"
  t  text                   ("Text")  STRING  {N} *          "Text"                 http://community.bistudio.com/wiki/setTriggerText
  p  position               ([0,0,0]) ARRAY   {Y} *          "[x,y,z]"
  ty type                   (0)       SCALAR  {N} 0,12       "NONE","EAST G","WEST G","GUER G","SWITCH","END1","END2","END3","END4","END5","END6","LOOSE","WIN" http://community.bistudio.com/wiki/setTriggerType
  rx radius_x               (10)      SCALAR  {N} *          "Metres"               http://community.bistudio.com/wiki/setTriggerArea
  ry radius_y               (10)      SCALAR  {N} *          "Metres"
  rz radius_z               (0)       SCALAR  {N} *          "Metres"
  a  angle                  (0)       SCALAR  {N} 0,359      "Degrees"
  r  rectangle              (false)   BOOLEAN {N} false,true "Disabled","Enabled"
  ab activated_by           (6)       SCALAR  {N} 0,24       "NONE","EAST","WEST","GUER","CIV","LOGIC","ANY","ALPHA","BRAVO","CHARLIE","DELTA","ECHO","FOXTROT","GOLF","HOTEL","INDIA","JULIET","STATIC","VEHICLE","GROUP","LEADER","MEMBER","WEST SEIZED","EAST SEIZED","GUER SEIZED"
  at activation_type        (0)       SCALAR  {N} 0,5        "PRESENT","NOT PRESENT","WEST D","EAST D","GUER D","CIV D"
  ar activation_repeatable  (true)    BOOLEAN {N} false,true "Disabled","Enabled"   http://community.bistudio.com/wiki/setTriggerActivation
  sc statement_condition    ("this")  STRING  {N} *          ""                     http://community.bistudio.com/wiki/setTriggerStatements
  sa statement_activation   ("")      STRING  {N} *          ""
  sd statement_deactivation ("")      STRING  {N} *          ""
  tn timeout_min            (1)       SCALAR  {N} *          "Seconds"              http://community.bistudio.com/wiki/setTriggerTimeout
  td timeout_mid            (1)       SCALAR  {N} *          "Seconds"
  tx timeout_max            (1)       SCALAR  {N} *          "Seconds"
  i  interruptable          (false)   BOOLEAN {N} false,true "Disabled","Enabled"
  g  global                 (true)    BOOLEAN {N} false,true "Disabled","Enabled"
  sy synced_waypoints       ([])      ARRAY   {N} *          "Waypoints"            http://community.bistudio.com/wiki/synchronizeTrigger
Returns: OBJECT on success. FALSE on failure.
Usage: _trigger = [["p",[0,0,0]]] call VVM_fnc_createTrigger;
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
_rectangle = [true,false] select (_rectangle == 0);
_activation_repeatable = [true,false] select (_activation_repeatable == 0);
_interruptable = [true,false] select (_interruptable == 0);
_global = [true,false] select (_global == 0);
_types = ["NONE","EAST G","WEST G","GUER G","SWITCH","END1","END2","END3","END4","END5","END6","LOOSE","WIN"];
_type = _types select _type;
_act_types = ["PRESENT","NOT PRESENT","WEST D","EAST D","GUER D","CIV D"];
_activation_type = _act_types select _activation_type;
_act_by_types = ["NONE","EAST","WEST","GUER","CIV","LOGIC","ANY","ALPHA","BRAVO","CHARLIE","DELTA","ECHO","FOXTROT","GOLF","HOTEL","INDIA","JULIET","STATIC","VEHICLE","GROUP","LEADER","MEMBER","WEST SEIZED","EAST SEIZED","GUER SEIZED"];
_activated_by = _act_by_types select _activated_by;
_return = createTrigger ["EmptyDetector",_position,_global];
_return setTriggerType _type;
_return setTriggerText _text;
_return setTriggerArea [_radius_x,_radius_y,_angle,_rectangle,_radius_z];
_return setTriggerActivation [_activated_by,_activation_type,_activation_repeatable];
_return setTriggerStatements [_statement_condition,_statement_activation,_statement_deactivation];
_return setTriggerTimeout [_timeout_min,_timeout_mid,_timeout_max,_interruptable];
_return synchronizeTrigger _synced_waypoints;
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_name,_position,_rotation,_size,_text,_alpha,_brush,_colour,_shape,_type,_brushes,_colours,_shapes,_types];
_return;
