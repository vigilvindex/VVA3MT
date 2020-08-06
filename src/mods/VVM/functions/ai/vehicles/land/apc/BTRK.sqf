_key = "BTRK"; // https://armedassault.fandom.com/wiki/BTR-K_Kamysh
_year = 2011; // https://en.wikipedia.org/wiki/BMPT_Terminator
_sides = [EAST];
_name = "BTR-K";
_factions = ["CSAT"];
_content = ["Vanilla","Apex"];
_type = "Infantry Fighting Vehicle";
_amphibious = false;
_variants = [
	"O_APC_Tracked_02_cannon_F",		// 0 Hex
	"O_T_APC_Tracked_02_cannon_ghex_F"	// 1 Green Hex
];
_components = [
	"showTracks",
	"showCamonetHull",
	"showBags",
	"showSLATHull"
];
_textures = [];
_pylons  = [];
_pylonMagazines = [];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
