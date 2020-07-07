/*****************************************************************************
Function name: VVM_fnc_cronJobRun;
Authors: longbow
License: MIT License
https://github.com/ussrlongbow/VVM_cron
Version: 1.0
Dependencies:
	VVM_fnc_cronJobAdd
	VVM_fnc_cronJobRemove
	VVM_var_cronDebug
	VVM_var_cronSchedule

Changelog:
	=== 1.0 === 01-Jul-2016
		[added] toggleable logging, see VVM_var_cronDebug in VVM_fnc_cronIinit
		[changed] updated code comments
		
	=== 0.1 === 06-Mar-2015
		Initial release

Description:
	Runs jobs from VVM_var_cronSchedule if time > jobs' execution time.
	Executed on server.

Arguments:
	NONE

Returns:
	NOTHING

*****************************************************************************/
private ["_time","_earliest","_jobs"];
_time = time; // current time
if (isServer) then {
	if (count VVM_var_cronSchedule == 0) exitWith {false}; // exit if no jobs
	_earliest = VVM_var_cronSchedule select 0; // get the time of earliest event
	if (_time < _earliest) exitWith {false}; // exit if earliest event is in future
	VVM_var_cronSchedule deleteAt 0; // remove event from timetable if it occurs
	_jobs = missionNamespace getVariable [format["VVM_var_cronJobsAt_%1", _earliest], []];
	if (_jobs isEqualTo []) exitWith { // if no jobs at this time, nil this var and exit
		missionNamespace setVariable [format["VVM_var_cronJobsAt_%1", _earliest], nil];
		false;
	};
	{	private ["_job","_interval","_new_time","_index"];
		_new_time = 0; // read job data
		_index = _x; // job we run in this iteration
		missionNamespace setVariable [format["VVM_var_cronJob_%1", _index], _job];
		_interval = _job select 3; // finding job interval
		[_index,(_job select 1)] spawn (_job select 0); // spawn function defined in _job's code
		if (_interval != 0) then {	// reschedule job for new time
			_new_time = _interval + _time;
			_job set [2,_new_time];
			_job set [4,_index];
			_job call VVM_fnc_cronJobAdd;
		} else {_index call VVM_fnc_cronJobRemove;};
	} forEach _jobs; // run jobs
	missionNamespace setVariable [format["VVM_var_cronJobsAt_%1", _earliest], nil]; // nil var with jobs, since we ran them
};
