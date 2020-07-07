/* Function: VVM_fnc_cronInit; - Authors: longbow - License: MIT License - https://github.com/ussrlongbow/VVM_cron - Version: 1.0
 * Dependencies: VVM_fnc_cronJobRun
 * Description: Function initializes cron scheduling manager. Executed on server. postInit	must be set to 1, or run function manually on server after mission init.
 * Arguments: NONE - Returns: NOTHING
 * Changelog:
 * 1.0 - 01-Jul-2016 - [Added] Variables initialization moved to function.
 * 0.1 - 06-Mar-2015 - Initial release.
 */
if (isServer) then {
	VVM_var_cronInstance = createTrigger ["EmptyDetector",[0,0,0],false]; // Main trigger object, which checks if we have some jobs to do.
	VVM_var_cronInstance setTriggerActivation ["NONE","PRESENT",true];
	VVM_var_cronInstance setTriggerStatements ["[] call VVM_fnc_cronJobRun","",""];
	VVM_var_cronInstance setTriggerInterval 1;
	VVM_var_cronIdProvider = 0; // Incremental counter for jobs.
	VVM_var_cronSchedule = []; // Variable which stores, when we have some jobs to run.
	VVM_var_cronDebug = false; // Writes debug information to logs, make sure allowFunctionsLog enabled in mission's description.ext. Set to false for production release.
};
