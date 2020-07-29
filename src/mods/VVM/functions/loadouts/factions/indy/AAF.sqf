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
_primaries = [	// FACTION PRIMARY WEAPONS
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
_secondaries = [	// FACTION SECONDARY WEAPONS
	"PO7",			// 0
	"4FIVE"			// 1
];
_launchers = [	// FACTION LAUNCHER WEAPONS
	"TITAN",	// 0 AA
	"MAAWS",	// 1 AT
	"PCML",		// 2 AT
	"TITANC"	// 3 AT
];
_voices = [			// FACTION VOICES
	"Male01ENG",	// 0
	"Male02ENG",	// 1
	"Male03ENG",	// 2
	"Male04ENG",	// 3
	"Male05ENG",	// 4
	"Male06ENG",	// 5
	"Male07ENG",	// 6
	"Male08ENG",	// 7
	"Male09ENG",	// 8
	"Male10ENG",	// 9
	"Male11ENG",	// 10
	"Male12ENG"		// 11
];
_faces = [			// FACTION FACES
	"WhiteHead_01", // 0
	"WhiteHead_02", // 1
	"WhiteHead_03", // 2
	"WhiteHead_04", // 3
	"WhiteHead_05", // 4
	"WhiteHead_06", // 5
	"WhiteHead_07", // 6
	"WhiteHead_08", // 7
	"WhiteHead_09", // 8
	"WhiteHead_10", // 9
	"WhiteHead_11", // 10
	"WhiteHead_12", // 11
	"WhiteHead_13", // 12
	"WhiteHead_14", // 13
	"WhiteHead_15", // 14
	"WhiteHead_16", // 15
	"WhiteHead_17", // 16
	"WhiteHead_19", // 17
	"WhiteHead_20", // 18
	"WhiteHead_21"	// 19
];
_headgear = [						// FACTION HEADGEAR
	"H_Beret_Colonel",				// 0 Beret CO
	"H_Beret_02",					// 1 Beret SL
	"H_HelmetB_light",				// 2 Light Combat Helmet
	"H_HelmetB_Light_tna_F",		// 3 Light Combat Helmet Tropic
	"H_HelmetB_light_wdl",			// 4 Light Combat Helmet Woodland
	"H_HelmetB_light_black",		// 5 Light Combat Helmet Black
	"H_HelmetB_light_grass",		// 6 Light Combat Helmet Grass
	"H_HelmetB_light_sand",			// 7 Light Combat Helmet Sand
	"H_HelmetB_light_snakeskin",	// 8 Light Combat Helmet Snakeskin
	"H_HelmetB_light_desert",		// 9 Light Combat Helmet Desert
	"H_HelmetB_desert",				// 10 Combat Helmet Desert
	"H_HelmetB_tna_F",				// 11 Combat Helmet Tropic
	"H_HelmetB_plain_wdl",			// 12 Combat Helmet Woodland
	"H_HelmetB_black",				// 13 Combat Helmet Black
	"H_HelmetB_grass",				// 14 Combat Helmet Grass
	"H_HelmetB_sand",				// 15 Combat Helmet Sand
	"H_HelmetB_snakeskin",			// 16 Combat Helmet Snakeskin
	"H_HelmetB",					// 17 Combat Helmet 
	"H_HelmetSpecB_paint2",			// 18 Enhanced Combat Helmet Desert
	"H_HelmetB_Enh_tna_F",			// 19 Enhanced Combat Helmet Tropic
	"H_HelmetSpecB_wdl",			// 20 Enhanced Combat Helmet Woodland
	"H_HelmetSpecB_blk",			// 21 Enhanced Combat Helmet Black
	"H_HelmetSpecB_paint1",			// 22 Enhanced Combat Helmet Grass
	"H_HelmetSpecB_sand",			// 23 Enhanced Combat Helmet Sand
	"H_HelmetSpecB_snakeskin",		// 24 Enhanced Combat Helmet Snakeskin
	"H_HelmetSpecB",				// 25 Enhanced Combat Helmet 
	"H_HelmetCrew_B",				// 26 Crew Helmet
	"H_CrewHelmetHeli_B",			// 27 Heli Crew Helmet
	"H_PilotHelmetHeli_B",			// 28 Heli Pilot Helmet
	"H_PilotHelmetFighter_B",		// 29 Fighter Pilot Helmet
	"H_MilCap_mcamo",				// 30 Military Cap MTP
	"H_MilCap_tna_F",				// 31 Military Cap Tropic
	"H_MilCap_wdl",					// 32 Military Cap Woodland
	"H_Bandanna_mcamo",				// 33 Bandana MTP
	"H_Booniehat_mcamo",			// 34 Booniehat MTP
	"H_Cap_tan_specops_US"			// 35 Cap MTP
];
_uniforms = [								// FACTION UNIFORMS
	"U_B_CombatUniform_mcam",				// 0 Combat Fatigues MTP (Vanilla)
	"U_B_T_Soldier_F",						// 1 Combat Fatigues Tropic (Apex)
	"U_B_CombatUniform_mcam_wdl_f",			// 2 Combat Fatigues MTP Woodland (Contact)
	"U_B_CombatUniform_mcam_tshirt",		// 3 Combat Fatigues Tee MTP (Vanilla)
	"U_B_T_Soldier_AR_F",					// 4 Combat Fatigues Tee Tropic (Apex)
	"U_B_CombatUniform_tshirt_mcam_wdL_f",	// 5 Combat Fatigues Tee MTP Woodland (Contact)
	"U_B_CombatUniform_mcam_vest",			// 6 Recon Fatigues MTP (Vanilla)
	"U_B_T_Soldier_SL_F",					// 7 Recon Fatigues Tropic (Apex)
	"U_B_CombatUniform_vest_mcam_wdl_f",	// 8 Recon Fatigues MTP Woodland (Contact)
	"U_B_GhillieSuit",						// 9 Guillie Suit (Vanilla)
	"U_B_T_Sniper_F",						// 10 Guillie Suit Tropic (Apex)
	"U_B_FullGhillie_ard",					// 11 Full Gillie Arid (Vanilla)
	"U_B_FullGhillie_lsh",					// 12 Full Gillie Lush (Vanilla)
	"U_B_FullGhillie_sard",					// 13 Full Gillie Semi-Arid (Vanilla)
	"U_B_T_FullGhillie_tna_F",				// 14 Full Gillie Jungle (Apex)
	"U_B_HeliPilotCoveralls",				// 15 Heli Pilot
	"U_B_PilotCoveralls",					// 16 Pilot
	"U_B_Wetsuit",							// 17 Wetsuit
	"U_B_CBRN_Suit_01_MTP_F",				// 18 CBRN Suit MTP (Contact)
	"U_B_CBRN_Suit_01_Tropic_F",			// 19 CBRN Suit Tropic (Contact)
	"U_B_CBRN_Suit_01_Wdl_F"				// 20 CBRN Suit MTP Woodland (Contact)
];
_vests = [						// FACTION VESTS
	"V_PlateCarrier1_rgr",		// 0 Carrier Lite Green (Vanilla)
	"V_PlateCarrier1_tna_F",	// 1 Carrier Lite Tropic (Apex)
	"V_PlateCarrier1_wdl",		// 2 Carrier Lite Woodland (Contact)
	"V_PlateCarrier2_rgr",		// 3 Carrier Rig Green (Vanilla)
	"V_PlateCarrier2_tna_F",	// 4 Carrier Rig Tropic (Apex)
	"V_PlateCarrier2_wdl",		// 5 Carrier Rig Woodland (Contact)
	"V_PlateCarrierSpec_mtp",	// 6 Carrier Special Rig MTP (Vanilla)
	"V_PlateCarrierSpec_tna_F",	// 7 Carrier Special Rig Tropic (Apex)
	"V_PlateCarrierSpec_wdl",	// 8 Carrier Special Rig Woodland
	"V_PlateCarrierGL_mtp",		// 9 Carrier GL Rig MTP (Vanilla)
	"V_PlateCarrierGL_tna_F",	// 10 Carrier GL Rig Tropic (Apex)
	"V_PlateCarrierGL_wdl",		// 11 Carrier GL Rig Woodland (Contact)
	"V_RebreatherB"				// 12 Rebreather (Vanilla)
];
_backpacks = [					// FACTION BACKPACKS
	"B_AssaultPack_mcamo",		// 0 Assault Pack MTP (Vanilla)
	"B_AssaultPack_tna_F",		// 1 Assault Pack Tropic (Apex)
	"B_AssaultPack_wdl_F",		// 2 Assault Pack Woodland (Contact)
	"B_AssaultPack_blk",		// 3 Assault Pack Black (Vanilla)
	"B_Bergen_mcamo_F",			// 4 Bergen MTP (Apex)
	"B_Bergen_tna_F",			// 5 Bergen Tropic (Apex)
	"B_Carryall_mcamo",			// 6 Carryall MTP (Vanilla)
	"B_Carryall_oli",			// 7 Carryall Olive (Vanilla)
	"B_Carryall_wdl_F",			// 8 Carryall Woodland (Contact)
	"B_Kitbag_mcamo",			// 9 Kitbag MTP (Vanilla)
	"B_Kitbag_rgr",				// 10 Kitbag Green (Vanilla)
	"B_TacticalPack_mcamo",		// 11 Tactical Pack MTP (Vanilla)
	"B_TacticalPack_rgr",		// 12 Tactical Pack Green (Vanilla)
	"B_RadioBag_01_mtp_F",		// 13 Radio Pack MTP (Contact)
	"B_RadioBag_01_tropic_F",	// 14 Radio Pack Tropic (Contact)
	"B_RadioBag_01_wdl_F",		// 15 Radio Pack Woodland (Contact)
	"B_HMG_01_support_F",		// 16 Tripod (Vanilla)
	"B_HMG_01_support_high_F",	// 17 Tripod Raised (Vanilla)
	"B_HMG_01_weapon_F",		// 18 HMG (Vanilla)
	"B_HMG_01_high_weapon_F",	// 19 HMG Raised (Vanilla)
	"B_HMG_01_A_weapon_F",		// 20 HMG Auto (Vanilla)
	"B_GMG_01_weapon_F",		// 21 GMG (Vanilla)
	"B_GMG_01_high_weapon_F",	// 22 GMG Raised (Vanilla)
	"B_GMG_01_A_weapon_F",		// 23 GMG Auto (Vanilla)
	"B_Mortar_01_weapon_F",		// 24 Tube (Vanilla)
	"B_Mortar_01_support_F",	// 25 Bipod (Vanilla)
	"B_AA_01_weapon_F",			// 26 AA (Vanilla)
	"B_AT_01_weapon_F",			// 27 AT (Vanilla)
	"B_UAV_01_backpack_F",		// 28 UAV AR2 (Vanilla)
	"B_UAV_06_backpack_F",		// 29 UAV AL6 (Orange)
	"B_Parachute"				// 30 (Vanilla)
];
_role = _roles select _role; // SELECT FACTION ROLE
_return = [_role,_primaries,_secondaries,_launchers,_voices,_faces,_uniforms,_headgear,_backpacks,_vests] call VVM_fnc_parseRole; // Parse Role Array.
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return]};
{_x = nil} forEach [_debug,_key,_side,_year,_classname,_content,_climates,_camo,_roles,_primaries,_secondaries,_launchers,_voices,_faces,_uniforms,_headgear,_backpacks,_vests,_role];
_return
