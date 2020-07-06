/* init.sqf - Initialises the CrewInfo module. - vigil.vindex@gmail.com - https://creativecommons.org/licenses/by-sa/4.0/ */
if (isNil "modCrewInfoSwitch") then {modCrewInfoSwitch = 0;};
if (isNil "modDebug") then {modDebug = 0;};
if (modCrewInfoSwitch == 1) then {
  if (modDebug == 1) then {
    diag_log format ["#%1#%2#%3#Loading CrewInfo.#",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__];
    systemChat "Loading CrewInfo.";
  };
  _handle = [] execVM "mods\CrewInfo\main.sqf";
};
