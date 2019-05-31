/* fn_getParams.sqf - Creates global variables for params. - vigil.vindex@gmail.com - https://creativecommons.org/licenses/by-sa/4.0/ */
_debug = false;
for [{_i = 0},{_i < count paramsArray},{_i = _i + 1}] do {
  call compile format ["%1 = %2;",(configName ((missionConfigFile >> "Params") select _i)),(paramsArray select _i)];
  if (_debug) then {
    diag_log format ["#%1#%2#%3#%4 = %5#",time,
      __FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],
      __LINE__,(configName ((missionConfigFile >> "Params") select _i)),
      (paramsArray select _i)
    ];
  };
};