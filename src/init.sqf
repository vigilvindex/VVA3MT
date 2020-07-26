/* init.sqf - Initialises the mission. - vigil.vindex@gmail.com - https://creativecommons.org/licenses/by-sa/4.0/ - https://community.bistudio.com/wiki/Initialization_Order */
waitUntil {!isNil "BIS_fnc_init"};
PATH = parsingNamespace getVariable "MISSION_ROOT";
MODS = parsingNamespace getVariable "MISSION_MODS";
if (isDedicated) then { // Dedicated Server Scope
  diag_log format ["# %1 # %2 # %3 # Loading Dedicated Server. #",time,__FILE__ select [count PATH],__LINE__];
};
if (!hasInterface) then {};	// Headless Client & Dedicated Server Scope
if (!hasInterface && !isDedicated) then { // Headless Client Scope
  diag_log format ["# %1 # %2 # %3 # Loading Headless Client. #",time,__FILE__ select [count PATH],__LINE__];
};
if (!isServer) then {}; // Player Client & Headless Client Scope
if (!isDedicated) then {}; // Player Client, Player Host & Headless Client Scope
if (isServer) then { // Server & Player Host Scope
  diag_log format ["# %1 # %2 # %3 # Loading Server. #",time,__FILE__ select [count PATH],__LINE__];
};
if (hasInterface) then { // Player Client & Player Host Scope
  diag_log format ["# %1 # %2 # %3 # Loading Client. #",time,__FILE__ select [count PATH],__LINE__];
};
if (isNull player && !isServer) then { // JIP Client Scope
  diag_log format ["# %1 # %2 # %3 # Loading JIP Client. #",time,__FILE__ select [count PATH],__LINE__];
  waitUntil {!isNull player};
};
// Global Scope
diag_log format ["# %1 # %2 # %3 # Loading Mission. #",time,__FILE__ select [count PATH],__LINE__];
systemChat "Loading Mission.";
enableSaving[false,false]; // https://community.bistudio.com/wiki/enableSaving
{call compile format["call compile preprocessfilelinenumbers 'mods\%1\init.sqf';",_x];} forEach MODS;