/* Name: vv_add_action_attach_explosives.sqf
 * Description: Adds an action to attach explosives.
 * Authors: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/4.0/
 * Last Updated: 2016/07/25
 * Arguments:
 *  _this select 0; - DEBUG boolean (true/false)
 *  _this select 1; - OBJECT string (OBJECT_NAME)
 * Returns: addAction ID
 * Usage: [DEBUG,OBJECT] call vv_fnc_create_flag_pole;
 * Example: [FALSE,OBJECT_NAME] call vv_fnc_create_flag_pole;
 * Dependencies:
 *    - N/A
 * TODO:
 *    - Add option to specify a countdown to detonation.
 *    - Add option for manual remote detonation.
 */
vv_obj_active = true;
publicVariable"vv_obj_active";
[{vv_objective removeAction 0;},"BIS_fnc_spawn",WEST,FALSE] spawn BIS_fnc_MP;
[{vv_objective addAction["Defuse Explosives","modules\vv_mod\scripts\vv_add_action_defuse_explosives.sqf"];},"BIS_fnc_spawn",EAST,FALSE] spawn BIS_fnc_MP;
vv_obj_time = 180;
publicVariable"vv_obj_time";
while {vv_obj_active} do {
    [{hintsilent format ["Detonation in %1", [((vv_obj_time)/60)+.01,"HH:MM"] call bis_fnc_timetostring];},"BIS_fnc_spawn",TRUE,FALSE] spawn BIS_fnc_MP;
    vv_obj_time = vv_obj_time -1;
    publicVariable"vv_obj_time";
    sleep 1;
    if (vv_obj_time < 1) exitWith{
      "M_Mo_82mm_AT" createvehicle getpos vv_objective;
      sleep 1;
      vv_obj_active = false;
      publicVariable"vv_obj_active";
      vv_obj_won = true;
      publicVariable"vv_obj_won";
      [{hintsilent "Objective destroyed!";},"BIS_fnc_spawn",TRUE,FALSE] spawn BIS_fnc_MP;
    };
};
