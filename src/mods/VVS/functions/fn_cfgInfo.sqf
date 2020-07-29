/*
	File: fn_cfgInfo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in returning information about a vehicle from Config >> "CfgVehicles"
	
	Return:
	0: classname
	1: scope
	2: picture
	3: displayname
	4: vehicleclass
	5: side
	6: faction
	7: Base / Superclass
*/
private["_class","_scope","_picture","_displayName","_vehicleClass","_side","_faction","_superClass"];
_class = [_this,0,"",[""]] call BIS_fnc_param;
if(_class == "") exitWith {[]}; //Bad class passed.
if(!isClass (configFile >> "CfgVehicles" >> _class)) exitWith {[]}; //Class doesn't exist in CfgVehicles

//Predefine some stuff.
_scope = -1;
_picture = "";
_displayName = "";
_vehicleClass = "";
_side = -1;
_faction = "";

//Fetch
_scope = getNumber(configFile >> "CfgVehicles" >> _class >> "scope");
_picture = getText(configFile >> "CfgVehicles" >> _class >> "picture");
_displayName = getText(configFile >> "CfgVehicles" >> _class >> "displayName");
_vehicleClass = getText(configFile >> "CfgVehicles" >> _class >> "vehicleClass");
_side = getNumber(configFile >> "CfgVehicles" >> _class >> "side");
_faction = getText(configFile >> "CfgVehicles" >> _class >> "faction");
_superClass = configName(inheritsFrom (configFile >> "CfgVehicles" >> _class));

if ((_picture == "pictureThing" && _vehicleClass == "Support") || ((_picture == "picturestaticobject" || _picture ==  "picturething") && _vehicleClass == "rhs_vehclass_radar")) then 
{   //_picture = "support_no_images.paa";
	_picture = "\A3\Air_F_Heli\Heli_Transport_04\Data\UI\Pod_Heli_Transport_04_bench_CA.paa";
    // diag_log format["_picture: %1", _picture];
};

//Return
[_class,_scope,_picture,_displayName,_vehicleClass,_side,_faction,_superClass];