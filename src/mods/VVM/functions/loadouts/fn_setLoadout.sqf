// USAGE: _result = [UNIT,FACTION,ROLE,AI] call VVLO_fnc_setLoadout;
// TODO: Use BIS_fnc_setIdentity for JIP support of faces & voices.
private ["_unit","_faction","_role","_roledata","_ai","_addWeapon","_classname","_diver"];
//diag_log format ["# %1 # fn_setLoadout.sqf _this = %2 #",time,_this];
_unit = _this select 0;
_faction = _this select 1;
_role = _this select 2;
_roledata = [_faction,_role] call VVM_fnc_getFactionRole;
_result = [_unit] call VVM_fnc_clearGear;
_unit setVariable ["BIS_enableRandomization",false]; // Disable gear randomization.
[_unit,""] call BIS_fnc_setUnitInsignia; // Remove insignia.
if (isPlayer _unit) then {_ai = false} else {_ai = true}; // AI switch to not set face & voice for players.
_diver = false;
{	switch (_forEachIndex) do {
		case 0: {}; // ROLE
		case 1: {_result = [_unit,_x] call VVM_fnc_setTraits;}; // TRAITS
		case 2: {if (_ai isEqualTo true) then {[_unit, _x] remoteExec ["setSpeaker",0,_unit]}}; // VOICE
		case 3: {if (_ai isEqualTo true) then {_unit setFace _x}}; // FACE
		case 4: {if !(_x isEqualTo -1) then {_unit forceAddUniform _x}}; // UNIFORM
		case 5: {if !(_x isEqualTo -1) then {_unit addHeadgear _x}}; // HEADGEAR
		case 6: {if !(_x isEqualTo -1) then {_unit addBackpack _x}}; // BACKPACK
		case 7: {if !(_x isEqualTo -1) then { // VEST
			if (_x in ["V_RebreatherB","V_RebreatherIR","V_RebreatherIA"]) then {_diver = true;};
			_unit addVest _x;
		}};
		case 8: {if !(_x isEqualTo -1) then {(uniformContainer _unit) addItemCargoGlobal [_x,1]}}; // NVG
		case 9: {if !(_x isEqualTo -1) then {_unit addGoggles _x}}; // FACEWEAR
		case 10: {if !(_x isEqualTo -1) then {_unit addWeapon _x}}; // BINOCULARS
		case 11: {if !(_x isEqualTo -1) then {_unit linkItem _x}}; // TERMINAL
		case 12: { // PRIMARY
			if !(_x isEqualTo -1) then {
				if (_x isEqualType []) then {
					{	_addWeapon = false; _classname = "";
						{	switch (_forEachIndex) do {
								case 0: {if !(_x isEqualTo -1) then {_addWeapon = true; _classname = _x}}; // VARIANT
								case 1: {if !(_x isEqualTo -1) then {{(backpackContainer _unit) addItemCargoGlobal [_x,1]} forEach _x}}; // Magazines
								case 2: {if !(_x isEqualTo -1) then {{(backpackContainer _unit) addItemCargoGlobal [_x,1]} forEach _x}}; // Tracers
								case 3: {if !(_x isEqualTo -1) then {{(backpackContainer _unit) addItemCargoGlobal [_x,1]} forEach _x}}; // Grenades
								case 4: {if !(_x isEqualTo -1) then {{(backpackContainer _unit) addItemCargoGlobal [_x,1]} forEach _x}}; // Flares
								case 5: {if !(_x isEqualTo -1) then {{(backpackContainer _unit) addItemCargoGlobal [_x,1]} forEach _x}}; // Smokes
								case 6: { // Accessories & Add Gun
									if (_addWeapon isEqualTo true) then {_unit addWeapon _classname};
									if !(_x isEqualTo -1) then {{_unit addPrimaryWeaponItem _x} forEach _x};
								};
								case 7: {if !(_x isEqualTo -1) then {{_unit addPrimaryWeaponItem _x} forEach _x}}; // Bipods
								case 8: {if !(_x isEqualTo -1) then {{_unit addPrimaryWeaponItem _x} forEach _x}}; // Muzzles
								case 9: {if !(_x isEqualTo -1) then {{_unit addPrimaryWeaponItem _x} forEach _x}}; // Optics
							};
						} forEach _x;
					} forEach _x;
				};
			};
		};
		case 13: { // SECONDARY
			if !(_x isEqualTo -1) then {
				if (_x isEqualType []) then {
					{	_addWeapon = false; _classname = "";
						{	switch (_forEachIndex) do {
								case 0: {if !(_x isEqualTo -1) then {_addWeapon = true; _classname = _x}}; // VARIANT
								case 1: {if !(_x isEqualTo -1) then {{(uniformContainer _unit) addItemCargoGlobal [_x,1]} forEach _x}}; // Magazines
								case 2: {if !(_x isEqualTo -1) then {{(uniformContainer _unit) addItemCargoGlobal [_x,1]} forEach _x}}; // Tracers
								case 3: {if !(_x isEqualTo -1) then {{(uniformContainer _unit) addItemCargoGlobal [_x,1]} forEach _x}}; // Grenades
								case 4: {if !(_x isEqualTo -1) then {{(uniformContainer _unit) addItemCargoGlobal [_x,1]} forEach _x}}; // Flares
								case 5: {if !(_x isEqualTo -1) then {{(uniformContainer _unit) addItemCargoGlobal [_x,1]} forEach _x}}; // Smokes
								case 6: { // Accessories & Add Gun
									if (_addWeapon isEqualTo true) then {_unit addWeapon _classname};
									if !(_x isEqualTo -1) then {{_unit addHandgunItem _x} forEach _x};
								};
								case 7: {if !(_x isEqualTo -1) then {{_unit addHandgunItem _x} forEach _x}}; // Bipods
								case 8: {if !(_x isEqualTo -1) then {{_unit addHandgunItem _x} forEach _x}}; // Muzzles
								case 9: {if !(_x isEqualTo -1) then {{_unit addHandgunItem _x} forEach _x}}; // Optics
							};
						} forEach _x;
					} forEach _x;
				};
			};
		};
		case 14: { // LAUNCHER
			if !(_x isEqualTo -1) then {
				if (_x isEqualType []) then {
					{	_addWeapon = false; _classname = "";
						{	switch (_forEachIndex) do {
								case 0: {if !(_x isEqualTo -1) then {_addWeapon = true; _classname = _x}}; // VARIANT
								case 1: {if !(_x isEqualTo -1) then {{(backpackContainer _unit) addItemCargoGlobal [_x,1]} forEach _x}}; // Magazines
								case 2: {if !(_x isEqualTo -1) then {{(backpackContainer _unit) addItemCargoGlobal [_x,1]} forEach _x}}; // Tracers
								case 3: {if !(_x isEqualTo -1) then {{(backpackContainer _unit) addItemCargoGlobal [_x,1]} forEach _x}}; // Grenades
								case 4: {if !(_x isEqualTo -1) then {{(backpackContainer _unit) addItemCargoGlobal [_x,1]} forEach _x}}; // Flares
								case 5: {if !(_x isEqualTo -1) then {{(backpackContainer _unit) addItemCargoGlobal [_x,1]} forEach _x}}; // Smokes
								case 6: { // Accessories & Add Gun
									if (_addWeapon isEqualTo true) then {_unit addWeapon _classname};
									if !(_x isEqualTo -1) then {{_unit addSecondaryWeaponItem _x} forEach _x};
								};
								case 7: {if !(_x isEqualTo -1) then {{_unit addSecondaryWeaponItem _x} forEach _x}}; // Bipods
								case 8: {if !(_x isEqualTo -1) then {{_unit addSecondaryWeaponItem _x} forEach _x}}; // Muzzles
								case 9: {if !(_x isEqualTo -1) then {{_unit addSecondaryWeaponItem _x} forEach _x}}; // Optics
							};
						} forEach _x;
					} forEach _x;
				};
			};
		};
		case 15: {if !(_x isEqualTo -1) then {{(backpackContainer _unit) addItemCargoGlobal [_x,1]} forEach _x}}; // MEDICAL
		case 16: {if !(_x isEqualTo -1) then {{(uniformContainer _unit) addItemCargoGlobal [_x,1]} forEach _x}}; // CHEMLIGHTS
		case 17: {if !(_x isEqualTo -1) then { // SMOKES
			if (_diver isEqualTo true) then {
				{(backpackContainer _unit) addItemCargoGlobal [_x,1]} forEach _x;
			} else {
				{(vestContainer _unit) addItemCargoGlobal [_x,1]} forEach _x;
			};
		}};
		case 18: {if !(_x isEqualTo -1) then { // GRENADES
			if (_diver isEqualTo true) then {
				{(backpackContainer _unit) addItemCargoGlobal [_x,1]} forEach _x;
			} else {
				{(vestContainer _unit) addItemCargoGlobal [_x,1]} forEach _x;
			};
		}};
		case 19: {if !(_x isEqualTo -1) then {{(backpackContainer _unit) addItemCargoGlobal [_x,1]} forEach _x}}; // EXPLOSIVES
		case 20: {if !(_x isEqualTo -1) then {{(backpackContainer _unit) addItemCargoGlobal [_x,1]} forEach _x}}; // MINES
		case 21: {if !(_x isEqualTo -1) then {_unit linkItem _x}}; // COMPASS
		case 22: {if !(_x isEqualTo -1) then {_unit linkItem _x}}; // MAP
		case 23: {if !(_x isEqualTo -1) then {_unit linkItem _x}}; // WATCH
		case 24: {if !(_x isEqualTo -1) then {{_unit linkItem _x} forEach _x}}; // RADIO
		case 25: {if !(_x isEqualTo -1) then {{(backpackContainer _unit) addItemCargoGlobal [_x,1]} forEach _x}}; // TOOLS
	};
} forEach _roledata;
_unit selectWeapon primaryWeapon _unit; // Select Default Weapon
