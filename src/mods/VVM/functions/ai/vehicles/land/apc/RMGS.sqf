_key = "RMGS"; // https://armedassault.fandom.com/wiki/Rhino_MGS
_year = 1987; // https://en.wikipedia.org/wiki/Rooikat
_sides = [WEST];
_name = "R-MGS";
_factions = ["NATO"];
_content = ["Tank"];
_type = "Tank Destroyer";
_amphibious = false;
_variants = [
	"B_AFV_Wheeled_01_cannon_F",	// 0 Sand
	"B_T_AFV_Wheeled_01_cannon_F",	// 1 Olive
	"B_AFV_Wheeled_01_up_cannon_F",	// 2 Sand
	"B_T_AFV_Wheeled_01_up_cannon_F"// 3 Olive
];
_components = [
	"showCamonetHull",
	"showCamonetTurret",
	"showSLATHull"
];
_textures = [];
_pylons  = [];
_pylonMagazines = [];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
