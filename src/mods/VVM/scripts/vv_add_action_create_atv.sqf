/* Name: vv_add_action_create_atv.sqf
 * Description: Creates a flag pole.
 * Authors: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2013/09/01
 * Usage: _object addAction["Spawn ATV","modules\vv_mod\scripts\vv_add_action_create_atv.sqf"];
 */
private["_atv"];
_atv = "B_Quadbike_01_F" createVehicle (getPos player);
