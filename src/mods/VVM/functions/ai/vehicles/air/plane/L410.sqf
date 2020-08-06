_key = "L410"; // https://armedassault.fandom.com/wiki/L-410_UVP
_year = 1971; // https://en.wikipedia.org/wiki/Let_L-410_Turbolet
_sides = [EAST,CIVILIAN];
_name = "L-410";
_factions = ["East Germany"];
_content = ["GM"];
_type = "Transport Plane";
_amphibious = false;
_variants = [
	"gm_gc_airforce_l410t",				// 0 L-410T Transport Plane
	"gm_gc_airforce_l410t_wdl",			// 1 Woodland
	"gm_gc_airforce_l410s_salon",		// 2 L-410S Salon VIP Transport Plane
	"gm_gc_airforce_l410s_salon_wdl",	// 3 Woodland
	"gm_gc_civ_l410s_passenger",		// 4 L-410S Transport Plane
	"gm_gc_civ_l410s_salon"				// 5 L-410S Salon VIP Transport Plane
];
_pylons  = [];
_pylonMagazines = [];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
