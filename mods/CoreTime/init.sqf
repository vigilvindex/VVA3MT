/* init.sqf - Initialises the CoreTime module. - vigil.vindex@gmail.com - https://creativecommons.org/licenses/by-sa/4.0/ */
if (isNil "modDebug") then {modDebug = 0;};
if (isNil "modCoreTimeSwitch") then {modCoreTimeSwitch = 0;};
if (isNil "modCoreTimeSkipTime") then {modCoreTimeSkipTime = 1;};
if (isNil "modCoreTimeMethod") then {modCoreTimeMethod = 0;};
if (isNil "modCoreTimeSyncInterval") then {modCoreTimeSyncInterval = 10;};
if (isNil "modCoreTimeSkipInterval") then {modCoreTimeSkipInterval = 1;};
if (isNil "modCoreTimeNightCycle") then {modCoreTimeNightCycle = 1;};
if (isNil "modCoreTimeNightCycleSkipTime") then {modCoreTimeNightCycleSkipTime = 1;};
if (modCoreTimeSwitch == 1) then {
  if (modDebug == 1) then {
    diag_log format ["#%1#%2#%3# Loading CoreTime.",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__];
	  systemChat "Loading CoreTime.";
  };
  if (modCoreTimeMethod == 1) then { modCoreTimeMethod = true; } else { modCoreTimeMethod = false; };
  if (modCoreTimeNightCycle == 1) then { modCoreTimeNightCycle = true; } else { modCoreTimeNightCycle = false; };
  [modCoreTimeSkipTime,modCoreTimeMethod,modCoreTimeSyncInterval,modCoreTimeSkipInterval,modCoreTimeNightCycle,modCoreTimeNightCycleSkipTime] execFSM "mods\CoreTime\core_time.fsm";
};