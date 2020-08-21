/* Name: fn_createUnit.sqf
 * Description creates a unit.
 * Usage: [_group,_side,_faction,_role,_position,_rank,_leader] call VVM_fnc_createUnit;
 * Example: [_group,0,0,0,[0,0,0],0,0] call VVM_fnc_createUnit;
 */
_group = _this select 0;
_side = _this select 1;
_faction = _this select 2;
_role = _this select 3;
_position = _this select 4;
_rank = _this select 5;
_leader = _this select 6;
_sides = [WEST,EAST,INDEPENDENT,CIVILIAN];
_sideObj = _sides select _side;
_sideUnits = [];
{if ((side _x) isEqualTo _sideObj) then {_sideUnits pushBackUnique _x}} forEach allUnits;
_unitIndex = count _sideUnits;
_unitVarName = switch (_side) do {
	case  0: {format["VVM_AI_W_U_%1",_unitIndex]};
	case  1: {format["VVM_AI_E_U_%1",_unitIndex]};
	case  2: {format["VVM_AI_I_U_%1",_unitIndex]};
	case  3: {format["VVM_AI_C_U_%1",_unitIndex]};
};
_types = [
	"B_Soldier_unarmed_F",	// 0 WEST
	"O_Soldier_unarmed_F",	// 1 EAST
	"I_Soldier_unarmed_F",	// 2 INDEPENDENT
	"C_journalist_F"		// 3 CIVILIAN
];
_type = _types select _side;
_ranks = [
	"PRIVATE",		// 0
	"CORPORAL",		// 1
	"SERGEANT",		// 2
	"LIEUTENANT",	// 3
	"CAPTAIN",		// 4
	"MAJOR",		// 5
	"COLONEL"		// 6
];
_rank = _ranks select _rank;
_factions = ["NATO","CSAT","AAF"];
_faction = _factions select _faction;
_special = 0;
_specials = ["NONE","FORM","CAN_COLLIDE","CARGO"];
_special = _specials select _special;
_markers = [];
_placement = 0;
_azimuth = 0;
/*
_player = false;
_playable = false;
_role_description = "";
_skill = 0;
_health = 100;
_armor = 100;
_ammo = 100;
_stance = 0;
_name = "";
_face = "";
_callsign = "";
_voice = "";
_voicepitch = 1;
_insignia = "";
_damage = true;
_stamina = true;
_sim = true;
_dynsim = false;
_revive = false;
_respawn = false;
_init = "";
_dataLinkSend = false;
_dataLinkReceive = false;
_dataLinkPosition = false;
_captive = false;
_traits = 0;
_syncedWaypoints = [];
_syncedObjects = [];
_waypoints = [];
_tasks = [];
_triggers = [];
*/
_return = _group createUnit [_type,_position,_markers,_placement,_special];
_return setUnitRank _rank;
if (_leader > 0) then {_group selectLeader _return};
// [_return,_face,_speaker,_pitch,_callsign] call BIS_fnc_setIdentity;
_result = [_return,_faction,_role] call VVM_fnc_setLoadout;
call compile format["%1 = _return;",_unitVarName];
diag_log format ["AI UNIT CREATED! HANDLE: %1, NAME: %2",_unitVarName,name _return];
_return;
