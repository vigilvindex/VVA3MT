/* Name: CSAT.sqf
 * Description: Faction Definition for CSAT.
 * Authors: vigil.vindex@gmail.com
 * License: https://creativecommons.org/licenses/by-sa/4.0/
 * Created: 2020/07/22 Updated: 2020/07/22 Version: 0.0.1
 * Dependencies: VVM_fnc_parseRole
 * Returns:
 *   ROLE ARRAY [ROLE,TRAITS,VOICE,FACE,UNIFORM,HEADGEAR,BACKPACK,VEST,NVG,FACEWEAR,BINOCULAR,TERMINAL,[PRIMARY],[SECONDARY],[LAUNCHER],MEDICAL,CHEMLIGHTS,SMOKES,GRENADES,EXPLOSIVES,MINES,COMPASS,MAP,WATCH,RADIO,TOOLS]
 *   WEAPON ARRAYS [KEY,VARIANT,[MAGAZINES],[TRACERS],[SMOKES],[FLARES],[GRENADES],[ACCESSORIES],[BIPODS],[MUZZLES],[OPTICS]]
 *   MAGAZINE & ITEM ARRAYS [[TYPE,COUNT]]
 * Arguments: index name     (default) TYPE    {Required} min,max    "values"
 *            d     debug    (false)   BOOLEAN {N}        false,true "Disabled","Enabled"
 *            r     role 	 (0)       SCALAR  {N}        0,36       "Role Key"
 *			  c 	camo 	 (0) 	   SCALAR  {N}		  0,2		 "Camoflage Variant"
 * Usage: _co = [] call compile preprocessFileLineNumbers "CSAT.sqf";
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
_key = "CSAT"; // FACTION TITLE https://armedassault.fandom.com/wiki/CSAT
_side = EAST; // FACTION SIDE
_year = 2035; // FACTION YEAR
_classname = "OPF_F"; // FACTION CLASSNAME
_content = ["Vanilla","Apex","Marks","Tanks"]; // FACTION CONTENT = Vanilla; DLC: TANOA,TANKS,MARKS,GM; MODS: CUP,RHS,BAF;
_climates = [0,1,2]; // "Arid","Urban","Lush": _environment selectRandom _environments; _uniform + _environment;
_camo = ["Hex","Urban","Green Hex"];
_v = floor random 3; // Voice
_f = floor random 3; // Face
_roles = [ // ROLE TRAITS VOICE FACE UNIFORM HEADGEAR BACKPACK VEST NVG FACEWEAR BINOCULAR TERMINAL PRIMARY										SECONDARY										LAUNCHER										MEDICAL 		CHEMLIGHTS 					SMOKES 					   GRENADES 	  EXPLOSIVES 	 MINES 						COMPASS MAP WATCH RADIO TOOLS
/* 0*/["co",	0,_v,_f,0,0,0,6,0,-1,1,0,	[[1,2,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[1,0,[[0,2]],-1,-1,-1,-1,-1,-1,-1,[[0,1]]]], 	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/* 1*/["sl",	0,_v,_f,0,11,1,12,0,-1,1,0,	[[1,0,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[1,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/* 2*/["ftl",	0,_v,_f,0,5,1,3,0,-1,1,0,	[[1,1,[[0,4]],[[0,3]],[[0,5]],[[0,4]],[[0,4]],[[0,1]],-1,[[0,1]],[[0,1]]]],							[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/* 3*/["med",	1,_v,_f,0,5,4,12,0,-1,0,0,	[[1,0,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,10],[1,1]],	[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/* 4*/["eng",	2,_v,_f,0,5,4,12,0,-1,0,0,	[[1,2,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],[[1,1]]],
/* 5*/["engm",	3,_v,_f,0,5,4,12,0,-1,0,0,	[[1,2,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 [[0,1],[1,1],[2,1],[3,1],[4,1],[5,1]],	0,0,0,[[0,1]],[[0,1],[1,1]]],
/* 6*/["eod",	4,_v,_f,0,5,4,12,0,-1,0,0,	[[1,2,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], [[0,2],[1,1]], -1,									0,0,0,[[0,1]],[[0,1]]],
/* 7*/["uav",	5,_v,_f,0,5,18,12,0,-1,1,1,	[[1,0,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/* 8*/["r",		0,_v,_f,0,5,1,0,0,-1,0,0,	[[1,0,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/* 9*/["rat",	0,_v,_f,0,5,1,0,0,-1,0,0,	[[1,0,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	[[1,2,[[0,2],[1,1]],-1,-1,-1,-1,-1,-1,-1]],		[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*10*/["gre",	0,_v,_f,0,5,1,9,0,-1,0,0,	[[1,1,[[0,4]],[[0,3]],[[0,5]],[[0,4]],[[0,4]],[[0,1]],-1,[[0,1]],[[0,1]]]],							[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*11*/["ar",	0,_v,_f,0,5,1,0,0,-1,0,0,	[[4,0,[[0,4]],[[0,2]],-1,-1,-1,[[0,1]],-1,-1,[[1,1]]]],												[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*12*/["aar",	0,_v,_f,0,5,4,0,0,-1,0,0,	[[1,0,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]],[4,-1,[[0,3]],-1,-1,-1,-1,-1,-1,-1,-1]],	[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*13*/["mmg",	0,_v,_f,0,5,4,0,0,-1,0,0,	[[5,0,[[0,3]],-1,-1,-1,-1,[[0,1]],-1,-1,[[1,1]]]],													[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*14*/["mmga",	0,_v,_f,0,5,4,0,0,-1,0,0,	[[1,0,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]],[5,-1,[[0,3]],-1,-1,-1,-1,-1,-1,-1,-1]],	[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*15*/["hmg",	0,_v,_f,0,5,18,0,0,-1,0,0,	[[5,0,[[0,4]],-1,-1,-1,-1,[[0,1]],-1,-1,[[1,1]]]],													[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*16*/["hmga",	0,_v,_f,0,5,16,0,0,-1,0,0,	[[1,0,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]],[5,-1,[[0,3]],-1,-1,-1,-1,-1,-1,-1,-1]],	[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*17*/["mat",	0,_v,_f,0,5,4,0,0,-1,0,0,	[[1,2,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	[[3,3,[[0,2],[1,2]],-1,-1,-1,-1,-1,-1,-1]],		[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*18*/["mata",	0,_v,_f,0,5,4,0,0,-1,0,0,	[[1,0,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	[[3,-1,[[0,2],[1,2]],-1,-1,-1,-1,-1,-1,-1]],	[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*19*/["hat",	0,_v,_f,0,5,27,0,0,-1,0,0,	[[1,0,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	[[2,0,[[0,2],[1,2]],-1,-1,-1,-1,-1,-1,-1]],		[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*20*/["hata",	0,_v,_f,0,5,16,0,0,-1,0,0,	[[1,0,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	[[2,-1,[[0,2],[1,2]],-1,-1,-1,-1,-1,-1,-1]],	[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*21*/["mrt",	0,_v,_f,0,5,24,0,0,-1,0,0,	[[1,2,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*22*/["mrta",	0,_v,_f,0,5,25,0,0,-1,0,0,	[[1,2,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*23*/["msam",	0,_v,_f,0,5,4,0,0,-1,0,0,	[[1,2,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	[[0,5,[[0,2]],-1,-1,-1,-1,-1,-1,-1]],			[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*24*/["msama",	0,_v,_f,0,5,4,0,0,-1,0,0,	[[1,0,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	[[0,-1,[[0,2]],-1,-1,-1,-1,-1,-1,-1]],			[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*25*/["hsam",	0,_v,_f,0,5,26,0,0,-1,0,0,	[[1,2,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	[[0,5,[[0,2]],-1,-1,-1,-1,-1,-1,-1]],			[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*26*/["hsama",	0,_v,_f,0,5,16,0,0,-1,0,0,	[[1,0,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	[[0,-1,[[0,2]],-1,-1,-1,-1,-1,-1,-1]],			[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*27*/["dm",	0,_v,_f,0,5,4,0,0,-1,1,0,	[[11,0,[[0,10]],-1,-1,-1,-1,-1,-1,[[0,1]],[[1,1]]]],												[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*28*/["sn",	0,_v,_f,11,5,4,0,0,-1,1,0,	[[12,1,[[0,6],[1,5]],-1,-1,-1,-1,-1,-1,-1,[[0,1]]]],												[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*29*/["sp",	0,_v,_f,11,5,4,0,0,-1,2,0,	[[8,1,[[0,10]],-1,-1,-1,-1,[[0,1]],[[0,1]],[[0,1]],[[4,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*30*/["div",	0,_v,_f,14,-1,10,12,0,0,0,0,[[13,0,[[0,5],[1,5]],-1,-1,-1,-1,-1,-1,-1,-1]],														[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*31*/["car",	0,_v,_f,0,5,1,0,0,-1,0,0,	[[1,2,[[0,4]],[[0,3]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*32*/["smg",	0,_v,_f,0,5,1,0,0,-1,0,0,	[[0,0,[[0,5]],[[0,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*33*/["vc",	0,_v,_f,0,14,0,-1,0,-1,0,0,	[[0,0,[[0,5]],[[0,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*34*/["vg",	0,_v,_f,0,14,0,-1,0,-1,0,0,	[[0,0,[[0,5]],[[0,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*35*/["vd",	0,_v,_f,0,14,0,-1,0,-1,0,0,	[[0,0,[[0,5]],[[0,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*36*/["p",		0,_v,_f,13,22,32,-1,0,-1,0,0,[[0,0,[[0,5]],[[0,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*37*/["pp",	0,_v,_f,13,19,32,-1,0,-1,0,0,[[0,0,[[0,5]],[[0,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*38*/["pcc",	0,_v,_f,13,17,32,-1,0,-1,0,0,[[0,0,[[0,5]],[[0,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*39*/["pc",	0,_v,_f,13,17,32,-1,0,-1,0,0,[[0,0,[[0,5]],[[0,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*40*/["rad",	0,_v,_f,0,5,15,0,0,-1,0,0,	[[1,0,[[0,5]],[[0,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*41*/["cbrn",	0,_v,_f,16,17,33,0,0,17,0,0,[[1,0,[[0,5]],[[0,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]],	-1,												[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1]
];
_primaries = [	// FACTION PRIMARY WEAPONS
	"STING",	// 0 SMG
	"KATIBA",	// 1 AR
	"CAR95",	// 2 AR
	"CAR951",	// 3 LSW
	"ZAFIR",	// 4 LMG
	"NAVID",	// 5 HMG
	"ASP1",		// 6 DMR
	"CMR76",	// 7 DMR
	"CYRUS",	// 8 DMR
	"M320",		// 9 DMR
	"MAR10",	// 10 DMR
	"RAHIM",	// 11 DMR
	"GM6LYNX",	// 12 AMR
	"SDAR"		// 13 AR
];
_secondaries = [	// FACTION SECONDARY WEAPONS
	"ROOK",			// 0	
	"ZUBR"			// 1
];
_launchers = [	// FACTION LAUNCHER WEAPONS
	"TITAN",	// 0 AA
	"RPG42",	// 1 AT
	"9M135",	// 2 AT
	"TITANC"	// 3 AT
];
_voices = [			// FACTION VOICES
	"Male01PER",	// 0
	"Male02PER",	// 1
	"Male03PER"		// 2
];
_faces = [					// FACTION FACES
	"PersianHead_A3_01",	// 0
	"PersianHead_A3_02",	// 1
	"PersianHead_A3_03"		// 2
];
_uniforms = [					// FACTION UNIFORMS
	"U_O_CombatUniform_ocamo",		// 0 Fatigues Hex (Vanilla)
	"U_O_CombatUniform_oucamo",		// 1 Fatigues Urban (Vanilla)
	"U_O_T_Soldier_F",				// 2 Fatigues Green Hex (Apex)
	"U_O_officer_noInsignia_hex_F",	// 3 Light Fatigues Hex (Tanks)
	"U_O_OfficerUniform_ocamo",		// 4 Officer Fatigues Hex (Vanilla)
	"U_O_T_Officer_F",				// 5 Officer Fatigues Green Hex (Apex)
	"U_O_SpecopsUniform_ocamo",		// 6 Recon Fatigues Hex (Vanilla)
	"U_O_FullGhillie_ard",			// 7 Full Ghillie Arid (Vanilla)
	"U_O_FullGhillie_sard",			// 8 Full Ghillie Semi Arid (Vanilla)
	"U_O_FullGhillie_lsh",			// 9 Full Ghillie Lush (Vanilla)
	"U_O_T_FullGhillie_tna_F",		// 10 Full Ghillie Jungle (Apex)
	"U_O_GhillieSuit",				// 11 Ghillie Suit Hex (Vanilla)
	"U_O_T_Sniper_F",				// 12 Ghillie Suit Green Hex (Apex)
	"U_O_PilotCoveralls",			// 13 Pilot Coveralls (Vanilla)
	"U_O_Wetsuit",					// 14 Wet Suit Camo (Vanilla)
	"U_B_Wetsuit",					// 15 Wet Suit Black (Vanilla)
	"U_C_CBRN_Suit_01_Blue_F",		// 16 CBRN Suit Blue (Contact)
	"U_C_CBRN_Suit_01_White_F"		// 17 CBRN Suit White (Contact)
];
_headgear = [					// FACTION HEADGEAR
	"H_Beret_ocamo",			// 0 Beret Black (Vanilla)
	"H_Beret_CSAT_01_F",		// 1 Beret Red (Apex)
	"H_Cap_brn_SPECOPS",		// 2 Cap Hex (Vanilla)
	"H_MilCap_ocamo",			// 3 Military Cap Hex (Vanilla)
	"H_MilCap_ghex_F",			// 4 Military Cap Green Hex (Apex)
	"H_HelmetO_ocamo",			// 5 Protector Helmet Hex (Vanilla)
	"H_HelmetO_oucamo",			// 6 Protector Helmet Urban (Vanilla)
	"H_HelmetO_ghex_F",			// 7 Protector Helmet Green Hex (Apex)
	"H_HelmetSpecO_ocamo",		// 8 Assassin Helmet Hex (Vanilla)
	"H_HelmetSpecO_blk",		// 9 Assassin Helmet Black (Vanilla)
	"H_HelmetSpecO_ghex_F",		// 10 Assassin Helmet Green Hex (Apex)
	"H_HelmetLeaderO_ocamo",	// 11 Defender Helmet Hex (Vanilla)
	"H_HelmetLeaderO_oucamo",	// 12 Defender Helmet Urban (Vanilla)
	"H_HelmetLeaderO_ghex_F",	// 13 Defender Helmet Green Hex (Apex)
	"H_HelmetCrew_O",			// 14 Crew Helmet Hex (Vanilla)
	"H_Tank_black_F",			// 15 Crew Helmet Black (Tanks)
	"H_HelmetCrew_O_ghex_F",	// 16 Crew Helmet Green Hex (Apex)
	"H_CrewHelmetHeli_O",		// 17 Heli Crew Helmet Green (Vanilla)
	"H_CrewHelmetHeli_B",		// 18 Heli Crew Helmet Black (Vanilla)
	"H_PilotHelmetHeli_O",		// 19 Heli Pilot Helmet Green (Vanilla)
	"H_PilotHelmetHeli_B",		// 20 Heli Pilot Helmet Black (Vanilla)
	"H_PilotHelmetFighter_I",	// 21 Pilot Helmet White (Vanilla)
	"H_PilotHelmetFighter_O",	// 22 Pilot Helmet Green (Vanilla)
	"H_PilotHelmetFighter_B"	// 23 Pilot Helmet Black (Vanilla)
];
_backpacks = [							// FACTION BACKPACKS
	"B_AssaultPack_ocamo",				// 0 Assault Pack Hex (Vanilla)
	"B_FieldPack_ocamo",				// 1 Field Pack Hex (Vanilla)
	"B_FieldPack_oucamo",				// 2 Field Pack Urban (Vanilla)
	"B_FieldPack_ghex_F",				// 3 Field Pack Green Hex (Apex)
	"B_Carryall_ocamo",					// 4 Carryall Backpack Hex (Vanilla)
	"B_Carryall_oucamo",				// 5 Carryall Backpack Urban (Vanilla)
	"B_Carryall_ghex_F",				// 6 Carryall Backpack Green Hex (Apex)
	"B_Bergen_hex_F",					// 7 Bergen Hex (Apex)
	"B_TacticalPack_ocamo",				// 8 Tactical Backpack Hex (Vanilla)
	"B_ViperLightHarness_hex_F",		// 9 Viper Light Harness Hex (Apex)
	"B_ViperLightHarness_blk_F",		// 10 Viper Light Harness Hex (Apex)
	"B_ViperLightHarness_ghex_F",		// 11 Viper Light Harness Hex (Apex)
	"B_ViperHarness_hex_F",				// 12 Viper Light Harness Hex (Apex)
	"B_ViperHarness_blk_F",				// 13 Viper Light Harness Hex (Apex)
	"B_ViperHarness_ghex_F",			// 14 Viper Light Harness Hex (Apex)
	"B_RadioBag_01_hex_F",				// 15 Radio Bag Hex (Contact)
	"B_RadioBag_01_oucamo_F",			// 16 Radio Bag Urban (Contact)
	"B_RadioBag_01_ghex_F",				// 17 Radio Bag Green Hex (Contact)
	"O_UAV_01_backpack_F",				// 18 UAV Bag AR2 Green (Vanilla)
	"B_UAV_01_backpack_F",				// 19 UAV Bag AR2 Grey (Vanilla)
	"O_AA_01_weapon_F",					// 20 TITAN (Vanilla)
	"O_AT_01_weapon_F",					// 21 TITAN COMPACT (Vanilla)
	"O_GMG_01_weapon_F",				// 22 MK32 GMG (Vanilla)
	"O_GMG_01_high_weapon_F",			// 23 MK32 GMG RAISED (Vanilla)
	"O_GMG_01_A_weapon_F",				// 24 MK32 GMG AUTO (Vanilla)
	"O_HMG_01_weapon_F",				// 25 MK30 HMG (Vanilla)
	"O_HMG_01_high_weapon_F",			// 26 MK30 HMG RAISED (Vanilla)
	"O_HMG_01_A_weapon_F",				// 27 MK30 HMG AUTO (Vanilla)
	"O_HMG_01_support_F",				// 28 TRIPOD (Vanilla)
	"O_HMG_01_support_high_F",			// 29 TRIPOD RAISED (Vanilla)
	"O_Mortar_01_support_F",			// 30 MK6 BIPOD (Vanilla)
	"O_Mortar_01_weapon_F",				// 31 MK6 TUBE (Vanilla)
	"B_Parachute",						// 32 Parachute (Vanilla)
	"B_SCBA_01_F",						// 33 Self Contained Breathing Aparatus (Contact)
	"O_Static_Designator_02_weapon_F"	// 34 Remote Designator Hex (Marks)
];
_vests = [					// FACTION VESTS
	"V_HarnessO_brn",		// 0 LBV Harness Brown (Vanilla)
	"V_HarnessO_gry",		// 1 LBV Harness Grey (Vanilla)
	"V_HarnessO_ghex_F",	// 2 LBV Harness Green Hex (Apex)
	"V_HarnessOGL_brn",		// 3 LBV GL Harness Brown (Vanilla)
	"V_HarnessOGL_gry",		// 4 LBV GL Harness Grey (Vanilla)
	"V_HarnessOGL_ghex_F",	// 5 LBV GL Harness Green Hex (Apex)
	"V_BandollierB_khk",	// 6 Slash Bandolier Khaki (Vanilla)
	"V_BandollierB_blk",	// 7 Slash Bandolier Black (Vanilla)
	"V_BandollierB_ghex_F",	// 8 Slash Bandolier Green Hex (Apex)
	"V_Chestrig_khk",		// 9 Chest Rig Khaki (Vanilla)
	"V_Chestrig_blk",		// 10 Chest Rig Black (Vanilla)
	"V_Chestrig_rgr",		// 11 Chest Rig Green (Vanilla)
	"V_TacVest_khk",		// 12 Tactical Vest Khaki (Vanilla)
	"V_TacVest_blk",		// 13 Tactical Vest Black (Vanilla)
	"V_TacVest_oli",		// 14 Tactical Vest Olive (Vanilla)
	"V_RebreatherIR",		// 15 Rebreather Camo (Vanilla)
	"V_RebreatherB"			// 16 Rebreather Black (Vanilla)
];
_role = _roles select _role; // SELECT FACTION ROLE
_return = [_role,_primaries,_secondaries,_launchers,_voices,_faces,_uniforms,_headgear,_backpacks,_vests] call VVM_fnc_parseRole; // Parse Role Array.
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return]};
{_x = nil} forEach [_debug,_key,_side,_year,_classname,_content,_climates,_camo,_roles,_primaries,_secondaries,_launchers,_voices,_faces,_uniforms,_headgear,_backpacks,_vests,_role];
_return
