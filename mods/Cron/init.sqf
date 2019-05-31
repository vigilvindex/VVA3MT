/* init.sqf
Description: Initialises the LBCron module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/07/21 Updated: 2016/08/16 Version: 0.0.1
*/
if (isNil "modLBCronSwitch") then {modLBCronSwitch = 0;};
if (modLBCronSwitch == 1) then {
  diag_log format ["#%1#%2#%3#Loading LBCron.#",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__];
  systemChat "Loading LBCron.";
};
