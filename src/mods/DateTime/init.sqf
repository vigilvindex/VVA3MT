/* init.sqf
Description: Initialises the CrewInfo module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/07/21 Updated: 2016/08/16 Version: 0.0.1
*/
if (isNil "modDateTimeSwitch") then {modDateTimeSwitch = 0;};
if (modDateTimeSwitch == 1) then {
  diag_log format ["#%1#%2#%3#Loading DateTime.#",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__];
	systemChat "Loading DateTime.";
	if (isServer) then {
		if (isNil "modDateTimeRandom") then {modDateTimeRandom = 0;};
		if (modDateTimeRandom == 1) then {
			setDate[2016,(floor random 12),(floor random 28),(floor random 23),(floor random 59)];
		} else {
			setDate[(modDateTimeYear),(modDateTimeMonth),(modDateTimeDay),(modDateTimeHour),(modDateTimeMinute)];
		};
	};
};
