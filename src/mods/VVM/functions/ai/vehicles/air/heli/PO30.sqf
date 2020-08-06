_key = "PO30"; // https://armedassault.fandom.com/wiki/PO-30_Orca
_year = 1998; // https://en.wikipedia.org/wiki/Kamov_Ka-60
_sides = [EAST];
_name = "PO-30";
_factions = ["CSAT"];
_content = ["Vanilla"];
_type = "Light Utility Helicopter";
_amphibious = false;
_variants = [
	"O_Heli_Light_02_dynamicLoadout_F",	// 0 Hex
	"O_Heli_Light_02_F",				// 1 Hex
	"O_Heli_Light_02_unarmed_F",		// 2 Black
	"O_Heli_Light_02_v2_F"				// 3 Black
];
_pylons  = [
	"PylonLeft1",
	"PylonRight1"
];
_pylonMagazines = [
	"PylonRack_1Rnd_AAA_missiles",
	"PylonRack_1Rnd_LG_scalpel",
	"PylonRack_12Rnd_PG_missiles",
	"PylonRack_12Rnd_missiles",
	"PylonWeapon_300Rnd_20mm_shells",
	"PylonWeapon_2000Rnd_65x39_belt",
	"PylonRack_19Rnd_Rocket_Skyfire"
];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
