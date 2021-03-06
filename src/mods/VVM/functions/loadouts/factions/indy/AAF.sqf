/* Name: AAF.sqf
 * Description: Faction Definition for AAF.
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
 * Usage: _co = [] call compile preprocessFileLineNumbers "AAF.sqf";
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
_key = "AAF"; // FACTION KEY https://armedassault.fandom.com/wiki/AAF
_side = INDEPENDENT; // FACTION SIDE
_year = 2035; // FACTION YEAR
_classname = "IND_F"; // FACTION CLASSNAME
_content = ["Vanilla","Apex","Contact"]; // FACTION CONTENT = Vanilla; DLC: TANOA,TANKS,MARKS,GM; MODS: CUP,RHS,BAF,IFA3,GEIST;
_climates = [0,1,2]; // "Arid","Urban","Lush": _environment selectRandom _environments; _uniform + _environment;
_camo = ["Digital Green"];
_v = floor random 6; // Voice
_f = floor random 9; // Face
_roles = [ // ROLE TRAITS VOICE FACE UNIFORM HEADGEAR BACKPACK VEST NVG FACEWEAR BINOCULAR TERMINAL PRIMARY										SECONDARY									  LAUNCHER												MEDICAL 		CHEMLIGHTS 					SMOKES 					   GRENADES 	  EXPLOSIVES 	 MINES 						COMPASS MAP WATCH RADIO TOOLS
/* 0*/["co",	0,_v,_f,1,0,0,5,2,-1,1,0,	[[1,4,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/* 1*/["sl",	0,_v,_f,0,4,0,7,2,-1,1,0,	[[1,2,[[0,6]],[[1,5]],[[0,5]],[[0,5]],[[0,5]],[[0,1]],-1,[[0,1]],[[0,1]]]],							[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/* 2*/["ftl",	0,_v,_f,0,4,0,7,2,-1,1,0,	[[1,0,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/* 3*/["med",	1,_v,_f,0,4,2,7,2,-1,0,0,	[[1,0,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,10],[1,1]],	[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/* 4*/["eng",	2,_v,_f,0,4,2,4,2,-1,0,0,	[[1,4,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],[[1,1]]],
/* 5*/["engm",	3,_v,_f,0,4,2,4,2,-1,0,0,	[[1,4,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 [[0,1],[1,1],[2,1],[3,1],[4,1],[5,1]],	0,0,0,[[0,1]],[[0,1],[1,1]]],
/* 6*/["eod",	4,_v,_f,0,4,2,4,2,-1,0,0,	[[1,4,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], [[0,2],[1,1]], -1,									0,0,0,[[0,1]],[[0,1]]],
/* 7*/["uav",	5,_v,_f,0,4,20,7,2,-1,1,3,	[[1,0,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/* 8*/["r",		0,_v,_f,0,4,0,7,2,-1,0,0,	[[1,0,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/* 9*/["rat",	0,_v,_f,0,4,0,7,2,-1,0,0,	[[1,0,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], [[2,0,[[0,2]],-1,-1,-1,-1,-1,-1,-1]],					[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*10*/["gre",	0,_v,_f,0,4,2,2,2,-1,0,0,	[[1,2,[[0,6]],[[1,5]],[[0,5]],[[0,5]],[[0,5]],[[0,1]],-1,[[0,1]],[[0,1]]]],							[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*11*/["ar",	0,_v,_f,0,4,2,7,2,-1,0,0,	[[2,0,[[0,3]],[[0,2]],-1,-1,-1,[[0,1]],[[0,1]],[[0,1]],[[1,1]]]],									[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*12*/["aar",	0,_v,_f,0,4,6,4,2,-1,0,0,	[[1,0,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]],[2,-1,[[0,2]],-1,-1,-1,-1,-1,-1,-1,-1]],	[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*13*/["mmg",	0,_v,_f,0,4,2,7,2,-1,0,0,	[[2,0,[[0,3]],[[0,2]],-1,-1,-1,[[0,1]],[[0,1]],[[0,1]],[[1,1]]]],									[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*14*/["mmga",	0,_v,_f,0,4,2,3,2,-1,0,0,	[[1,0,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]],[2,-1,[[0,2]],-1,-1,-1,-1,-1,-1,-1,-1]],	[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*15*/["hmg",	0,_v,_f,0,4,11,7,2,-1,0,0,	[[2,0,[[0,3]],[[0,2]],-1,-1,-1,[[0,1]],[[0,1]],[[0,1]],[[1,1]]]],									[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*16*/["hmga",	0,_v,_f,0,4,9,7,2,-1,0,0,	[[1,0,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]],[2,-1,[[0,2]],-1,-1,-1,-1,-1,-1,-1,-1]],	[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*17*/["mat",	0,_v,_f,0,4,2,7,2,-1,0,0,	[[1,0,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], [[1,1,[[0,2],[1,1],[2,1]],-1,-1,-1,-1,-1,-1,-1]],		[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*18*/["mata",	0,_v,_f,0,4,2,7,2,-1,0,0,	[[1,0,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], [[1,-1,[[0,1],[1,1],[2,1]],-1,-1,-1,-1,-1,-1,-1]],	[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*19*/["hat",	0,_v,_f,0,4,19,7,2,-1,0,0,	[[1,4,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], [[4,2,[[0,2],[1,2]],-1,-1,-1,-1,-1,-1,-1]],			[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*20*/["hata",	0,_v,_f,0,4,9,7,2,-1,0,0,	[[1,4,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], [[4,-1,[[0,2],[1,2]],-1,-1,-1,-1,-1,-1,-1]],			[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*21*/["mrt",	0,_v,_f,0,4,16,7,2,-1,0,0,	[[1,4,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*22*/["mrta",	0,_v,_f,0,4,17,7,2,-1,0,0,	[[1,4,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*23*/["msam",	0,_v,_f,0,4,2,7,2,-1,0,0,	[[1,4,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], [[0,1,[[0,2]],-1,-1,-1,-1,-1,-1,-1]],					[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*24*/["msama",	0,_v,_f,0,4,2,7,2,-1,0,0,	[[1,0,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], [[0,-1,[[0,2]],-1,-1,-1,-1,-1,-1,-1]],				[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*25*/["hsam",	0,_v,_f,0,4,18,7,2,-1,0,0,	[[1,4,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], [[0,1,[[0,2]],-1,-1,-1,-1,-1,-1,-1]],					[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*26*/["hsama",	0,_v,_f,0,4,9,7,2,-1,0,0,	[[1,4,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], [[0,-1,[[0,2]],-1,-1,-1,-1,-1,-1,-1]],				[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*27*/["dm",	0,_v,_f,0,4,0,7,2,-1,1,0,	[[3,0,[[0,6]],-1,-1,-1,-1,[[1,1]],-1,[[0,1]],[[3,1]]]],												[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*28*/["sn",	0,_v,_f,4,4,0,7,2,-1,1,0,	[[4,0,[[0,6]],-1,-1,-1,-1,-1,-1,-1,[[0,1]]]],														[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*29*/["sp",	0,_v,_f,8,4,2,7,2,-1,2,0,	[[3,0,[[0,6]],-1,-1,-1,-1,[[1,1]],-1,[[0,1]],[[3,1]]]],												[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*30*/["div",	0,_v,_f,12,-1,22,8,2,0,0,0,	[[5,0,[[0,6],[1,5]],-1,-1,-1,-1,-1,-1,-1,-1]],														[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*31*/["car",	0,_v,_f,0,4,0,7,2,-1,0,0,	[[1,4,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*32*/["smg",	0,_v,_f,0,4,0,7,2,-1,0,0,	[[0,0,[[0,6]],[[0,5]],-1,-1,-1,-1,-1,[[0,1]],[[1,1]]]],												[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*33*/["vc",	0,_v,_f,2,5,0,-1,2,-1,0,0,	[[1,4,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*34*/["vg",	0,_v,_f,2,5,0,-1,2,-1,0,0,	[[1,4,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*35*/["vd",	0,_v,_f,2,5,0,-1,2,-1,0,0,	[[1,4,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*36*/["p",		0,_v,_f,10,8,7,-1,2,-1,0,0,	[[0,0,[[0,6]],[[0,5]],-1,-1,-1,-1,-1,[[0,1]],[[1,1]]]],												[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*37*/["pp",	0,_v,_f,9,6,7,-1,2,-1,0,0,	[[0,0,[[0,6]],[[0,5]],-1,-1,-1,-1,-1,[[0,1]],[[1,1]]]],												[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*38*/["pcc",	0,_v,_f,9,6,7,-1,2,-1,0,0,	[[1,4,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*39*/["pc",	0,_v,_f,9,6,7,-1,2,-1,0,0,	[[1,4,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*40*/["rad",	0,_v,_f,0,4,5,7,2,-1,0,0,	[[1,0,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*41*/["cbrn",	0,_v,_f,3,-1,0,5,2,17,0,0,	[[1,0,[[0,6]],[[1,5]],-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],										[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,[[0,1]],-1]], -1,													[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1]
];
_primaries = [	// FACTION PRIMARY WEAPONS
	"PDW2000",	// 0 SMG
	"MK20",		// 1 AR
	"MK200",	// 2 LMG
	"MK18",		// 3 DMR
	"GM6LYNX",	// 4 AMR
	"SDAR"		// 5 AR
];
_secondaries = [	// FACTION SECONDARY WEAPONS
	"ACPC2"			// 0
];
_launchers = [	// FACTION LAUNCHER WEAPONS
	"TITAN",	// 0 AA
	"MAAWS",	// 1 AT
	"PCML",		// 2 AT
	"RPG42",	// 3 AT
	"TITANC"	// 4 AT
];
_voices = [			// FACTION VOICES
	"Male01GRE",	// 0
	"Male02GRE",	// 1
	"Male03GRE",	// 2
	"Male04GRE",	// 3
	"Male05GRE",	// 4
	"Male06GRE"		// 5
];
_faces = [			// FACTION FACES
	"GreekHead_A3_01", // 0
	"GreekHead_A3_02", // 1
	"GreekHead_A3_03", // 2
	"GreekHead_A3_04", // 3
	"GreekHead_A3_05", // 4
	"GreekHead_A3_06", // 5
	"GreekHead_A3_07", // 6
	"GreekHead_A3_08", // 7
	"GreekHead_A3_09"  // 8
];
_headgear = [					// FACTION HEADGEAR
	"H_Beret_blk",				// 0 (Vanilla)
	"H_Booniehat_dgtl",			// 1 (Vanilla)
	"H_Cap_blk_Raven",			// 2 (Vanilla)
	"H_MilCap_dgtl",			// 3 (Vanilla)
	"H_HelmetIA",				// 4 (Vanilla)
	"H_HelmetCrew_I",			// 5 (Vanilla)
	"H_HelmetCrewHeli_I",		// 6 (Vanilla)
	"H_PilotHelmetFighter_I",	// 7 (Vanilla)
	"H_PilotHelmetHeli_I"		// 8 (Vanilla)
];
_uniforms = [						// FACTION UNIFORMS
	"U_I_CombatUniform",			// 0 Combat Fatigues (Vanilla)
	"U_I_OfficerUniform",			// 1 Combat Fatigues Officer (Vanilla)
	"U_I_CombatUniform_shortleeve",	// 2 Combat Fatigues Rolled Up (Vanilla)
	"U_I_CBRN_Suit_01_AAF_F",		// 3 CBRN Suit (Contact)
	"U_I_FullGhillie_ard",			// 4 Arid (Vanilla)
	"U_I_FullGhillie_lsh",			// 5 Lush (Vanilla)
	"U_I_FullGhillie_sard",			// 6 Semi Arid (Vanilla)
	"U_B_T_FullGhillie_tna_F",		// 7 Jungle (Apex)
	"U_I_GhillieSuit",				// 8 (Vanilla)
	"U_I_HeliPilotCoveralls",		// 9 (Vanilla)
	"U_I_pilotCoveralls",			// 10 (Vanilla)
	"U_Tank_green_F",				// 11 (Tanks)
	"U_I_Wetsuit"					// 12 (Vanilla)
];
_vests = [						// FACTION VESTS
	"V_Chestrig_rgr",			// 0 Chest Rig Olive (Vanilla)
	"V_EOD_olive_F",			// 1 EOD Vest (Orange)
	"V_PlateCarrierIAGL_dgtl",	// 2 GA Carrier GL Rig(Vanilla)
	"V_PlateCarrierIA1_dgtl",	// 3 GA Carrier Lite (Vanilla)
	"V_PlateCarrierIA2_dgtl",	// 4 GA Carrier Rig (Vanilla)
	"V_BandollierB_oli",		// 5 Slash Bandolier Olive (Vanilla)
	"V_TacChestrig_oli_F",		// 6 Tactical Chest Rig Olive (Apex)
	"V_TacVest_oli",			// 7 Tactical Vest Olive (Vanilla)
	"V_RebreatherB",			// 8 Rebreather (Vanilla)
	"V_RebreatherIA"			// 9 Rebreather (Vanilla)
];
_backpacks = [					// FACTION BACKPACKS
	"B_AssaultPack_dgtl",		// 0 Assault Pack Digital (Vanilla)
	"B_Bergen_dgtl_F",			// 1 Bergen Digital (Apex)
	"B_Carryall_oli",			// 2 Carryall Olive (Vanilla)
	"B_FieldPack_oli",			// 3 Field Pack Olive (Vanilla)
	"B_Kitbag_sgg",				// 4 Kit Bag Sage (Vanilla)
	"B_RadioBag_01_digi_F",		// 5 Radio Pack Digital (Contact)
	"B_TacticalPack_oli",		// 6 Tactical Pack Green (Vanilla)
	"B_Parachute",				// 7 (Vanilla)
	"I_HMG_01_support_F",		// 8 Tripod (Vanilla)
	"I_HMG_01_support_high_F",	// 9 Tripod Raised (Vanilla)
	"I_HMG_01_weapon_F",		// 10 HMG (Vanilla)
	"I_HMG_01_high_weapon_F",	// 11 HMG Raised (Vanilla)
	"I_HMG_01_A_weapon_F",		// 12 HMG Auto (Vanilla)
	"I_GMG_01_weapon_F",		// 13 GMG (Vanilla)
	"I_GMG_01_high_weapon_F",	// 14 GMG Raised (Vanilla)
	"I_GMG_01_A_weapon_F",		// 15 GMG Auto (Vanilla)
	"I_Mortar_01_weapon_F",		// 16 Tube (Vanilla)
	"I_Mortar_01_support_F",	// 17 Bipod (Vanilla)
	"I_AA_01_weapon_F",			// 18 AA (Vanilla)
	"I_AT_01_weapon_F",			// 19 AT (Vanilla)
	"I_UAV_01_backpack_F",		// 20 UAV AR2 (Vanilla)
	"I_UAV_06_backpack_F",		// 21 UAV AL6 (Orange)
	"B_AssaultPack_blk"			// 22 Assault Pack Black (Vanilla)
];
_role = _roles select _role; // SELECT FACTION ROLE
_return = [_role,_primaries,_secondaries,_launchers,_voices,_faces,_uniforms,_headgear,_backpacks,_vests] call VVM_fnc_parseRole; // Parse Role Array.
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return]};
{_x = nil} forEach [_debug,_key,_side,_year,_classname,_content,_climates,_camo,_roles,_primaries,_secondaries,_launchers,_voices,_faces,_uniforms,_headgear,_backpacks,_vests,_role];
_return
