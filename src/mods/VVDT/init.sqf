/* init.sqf
Description: Initialises the VVDT module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/07/21 Updated: 2016/08/16 Version: 0.0.1
*/
if (isNil "modVVDTSwitch") then {modVVDTSwitch = 0;};
if (modVVDTSwitch == 1) then {
  diag_log format ["#%1#%2#%3#Loading VVDT.#",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__];
	systemChat "Loading VVDT.";
	if (isServer) then {
		if (isNil "modVVDTRandom") then {modVVDTRandom = 0;};
		if (modVVDTRandom == 1) then {
			setDate[2020,(floor random 12),(floor random 28),(floor random 23),(floor random 59)];
		} else {
			setDate[(modVVDTYear),(modVVDTMonth),(modVVDTDay),(modVVDTHour),(modVVDTMinute)];
		};
		if (isNil "modVVDTMoon") then {modVVDTMoon = 0;};
		if (modVVDTMoon == 1) then {
			setDate selectRandom ((modVVDTYear) call VVDT_fnc_getFullMoonDates);
		};
		if (isNil "modVVDTSyncSwitch") then {modVVDTSyncSwitch = 0;};
		if (modVVDTSyncSwitch == 1) then {
			if (isNil "modVVDTSyncSkipTime") then {modVVDTSyncSkipTime = 1;};
			if (isNil "modVVDTSyncMethod") then {modVVDTSyncMethod = 0;};
			if (isNil "modVVDTSyncInterval") then {modVVDTSyncInterval = 10;};
			if (isNil "modVVDTSyncSkipInterval") then {modVVDTSyncSkipInterval = 1;};
			if (isNil "modVVDTSyncNightCycle") then {modVVDTSyncNightCycle = 1;};
			if (isNil "modVVDTSyncNightCycleSkipTime") then {modVVDTSyncNightCycleSkipTime = 1;};
			if (modVVDTSyncMethod == 1) then { modVVDTSyncMethod = true; } else { modVVDTSyncMethod = false; };
			if (modVVDTSyncNightCycle == 1) then { modVVDTSyncNightCycle = true; } else { modVVDTSyncNightCycle = false; };
			[modVVDTSyncSkipTime,modVVDTSyncMethod,modVVDTSyncInterval,modVVDTSyncSkipInterval,modVVDTSyncNightCycle,modVVDTSyncNightCycleSkipTime] execFSM "mods\VVDT\timesync.fsm";
		};
		call VVDT_fnc_displayDate;
	};
};
