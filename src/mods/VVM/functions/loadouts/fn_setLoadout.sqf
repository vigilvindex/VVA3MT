// USAGE: _result = [UNIT,FACTION,ROLE,AI] call VVLO_fnc_setLoadout;
private ["_unit","_faction","_role","_roledata","_ai","_addWeapon","_classname"];
_unit = _this select 0;
_faction = _this select 1;
_role = _this select 2;
_roledata = [_faction,_role] call VVM_fnc_getFactionRole;
_result = [_unit] call VVM_fnc_clearGear;
_unit setVariable ["BIS_enableRandomization",false]; // Disable gear randomization.
_ai = true;
{	switch (_forEachIndex) do {
		case 0: {}; // ROLE
		case 1: {_result = [_unit,_x] call VVM_fnc_setTraits;}; // TRAITS
		case 2: {if (_ai isEqualTo true) then {[_unit, _x] remoteExec ["setSpeaker",0,_unit]}}; // VOICE
		case 3: {if (_ai isEqualTo true) then {_unit setFace _x}}; // FACE
		case 4: {if !(_x isEqualTo -1) then {_unit forceAddUniform _x}}; // UNIFORM
		case 5: {if !(_x isEqualTo -1) then {_unit addHeadgear _x}}; // HEADGEAR
		case 6: {if !(_x isEqualTo -1) then {_unit addBackpack _x}}; // BACKPACK
		case 7: {if !(_x isEqualTo -1) then {_unit addVest _x}}; // VEST
		case 8: {if !(_x isEqualTo -1) then {_unit addItem _x; _unit assignItem _x}}; // NVG
		case 9: {if !(_x isEqualTo -1) then {_unit addGoggles _x}}; // FACEWEAR
		case 10: {if !(_x isEqualTo -1) then {_unit addWeapon _x}}; // BINOCULARS
		case 11: {if !(_x isEqualTo -1) then {_unit linkItem _x}}; // TERMINAL
		case 12: { // PRIMARY
			if !(_x isEqualTo -1) then {
				if (_x isEqualType []) then {
					{	_addWeapon = false; _classname = "";
						{	switch (_forEachIndex) do {
								case 0: {if !(_x isEqualTo -1) then {_addWeapon = true; _classname = _x}}; // VARIANT
								case 1: {if !(_x isEqualTo -1) then {{_unit addItemToBackpack _x} forEach _x}}; // Magazines
								case 2: {if !(_x isEqualTo -1) then {{_unit addItemToBackpack _x} forEach _x}}; // Tracers
								case 3: {if !(_x isEqualTo -1) then {{_unit addItemToBackpack _x} forEach _x}}; // Grenades
								case 4: {if !(_x isEqualTo -1) then {{_unit addItemToBackpack _x} forEach _x}}; // Flares
								case 5: {if !(_x isEqualTo -1) then {{_unit addItemToBackpack _x} forEach _x}}; // Smokes
								case 6: {
									if (_addWeapon isEqualTo true) then {_unit addWeapon _classname};
									if !(_x isEqualTo -1) then {{_unit addPrimaryWeaponItem _x} forEach _x};
								}; // Accessories
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
								case 1: {if !(_x isEqualTo -1) then {{_unit addItemToUniform _x} forEach _x}}; // Magazines
								case 2: {if !(_x isEqualTo -1) then {{_unit addItemToUniform _x} forEach _x}}; // Tracers
								case 3: {if !(_x isEqualTo -1) then {{_unit addItemToUniform _x} forEach _x}}; // Grenades
								case 4: {if !(_x isEqualTo -1) then {{_unit addItemToUniform _x} forEach _x}}; // Flares
								case 5: {if !(_x isEqualTo -1) then {{_unit addItemToUniform _x} forEach _x}}; // Smokes
								case 6: {
									if (_addWeapon isEqualTo true) then {_unit addWeapon _classname};
									if !(_x isEqualTo -1) then {{_unit addHandgunItem _x} forEach _x};
								}; // Accessories
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
								case 1: {if !(_x isEqualTo -1) then {{_unit addItemToBackpack _x} forEach _x}}; // Magazines
								case 2: {if !(_x isEqualTo -1) then {{_unit addItemToBackpack _x} forEach _x}}; // Tracers
								case 3: {if !(_x isEqualTo -1) then {{_unit addItemToBackpack _x} forEach _x}}; // Grenades
								case 4: {if !(_x isEqualTo -1) then {{_unit addItemToBackpack _x} forEach _x}}; // Flares
								case 5: {if !(_x isEqualTo -1) then {{_unit addItemToBackpack _x} forEach _x}}; // Smokes
								case 6: {
									if (_addWeapon isEqualTo true) then {_unit addWeapon _classname};
									if !(_x isEqualTo -1) then {{_unit addSecondaryWeaponItem _x} forEach _x};
								}; // Accessories
								case 7: {if !(_x isEqualTo -1) then {{_unit addSecondaryWeaponItem _x} forEach _x}}; // Bipods
								case 8: {if !(_x isEqualTo -1) then {{_unit addSecondaryWeaponItem _x} forEach _x}}; // Muzzles
								case 9: {if !(_x isEqualTo -1) then {{_unit addSecondaryWeaponItem _x} forEach _x}}; // Optics
							};
						} forEach _x;
					} forEach _x;
				};
			};
		};
		case 15: {if !(_x isEqualTo -1) then {{_unit addItemToBackpack _x} forEach _x}}; // MEDICAL
		case 16: {if !(_x isEqualTo -1) then {{_unit addItemToUniform _x} forEach _x}}; // CHEMLIGHTS
		case 17: {if !(_x isEqualTo -1) then {{_unit addItemToVest _x} forEach _x}}; // SMOKES
		case 18: {if !(_x isEqualTo -1) then {{_unit addItemToVest _x} forEach _x}}; // GRENADES
		case 19: {if !(_x isEqualTo -1) then {{_unit addItemToBackpack _x} forEach _x}}; // EXPLOSIVES
		case 20: {if !(_x isEqualTo -1) then {{_unit addItemToBackpack _x} forEach _x}}; // MINES
		case 21: {if !(_x isEqualTo -1) then {_unit linkItem _x}}; // COMPASS
		case 22: {if !(_x isEqualTo -1) then {_unit linkItem _x}}; // MAP
		case 23: {if !(_x isEqualTo -1) then {_unit linkItem _x}}; // WATCH
		case 24: {if !(_x isEqualTo -1) then {{_unit linkItem _x} forEach _x}}; // RADIO
		case 25: {if !(_x isEqualTo -1) then {{_unit linkItem _x} forEach _x}}; // TOOLS
	};
} forEach _roledata;
_unit selectWeapon primaryWeapon _unit; // Select Default Weapon
