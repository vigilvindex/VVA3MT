/* Name: fn_createVehicle.sqf
 * Description: Creates a vehicle.
 * Authors: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/4.0/
 * Created: 2016/08/19 Updated: 2016/08/19 Version: 0.0.1
 * Dependencies: gm_core_vehicles_fnc_vehicleMarkingsInit
 * Arguments:  index name      (default) TYPE    {Required}  min,max "values"
 *             d     debug     (false)   BOOLEAN {N}         *       "Disabled","Enabled"
 *             p     position  ([x,y,z]) ARRAY   {Y}         *       ""
 *             t     type      (0)       SCALAR  {N}         0,3     "Air","Land","Sea","Sub"
 *             m     markers   ([])      ARRAY   {N}         *       ""
 *             r     radius    (0)       SCALAR  {N}         *       "Metres"
 *             s     special   (0)       SCALAR  {N}         0,3     "NONE","FLY","FORM","CAN_COLLIDE"
 *             a     azimuth   (0)       SCALAR  {N}         0,359   "Degrees"
 * Returns: OBJECT on success. FALSE on failure.
 * Usage: [["d",_debug],["p",_position],["t",_type],["m",_markers],["r",_radius],["s",_special],["a",_azimuth]] call VVM_fnc_createVehicle;
 * Example: [["p",[5,5,1]]] call VVM_fnc_createVehicle; [[5,5,1]]] call VVM_fnc_createVehicle;
 */
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false};
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false};
private ["_debug","_type","_nation","_position","_specials","_special","_markers","_placement","_azimuth","_gm_vehicle_attributes","_return"];
_debug = true;
_position = _this select 0;
_specials = ["NONE","CAN_COLLIDE","FLY"];
_special = _specials select 0;
_markers = [];
_placement = 0;
_azimuth = 0;
_attributes = [];
_clearCargo = 1;
_type = _this select 1;// _type = "B_T_UAV_03_dynamicLoadout_F";
_nation = ""; // "gm_insignia_ur_star_01";
_pylons = [""];
if (_special == "NONE") then {
  _return = _type createVehicle _position; // FAST
} else {
  _return = createVehicle [_type,_position,_markers,_placement,_special]; // SLOW
};
_return setVariable ["BIS_enableRandomization",false];
_return setDir _azimuth;
_return setPos getPos _return;
_return setVehicleLock "UNLOCKED";
if (_clearCargo > 0) then {
  clearWeaponCargoGlobal _return;
  clearMagazineCargoGlobal _return;
  clearItemCargoGlobal _return;
};
if (_nation != "") then {
  _attributes = [
    [-1,-1], // LicensePlates: Plate, Numbers
    [-1,"",-1,-1,"_"], // tacticalSign: PreIcon, Icon, PostIcon
    [-1,-1], // tacticalNumber: Number, Numberfont
    // Insignias
    [-1,-1,-1,-1,-1,-1], // MissionSmall, MissionLarge, Recon, Unit, Company, Formation
    [-1], // HazardSign
    [_nation,_nation,""] // nation, nationPosition, flag
  ];
  _return setVariable ["gm_vehicle_attributes",_attributes];
  [_return] spawn gm_core_vehicles_fnc_vehicleMarkingsInit;
  //_return setFlagTexture "\gm\gm_core\data\flags\gm_flag_gc_co.paa";
  // [_return,["1","gm_din_norm_gry","gm_tacticalSign_nato_mechanizedInfantry","100","gm_din_norm_gry"]] call gm_core_vehicles_fnc_setTacticalSign; // configfile >> "gm_tacticalSigns"
};
if (count _pylons > 0) then {
  _allPylons = "true" configClasses (configFile >> "CfgVehicles" >> typeOf _return >> "Components" >> "TransportPylonsComponent" >> "pylons") apply {configName _x}; diag_log str _allPylons;
  {_mags = _return getCompatiblePylonMagazines _x; diag_log str _mags;} forEach _allPylons;
  _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _return >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
  _nonPylonWeapons = [];
  { _nonPylonWeapons append getArray (_x >> "weapons") } forEach ([_return, configNull] call BIS_fnc_getTurrets);
  { _return removeWeaponGlobal _x } forEach ((weapons _return) - _nonPylonWeapons);
  { _return setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
};
// _textures = (configFile >> "CfgVehicles" >> typeOf _return >> "TextureSources") call BIS_fnc_GetCfgData; diag_log str _textures;
// [_veh,["Hex",1],["showCamonetHull",1,"showCamonetTurret",1,"showLog",1]] call BIS_fnc_initVehicle;
// [_return,nil,["AddTread_Short",1,"AddTread",0]] call BIS_fnc_initVehicle;
// [_return,["gm_gc_oli",1],true] call BIS_fnc_initVehicle;
//[_veh,["gm_gc_oli",1],["turretBox_01_unhide",1,"turretBox_02_unhide",1,"MainTurret_SearchLight_cover_unhide",1,"MainTurret_Optic_cover_unhide",1,"CommanderTurret_SearchLight_cover_unhide",1,"buoy_01_unhide",1,"camoNet_01_unhide",1,"camoNet_02_unhide",1,"fender_01_unhide",1,"fender_02_unhide",1,"woodenBeam_01_unhide",1,"snorkel_01_unhide",0,"snorkel_02_unhide",1,"rearbar_01_unhide",1,"barrelHolder_01_unhide",1,"barrel_01_unhide",1,"barrel_02_unhide",1,"storageBox_01_unhide",1,"storageBox_02_unhide",1]] call BIS_fnc_initVehicle;
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil} forEach [_debug,_type,_nation,_position,_specials,_special,_markers,_placement,_azimuth,_attributes];
_return;
