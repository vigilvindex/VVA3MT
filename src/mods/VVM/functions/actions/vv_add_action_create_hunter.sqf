/* Name: vv_add_action_create_hunter.sqf
 * Description: Creates a hunter.
 * Authors: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2013/09/01
 * Usage: _object addAction["Spawn Hunter","modules\vv_mod\scripts\vv_add_action_create_hunter.sqf"];
 */
private["_hunter"];
_hunter = "B_MRAP_01_F" createVehicle (getPos player);
