/* Name: NATO.sqf
 * Description: Faction Definition for NATO.
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
 * Usage: _co = [] call compile preprocessFileLineNumbers "NATO.sqf";
 * Developer Notes:
 * 	Faction role definition array uses "-1" to indicate to the set loadout function skip that element.
 * 	Voice and face are selected randomly, and only applied to AI via a switch in the set loadout function.
 * TODO: Switches for climate, stealth, day or night gear.
 */
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false;};
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false;};
private ["_key","_side","_year","_classname","_content","_climates","_camo","_roles","_primaries","_secondaries","_launchers","_voices","_faces","_uniforms","_headgear","_backpacks","_vests","_rolekeys","_role","_return"];
_key = "NATO"; // FACTION KEY https://armedassault.fandom.com/wiki/IDAP
_side = WEST; // FACTION SIDE
_year = 2035; // FACTION YEAR
_classname = "BLU_F"; // FACTION CLASSNAME
_content = ["Vanilla","Tanoa","Mark","GM"]; // FACTION CONTENT = Vanilla; DLC: TANOA,TANKS,MARKS,GM; MODS: CUP,RHS,BAF,IFA3,GEIST;
_climates = [0,1,2]; // "Arid","Urban","Lush": _environment selectRandom _environments; _uniform + _environment;
_camo = ["MTP","Tropic","Woodland"];
_voice = floor random 12;
_face = floor random 20;
_roles = [ // FACTION ROLES: INDEX ROLE TRAITS VOICE FACE UNIFORM HEADGEAR BACKPACK VEST NVG FACEWEAR BINOCULAR TERMINAL PRIMARY													SECONDARY												LAUNCHER									MEDICAL 		CHEMLIGHTS 					SMOKES 					   GRENADES 	  EXPLOSIVES 	 MINES 						COMPASS MAP WATCH RADIO TOOLS
/*0*/	["co",		0,	_voice,	_face,	0,	0,	0,	0,	-1,	-1,	1,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]], -1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*1*/	["sl",		0,	_voice,	_face,	0,	1,	3,	0,	-1,	-1,	1,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*2*/	["ftl",		0,	_voice,	_face,	0,	2,	3,	0,	-1,	-1,	1,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*3*/	["med",		1,	_voice,	_face,	0,	2,	7,	0,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,											[[0,10],[1,1]],	[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*4*/	["eng",		2,	_voice,	_face,	0,	2,	7,	9,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],[[1,1]]],
/*5*/	["engm",	3,	_voice,	_face,	0,	2,	7,	9,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 [[0,1],[1,1],[2,1],[3,1],[4,1],[5,1]],	0,0,0,[[0,1]],[[0,1],[1,1]]],
/*6*/	["eod",		4,	_voice,	_face,	0,	2,	7,	9,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], [[0,2],[1,1]], -1,									0,0,0,[[0,1]],[[0,1]]],
/*7*/	["uav",		5,	_voice,	_face,	0,	2,	21,	0,	-1,	-1,	0,	1,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*8*/	["r",		0,	_voice,	_face,	0,	2,	3,	0,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*9*/	["rat",		0,	_voice,	_face,	0,	2,	3,	0,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		[[0,0,[[0,2]],-1,-1,-1,-1,-1,-1,-1]],		[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*10*/	["ar",		0,	_voice,	_face,	0,	2,	3,	0,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*11*/	["aar",		0,	_voice,	_face,	0,	2,	3,	0,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]],[1,-1,[[1,5]],-1,-1,-1,-1,-1,-1,-1,-1]],	[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*12*/	["mat",		0,	_voice,	_face,	0,	2,	3,	0,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		[[0,0,[[0,2],[1,2]],-1,-1,-1,-1,-1,-1,-1]],	[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*13*/	["mata",	0,	_voice,	_face,	0,	2,	7,	0,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		[[0,-1,[[0,2],[1,2]],-1,-1,-1,-1,-1,-1,-1]],[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*14*/	["hat",		0,	_voice,	_face,	0,	2,	20,	0,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		[[0,0,[[0,2],[1,2]],-1,-1,-1,-1,-1,-1,-1]],	[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*15*/	["hata",	0,	_voice,	_face,	0,	2,	9,	0,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		[[0,-1,[[0,2],[1,2]],-1,-1,-1,-1,-1,-1,-1]],[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*16*/	["mmg",		0,	_voice,	_face,	0,	2,	3,	0,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*17*/	["mmga",	0,	_voice,	_face,	0,	2,	7,	0,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*18*/	["hmg",		0,	_voice,	_face,	0,	2,	11,	0,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*19*/	["hmga",	0,	_voice,	_face,	0,	2,	9,	0,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*20*/	["msam",	0,	_voice,	_face,	0,	2,	3,	0,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*21*/	["msama",	0,	_voice,	_face,	0,	2,	7,	0,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*22*/	["hsam",	0,	_voice,	_face,	0,	2,	19,	0,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*23*/	["hsama",	0,	_voice,	_face,	0,	2,	9,	0,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*24*/	["mrt",		0,	_voice,	_face,	0,	2,	17,	0,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*25*/	["mrta",	0,	_voice,	_face,	0,	2,	18,	0,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*26*/	["gre",		0,	_voice,	_face,	0,	2,	3,	9,	-1,	-1,	0,	0,	[[1,4,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*27*/	["dm",		0,	_voice,	_face,	0,	2,	3,	0,	-1,	-1,	1,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*28*/	["sn",		0,	_voice,	_face,	9,	6,	3,	0,	-1,	-1,	1,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*29*/	["sp",		0,	_voice,	_face,	6,	6,	3,	0,	-1,	-1,	1,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*30*/	["div",		0,	_voice,	_face,	17,	-1,	0,	12,	-1,	0,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*31*/	["vc",		0,	_voice,	_face,	0,	2,	0,	-1,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*32*/	["vd",		0,	_voice,	_face,	0,	2,	0,	-1,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*33*/	["vg",		0,	_voice,	_face,	0,	2,	0,	-1,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*34*/	["p",		0,	_voice,	_face,	16,	27,	23,	-1,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[1,0,[[0,2]],-1,-1,-1,-1,[[0,1]],-1,[[0,1]],[[0,1]]]],	-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*35*/	["car",		0,	_voice,	_face,	0,	2,	3,	0,	-1,	-1,	0,	0,	[[1,7,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1],
/*36*/	["smg",		0,	_voice,	_face,	0,	2,	3,	0,	-1,	-1,	0,	0,	[[1,1,[[1,5]],[[1,5]],-1,-1,-1,[[0,1]],[[1,1]],[[1,1]],[[2,1]]]],											[[0,0,[[0,2]],[[0,0]],-1,-1,-1,-1,-1,[[0,1]],-1]],		-1,											[[0,1]],		[[0,1],[1,1],[2,1],[3,1]],	[[0,2],[1,2],[2,2],[4,2]], [[0,2],[1,2]], -1,			 -1,									0,0,0,[[0,1]],-1]
];
_primaries = [	// FACTION PRIMARY WEAPONS
	"VERMIN",	// 0 SMG
	"MX",		// 1 AR
	"SPAR16",	// 2 AR
	"MXSW",		// 3 LSW
	"SPAR16S",	// 4 LSW
	"SPMG",		// 5 HMG
	"MXM",		// 6 DMR
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
_role = _roles select _this; // SELECT FACTION ROLE
_return = [_role,_primaries,_secondaries,_launchers,_voices,_faces,_uniforms,_headgear,_backpacks,_vests] call VVM_fnc_parseRole; // Parse Role Array.
{_x = nil} forEach [_key,_side,_year,_classname,_content,_climates,_camo,_roles,_primaries,_secondaries,_launchers,_voices,_faces,_uniforms,_headgear,_backpacks,_vests,_role];
_return;
