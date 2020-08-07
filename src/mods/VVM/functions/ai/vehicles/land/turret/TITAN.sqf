_key = "TITAN"; // https://armedassault.fandom.com/wiki/Static_Titan_Launcher
_year = 1997; // https://en.wikipedia.org/wiki/Spike_(missile)
_sides = [WEST,EAST,INDEPENDENT];
_name = "TITAN";
_factions = ["NATO","CSAT","AAF","LDF"];
_content = ["Vanilla","Apex","Contact"];
_type = "Missile Launcher";
_amphibious = false;
_variants = [
	"B_static_AT_F",		// 0 Sand
	"B_T_Static_AT_F",		// 1 Olive
	"O_static_AT_F",		// 2 Tan
	"I_static_AT_F",		// 3 Green
	"B_static_AA_F",		// 4 Sand
	"B_T_Static_AA_F",		// 5 Olive
	"O_static_AA_F",		// 6 Hex
	"I_static_AA_F",		// 7 Digital Green
	"I_E_Static_AA_F"		// 8 Geometric
];
_pylons  = [];
_pylonMagazines = [];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
