/* Function: VVM_fnc_cronJobAdd; - Authors: longbow - License: MIT License - https://github.com/ussrlongbow/VVM_cron
 * Description: Function adds a job to cron scheduling manager. Executed on server.
 * Returns: NOTHING - Version: 1.0
 * Dependencies: VVM_var_cronIdProvider, VVM_var_cronSchedule, VVM_var_cronDebug
 * Changelog:
 *  1.0 01-Jul-2016
 * 		[added] toggleable logging, see VVM_var_cronDebug in VVM_fnc_cronIinit
 * 		[changed] BIS_fnc_sortNum replaced with sort command
 * 		[changed] changed variable names to unified naming standart
 * 		[changed] updated code comments
 * 	0.1 06-Mar-2015 Initial release
 * Arguments:
 * 	ARRAY [_JOB,_ARGS,_FIRSTRUN,_INTERVAL,_ID]
 * 		_JOB - Code to be executed by cron manager, executed in scheduled  environment (by 'spawn' command)
 * 		_ARGS - arguments for _JOB, available as (_this select 1)
 * 		_FIRSTRUN - when this job should be executed first time. if _FIRSTRUN > time, it will be postponed until time reaches this value, set it to 0 if you wish immediate execution after adding to cron manager
 * 		_INTERVAL - interval in seconds between job runs, set to 0 if it is a one-time job
 * 		_ID - Integer, just job's numeric identifier, use 0 to create a new job, and any other value > 0 to edit existing job. Added job parameters are stored on server in variable VVM_var_cronJob_X, where X = _ID.
 */
if (isServer) then { // executing only on server host or in singleplayer
	if (VVM_var_cronDebug) then {diag_log format ["VVM_fnc_cronJobAdd: Entering function"]}; // debug logging
	private ["_job","_isnew","_first_time","_index","_time"];
	_job = _this;
	if (VVM_var_cronDebug) then {diag_log format ["VVM_fnc_cronJobAdd: supplied job params: %1",_job]}; // debug logging
	_time = time; // using time as our 'clock', since serverTime returns weird values after mission start in multiplayer
	_isnew = _this select 4; // if we add new job this param should be 0, if modifying existing should be equal to job's id
	if (VVM_var_cronDebug) then	{diag_log format ["VVM_fnc_cronJobAdd: job ID: %1",_isnew]};
	_index = if (_isnew == 0) then {
		VVM_var_cronIdProvider = VVM_var_cronIdProvider + 1;
		if (VVM_var_cronDebug) then	{diag_log format ["VVM_fnc_cronJobAdd: VVM_var_cronIdProvider: %1",VVM_var_cronIdProvider]};
		VVM_var_cronIdProvider
	} else { _isnew }; // get new id for cron job
	if (VVM_var_cronDebug) then	{diag_log format ["VVM_fnc_cronJobAdd: creating/modifying job: %1",_index]};
	missionNamespace setVariable [format["VVM_var_cronJob_%1",_index], _job]; // write the cron job to variable cronjob_##id
	_first_time = floor (_this select 2); // first time to run this job rounding down to seconds
	if (_time > _first_time) then {_first_time = 0}; // if first time run is earlier current time that means immediate execution all immedtiate to run jobs are considered to run at time 0 seconds from server start means that we put all these jobs to var VVM_var_cronJobsAt_0 otherwise job execution may be delayed
	if (VVM_var_cronDebug) then {diag_log format ["VVM_fnc_cronJobAdd: cron schedule before adding a job: %1",VVM_var_cronSchedule]}; // if we already have _first_time in time table, do not alter it, primarily to avoid unnecessary sorting for immediate events
	if (!(_first_time in VVM_var_cronSchedule)) then {
		VVM_var_cronSchedule pushBack _first_time; // adding to timetable and sorting array to have earliest event, always available by (VVM_var_cronSchedule select 0)
		VVM_var_cronSchedule sort true;
	};
	if (VVM_var_cronDebug) then {diag_log format ["VVM_fnc_cronJobAdd: cron schedule after adding a job: %1",VVM_var_cronSchedule]};
	_jobs = missionNamespace getVariable [format["VVM_var_cronJobsAt_%1",_first_time], []]; // get the list of existing jobs for requested time
	_jobs pushBack _index;
	missionNamespace setVariable [format["VVM_var_cronJobsAt_%1", _first_time], _jobs];
	if (VVM_var_cronDebug) then {diag_log format ["VVM_fnc_cronJobAdd: Exiting function"]};
};
