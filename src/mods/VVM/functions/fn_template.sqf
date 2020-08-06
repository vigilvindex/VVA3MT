/* Name: fn_template.sqf
 * Description: Template function.
 * Authors: vigil.vindex@gmail.com
 * License: https://creativecommons.org/licenses/by-sa/4.0/
 * Created: 2016/08/23 Updated: 2016/08/23 Version: 0.0.1
 * Dependencies: n/a
 * Arguments: index name     (default) TYPE    {Required} min,max    "values"
 *            d     debug    (false)   BOOLEAN {N}        false,true "Disabled","Enabled"
 *            p     position ([0,0,0]) ARRAY   {Y}        *          "[x,y,z]"
 *            r     rotation (0)       SCALAR  {N}        0,360      "Degrees"
 * Returns: OBJECT on success. FALSE on failure.
 * Usage: [["d",false]] call VVM_fnc_template;
 */
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false};
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false};
private ["_debug","_position","_rotation","_return"];
{ if (_x isEqualType []) then { if (_x select 0 isEqualType "") then { switch (toLower (_x select 0)) do {
    case "d": {_debug = [_x select 1] param [0,false,[true]]};
    case "p": {_position = [_x select 1] param [0,false,[[]],[2,3]]};
    case "r": {_rotation = [_x select 1] param [0,false,[0]]};
}}}} forEach _this;
if (isNil "_position") exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false};
if (_position isEqualType false) exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false};
{ if (isNil _x) then { switch (_forEachIndex) do {
    case 0: {_debug = false};
    case 1: {_rotation = 0};
}}} forEach ["_debug","_rotation"];
if (_debug) then {
  { diag_log format ["# %1 # %2 # %3 # _param %4 = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_forEachIndex,_x];
  } forEach [_debug,_position,_rotation]
};
_return = objNull;
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil} forEach [_debug,_position,_rotation];
_return;
