private ["_refUnit","_refUnitArray","_removeAction","_movePoint"];
if (count (playableUnits + switchableUnits) < 2) exitWith {};
if (leader player != player && alive (leader player)) then {
	_refUnit = leader player;
} else {
	_refUnitArray = [];
	{ if (alive _x) then { _refUnitArray pushBack _x; }; 
	} forEach (units group player) - [player];
	if (count _refUnitArray == 0) then {
		{ if ((side _x) == side (group player) && _x != player) then {_refUnitArray pushBack _x;}; } forEach allUnits;
		_refUnit = _refUnitArray select 0;
	} else {
		_refUnit = _refUnitArray select 0;
	};
};
_removeAction = true;
// If the JIP unit's team member is in a vehicle, put him in too. The code has fail-safe logic in case the vehicle is full
if (vehicle _refUnit != _refUnit) then {	// Member is in vehicle	
	if (!(player moveInAny (vehicle _refUnit))) then {	// Can't move JIP to vehicle!
		if ((getPos _refUnit select 2) > 10 || (speed _refUnit) > 35) then { // Member is in-flight or going too fast.
			systemChat format["Cannot Join on %1 - Target vehicle is full and in motion! Try later.",_refUnit];
			_removeAction = false;
		} else {
			player setPos [getPos _refUnit select 0, (getPos _refUnit select 1) - 5, 0.1];	
		};
	};
} else {
	_movePoint = position _refUnit findEmptyPosition [2,50,typeOf player];
	if (count _movePoint > 0) then {
		player setPos _movePoint;
	} else {
		player setPos [getPos _refUnit select 0, (getPos _refUnit select 1) - 5, 0.1];
	};
};
if (_removeAction) then {
	if (true) then {
		[player, 1, ["ACE_SelfActions","ACE_TeamManagement","JIP"]] call ace_interact_menu_fnc_removeActionFromObject;
	} else {
		player removeAction (_this select 2);
	};
};
hintSilent ""; // Remove the hint if present.
