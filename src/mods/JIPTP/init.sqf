/* Name: init.sqf
Description: Initialises the JIPTP module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2013/08/09 Updated: 2016/08/16 Version: 0.0.1
*/
if (isNil "modJIPTPSwitch") then {modJIPTPSwitch = 0;};
if (modJIPTPSwitch == 1) then {
  if (modDebug == 1) then {
    diag_log format ["# %1 # %2 # %3 # Loading JIPTP. #",time,__FILE__ select [count PATH],__LINE__];
	  systemChat "Loading JIPTP.";
  };
  if (isNull player && !isServer) then {
    waitUntil {!isNull player};
    if (_this select 1) then {
	    _handle = [] execVM "mods\JIPTP\f_teleportOption.sqf";
    };
  };
};
