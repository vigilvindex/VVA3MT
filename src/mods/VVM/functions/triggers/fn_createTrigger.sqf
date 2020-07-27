/* Name: fn_createTrigger.sqf - Description: Creates a trigger. http://community.bistudio.com/wiki/createTrigger - Authors: vigil.vindex@gmail.com - License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2013/08/07 Updated: 2020/06/10 Version: 0.0.1 - Dependencies: n/a - Returns: OBJECT
Usage: _trigger = [["p",[0,0,0]],["sa","hint 'Unit Detected';"],["sd","hint 'No Unit Detected';"]] call VVM_fnc_createTrigger;
Arguments: index name (default) TYPE {Required} min,max "values"
  d  debug                  (false)   BOOLEAN {N} false,true "Disabled","Enabled"
  t  text                   ("Text")  STRING  {N} *          "Text"                 http://community.bistudio.com/wiki/setTriggerText
  p  position               ([0,0,0]) ARRAY   {Y} *          "[x,y,z]"
  ty type                   (0)       SCALAR  {N} 0,12       "NONE","EAST G","WEST G","GUER G","SWITCH","END1","END2","END3","END4","END5","END6","LOOSE","WIN" http://community.bistudio.com/wiki/setTriggerType
  rx radius_x               (50)      SCALAR  {N} *          "Metres"               http://community.bistudio.com/wiki/setTriggerArea
  ry radius_y               (50)      SCALAR  {N} *          "Metres"
  rz radius_z               (-1)      SCALAR  {N} *          "Metres"
  a  angle                  (0)       SCALAR  {N} 0,359      "Degrees"
  r  rectangle              (false)   BOOLEAN {N} false,true "Disabled","Enabled"
  ab activated_by           (6)       SCALAR  {N} 0,24       "NONE","EAST","WEST","GUER","CIV","LOGIC","ANY","ALPHA","BRAVO","CHARLIE","DELTA","ECHO","FOXTROT","GOLF","HOTEL","INDIA","JULIET","STATIC","VEHICLE","GROUP","LEADER","MEMBER","WEST SEIZED","EAST SEIZED","GUER SEIZED"
  at activation_type        (0)       SCALAR  {N} 0,5        "PRESENT","NOT PRESENT","WEST D","EAST D","GUER D","CIV D"
  ar activation_repeatable  (true)    BOOLEAN {N} false,true "Disabled","Enabled"   http://community.bistudio.com/wiki/setTriggerActivation
  sc statement_condition    ("this")  STRING  {N} *          ""                     http://community.bistudio.com/wiki/setTriggerStatements
  sa statement_activation   ("")      STRING  {N} *          ""
  sd statement_deactivation ("")      STRING  {N} *          ""
  tn timeout_min            (0)       SCALAR  {N} *          "Seconds"              http://community.bistudio.com/wiki/setTriggerTimeout
  td timeout_mid            (0)       SCALAR  {N} *          "Seconds"
  tx timeout_max            (0)       SCALAR  {N} *          "Seconds"
  i  interruptable          (true)    BOOLEAN {N} false,true "Disabled","Enabled"
  g  global                 (true)    BOOLEAN {N} false,true "Disabled","Enabled"
  in interval               (0.5)     SCALAR  {N} 0,*        "Seconds"              https://community.bistudio.com/wiki/setTriggerInterval
  sy synced_waypoints       ([])      ARRAY   {N} *          "Waypoints"            http://community.bistudio.com/wiki/synchronizeTrigger
*/
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false;};
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false;};
private ["_debug","_text","_position","_type","_radius_x","_radius_y","_radius_z","_angle","_rectangle","_activated_by","_activation_type","_activation_repeatable","_statement_condition","_statement_activation","_statement_deactivation","_timeout_min","_timeout_mid","_timeout_max","_interruptable","_global","_interval","_synced_waypoints"];
{ if (_x isEqualType []) then {
    if (_x select 0 isEqualType "") then {
      switch (toLower (_x select 0)) do {
        case "d": {_debug = [_x select 1] param [0,false,[true]];};
        case "t": {_text = [_x select 1] param [0,"",[""]];};
        case "p": {_position = [_x select 1] param [0,[0,0,0],[[]],[2,3]];};
        case "ty": {_type = [_x select 1] param [0,0,[0]];};
        case "rx": {_radius_x = [_x select 1] param [0,0,[0]];};
        case "ry": {_radius_y = [_x select 1] param [0,0,[0]];};
        case "rz": {_radius_z = [_x select 1] param [0,0,[0]];};
        case "a": {_angle = [_x select 1] param [0,0,[0]];};
        case "r": {_rectangle = [_x select 1] param [0,false,[true]];};
        case "ab": {_activated_by = [_x select 1] param [0,6,[0]];};
        case "at": {_activation_type = [_x select 1] param [0,0,[0]];};
        case "ar": {_activation_repeatable = [_x select 1] param [0,true,[true]];};
        case "sc": {_statement_condition = [_x select 1] param [0,"this",[""]];};
        case "sa": {_statement_activation = [_x select 1] param [0,"",[""]];};
        case "sd": {_statement_deactivation = [_x select 1] param [0,"",[""]];};
        case "tn": {_timeout_min = [_x select 1] param [0,0,[0]];};
        case "td": {_timeout_mid = [_x select 1] param [0,0,[0]];};
        case "tx": {_timeout_max = [_x select 1] param [0,0,[0]];};
        case "i": {_interruptable = [_x select 1] param [0,true,[true]];};
        case "g": {_global = [_x select 1] param [0,true,[true]];};
        case "in": {_interval = [_x select 1] param [0,0.5,[0]];};
        case "sy": {_synced_waypoints = [_x select 1] param [0,[],[[]]];};
};};};} forEach _this;
if (isNil "_position") exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
if (_position isEqualType false) exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false;};
{ if (isNil _x) then {
    switch (_forEachIndex) do {
      case 0: {_debug = false;};
      case 1: {_text = "";};
      case 2: {_type = 0;};
      case 3: {_radius_x = 50;};
      case 4: {_radius_y = 50;};
      case 5: {_radius_z = -1;};
      case 6: {_angle = 0;};
      case 7: {_rectangle = false;};
      case 8: {_activated_by = 6;};
      case 9: {_activation_type = 0;};
      case 10: {_activation_repeatable = true;};
      case 11: {_statement_condition = "this";};
      case 12: {_statement_activation = "";};
      case 13: {_statement_deactivation = "";};
      case 14: {_timeout_min = 0;};
      case 15: {_timeout_mid = 0;};
      case 16: {_timeout_max = 0;};
      case 17: {_interruptable = true;};
      case 18: {_global = true;};
      case 19: {_interval = 0.5;};
      case 20: {_synced_waypoints = [];};
};};} forEach ["_debug","_text","_type","_radius_x","_radius_y","_radius_z","_angle","_rectangle","_activated_by","_activation_type","_activation_repeatable","_statement_condition","_statement_activation","_statement_deactivation","_timeout_min","_timeout_mid","_timeout_max","_interruptable","_global","_interval","_synced_waypoints"];
if (_debug) then {
  { diag_log format ["#%1#%2#%3# _param %4 = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_forEachIndex,_x];
  } forEach [_debug,_text,_position,_type,_radius_x,_radius_y,_radius_z,_angle,_rectangle,_activated_by,_activation_type,_activation_repeatable,_statement_condition,_statement_activation,_statement_deactivation,_timeout_min,_timeout_mid,_timeout_max,_interruptable,_global,_interval,_synced_waypoints];
};
_rectangle = [true,false] select (_rectangle == false);
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
_return setTriggerInterval _interval;
_return synchronizeTrigger _synced_waypoints;
if (_debug) then {diag_log format ["#%1#%2#%3# _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_text,_position,_type,_radius_x,_radius_y,_radius_z,_angle,_rectangle,_activated_by,_activation_type,_activation_repeatable,_statement_condition,_statement_activation,_statement_deactivation,_timeout_min,_timeout_mid,_timeout_max,_interruptable,_global,_interval,_synced_waypoints];
_return