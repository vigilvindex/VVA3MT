/* Function: VVM_fnc_cronJobRemove; - Authors: longbow - License: MIT License - https://github.com/ussrlongbow/VVM_cron
 * Description: Function removes a job from cron scheduling manager. Executed on server.
 * Returns: NOTHING
 * Version: 1.0 - Dependencies: VVM_var_cronDebug
 * Arguments: NUMBER _ID _ID - Integer, just job's numeric identifier.
 * Changelog:
 * 	1.0 01-Jul-2016 [added] toggleable logging, see VVM_var_cronDebug in VVM_fnc_cronIinit [changed] updated code comments
 * 	0.1 06-Mar-2015 Initial release
 */
if (isServer) then {
	if (VVM_var_cronDebug) then	{ diag_log format ["VVM_fnc_cronJobRemove: __LINE__: removing job with id: %1",_this]; };
	missionNamespace setVariable [format["VVM_var_cronJob_%1",_this],nil];
};
