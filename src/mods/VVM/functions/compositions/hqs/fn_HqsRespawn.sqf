/*
 * Vehicle Respawn Script [OOPS]
 * Usage: veh = [this] execVM "vehicleRespawn.sqf";
 * Options: veh = [this, Delay, Empty Timer, Respawns, Effect, Static] execVM "vehicleRespawn.sqf";
 * Defaults: veh = [this, 30, 120, 0, FALSE, FALSE] execVM "vehicleRespawn.sqf";
 *
 * Default respawn delay is 30 seconds, to set a custom respawn delay time, put that in the init as well.
 * veh = [this, 15] execVM "vehicleRespawn.sqf"
 * Default respawn time when vehicle is empty, but not destroyed is 120 seconds. To set a custom timer for this first put the respawn delay, then the empty vehicle timer. (0 = disabled)
 * veh = [this, 15, 10] execVM "vehicleRespawn.sqf"
 * By default the number of respawns is infinite. To set a limit first set the other values then the number of respawns you want (0 = infinite).
 * veh = [this, 15, 10, 5] execVM "vehicleRespawn.sqf"
 * Set this value to TRUE to add a special explosion effect to the wreck when respawning. Default value is FALSE, which will simply have the wreck disappear.
 * veh = [this, 15, 10, 5, TRUE] execVM "vehicleRespawn.sqf"
 * By default the vehicle will respawn to the static origin point of the mission. This can be changed to dynamic and the vehicle will respawn to where it was destroyed. Set TRUE for dynamic or FALSE for static.
 * veh = [this, 15, 10, 5, TRUE, TRUE] execVM "vehicleRespawn.sqf"
 * If you you want to set the INIT field of the respawned vehicle, first set all other values, then set init commands. Those must be inside quotations.
 * veh = [this, 15, 10, 5, TRUE, FALSE, "this setDammage 0.5"] execVM "vehicleRespawn.sqf"
 */
/*
if (!isServer) exitWith {};
// Variables
_unit = _this select 0;
_delay = if (count _this > 1) then {_this select 1} else {30};
_deserted = if (count _this > 2) then {_this select 2} else {120};
_respawns = if (count _this > 3) then {_this select 3} else {0};
_explode = if (count _this > 4) then {_this select 4} else {false};
_dynamic = if (count _this > 5) then {_this select 5} else {false};
_unitinit = if (count _this > 6) then {_this select 6} else {};
_haveinit = if (count _this > 6) then {true} else {false};
_hasname = false;
_unitname = vehicleVarName _unit;
if (isNil _unitname) then {_hasname = false;} else {_hasname = true;};
_noend = true;
_run = true;
_rounds = 0;
if (_delay < 0) then {_delay = 0};
if (_deserted < 0) then {_deserted = 0};
if (_respawns <= 0) then {_respawns= 0; _noend = true;};
if (_respawns > 0) then {_noend = false};
_dir = getDir _unit;
_position = getPosASL _unit;
_type = typeOf _unit;
_dead = false;
_nodelay = false;
// Start monitoring the vehicle
while {_run} do {
	sleep (2 + random 10);
      if ((getDammage _unit > 0.8) and ({alive _x} count crew _unit == 0)) then {_dead = true};
	// Check if the vehicle is deserted.
	if (_deserted > 0) then	{
		if ((getPosASL _unit distance _position > 10) and ({alive _x} count crew _unit == 0) and (getDammage _unit < 0.8)) then {
			_timeout = time + _deserted;
			sleep 0.1;
		 	waitUntil {_timeout < time or !alive _unit or {alive _x} count crew _unit > 0};
			if ({alive _x} count crew _unit > 0) then {_dead = false};
			if ({alive _x} count crew _unit == 0) then {_dead = true; _nodelay =true};
			if !(alive _unit) then {_dead = true; _nodelay = false};
		};
	};
	// Respawn vehicle
      if (_dead) then {
		if (_nodelay) then {sleep 0.1; _nodelay = false;} else {sleep _delay;};
		if (_dynamic) then {_position = getPosASL _unit; _dir = getDir _unit;};
		if (_explode) then {_effect = "M_TOW_AT" createVehicle getPosASL _unit; _effect setPosASL getPosASL _unit;};
		sleep 0.1;
		deleteVehicle _unit;
		sleep 2;
		_unit = _type createVehicle _position;
		_unit setPosASL _position;
		_unit setDir _dir;
		if (_haveinit) then
        			{_unit setVehicleInit format ["%1;", _unitinit]; processInitCommands;};
		if (_hasname) then
					{_unit setVehicleInit format ["%1 = this; this setVehicleVarName ""%1""",_unitname]; processInitCommands;};
		_dead = false;
		// Check respawn amount
		if !(_noend) then {_rounds = _rounds + 1};
		if ((_rounds == _respawns) and !(_noend)) then {_run = false;};
	};
};
*/
