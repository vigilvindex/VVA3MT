/* Name: FGR.sqf
 * Description: Faction Definition for FGR.
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
 * Usage: _co = [] call compile preprocessFileLineNumbers "FGR.sqf";
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
_key = "FGR"; // FACTION KEY https://armedassault.fandom.com/wiki/West_Germany
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
_voices = [
	"gm_voice_male_deu_01",	// 0
	"gm_voice_male_deu_02",	// 1
	"gm_voice_male_deu_03",	// 2
	"gm_voice_male_deu_04",	// 3
	"gm_voice_male_deu_05",	// 4
	"gm_voice_male_deu_06",	// 5
	"gm_voice_male_deu_07",	// 6
	"gm_voice_male_deu_08",	// 7
	"gm_voice_male_deu_09"	// 8
];
_faces = [
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
_headgear = [
	"gm_ge_bgs_headgear_m35_53_blk",				// 0 Helmet M35/53 (GM)
	"gm_ge_bgs_headgear_m35_53_net_blk",			// 1 Helmet M35/53 Mesh (GM)
	"gm_ge_dbp_headgear_cap_80_blu",				// 2 Postman Cap (GM)
	"gm_ge_ff_headgear_m35_53_tan",					// 3 Helmet M35/53 Tan (GM)
	"gm_ge_headgear_beret_bdx",						// 4 Beret Bordeaux (GM)
	"gm_ge_headgear_beret_red",						// 5 Beret Red (GM)
	"gm_ge_headgear_beret_grn",						// 6 Beret Green (GM)
	"gm_ge_headgear_beret_bdx_armyaviation",		// 7 Beret Army Aviation (GM)
 	"gm_ge_headgear_beret_bdx_lrrp",				// 8 Beret LRR (GM)
 	"gm_ge_headgear_beret_bdx_paratrooper",			// 9 Beret Paratroopers (GM)
 	"gm_ge_headgear_beret_bdx_specop",				// 10 Beret Special Forces (GM)
 	"gm_ge_headgear_beret_blk_antitank",			// 11 Beret Anti Tank (GM)
 	"gm_ge_headgear_beret_blk_armor",				// 12 Beret Armor (GM)
 	"gm_ge_headgear_beret_blk_armorrecon",			// 13 Beret Armored Recon (GM)
 	"gm_ge_headgear_beret_blk_recon",				// 14 Beret Recon (GM)
 	"gm_ge_headgear_beret_blu_medical",				// 15 Beret Medical (GM)
 	"gm_ge_headgear_beret_crew_bdx_paratrooper",	// 16 Crew Headset Paratroopers (GM)
 	"gm_ge_headgear_beret_crew_blk_antitank",		// 17 Crew Headset Anti Tank (GM)
 	"gm_ge_headgear_beret_crew_blk_armor",			// 18 Crew Headset Armor (GM)
 	"gm_ge_headgear_beret_crew_blk_armorrecon",		// 19 Crew Headset Armored Recon (GM)
 	"gm_ge_headgear_beret_crew_blk_recon",			// 20 Crew Headset Recon (GM)
 	"gm_ge_headgear_beret_crew_grn_mechinf",		// 21 Crew Headset Mechanized Infantry (GM)
 	"gm_ge_headgear_beret_crew_red_antiair",		// 22 Crew Headset Anti Air (GM)
 	"gm_ge_headgear_beret_crew_red_artillery",		// 23 Crew Headset Artillery (GM)
 	"gm_ge_headgear_beret_crew_red_engineer",		// 24 Crew Headset Engineer (GM)
 	"gm_ge_headgear_beret_crew_red_maintenance",	// 25 Crew Headset Maintenance (GM)
 	"gm_ge_headgear_beret_crew_red_militarypolice",	// 26 Crew Headset Military Police (GM)
 	"gm_ge_headgear_beret_crew_red_nbc",			// 27 Crew Headset NBC (GM)
 	"gm_ge_headgear_beret_crew_red_opcom",			// 28 Crew Headset Operative Communications (GM)
 	"gm_ge_headgear_beret_crew_red_signals",		// 29 Crew Headset Signals (GM)
 	"gm_ge_headgear_beret_crew_red_supply",			// 30 Crew Headset Supply (GM)
 	"gm_ge_headgear_beret_grn_guardbtl",			// 31 Beret Guard Battalion (GM)
 	"gm_ge_headgear_beret_grn_infantry",			// 32 Beret Infantry (GM)
 	"gm_ge_headgear_beret_grn_mechinf",				// 33 Beret Mechanized Infantry (GM)
 	"gm_ge_headgear_beret_grn_music",				// 34 Beret Musical Corps (GM)
 	"gm_ge_headgear_beret_mrb",						// 35 Beret Dark Blue (GM)
 	"gm_ge_headgear_beret_red_antiair",				// 36 Beret Anti Air (GM)
 	"gm_ge_headgear_beret_red_artillery",			// 37 Beret Artillery (GM)
 	"gm_ge_headgear_beret_red_engineer",			// 38 Beret Engineer (GM)
 	"gm_ge_headgear_beret_red_geoinfo",				// 39 Beret Topography (GM)
 	"gm_ge_headgear_beret_red_maintenance",			// 40 Beret Maintenance (GM)
 	"gm_ge_headgear_beret_red_militarypolice",		// 41 Beret Military Police (GM)
 	"gm_ge_headgear_beret_red_nbc",					// 42 Beret NBC (GM)
 	"gm_ge_headgear_beret_red_opcom",				// 43 Beret Operative Communications (GM)
 	"gm_ge_headgear_beret_red_signals",				// 44 Beret Signals (GM)
 	"gm_ge_headgear_beret_red_supply",				// 45 Beret Supply (GM)
 	"gm_ge_headgear_beret_un",						// 46 Beret Cyan (GM)
 	"gm_ge_headgear_crewhat_80_blk",				// 47 Crew Hat (GM)
 	"gm_ge_headgear_hat_80_gry",					// 48 Field Cap Gray (GM)
 	"gm_ge_headgear_hat_80_m62_oli",				// 49 Field Cap Olive M62 (GM)
 	"gm_ge_headgear_hat_80_oli",					// 50 Field Cap Olive (GM)
 	"gm_ge_headgear_headset_crew_oli",				// 51 Crew Headset (GM)
 	"gm_ge_headgear_m62",							// 52 Helmet M62 (GM)
 	"gm_ge_headgear_m62_cover_blu",					// 53 Helmet M62 Blue (GM)
 	"gm_ge_headgear_m62_cover_win",					// 54 Helmet M62 Winter (GM)
 	"gm_ge_headgear_m62_net",						// 55 Helmet M62 Mesh (GM)
 	"gm_ge_headgear_m62_win_pap_01",				// 56 Helmet M62 Winter (GM)
 	"gm_ge_headgear_winterhat_80_oli",				// 57 Winter Hat (GM)
 	"gm_ge_pol_headgear_cap_80_grn",				// 58 Police Cap Green (GM)
 	"gm_ge_pol_headgear_cap_80_wht",				// 59 Police Cap White (GM)
	"gm_ge_headgear_hat_boonie_oli",				// 60 Boonie Hat Olive (GM)
 	"gm_ge_headgear_hat_boonie_wdl",				// 61 Boonie Hat Woodland (GM)
	"gm_ge_headgear_hat_beanie_blk",				// 62 Wool Hat Black (GM)
	"gm_ge_headgear_m62_cover_wdl",					// 63 Helmet M62 Woodland (GM)
	"gm_ge_headgear_sph4_oli"						// 64 Helmet SPH-4 (GM)
];
_uniforms = [
	"gm_ge_army_uniform_crew_80_oli",			// 0 Tank Suit Olive (GM)
	"gm_ge_army_uniform_soldier_80_oli",		// 1 Field Dress Olive Clean (GM)
	"gm_ge_army_uniform_soldier_80_ols",		// 2 Field Dress Olive (GM)
	"gm_ge_army_uniform_soldier_parka_80_oli",	// 3 Field Parka Olive Clean (GM)
	"gm_ge_army_uniform_soldier_parka_80_ols",	// 4 Field Parka Olive (GM)
	"gm_ge_army_uniform_soldier_parka_80_win",	// 5 Field Parka Winter (GM)
	"gm_ge_bgs_uniform_soldier_80_smp",			// 6 Battle Dress Borderguards (GM)
	"gm_ge_civ_uniform_blouse_80_gry",			// 7 Casual Clothes Grey (GM)
	"gm_ge_dbp_uniform_suit_80_blu",			// 8 Uniform Mailman (GM)
	"gm_ge_ff_uniform_man_80_orn",				// 9 Firefighter Suit (GM)
	"gm_ge_pol_uniform_blouse_80_blk",			// 10 Patrol Uniform Police (GM)
	"gm_ge_pol_uniform_suit_80_grn",			// 11 Service Uniform Police (GM)
	"gm_ge_army_uniform_pilot_oli",				// 12 Flight Suit Olive (GM)
	"gm_ge_army_uniform_pilot_rolled_oli",		// 13 Flight Suit Rolled (GM)
	"gm_ge_army_uniform_pilot_sar",				// 14 Flight Suit Orange (GM)
	"gm_ge_army_uniform_pilot_rolled_sar",		// 14 Flight Suit Orange Rolled (GM)
	"gm_ge_pol_uniform_pilot_grn_ca",			// 15 Flight Suit Green (GM)
	"gm_ge_pol_uniform_pilot_rolled_grn",		// 16 Flight Suit Green Rolled (GM)
	"gm_ge_uniform_soldier_bdu_80_wdl",			// 17 Battle Dress Uniform Woodland (GM)
	"gm_ge_uniform_soldier_bdu_rolled_80_wdl"	// 18 Battle Dress Uniform Woodland Rolled (GM)
];
_vests = [
	"gm_ge_army_vest_80_bag",			// 0 Gasmask-bag (GM)
	"gm_ge_army_vest_80_belt",			// 1 Belt BW (GM)
	"gm_ge_army_vest_80_crew",			// 2 Gear Crew (GM)
	"gm_ge_army_vest_80_demolition",	// 3 Gear Detonator (GM)
	"gm_ge_army_vest_80_leader",		// 4 Gear Leader (GM)
	"gm_ge_army_vest_80_machinegunner",	// 5 Gear Machinegunner (GM)
	"gm_ge_army_vest_80_medic",			// 6 Gear Medic (GM)
	"gm_ge_army_vest_80_mp_wht",		// 7 Gear Military Police (GM)
	"gm_ge_army_vest_80_officer",		// 8 Gear Officer (GM)
	"gm_ge_army_vest_80_rifleman",		// 9 Gear Rifleman (GM)
	"gm_ge_bgs_vest_80_rifleman",		// 10 Gear Borderguards (GM)
	"gm_ge_pol_vest_80_wht"				// 11 Gear Police (GM)
];
_backpacks = [
	"gm_ge_army_backpack_80_oli",		// 0 Infantry Backpack Olive (GM)
	"gm_ge_backpack_satchel_80_blk",	// 1 Satchel Black (GM)
	"gm_ge_backpack_satchel_80_san",	// 2 Satchel Medical (GM)
	"gm_milan_launcher_weaponBag"		// 3 LATGM Tripod (GM)
];
_role = _roles select _role;
_return = [_role,_primaries,_secondaries,_launchers,_voices,_faces,_uniforms,_headgear,_backpacks,_vests] call VVM_fnc_parseRole;
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return]};
{_x = nil} forEach [_debug,_key,_side,_year,_classname,_content,_climates,_camo,_roles,_primaries,_secondaries,_launchers,_voices,_faces,_uniforms,_headgear,_backpacks,_vests,_role];
_return;
