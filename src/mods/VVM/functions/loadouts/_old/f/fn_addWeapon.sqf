// Zeus - Checks if a weapon is valid and if so gives it to _unit.
// Iterates and assigns weapons into a relevant local array to display in-briefing.
// ====================================================================================
params["_refUnit",["_wepList","",["",[]]]];
private ["_refSide","_refType","_varName","_weapType"];
_refSide = _side; 			// side _refUnit;
_refType = _typeofUnit; 	// _refUnit getVariable ["????","r"];
_varName = format["f_var_%1_%2_gear",_refSide,_refType];

// Convert to array if string only.
if (_wepList isEqualType "") then { _wepList = [_wepList]; };

// Validate weapons and add to list
private _wepArray = [];
{
	if (getNumber(configFile >> "CfgWeapons" >> _x >> "type") > 0 && {isClass (configFile >> "CfgWeapons" >> _x)}) then {
		_wepArray pushBackUnique (configName (configFile >> "CfgWeapons" >> _x));
		_weapType = getNumber(configFile >> "CfgWeapons" >> _x >> "type");
	} else {
		diag_log text format["[F3] ERROR (f_addWeapon.sqf): Invalid weapon for %1_%2: '%3' (%4 - %5)",_side,_typeofUnit,_x,getNumber(configFile >> "CfgWeapons" >> _x >> "type"),isClass (configFile >> "CfgWeapons" >> _x)];
		["fn_addWeapon.sqf",format["Invalid weapon for %1_%2: '%3'.",_side,_typeofUnit,_x]] call f_fnc_logIssue;
	};
} forEach _wepList;

if (count _wepArray > 0) then {
	_refUnit addWeapon (_wepArray select 0);
	// Only players will need the list of weapons to choose from.
	if (isPlayer _unit && isNil format["%1%2",_varName,_weapType]) then { 
		missionNamespace setVariable [format["%1%2",_varName,_weapType],_wepArray,true];
	};
};