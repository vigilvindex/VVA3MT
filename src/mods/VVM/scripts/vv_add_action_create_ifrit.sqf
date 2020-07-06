/* Name: vv_add_action_create_ifrit.sqf
 * Description: Creates a ifrit.
 * Authors: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2013/09/01
 * Usage: _object addAction["Spawn Ifrit","modules\vv_mod\scripts\vv_add_action_create_ifrit.sqf"];
 */
private["_ifrit"];
_ifrit = "O_MRAP_02_F" createVehicle (getPos player);
