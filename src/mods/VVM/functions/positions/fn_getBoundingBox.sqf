/* Name: fn_getBoundingBox.sqf
 * Description: Gets the bounding area for an array of locations [x,y].
 * Authors: vigil.vindex@gmail.com
 * License: https://creativecommons.org/licenses/by-sa/4.0/
 * Created: 2020/07/28 Updated: 2020/07/28 Version: 0.0.1
 * Dependencies: VVM_fnc_createMarker, VVM_fnc_lineToMapGlobal
 * Arguments: index name      (default) TYPE    {Required} min,max    "values"
 *            d     debug     (false)   BOOLEAN {N}        false,true "Disabled","Enabled"
 *            p     positions ([[0,0]]) ARRAY   {Y}        *          "[x,y]"
 *            m     margin    (10)     SCALAR  {N}        *          "Meters"
 * Returns: ARRAY on success. FALSE on failure.
 * Usage: [["p",[[111,111],[222,222]]]] call VVM_fnc_getBoundingBox;
 */
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false};
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false};
private ["_debug","_positions","_margin","_firstPos","_xHigh","_yHigh","_xLow","_yLow","_posX","_posY","_return"];
{ if (_x isEqualType []) then { if (_x select 0 isEqualType "") then { switch (toLower (_x select 0)) do {
    case "d": {_debug = [_x select 1] param [0,false,[true]]};
    case "p": {_positions = [_x select 1] param [0,false,[[]]]};
    case "m": {_margin = [_x select 1] param [0,10,[0]]};
}}}} forEach _this;
if (isNil "_positions") exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false};
if (_positions isEqualType false) exitWith {["%1 Function called without required argument.",time] call BIS_fnc_error;false};
{ if (isNil _x) then { switch (_forEachIndex) do {
    case 0: {_debug = false};
    case 1: {_margin = 10};
}}} forEach ["_debug","_margin"];
if (_debug) then {
  { diag_log format ["# %1 # %2 # %3 # _param %4 = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_forEachIndex,_x];
  } forEach [_debug,_positions,_margin];
};
if (_debug) then { {[["n",format["_marker%1",_forEachIndex]],["p",_x],["c",9],["ty",14],["a",1]] call VVM_fnc_createMarker} forEach _positions };
_firstPos = _positions select 0;
_xHigh = _firstPos select 0;
_yHigh = _firstPos select 1;
_xLow = _firstPos select 0;
_yLow = _firstPos select 1;
{	_posX = _x select 0;
    _posY = _x select 1;
    if (_posX > _xHigh) then {_xHigh = _posX};
    if (_posY > _yHigh) then {_yHigh = _posY};
    if (_posX < _xLow) then {_xLow = _posX};
    if (_posY < _yLow) then {_yLow = _posY};
} forEach _positions;
_xHigh = _xHigh + _margin;
_yHigh = _yHigh + _margin;
_xLow = _xLow - _margin;
_yLow = _yLow - _margin;
_return = [[_xLow,_yLow],[_xLow,_yHigh],[_xHigh,_yHigh],[_xHigh,_yLow],[_xLow,_yLow]];
if (_debug) then {[_return,2,["ColorRed",1]] call VVM_fnc_lineToMapGlobal};
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return]};
{_x = nil} forEach [_debug,_positions,_margin,_firstPos,_xHigh,_yHigh,_xLow,_yLow,_posX,_posY];
_return;
