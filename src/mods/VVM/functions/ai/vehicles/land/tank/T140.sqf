_key = "T140"; // https://armedassault.fandom.com/wiki/T-140_Angara
_year = 2015; // https://en.wikipedia.org/wiki/T-14_Armata
_sides = [EAST];
_name = "T-140";
_factions = ["CSAT"];
_content = ["Tanks"];
_type = "Main Battle Tank";
_amphibious = false;
_variants = [
	"O_MBT_04_cannon_F",	// 0 Hex
	"O_T_MBT_04_cannon_F",	// 1 Green Hex
	"O_MBT_04_command_F",	// 2 Hex
	"O_T_MBT_04_command_F"	// 3 Green Hex
];
_components = [
	"showCamonetHull",
	"showCamonetTurret"
];
_pylons  = [];
_pylonMagazines = [];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
