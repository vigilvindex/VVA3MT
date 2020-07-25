private ["_role","_traits","_primaries","_secondaries","_launchers","_voices","_faces","_uniforms","_headgear","_backpacks","_vests","_voices","_faces","_uniforms","_headgear","_backpacks","_vests","_binoculars","_compasses","_facewear","_maps","_medical","_nvgs","_radios","_terminals","_tools","_watches","_chemlights","_explosives","_grenades","_mines","_smokes","_return","_prim","_sec","_lau","_meds","_chems","_smoks","_gres","_exps","_mins","_rads","_toos","_a","_b"];
diag_log format ["# %1 # fn_parseRole.sqf _this = %2 #",time,_this];
_role = _this select 0;
_traits = [[0,0,0,0],[0,0,1,0],[1,0,0,0],[0,1,0,0],[1,1,0,0],[0,0,0,1]]; // [ENG,EXP,MED,UAV] 0 = OFF, 1 = ON. [NONE,MED,ENG,ENGM,EOD,UAV]
_primaries = _this select 1;
_secondaries = _this select 2;
_launchers = _this select 3;
_voices = _this select 4;
_faces = _this select 5;
_uniforms = _this select 6;
_headgear = _this select 7;
_backpacks = _this select 8;
_vests = _this select 9;
_binoculars = 0 call VVM_fnc_getItems;
_compasses = 1 call VVM_fnc_getItems;
_facewear = 2 call VVM_fnc_getItems;
_maps = 4 call VVM_fnc_getItems;
_medical = 5 call VVM_fnc_getItems;
_nvgs = 6 call VVM_fnc_getItems;
_radios = 7 call VVM_fnc_getItems;
_terminals = 8 call VVM_fnc_getItems;
_tools = 9 call VVM_fnc_getItems;
_watches = 10 call VVM_fnc_getItems;
_chemlights = 0 call VVM_fnc_getMagazines;
_explosives = 1 call VVM_fnc_getMagazines;
_grenades = 3 call VVM_fnc_getMagazines;
_mines = 4 call VVM_fnc_getMagazines;
_smokes = 5 call VVM_fnc_getMagazines;
_return = [];
{	switch (_forEachIndex) do {
		case 0: {_return pushBack toUpper _x;}; // ROLE
		case 1: {if (_x == -1) then {_return pushBack -1;} else {_return pushBack (_traits select _x);}}; // TRAITS
		case 2: {if (_x == -1) then {_return pushBack -1;} else {_return pushBack (_voices select _x);}}; // VOICE
		case 3: {if (_x == -1) then {_return pushBack -1;} else {_return pushBack (_faces select _x);}}; // FACE
		case 4: {if (_x == -1) then {_return pushBack -1;} else {_return pushBack (_uniforms select _x);}}; // UNIFORM
		case 5: {if (_x == -1) then {_return pushBack -1;} else {_return pushBack (_headgear select _x);}};// HEADGEAR
		case 6: {if (_x == -1) then {_return pushBack -1;} else {_return pushBack (_backpacks select _x);}}; // BACKPACK
		case 7: {if (_x == -1) then {_return pushBack -1;} else {_return pushBack (_vests select _x);}}; // VEST
		case 8: {if (_x == -1) then {_return pushBack -1;} else {_return pushBack (_nvgs select _x);}}; // NVG
		case 9: {if (_x == -1) then {_return pushBack -1;} else {_return pushBack (_facewear select _x);}}; // FACEWEAR
		case 10: {if (_x == -1) then {_return pushBack -1;} else {_return pushBack (_binoculars select _x);}}; // BINOCULAR
		case 11: {if (_x == -1) then {_return pushBack -1;} else {_return pushBack (_terminals select _x);}}; // TERMINAL
		case 12: { // PRIMARY
			if (_x isEqualType []) then {
				_prim = [];
				{	_data = [_primaries,_x] call VVM_fnc_parseWeapon;
					_prim pushBack _data;
				} forEach _x;
				_return pushBack _prim;
			} else {
				_return pushBack -1;
			};
		};
		case 13: { // SECONDARY
			if (_x isEqualType []) then {
				_sec = [];
				{	_data = [_secondaries,_x] call VVM_fnc_parseWeapon;
					_sec pushBack _data;
				} forEach _x;
				_return pushBack _sec;
			} else {
				_return pushBack -1;
			};
		};
		case 14: { // LAUNCHER
			if (_x isEqualType []) then {
				_lau = [];
				{	_data = [_launchers,_x] call VVM_fnc_parseWeapon;
					_lau pushBack _data;
				} forEach _x;
				_return pushBack _lau;
			} else {
				_return pushBack -1;
			};
		};
		case 15: { // MEDICAL
			if (_x isEqualType []) then {
				_meds = [];
				{	if (_x isEqualType []) then {
						_a = _x select 0;
						_b = _x select 1;
						for "_i" from 1 to _b do {
							_meds pushBack (_medical select _a);
						};
					};
				} forEach _x;
				_return pushBack _meds;
			} else {
				_return pushBack -1;
			};
		};
		case 16: { // CHEMLIGHTS
			if (_x isEqualType []) then {
				_chems = [];
				{	if (_x isEqualType []) then {
						_a = _x select 0;
						_b = _x select 1;
						for "_i" from 1 to _b do {
							_chems pushBack (_chemlights select _a);
						};
					};
				} forEach _x;
				_return pushBack _chems;
			} else {
				_return pushBack -1;
			};
		};
		case 17: { // SMOKES
			if (_x isEqualType []) then {
				_smoks = [];
				{	if (_x isEqualType []) then {
						_a = _x select 0;
						_b = _x select 1;
						for "_i" from 1 to _b do {
							_smoks pushBack (_smokes select _a);
						};
					};
				} forEach _x;
				_return pushBack _smoks;
			} else {
				_return pushBack -1;
			};
		};
		case 18: { // GRENADES
			if (_x isEqualType []) then {
				_gres = [];
				{	if (_x isEqualType []) then {
						_a = _x select 0;
						_b = _x select 1;
						for "_i" from 1 to _b do {
							_gres pushBack (_grenades select _a);
						};
					};
				} forEach _x;
				_return pushBack _gres;
			} else {
				_return pushBack -1;
			};
		};
		case 19: { // EXPLOSIVES
			if (_x isEqualType []) then {
				_exps = [];
				{	if (_x isEqualType []) then {
						_a = _x select 0;
						_b = _x select 1;
						for "_i" from 1 to _b do {
							_exps pushBack (_explosives select _a);
						};
					};
				} forEach _x;
				_return pushBack _exps;
			} else {
				_return pushBack -1;
			};
		};
		case 20: { // MINES
			if (_x isEqualType []) then {
				_mins = [];
				{	if (_x isEqualType []) then {
						_a = _x select 0;
						_b = _x select 1;
						for "_i" from 1 to _b do {
							_mins pushBack (_mines select _a);
						};
					};
				} forEach _x;
				_return pushBack _mins;
			} else {
				_return pushBack -1;
			};
		};
		case 21: {if (_x == -1) then {_return pushBack -1;} else {_return pushBack (_compasses select _x)}}; // COMPASS
		case 22: {if (_x == -1) then {_return pushBack -1;} else {_return pushBack (_maps select _x)}}; // MAP
		case 23: {if (_x == -1) then {_return pushBack -1;} else {_return pushBack (_watches select _x)}}; // WATCH
		case 24: { // RADIO
			if (_x isEqualType []) then {
				_rads = [];
				{	if (_x isEqualType []) then {
						_a = _x select 0;
						_b = _x select 1;
						for "_i" from 1 to _b do {
							_rads pushBack (_radios select _a);
						};
					};
				} forEach _x;
				_return pushBack _rads;
			} else {
				_return pushBack -1;
			};
		};
		case 25: { // TOOLS
			if (_x isEqualType []) then {
				_toos = [];
				{	if (_x isEqualType []) then {
						_a = _x select 0;
						_b = _x select 1;
						for "_i" from 1 to _b do {
							_toos pushBack (_tools select _a);
						};
					};
				} forEach _x;
				_return pushBack _toos;
			} else {
				_return pushBack -1;
			};
		};
	};
} forEach _role;
_return;
