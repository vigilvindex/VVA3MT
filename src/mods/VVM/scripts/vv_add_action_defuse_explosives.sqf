vv_obj_active = false;
publicVariable"vv_obj_active";
[{vv_objective removeAction 0;},"BIS_fnc_spawn",EAST,FALSE] spawn BIS_fnc_MP;
[{vv_objective addAction['Attach Explosives',"modules\vv_mod\scripts\vv_add_action_attach_explosives.sqf"];},"BIS_fnc_spawn",WEST,FALSE] spawn BIS_fnc_MP;
[{hintsilent "Explosives defused!";},"BIS_fnc_spawn",TRUE,FALSE] spawn BIS_fnc_MP;
