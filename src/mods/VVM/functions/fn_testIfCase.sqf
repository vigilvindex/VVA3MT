/* fn_testIfCase.sqf
Description: Tests If versus Case.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/19 Updated: 2016/08/19 Version: 0.0.1
Dependencies: n/a
Arguments:  index name        (default) TYPE    {Required}  min,max "values"
            d     debug       (false)   BOOLEAN {N}         *       "Disabled","Enabled"
            m     method      (0)       SCALAR  {N}         0,2     "If","Case","Random"
            i     iterations  (100)     SCALAR  {N}         *       "10"
Returns: OBJECT on success. FALSE on failure.
Usage: [] call vvMOD_fnc_testIfCase;
Examples:
  call vvMOD_fnc_testIfCase; // FAILS
  0 call vvMOD_fnc_testIfCase; // FAILS
  [] call vvMOD_fnc_testIfCase; // WORKS
  [true,0,10] call vvMOD_fnc_testIfCase; // FAILS
  [["d",true]] call vvMOD_fnc_testIfCase; // WORKS
  [["d",true],["m",0]] call vvMOD_fnc_testIfCase; // WORKS
  [["d",true],["m",1],["i",1000]] call vvMOD_fnc_testIfCase; // WORKS
  [true,0,10] call vvMOD_fnc_testIfCase; // FAILS
  0 call vvMOD_fnc_testIfCase; // FAILS
  call vvMOD_fnc_testIfCase; // FAILS
  [] call vvMOD_fnc_testIfCase; // WORKS
  [["d",true]] call vvMOD_fnc_testIfCase; // WORKS
  ["d",true] call vvMOD_fnc_testIfCase; // WORKS
  [["d",true],["m",0]] call vvMOD_fnc_testIfCase; // WORKS
  [["d",true],["m",1],["i",1000]] call vvMOD_fnc_testIfCase; // WORKS

Todo:
*/
diag_log format ["# %1 # %2 # %3 # TEST IF CASE #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__];
if (isNil "_this") exitWith {
  diag_log format ["# %1 # %2 # %3 # Error! Function called without argument array. #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__];
  false;
};
if ((isNil "_this") or !(_this isEqualType []) or !(_this select 0 isEqualType [])) exitWith {
  diag_log format ["# %1 # %2 # %3 # Error! Function called without argument array. _this = TYPE = %4 VALUE = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,typeName _this,_this];
  false;
};
private ["_debug","_method","_iterations","_methods","_return"];
{
  if (_x isEqualType []) then {

    if ((_x select 0) isEqualType "") then {
      switch (_x select 0) do {
        case "d": {
          _debug = [[_x select 1],0,false,[true]] call BIS_fnc_param;
        };
        case "m": {
          _method = [[_x select 1],0,0,[0],2] call BIS_fnc_param;
          if ((_method) >= 2) then { _method = floor random 1; };
        };
        case "i": {
          _iterations = [[_x select 1],0,100,[0]] call BIS_fnc_param;
        };
      };
    };

  };
} forEach _this;
{
  if (isNil _x) then {
    switch (_forEachIndex) do {
      case 0: { _debug = false; };
      case 1: { _method = 0; };
      case 2: { _iterations = 100; };
    };
  };
} forEach ["_debug","_method","_iterations"];
_methods = ["If","Case"];
_method = _methods select _method;
if (_debug) then {
  {
    diag_log format ["# %1 # %2 # %3 # _param %4 = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_forEachIndex,_x];
  } forEach [_debug,_method,_iterations,_methods];
};
if ((_method) == "If") then {
  _return = diag_codePerformance [
    {
      _num = 0;
      call {
        if (_num == 0) exitWith {_num2str = "0"};
        if (_num == 1) exitWith {_num2str = "1"};
        if (_num == 2) exitWith {_num2str = "2"};
        private _num2str = "N/A";
      };
    },
    0,
    _iterations
  ];
  diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];
};
if ((_method) == "Case") then {
  _return = diag_codePerformance [
    {
      _num = 0;
      switch _num do {
        case 0: {private _num2str = "0"};
        case 1: {private _num2str = "1"};
        case 2: {private _num2str = "2"};
        default {private _num2str = "N/A"};
      };
    },
    0,
    _iterations
  ];
  diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];
};
if (_debug) then { diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return]; };
{ _x = nil; } forEach [_debug,_method,_iterations,_methods];
_return;
