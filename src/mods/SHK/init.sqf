/* Name: init.sqf
Description: Initialises the SHK module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2013/08/09 Updated: 2016/08/16 Version: 0.0.1
*/
if (isNil "modSHKSwitch") then {modSHKSwitch = 0;};
if (modSHKSwitch == 1) then {
	if (modDebug == 1) then {
  	diag_log format ["#%1#%2#%3#Loading SHK.#",time,__FILE__ select [count PATH],__LINE__];
		systemChat "Loading SHK.";
	};
};
