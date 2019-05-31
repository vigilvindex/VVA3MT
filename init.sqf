/* init.sqf - Initialises the mission. - vigil.vindex@gmail.com - https://creativecommons.org/licenses/by-sa/4.0/ */
PATH = parsingNamespace getVariable "MISSION_ROOT";
#include "cfg\Modules.hpp"
#ifndef execNow
  #define execNow call compile preprocessfilelinenumbers
#endif
waitUntil {!isNil "BIS_fnc_init"};
if (isDedicated) then { // Dedicated Server Scope
  diag_log format ["#%1#%2#%3#Loading Dedicated Server.#",time,__FILE__ select [count PATH],__LINE__];
};
if (!hasInterface) then {};	// Headless Client & Dedicated Server Scope
if (!hasInterface && !isDedicated) then { // Headless Client Scope
  diag_log format ["#%1#%2#%3#Loading Headless Client.#",time,__FILE__ select [count PATH],__LINE__];
};
if (!isServer) then {}; // Player Client & Headless Client Scope
if (!isDedicated) then {}; // Player Client, Player Host & Headless Client Scope
if (isServer) then { // Server & Player Host Scope
  diag_log format ["#%1#%2#%3#Loading Server.#",time,__FILE__ select [count PATH],__LINE__];
};
if (hasInterface) then { // Player Client & Player Host Scope
  diag_log format ["#%1#%2#%3#Loading Client.#",time,__FILE__ select [count PATH],__LINE__];
};
if (isNull player && !isServer) then { // JIP Client Scope
  diag_log format ["#%1#%2#%3#Loading JIP Client.#",time,__FILE__ select [count PATH],__LINE__];
  waitUntil {!isNull player};
};
// Global Scope
diag_log format ["#%1#%2#%3#Loading Mission.#",time,__FILE__ select [count PATH],__LINE__];
systemChat "Loading Mission.";
enableSaving[false,false]; // https://community.bistudio.com/wiki/enableSaving
execNow "mods\init.sqf";
_date = date;
_year = format ["%3-%2-%1",_date select 0,(if (_date select 1 < 10) then {"0"} else {""}) + str (_date select 1),(if (_date select 2 < 10) then {"0"} else {""}) + str (_date select 2)];
_time = format ["%1:%2",(if (_date select 3 < 10) then {"0"} else {""}) + str (_date select 3),(if (_date select 4 < 10) then {"0"} else {""}) + str (_date select 4)];
[[worldName,2,1],[_year,2,1],[_time,2,1,2]] spawn BIS_fnc_EXP_camp_SITREP;