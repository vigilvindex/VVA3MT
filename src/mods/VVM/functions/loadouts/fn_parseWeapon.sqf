private ["_keys","_weaponarray","_weapon","_variants","_magazines","_tracers","_grenades","_flares","_smokes","_accessories","_bipods","_muzzles","_optics","_return","_variant","_mags","_tracs","_grens","_flas","_smos","_accs","_bips","_muzs","_opts"];
//diag_log format ["# %1 # fn_parseWeapon.sqf _this = %2 #",time,_this];
_keys = _this select 0;
_weaponarray = _this select 1;
_weapon = (_keys select (_weaponarray select 0)) call VVM_fnc_getWeapon;
_variants = _weapon select 0;
_magazines = _weapon select 1;
_tracers = _weapon select 2;
_grenades = _weapon select 3;
_flares = _weapon select 4;
_smokes = _weapon select 5;
_accessories = _weapon select 6;
_bipods = _weapon select 7;
_muzzles = _weapon select 8;
_optics = _weapon select 9;
_return = [];
if (_weaponarray isEqualType []) then {
	{	switch (_forEachIndex) do {
			case 0: {};
			case 1: {if (_x == -1) then {_return set [count _return,-1]} else {_variant = _variants select _x; _return set [count _return,_variant]}};
			case 2: {
				if (_x isEqualType []) then {
					_mags = [];
					{if (_x isEqualType []) then {for "_i" from 1 to (_x select 1) do {_mags set [count _mags, _magazines select (_x select 0)]}}} forEach _x;
					_return set [count _return,_mags];
				} else {
					_return set [count _return,_x];
				};
			};
			case 3: {
				if (_x isEqualType []) then {
					_tracs = [];
					{if (_x isEqualType []) then {for "_i" from 1 to (_x select 1) do {_tracs set [count _tracs, _tracers select (_x select 0)]}}} forEach _x;
					_return set [count _return,_tracs];
				} else {
					_return set [count _return,_x];
				};
			};
			case 4: {
				if (_x isEqualType []) then {
					_grens = [];
					{if (_x isEqualType []) then {for "_i" from 1 to (_x select 1) do {_grens set [count _grens, _grenades select (_x select 0)]}}} forEach _x;
					_return set [count _return,_grens];
				} else {
					_return set [count _return,_x];
				};
			};
			case 5: {
				if (_x isEqualType []) then {
					_flas = [];
					{if (_x isEqualType []) then {for "_i" from 1 to (_x select 1) do {_flas set [count _flas, _flares select (_x select 0)]}}} forEach _x;
					_return set [count _return,_flas];
				} else {
					_return set [count _return,_x];
				};
			};
			case 6: {
				if (_x isEqualType []) then {
					_smos = [];
					{if (_x isEqualType []) then {for "_i" from 1 to (_x select 1) do {_smos set [count _smos, _smokes select (_x select 0)]}}} forEach _x;
					_return set [count _return,_smos];
				} else {
					_return set [count _return,_x];
				};
			};
			case 7: {
				if (_x isEqualType []) then {
					_accs = [];
					{if (_x isEqualType []) then {for "_i" from 1 to (_x select 1) do {_accs set [count _accs, _accessories select (_x select 0)]}}} forEach _x;
					_return set [count _return,_accs];
				} else {
					_return set [count _return,_x];
				};
			};
			case 8: {
				if (_x isEqualType []) then {
					_bips = [];
					{if (_x isEqualType []) then {for "_i" from 1 to (_x select 1) do {_bips set [count _bips, _bipods select (_x select 0)]}}} forEach _x;
					_return set [count _return,_bips];
				} else {
					_return set [count _return,_x];
				};
			};
			case 9: {
				if (_x isEqualType []) then {
					_muzs = [];
					{if (_x isEqualType []) then {for "_i" from 1 to (_x select 1) do {_muzs set [count _muzs, _muzzles select (_x select 0)]}}} forEach _x;
					_return set [count _return,_muzs];
				} else {
					_return set [count _return,_x];
				};
			};
			case 10: {
				if (_x isEqualType []) then {
					_opts = [];
					{if (_x isEqualType []) then {for "_i" from 1 to (_x select 1) do {_opts set [count _opts, _optics select (_x select 0)]}}} forEach _x;
					_return set [count _return,_opts];
				} else {
					_return set [count _return,_x];
				};
			};
		};
	} forEach _weaponarray;
};
_return;
