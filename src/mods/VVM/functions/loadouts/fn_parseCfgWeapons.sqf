_primaries = [];
_secondaries = [];
_launchers = [];
_cfg = configFile >> "CfgWeapons";
for "_i" from 0 to ((count _cfg) - 1) do {
	diag_log "###################";
	_class = _cfg select _i;
	if (isClass _class) then {
		_className = configName _class;
		if (_className != "") then {
			 diag_log format["Classname = '%1';",_className];
			if (_className isKindOf ["Rifle_Base_F", configFile >> "CfgWeapons"]) then {
				// Primaries
				_displayName = getText(configFile >> "CfgWeapons" >> _className >> "displayName"); diag_log format["Name = '%1';",_displayName];
				_description = getText(configfile >> "CfgWeapons" >> _className >> "descriptionShort"); diag_log format["Description = '%1';",_description];
				_author = getText(configFile >> "CfgWeapons" >> _className >> "author"); diag_log format["Author = '%1';",_author];
				_base = [_className] call BIS_fnc_baseWeapon; diag_log format["Base = '%1';",_base]; _primaries pushBackUnique _base;
				_components = _className call BIS_fnc_weaponComponents; diag_log format["Components = '%1';",_components];
				_items = _className call BIS_fnc_compatibleItems; diag_log format["Items = '%1';",_items];
				//if ((count _items) > 0) then { { diag_log format["Items = '%1';",_x] } forEach _items };
				_magazines = getArray(configfile >> "CfgWeapons" >> _className >> "magazines");
				if ((count _magazines) > 0) then { { diag_log format["Magazines = %1 #",_x] } forEach _magazines };
				_muzzles = getArray(configfile >> "CfgWeapons" >> _className >> "muzzles");
				if ((count _muzzles) > 1) then {
					{	_muzzleMags = getArray(configfile >> "CfgWeapons" >> _className >> _x >> "magazines");
						if ((count _muzzleMags) > 0) then { {diag_log format["Muzzle Magazines = %1 #",_x];} forEach _muzzleMags; };
					} forEach _muzzles;
				};
			};
			if (_className isKindOf ["Pistol_Base_F", configFile >> "CfgWeapons"]) then {
				// Secondaries
				_displayName = getText(configFile >> "CfgWeapons" >> _className >> "displayName"); diag_log format["Name = '%1';",_displayName];
				_description = getText(configfile >> "CfgWeapons" >> _className >> "descriptionShort"); diag_log format["Description = '%1';",_description];
				_author = getText(configFile >> "CfgWeapons" >> _className >> "author"); diag_log format["Author = '%1';",_author];
				_base = [_className] call BIS_fnc_baseWeapon; diag_log format["Base = '%1';",_base]; _secondaries pushBackUnique _base;
				_components = _className call BIS_fnc_weaponComponents; diag_log format["Components = '%1';",_components];
				_items = _className call BIS_fnc_compatibleItems; diag_log format["Items = '%1';",_items];
				//if ((count _items) > 0) then { { diag_log format["Items = '%1';",_x] } forEach _items };
				_magazines = getArray(configfile >> "CfgWeapons" >> _className >> "magazines");
				if ((count _magazines) > 0) then { { diag_log format["Magazines = %1 #",_x] } forEach _magazines };
				_muzzles = getArray(configfile >> "CfgWeapons" >> _className >> "muzzles");
				if ((count _muzzles) > 1) then {
					{	_muzzleMags = getArray(configfile >> "CfgWeapons" >> _className >> _x >> "magazines");
						if ((count _muzzleMags) > 0) then { {diag_log format["Muzzle Magazines = %1 #",_x];} forEach _muzzleMags; };
					} forEach _muzzles;
				};
			};
			if (_className isKindOf ["Launcher_Base_F", configFile >> "CfgWeapons"]) then {
				// Launchers
				_displayName = getText(configFile >> "CfgWeapons" >> _className >> "displayName"); diag_log format["Name = '%1';",_displayName];
				_description = getText(configfile >> "CfgWeapons" >> _className >> "descriptionShort"); diag_log format["Description = '%1';",_description];
				_author = getText(configFile >> "CfgWeapons" >> _className >> "author"); diag_log format["Author = '%1';",_author];
				_base = [_className] call BIS_fnc_baseWeapon; diag_log format["Base = '%1';",_base]; _launchers pushBackUnique _base;
				_components = _className call BIS_fnc_weaponComponents; diag_log format["Components = '%1';",_components];
				_items = _className call BIS_fnc_compatibleItems; diag_log format["Items = '%1';",_items];
				//if ((count _items) > 0) then { { diag_log format["Items = '%1';",_x] } forEach _items };
				_magazines = getArray(configfile >> "CfgWeapons" >> _className >> "magazines");
				if ((count _magazines) > 0) then { { diag_log format["Magazines = %1 #",_x] } forEach _magazines };
				_muzzles = getArray(configfile >> "CfgWeapons" >> _className >> "muzzles");
				if ((count _muzzles) > 1) then {
					{	_muzzleMags = getArray(configfile >> "CfgWeapons" >> _className >> _x >> "magazines");
						if ((count _muzzleMags) > 0) then { {diag_log format["Muzzle Magazines = %1 #",_x];} forEach _muzzleMags; };
					} forEach _muzzles;
				};
			};
		};
	};
};
if ((count _primaries) > 0) then { {diag_log format["_primaries = %1 #",_x];} forEach _primaries; };
if ((count _secondaries) > 0) then { {diag_log format["_secondaries = %1 #",_x];} forEach _secondaries; };
if ((count _launchers) > 0) then { {diag_log format["_launchers = %1 #",_x];} forEach _launchers; };
