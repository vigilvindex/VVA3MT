/* init.sqf
Description: Initialises the Respawn module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/07/21 Updated: 2016/08/16 Version: 0.0.1
*/
if (isNil "modRespawnSwitch") then {modRespawnSwitch = 0;};
if (modRespawnSwitch == 1) then {
  if (modDebug == 1) then {
    diag_log format ["#%1#%2#%3#Loading Respawn.#",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__];
    systemChat "Loading Respawn.";
  };
};
