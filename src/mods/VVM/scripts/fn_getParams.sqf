/*
Name: fn_getParams.sqf
Description: Creates variables for all values in paramsArray.
Authors: vigil.vindex@gmail.com
Licence: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/19 Updated: 2016/08/19 Version: 0.0.1
Dependencies: n/a
Arguments:  index name        (default) TYPE    {Required}  min,max "values"
           d     debug       (false)   BOOLEAN {N}         *       "Disabled","Enabled"
Returns: BOOLEAN
Usage: [] call VVM_fnc_getParams;
Examples:
Todo:
*/
private["_debug"];
_debug = false;
if (_debug) then {
  diag_log format ["# %1 # %2 # %3 # Initialising Get Params.",time,__FILE__,__LINE__];
};
for [{_i = 0},{_i < count(paramsArray)},{_i = _i + 1}] do {
  call compile format ["%1 = %2;",(configName ((missionConfigFile >> "Params") select _i)),(paramsArray select _i)];
  if (_debug) then {
    diag_log format ["# %1 # %2 # %3 = %4",time,__FILE__,(configName ((missionConfigFile >> "Params") select _i)),(paramsArray select _i)];
  };
};
if (_debug) then {
  diag_log format ["# %1 # %2 # %3 # Completed Get Params.",time,__FILE__,__LINE__];
};
