private ["_name","_icon","_position"];
_id = "VVM_AI_WP_W_A1_%1";
_icon = "a3\ui_f\data\map\groupicons\badge_simple.paa";
_text = "%1-%2";
_position = [0,0,0];
[	_id,
	"onEachFrame",
	{drawIcon3D["a3\ui_f\data\map\groupicons\badge_simple.paa",[1,1,1,0.5],(_this select 0),1,1,0,format["%1-%2","WP",str (_this select 1)]]},
	[_wp,_forEachIndex]
] call BIS_fnc_addStackedEventHandler;