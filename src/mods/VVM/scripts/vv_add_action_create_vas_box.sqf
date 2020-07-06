/* Name: vv_add_action_create_vas_box.sqf
 * Description: Creates a VAS ammo box.
 * Authors: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2013/09/01
 * Usage: _object addAction["Spawn Ammo Crate","modules\vv_mod\scripts\vv_add_action_create_vas_box.sqf"];
 */
private["_boxname"];
_boxname = format["vas_box_%1",floor time];
call compile format["%1 = 'B_supplyCrate_F' createVehicle (getPos player);",_boxname];
call compile format["clearWeaponCargo %1;",_boxname];
call compile format["clearMagazineCargo %1;",_boxname];
call compile format["clearItemCargo %1;",_boxname];
call compile format["clearBackpackCargo %1;",_boxname];
call compile format["%1 allowDamage false;",_boxname];
call compile format["publicVariable '%1';",_boxname];
call compile format["[{%1 addAction['Virtual Ammobox','modules\VAS\open.sqf'];},'BIS_fnc_spawn',TRUE,TRUE] spawn BIS_fnc_MP;",_boxname];
