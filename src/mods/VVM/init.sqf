/* Name: init.sqf
Description: Initialises the VVM module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2013/08/09 Updated: 2016/08/16 Version: 0.0.1
*/
if (isNil "modVVMSwitch") then {modVVMSwitch = 0;};
if (modVVMSwitch == 1) then {
  if (modDebug == 1) then {
    diag_log format ["#%1#%2#%3#Loading VVM.#",time,__FILE__ select [count PATH],__LINE__];
	  systemChat "Loading VVM.";
  };
  if (isServer) then {};
};