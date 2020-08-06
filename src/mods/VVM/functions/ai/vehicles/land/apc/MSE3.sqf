_key = "MSE3"; // https://armedassault.fandom.com/wiki/MSE-3_Marid
_year = 2010; // https://en.wikipedia.org/wiki/Otokar_Arma
_sides = [EAST];
_name = "MSE-3";
_factions = ["CSAT"];
_content = ["Vanilla","Apex"];
_type = "Armoured Personnel Carrier";
_amphibious = true;
_variants = [
	"O_APC_Wheeled_02_rcws_v2_F",		// 0 Hex
	"O_T_APC_Wheeled_02_rcws_v2_ghex_F",// 1 Green Hex
	"O_APC_Wheeled_02_rcws_F",			// 2 Hex
	"O_T_APC_Wheeled_02_rcws_ghex_F"	// 3 Green Hex
];
_components = [
	"showBags",
	"showCanisters",
	"showTools",
	"showCamonetHull",
	"showSLATHull"
];
_textures = [];
_pylons  = [];
_pylonMagazines = [];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
