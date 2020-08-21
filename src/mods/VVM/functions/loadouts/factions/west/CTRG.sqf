/* Name: CTRG.sqf
 * Description: Faction Definition for CTRG.
 * Authors: vigil.vindex@gmail.com
 * License: https://creativecommons.org/licenses/by-sa/4.0/
 * Created: 2020/07/22 Updated: 2020/07/22 Version: 0.0.1
 * Dependencies: VVM_fnc_parseRole
 * Returns:
 *   ROLE ARRAY [ROLE,TRAITS,VOICE,FACE,UNIFORM,HEADGEAR,BACKPACK,VEST,NVG,FACEWEAR,BINOCULAR,TERMINAL,[PRIMARY],[SECONDARY],[LAUNCHER],[MEDICAL],[CHEMLIGHTS],[SMOKES],[GRENADES],[EXPLOSIVES],[MINES],COMPASS,MAP,WATCH,[RADIO],[TOOLS]]
 *   WEAPON ARRAYS [KEY,VARIANT,[MAGAZINES],[TRACERS],[SMOKES],[FLARES],[GRENADES],[ACCESSORIES],[BIPODS],[MUZZLES],[OPTICS]]
 *   MAGAZINE & ITEM ARRAYS [[TYPE,COUNT]]
 * Arguments: index name     (default) TYPE    {Required} min,max    "values"
 *            d     debug    (false)   BOOLEAN {N}        false,true "Disabled","Enabled"
 *            r     role 	 (0)       SCALAR  {N}        0,36       "Role Key"
 * Usage: _co = [] call compile preprocessFileLineNumbers "CTRG.sqf";
 * Developer Notes:
 * 	Faction role definition array uses "-1" to indicate to the set loadout function skip that element.
 * 	Voice and face are selected randomly, and only applied to AI via a switch in the set loadout function.
 * TODO: Switches for climate, stealth, day or night gear.
 */
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false};
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false};
private ["_debug","_key","_side","_year","_classname","_content","_climates","_camo","_roles","_primaries","_secondaries","_launchers","_v","_f","_uniforms","_headgear","_backpacks","_vests","_rolekeys","_role","_return"];
{ if (_x isEqualType []) then { if (_x select 0 isEqualType "") then { switch (toLower (_x select 0)) do {
	case "d": {_debug = [_x select 1] param [0,false,[true]]};
	case "r": {_role = [_x select 1] param [0,0,[0]]};
}}}} forEach _this;
{ if (isNil _x) then { switch (_forEachIndex) do {
	case 0: {_debug = false};
	case 1: {_role = 0};
}}} forEach ["_debug","_role"];
if (_debug) then {
  { diag_log format ["# %1 # %2 # %3 # _param %4 = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_forEachIndex,_x];
  } forEach [_debug,_role];
};
_key = "CTRG"; // FACTION KEY https://armedassault.fandom.com/wiki/CTRG
_side = WEST; // FACTION SIDE
_year = 2035; // FACTION YEAR
_classname = "BLU_F"; // FACTION CLASSNAME
_content = ["Vanilla","Apex","Contact"]; // FACTION CONTENT = Vanilla; DLC: TANOA,TANKS,MARKS,GM; MODS: CUP,RHS,BAF,IFA3,GEIST;
_climates = [0,1,2]; // "Arid","Urban","Lush": _environment selectRandom _environments; _uniform + _environment;
_camo = ["MTP","Tropic","Woodland"];
_v = floor random 12;  // Voice
_f = floor random 20; // Face
_roles = [ // ROLE TRAITS VOICE FACE UNIFORM HEADGEAR BACKPACK VEST NVG FACEWEAR BINOCULAR TERMINAL PRIMARY												SECONDARY												LAUNCHER									MEDICAL 		CHEMLIGHTS 					SMOKES 					   GRENADES 	  EXPLOSIVES 	 MINES 						COMPASS MAP WATCH RADIO TOOLS
/* 0*/["co",	0,_v,_f,0,1,0,0,0,-1,1,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/* 1*/["sl",	0,_v,_f,0,2,6,0,0,-1,1,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/* 2*/["ftl",	0,_v,_f,0,2,6,0,0,-1,1,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/* 3*/["med",	1,_v,_f,0,2,6,0,0,-1,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,													[[0,10],[1,1]],	[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/* 4*/["eng",	2,_v,_f,0,2,6,9,0,-1,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],[[1,1]]],
/* 5*/["engm",	3,_v,_f,0,2,6,9,0,-1,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 [[0,1],[1,1],[2,1],[3,1],[4,1],[5,1]],	0,0,0,[[0,1]],[[0,1],[1,1]]],
/* 6*/["eod",	4,_v,_f,0,2,6,9,0,-1,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], [[0,2],[1,1]], -1,									0,0,0,[[0,1]],[[0,1]]],
/* 7*/["uav",	5,_v,_f,0,2,28,0,0,-1,1,1,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/* 8*/["r",		0,_v,_f,0,2,6,0,0,-1,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/* 9*/["rat",	0,_v,_f,0,2,6,0,0,-1,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		[[2,0,[[0,2]],-1,-1,-1,-1,-1,-1,-1]],				[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*10*/["gre",	0,_v,_f,0,2,6,9,0,-1,0,0,	[[1,4,[[1,5]],[[1,5]],[[1,5]],[[5,5]],[[7,5]],[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],							[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*11*/["ar",	0,_v,_f,0,2,6,0,0,-1,0,0,	[[3,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*12*/["aar",	0,_v,_f,0,2,6,0,0,-1,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]],[3,-1,[[1,5]],-1,-1,-1,-1,-1,-1,-1,-1]],	[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*13*/["mmg",	0,_v,_f,0,2,6,0,0,-1,0,0,	[[5,0,[[0,3]],-1,-1,-1,-1,[[0,1]],-1,-1,[[0,1]]]],															[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*14*/["mmga",	0,_v,_f,0,2,6,0,0,-1,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]],[5,-1,[[0,2]],-1,-1,-1,-1,-1,-1,-1,-1]],	[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*15*/["hmg",	0,_v,_f,0,2,18,0,0,-1,0,0,	[[5,0,[[0,3]],-1,-1,-1,-1,[[0,1]],-1,-1,[[0,1]]]],															[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*16*/["hmga",	0,_v,_f,0,2,16,0,0,-1,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]],[5,-1,[[0,2]],-1,-1,-1,-1,-1,-1,-1,-1]],	[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*17*/["mat",	0,_v,_f,0,2,6,0,0,-1,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		[[1,2,[[0,2],[1,1],[2,1]],-1,-1,-1,-1,-1,-1,-1]],	[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*18*/["mata",	0,_v,_f,0,2,6,0,0,-1,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		[[1,-1,[[0,1],[1,1],[2,1]],-1,-1,-1,-1,-1,-1,-1]],	[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*19*/["hat",	0,_v,_f,0,2,27,0,0,-1,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		[[3,0,[[0,2],[1,2]],-1,-1,-1,-1,-1,-1,-1]],			[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*20*/["hata",	0,_v,_f,0,2,16,0,0,-1,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		[[3,-1,[[0,2],[1,2]],-1,-1,-1,-1,-1,-1,-1]],		[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*21*/["mrt",	0,_v,_f,0,2,24,0,0,-1,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*22*/["mrta",	0,_v,_f,0,2,25,0,0,-1,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*23*/["msam",	0,_v,_f,0,2,6,0,0,-1,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,-1]],				[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*24*/["msama",	0,_v,_f,0,2,6,0,0,-1,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		[[0,-1,[[0,2]],-1,-1,-1,-1,-1,-1,-1]],				[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*25*/["hsam",	0,_v,_f,0,2,26,0,0,-1,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,-1]],				[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*26*/["hsama",	0,_v,_f,0,2,16,0,0,-1,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		[[0,-1,[[0,2]],-1,-1,-1,-1,-1,-1,-1]],				[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*27*/["dm",	0,_v,_f,9,2,6,0,0,-1,1,0,	[[6,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[6,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*28*/["sn",	0,_v,_f,11,6,6,0,0,-1,1,0,	[[10,1,[[0,10]],-1,-1,-1,-1,-1,-1,-1,[[0,1]]]],																[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*29*/["sp",	0,_v,_f,11,6,6,0,0,-1,2,0,	[[6,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[6,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*30*/["div",	0,_v,_f,17,-1,3,12,0,0,0,0,	[[12,0,[[0,5],[1,5]],-1,-1,-1,-1,-1,-1,-1,-1]],																[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*31*/["car",	0,_v,_f,0,2,0,0,0,-1,0,0,	[[1,7,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*32*/["smg",	0,_v,_f,0,2,0,0,0,-1,0,0,	[[0,0,[[0,5]],[[0,5]],-1,-1,-1,-1,-1,[[0,1]],[[0,1]]]],														[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*33*/["vc",	0,_v,_f,0,26,0,-1,0,-1,0,0,	[[0,0,[[0,5]],[[0,5]],-1,-1,-1,-1,-1,[[0,1]],[[0,1]]]],														[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*34*/["vg",	0,_v,_f,0,26,0,-1,0,-1,0,0,	[[0,0,[[0,5]],[[0,5]],-1,-1,-1,-1,-1,[[0,1]],[[0,1]]]],														[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*35*/["vd",	0,_v,_f,0,26,0,-1,0,-1,0,0,	[[0,0,[[0,5]],[[0,5]],-1,-1,-1,-1,-1,[[0,1]],[[0,1]]]],														[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*36*/["p",		0,_v,_f,16,29,30,-1,0,-1,0,0,[[0,0,[[0,5]],[[0,5]],-1,-1,-1,-1,-1,[[0,1]],[[0,1]]]],													[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*37*/["pp",	0,_v,_f,16,28,30,-1,0,-1,0,0,[[0,0,[[0,5]],[[0,5]],-1,-1,-1,-1,-1,[[0,1]],[[0,1]]]],													[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*38*/["pcc",	0,_v,_f,16,27,30,-1,0,-1,0,0,[[0,0,[[0,5]],[[0,5]],-1,-1,-1,-1,-1,[[0,1]],[[0,1]]]],													[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*39*/["pc",	0,_v,_f,16,27,30,-1,0,-1,0,0,[[0,0,[[0,5]],[[0,5]],-1,-1,-1,-1,-1,[[0,1]],[[0,1]]]],													[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*40*/["rad",	0,_v,_f,0,2,13,0,0,-1,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*41*/["cbrn",	0,_v,_f,18,-1,0,0,0,17,0,0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1]
];
_primaries = [
	"VERMIN",	// 0 SMG (Vanilla)
	"MX",		// 1 AR (Vanilla)
	"SPAR16",	// 2 AR
	"MXSW",		// 3 LSW (Vanilla)
	"SPAR16S",	// 4 LSW
	"SPMG",		// 5 HMG
	"MXM",		// 6 DMR (Vanilla)
	"SPAR17",	// 7 DMR
	"MK1",		// 8 DMR
	"MK14",		// 9 DMR
	"M320",		// 10 DMR
	"MAR10",	// 11 DMR
	"SDAR"		// 12 AR
];
_secondaries = [
	"PO7",	// 0
	"4FIVE"	// 1
];
_launchers = [
	"TITAN",	// 0 AA
	"MAAWS",	// 1 AT
	"PCML",		// 2 AT
	"TITANC"	// 3 AT
];
_role = _roles select _role;
_return = [_role,_primaries,_secondaries,_launchers,_voices,_faces,_uniforms,_headgear,_backpacks,_vests] call VVM_fnc_parseRole;
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return]};
{_x = nil} forEach [_debug,_key,_side,_year,_classname,_content,_climates,_camo,_roles,_primaries,_secondaries,_launchers,_voices,_faces,_uniforms,_headgear,_backpacks,_vests,_role];
_return;
