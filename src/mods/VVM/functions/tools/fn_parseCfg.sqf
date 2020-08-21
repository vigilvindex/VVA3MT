private ["_cfgs","_cfgVehiclesClasses","_cfgWeaponsClasses","_cfgGlassesClasses","_properties","_cfgString","_cfg","_class","_className","_scope","_value","_base","_components","_items","_magazines","_muzzles","_muzzleMags"];
_faces = [];
_voices = [];
_insignia = [];
_mags = [];
_flares =[];
_facewear = [];
_backpacks = [];
_uniforms = [];
_headgear = [];
_vests = [];
_grenades = [];
_mines = [];
_explosives = [];
_smokes = [];
_nvgs = [];
_tools = [];
_bipods = [];
_muzzles = [];
_optics = [];
_pointers = [];
_binos = [];
_maps = [];
_terminals = [];
_compasses = [];
_meds = [];
_radios = [];
_watches = [];
_cfgs = [
	"CfgFaces",			// Faces
	"CfgVoice",			// Voices
	"CfgUnitInsignia",	// Insignia
	"CfgGlasses",		// Facewear
	"CfgWeapons",		// Weapons, Accessories, Headgear, Uniforms, Vests, Items
	"CfgVehicles",		// Backpacks, Vehicles
	"CfgMagazines"		// Grenades, Mines, Explosives, Magazines
];
// CfgWeapons ITEMS
_itemCategories = ["Weapon","Item","Equipment","Magazine","Mine"];
_weaponTypes = ["AssaultRifle","BombLauncher","Cannon","GrenadeLauncher","Handgun","Launcher","MachineGun","Magazine","MissileLauncher","Mortar","RocketLauncher","Shotgun","Throw","Rifle","SubmachineGun","SniperRifle"];
_itemTypes = ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod","Binocular","Compass","FirstAidKit","GPS","LaserDesignator","Map","Medikit","MineDetector","NVGoggles","Radio","Toolkit","UAVTerminal","VehicleWeapon","Unknown","UnknownEquipment","UnknownWeapon","Watch"];
_equipTypes = ["Glasses","Headgear","Vest","Uniform","Backpack"];
_magTypes = ["Artillery","Bullet","CounterMeasures","Flare","Grenade","Laser","Missile","Rocket","Shell","ShotgunShell","SmokeShell","UnknownMagazine"];
_mineTypes = ["Mine","MineBounding","MineDirectional"];
// CfgVehicles OBJECTS
_objectCategories = ["Soldier","Vehicle","VehicleAutonomous","Logic","Object"];
_soldierTypes = ["AT","Civilian","Diver","Infantry","Medic","MG","Officer","Pilot","Sniper","SpecialForces","UAVPilot"];
_vehicleTypes = ["Car","Helicopter","Motorcycle","Plane","Ship","StaticWeapon","Submarine","TrackedAPC","Tank","WheeledAPC"];
_logicTypes = ["Logic","Module"];
_objectTypes = ["Ammobox","Animal","Backpack","Camera","Church","Effect","Fire","Flag","Helipad","House","Marker","Mine","Parachute","Seagull","Sound","Target","Thing","Trigger","UnknownObject","VASI","Wreck"];
// TYPES
_itemTypesWeWant = ["Bullet","Missile","Rocket","ShotgunShell","Mine","MineBounding","MineDirectional","Flare","Grenade","SmokeShell","Glasses","Headgear","Vest","Uniform","Backpack","AssaultRifle","BombLauncher","Cannon","GrenadeLauncher","Handgun","Launcher","MachineGun","Magazine","MissileLauncher","Mortar","RocketLauncher","Shotgun","Throw","Rifle","SubmachineGun","SniperRifle","AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod","Binocular","Compass","FirstAidKit","GPS","LaserDesignator","Map","Medikit","MineDetector","NVGoggles","Radio","Toolkit","UAVTerminal","VehicleWeapon","Unknown","UnknownEquipment","UnknownWeapon","Watch"];
_objectTypesWeWant = ["Backpack","Mine","Parachute","Car","Helicopter","Motorcycle","Plane","Ship","StaticWeapon","Submarine","TrackedAPC","Tank","WheeledAPC"];
{	_cfgString = _x;
	diag_log format["#### START %1 ####",_x];
	if (_cfgString == "CfgFaces") then {_cfg = configFile >> _x >> "Man_A3"} else {_cfg = configFile >> _x};
	_configs = [_cfg] call BIS_fnc_returnChildren;
	{	_class = configname _x;
		_name = getText (_x >> "displayName");
		_scope = getnumber (_x >> "scope");
		_disabled = getNumber (_x >> "disabled");
		switch (_cfgString) do {
			case "CfgFaces": {if ((_name != "") AND (_disabled != 1)) then {_faces pushBackUnique [_class,_name]}};
			case "CfgVoice": {if ((_scope > 1) AND (_name != "")) then {_voices pushBackUnique [_class,_name]}};
			case "CfgUnitInsignia": {if (_name != "") then {_insignia pushBackUnique [_class,_name]}};
			case "CfgGlasses": {if ((_scope > 1) AND (_name != "")) then {_facewear pushBackUnique [_class,_name]}};
			case "CfgMagazines": {
				if ((_scope > 1) AND (_name != "")) then {
					_type = [_class] call BIS_fnc_itemType;
					if ((_type select 1) in _itemTypesWeWant) then {
						if ((_type select 1) in ["Mine","MineBounding","MineDirectional"]) then {_mines pushBackUnique [_class,_name]};
						if ((_type select 1) in ["Flare"]) then {_flares pushBackUnique [_class,_name]};
						if ((_type select 1) in ["Grenade"]) then {_grenades pushBackUnique [_class,_name]};
						if ((_type select 1) in ["SmokeShell"]) then {_smokes pushBackUnique [_class,_name]};
					};
				};
			};
			case "CfgVehicles": {
				if ((_scope > 1) AND (_name != "")) then {
					_type = [_class] call BIS_fnc_itemType;
					_objType = [_class] call BIS_fnc_objectType;
					_itemType = _type select 1;
					_itemCategory = _type select 0;
					_objectType = _objType select 1;
					_objectCategory = _objType select 0;
					if ((_itemType in _itemTypesWeWant) OR (_objectType in _objectTypesWeWant)) then {
						if ((_itemType == "Backpack") OR (_objectType == "Backpack")) then {_backpacks pushBackUnique [_class,_name]};
						if ((_itemType == "Mine") OR (_objectType == "Mine")) then {_mines pushBackUnique [_class,_name]};
					};
				};
			};
			case "CfgWeapons": {
				if ((_scope > 1) AND (_name != "")) then {
					_type = [_class] call BIS_fnc_itemType;
					if ((_type select 1) in _itemTypesWeWant) then {
						if ((_type select 1) in ["Mine","MineBounding","MineDirectional"]) then {_mines pushBackUnique [_class,_name]};
						if ((_type select 1) in ["Flare"]) then {_flares pushBackUnique [_class,_name]};
						if ((_type select 1) in ["Grenade"]) then {_grenades pushBackUnique [_class,_name]};
						if ((_type select 1) in ["SmokeShell"]) then {_smokes pushBackUnique [_class,_name]};
						if ((_type select 1) in ["Glasses"]) then {_facewear pushBackUnique [_class,_name]};
						if ((_type select 1) in ["Headgear"]) then {_headgear pushBackUnique [_class,_name]};
						if ((_type select 1) in ["Vest"]) then {_vests pushBackUnique [_class,_name]};
						if ((_type select 1) in ["Uniform"]) then {_uniforms pushBackUnique [_class,_name]};
						if ((_type select 1) in ["AccessoryMuzzle"]) then {_muzzles pushBackUnique [_class,_name]};
						if ((_type select 1) in ["AccessoryPointer"]) then {_pointers pushBackUnique [_class,_name]};
						if ((_type select 1) in ["AccessorySights"]) then {_optics pushBackUnique [_class,_name]};
						if ((_type select 1) in ["AccessoryBipod"]) then {_bipods pushBackUnique [_class,_name]};
						if ((_type select 1) in ["Binocular","LaserDesignator"]) then {_binos pushBackUnique [_class,_name]};
						if ((_type select 1) in ["Compass"]) then {_compasses pushBackUnique [_class,_name]};
						if ((_type select 1) in ["FirstAidKit","Medikit"]) then {_meds pushBackUnique [_class,_name]};
						if ((_type select 1) in ["GPS","UAVTerminal"]) then {_terminals pushBackUnique [_class,_name]};
						if ((_type select 1) in ["Map"]) then {_maps pushBackUnique [_class,_name]};
						if ((_type select 1) in ["MineDetector","Toolkit"]) then {_tools pushBackUnique [_class,_name]};
						if ((_type select 1) in ["NVGoggles"]) then {_nvgs pushBackUnique [_class,_name]};
						if ((_type select 1) in ["Radio"]) then {_radios pushBackUnique [_class,_name]};
						if ((_type select 1) in ["Watch"]) then {_watches pushBackUnique [_class,_name]};
					};
				};
			};
		};
	} forEach _configs;
	diag_log format["#### END %1 ####",_x];
} forEach _cfgs;
//if (count _faces > 0) then {_faces sort true; {diag_log format ["# FACES: %1 #",_x]} forEach _faces};
//if (count _voices > 0) then {_voices sort true; {diag_log format ["# VOICES: %1 #",_x]} forEach _voices};
//if (count _insignia > 0) then {_insignia sort true; {diag_log format ["# INSIGNIAS: %1 #",_x]} forEach _insignia};
//if (count _mags > 0) then {_mags sort true; {diag_log format ["# MAGS: %1 #",_x]} forEach _mags};
//if (count _flares > 0) then {_flares sort true; {diag_log format ["# FLARES: %1 #",_x]} forEach _flares};
//if (count _facewear > 0) then {_facewear sort true; {diag_log format ["# FACEWEAR: %1 #",_x]} forEach _facewear};
//if (count _backpacks > 0) then {_backpacks sort true; {diag_log format ["# BACKPACKS: %1 #",_x]} forEach _backpacks};
//if (count _uniforms > 0) then {_uniforms sort true; {diag_log format ["# UNIFORMS: %1 #",_x]} forEach _uniforms};
//if (count _headgear > 0) then {_headgear sort true; {diag_log format ["# HEADGEAR: %1 #",_x]} forEach _headgear};
//if (count _vests > 0) then {_vests sort true; {diag_log format ["# VESTS: %1 #",_x]} forEach _vests};
//if (count _grenades > 0) then {_grenades sort true; {diag_log format ["# GRENADES: %1 #",_x]} forEach _grenades};/
//if (count _mines > 0) then {_mines sort true; {diag_log format ["# MINES: %1 #",_x]} forEach _mines};
//if (count _explosives > 0) then {_explosives sort true; {diag_log format ["# EXPLOSIVES: %1 #",_x]} forEach _explosives};
//if (count _smokes > 0) then {_smokes sort true; {diag_log format ["# SMOKES: %1 #",_x]} forEach _smokes};
//if (count _nvgs > 0) then {_nvgs sort true; {diag_log format ["# NVGS: %1 #",_x]} forEach _nvgs};
//if (count _tools > 0) then {_tools sort true; {diag_log format ["# TOOLS: %1 #",_x]} forEach _tools};
//if (count _bipods > 0) then {_bipods sort true; {diag_log format ["# BIPODS: %1 #",_x]} forEach _bipods};
//if (count _muzzles > 0) then {_muzzles sort true; {diag_log format ["# MUZZLES: %1 #",_x]} forEach _muzzles};
//if (count _optics > 0) then {_optics sort true; {diag_log format ["# OPTICS: %1 #",_x]} forEach _optics};
//if (count _pointers > 0) then {_pointers sort true; {diag_log format ["# POINTERS: %1 #",_x]} forEach _pointers};
//if (count _binos > 0) then {_binos sort true; {diag_log format ["# BINOS: %1 #",_x]} forEach _binos};
//if (count _maps > 0) then {_maps sort true; {diag_log format ["# MAPS: %1 #",_x]} forEach _maps};
//if (count _terminals > 0) then {_terminals sort true; {diag_log format ["# TERMINALS: %1 #",_x]} forEach _terminals};
//if (count _compasses > 0) then {_compasses sort true; {diag_log format ["# COMPASSES: %1 #",_x]} forEach _compasses};
//if (count _meds > 0) then {_meds sort true; {diag_log format ["# MEDS: %1 #",_x]} forEach _meds};
//if (count _radios > 0) then {_radios sort true; {diag_log format ["# RADIOS: %1 #",_x]} forEach _radios};
//if (count _watches > 0) then {_watches sort true; {diag_log format ["# WATCHES: %1 #",_x]} forEach _watches};
/*
_properties = ["displayName"]; // "dlc","side","faction","hiddenSelections","hiddenSelectionsTextures","attachments""components","gm_InsigniasSelectionsNation","textures","availableForSupportTypes","textureList","vehicleClass"
_items = [gettext (_x >> "uniformClass")] + getarray (_x >> "linkedItems") + getarray (_x >> "items");
_items = _items - [""];
{	_weapons = _weapons + getarray (_x >> "weapons");
	_magazines = _magazines + getarray (_x >> "magazines");
} foreach (_class call bis_fnc_getTurrets);
{	_type = _x call bis_fnc_itemType;
	_page = (_type select 0) call _fnc_getItemPage;
	_textWeapons = _textWeapons + _br + format [":[[%1 %3#%2|%2]]",_product,_x,_page];
} foreach _weapons;
while {count _magazines > 0} do {
	_mag = _magazines select 0;
	_textMagazines = _textMagazines + _br + format [":%1x&nbsp;[[%3 CfgMagazines#%2|%2]]",{_x == _mag} count _magazines,_mag,_product];
	_magazines = _magazines - [_mag];
};
while {count _items > 0} do {
	_item = _items select 0;
	_type = _item call bis_fnc_itemType;
	_page = (_type select 0) call _fnc_getItemPage;
	_textItems = _textItems + _br + format [":[[%4 %3#%2|%2]]",{_x == _item} count _items,_item,_page,_product];
	_items = _items - [_item];
};
_customs = [objNull,_className] call BIS_fnc_getVehicleCustomization;
_base = [_className] call BIS_fnc_baseWeapon;
if !(isNil "_base") then {diag_log format["Base = '%1';",_base]};
_components = _className call BIS_fnc_weaponComponents;
if !(isNil "_components") then {diag_log format["Components = '%1';",_components]};
_items = _className call BIS_fnc_compatibleItems;
if !(isNil "_items") then {diag_log format["Items = '%1';",_items]};
_magazines = (configfile >> _cfgString >> _className >> "magazines") call BIS_fnc_getCfgData;
if !(isNil "_magazines") then { diag_log format["Magazines = %1 #",_magazines]};
_muzzles = (configfile >> _cfgString >> _className >> "muzzles") call BIS_fnc_getCfgData;
if !(isNil "_muzzles") then {
	{	_muzzleMags = (configfile >> _cfgString >> _className >> _x >> "magazines") call BIS_fnc_getCfgData;
		if !(isNil "_muzzleMags") then { diag_log format["Muzzle Magazines = %1 #",_muzzleMags]};
	} forEach _muzzles;
};
*/
