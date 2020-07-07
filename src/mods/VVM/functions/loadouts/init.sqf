/* Name: init.sqf - Description: Initialises the VVLO module. - Authors: vigil.vindex@gmail.com - License: https://creativecommons.org/licenses/by-sa/4.0/ - Created: 2020/06/13 Updated: 2020/06/13 Version: 0.0.1 */
if (isNil "modVVLOSwitch") then {modVVLOSwitch = 0;};
if (modVVLOSwitch == 1) then {
  if (modDebug == 1) then { diag_log format ["#%1#%2#%3#Loading VVLO.#",time,__FILE__ select [count PATH],__LINE__]; systemChat "Loading VVLO."; };
  if (isServer) then {
    scopeName "Main";
  };
};