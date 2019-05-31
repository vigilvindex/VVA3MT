/* Name: init.sqf
Description: Initialises the Spectator module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2013/08/09 Updated: 2016/08/16 Version: 0.0.1
*/
if (isNil "modSpectatorSwitch") then {modSpectatorSwitch = 0;};
if (modSpectatorSwitch == 1) then {
  diag_log format ["#%1#%2#%3#Loading Spectator.#",time,__FILE__ select [count PATH],__LINE__];
	systemChat "Loading Spectator.";
	// init="this addAction [""Spectate"", {[] call Spectator_fnc_spectateInit;}]; this allowDamage false;";
};
