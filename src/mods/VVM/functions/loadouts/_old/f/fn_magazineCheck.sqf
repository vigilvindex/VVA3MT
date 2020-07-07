// Zeus - Checks a units magazines and converts them from the old weapon to a given one.
// USAGE: [player,"arifle_Katiba_F","SMG_02_F"] call f_fnc_magazineCheck;
// ====================================================================================
params["_unit","_weaponOld","_weaponNew",""];

if (isNil "_unit") exitWith {diag_log text format["[F3] MAGCHECK %1: Invalid Unit passed!",_unit];};
if !(isClass (configFile >> "CfgWeapons" >> _weaponOld)) exitWith { diag_log text format["[F3] MAGCHECK: Invalid Current Weapon (%1)",_weaponOld];};
if !(isClass (configFile >> "CfgWeapons" >> _weaponNew)) exitWith { diag_log text format["[F3] MAGCHECK: Invalid New Weapon (%1)",_weaponNew];};

private _magsOld = getArray(configFile >> "CfgWeapons" >> _weaponOld >> "magazines");
private _magsNew = getArray(configFile >> "CfgWeapons" >> _weaponNew >> "magazines");

//diag_log format["[F3] MAGCHECK: _magsOld: %1",_magsOld];
//diag_log format["[F3] MAGCHECK: _magsNew: %1",_magsNew];

private _magsCurrent = magazines _unit; 
private _magsToAdd = 0;
{
	_currentMagName = _x;
	if (_currentMagName in _magsOld && !(_currentMagName in _magsNew)) then {
		_unit removeMagazine _currentMagName;
		_magsToAdd = _magsToAdd + 1;
	};
} forEach _magsCurrent;

// No suitable magazines found to add!
if (_magsToAdd isEqualTo 0 || count _magsNew == 0) exitWith {
	diag_log "[F3] MAGCHECK: Magazines Unchanged";
}; 

private _magsNewDefault = _magsNew select 0; // Default new magazine.
private _magsTracer = 0;
private _magsStandard = _magsToAdd;

// Check weapon type to see if we need tracer rounds.
if (getNumber (configFile >> "CfgWeapons" >> _weaponNew >> "type") == 1) then {
	_magsTracer = ceil ((_magsToAdd / 100) * 35);
	_magsStandard = _magsToAdd - _magsTracer;
};

//diag_log format["[F3] MAGCHECK: There are %1 magazines to add, %2 std %3 special.",_magsToAdd,_magsStandard,_magsTracer];

if (_magsTracer > 1) then {
	//diag_log format["[F3] MAGCHECK:Planning to add, %1 of %2, %3 of %4.",(_magsNew select 0),_magsStandard,(_magsNew select 1),_magsTracer];
	_unit addMagazines[_magsNewDefault, _magsStandard];
	
	// Try and find 'special' mags that fit the factions tracer.
	// Get array of tracer rounds, then try and find the factions own tracer if possible.
	
	KK_fnc_inString = {
		/*
		Author: Killzone_Kid
		Description: Find a string within a string (case insensitive)
		Parameter(s): _this select 0: <string> string to be found, _this select 1: <string> string to search in
		Returns: Boolean (true when string is found)
		_found = ["needle", "Needle in Haystack"] call KK_fnc_inString;
		*/

		private ["_searchLen","_searchItem","_found"];
		params [["_searchFor",""],["_searchIn",""]];
		_searchIn = toArray _searchIn;
		_searchLen = count toArray _searchFor;
		_searchItem = +_searchIn;
		_searchItem resize _searchLen;
		_found = false;
		for "_i" from _searchLen to count _searchIn do {
			if (toString _searchItem == _searchFor) exitWith {_found = true};
			_searchItem set [_searchLen, _searchIn select _i];
			_searchItem set [0, "x"];
			_searchItem = _searchItem - ["x"]
		};
		_found
	};
	
	// TRY1: Get a list of ALL the tracer rounds from the magazine class.
	_magTracerAll = [];
	{
		_searchString = _x + 
						getText(configFile >> "cfgMagazines" >> _x >> "ammo") +
						getText(configFile >> "cfgMagazines" >> _x >> "displayNameShort") + 
						getText(configFile >> "cfgMagazines" >> _x >> "displayName") + 
						getText(configFile >> "cfgMagazines" >> _x >> "descriptionShort");
						
		if (["tracer",_searchString] call KK_fnc_inString) then {
			_magTracerAll pushBack [_x,_searchString];
		}
	} forEach _magsNew;
	
	//diag_log format["[F3] MAGCHECK: Result of tracer search: %1",_magTracerAll];
	
	// Unable to find any tracer rounds at all, assign default magazine.
	if (count _magTracerAll < 1) exitWith {
		_unit addMagazines[_magsNewDefault,_magsTracer];
	};
		
	_tracerColor = switch (side _unit) do {case west: {"red"}; case east: {"green"}; default {"yellow"};};
	
	// TRY2: Filter the list further to just find the factions tracer.
	_magTracerFaction = [];
	{						
		if ([_tracerColor,(_x select 1)] call KK_fnc_inString) then {
			_magTracerFaction pushBack (_x select 0);
		}
	} forEach _magTracerAll;
	
	//diag_log format["[F3] MAGCHECK: Result of tracerFaction search: %1",_magTracerFaction];
	
	if (count _magTracerFaction > 0) then {
		_unit addMagazines[(_magTracerFaction select 0),_magsTracer];
	} else {
		if ((_magTracerAll select 0) isEqualType []) then {
			_unit addMagazines[((_magTracerAll select 0) select 0),_magsTracer];
		} else {
			_unit addMagazines[(_magTracerAll select 0),_magsTracer];
		};
	};	
} else {
	_unit addMagazines [_magsNewDefault,(_magsStandard+_magsTracer)];
	//diag_log format["[F3] MAGCHECK:Added, %1 of %2.",_magsNewDefault,_magsStandard+_magsTracer];
};

diag_log format["[F3] MAGCHECK %1 Mags Replaced",_magsToAdd];