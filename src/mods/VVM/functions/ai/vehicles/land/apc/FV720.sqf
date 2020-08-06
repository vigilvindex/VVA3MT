_key = "FV720"; // https://armedassault.fandom.com/wiki/FV-720_Mora
_year = 1984; // https://en.wikipedia.org/wiki/Warrior_tracked_armoured_vehicle
_sides = [INDEPENDENT];
_name = "FV-720";
_factions = ["AAF","LDF"];
_content = ["Vanilla","Contact"];
_type = "Infantry Fighting Vehicle";
_amphibious = false;
_variants = [
	"I_APC_tracked_03_cannon_F",	// 0 Digital Green
	"I_E_APC_tracked_03_cannon_F"	// 1 Geometric
];
_components = [
	"showBags",
	"showBags2",
	"showCamonetHull",
	"showCamonetTurret",
	"showTools",
	"showSLATHull",
	"showSLATTurret"
];
_textures = [];
_pylons  = [];
_pylonMagazines = [];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
