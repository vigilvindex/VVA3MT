_key = "MI48"; // https://armedassault.fandom.com/wiki/Mi-48_Kajman
_year = 1982; // https://en.wikipedia.org/wiki/Mil_Mi-28
_sides = [EAST];
_name = "Mi-48";
_factions = ["CSAT"];
_content = ["Vanilla"];
_type = "Heavy Attack Helicopter";
_amphibious = false;
_variants = [
	"O_Heli_Attack_02_dynamicLoadout_black_F",	// 0 Black
	"O_Heli_Attack_02_dynamicLoadout_F",		// 1 Hex
	"O_Heli_Attack_02_black_F",					// 2 Black
	"O_Heli_Attack_02_F"						// 3 Hex
];
_pylons  = [
	"PylonLeft1",
	"PylonLeft2",
	"PylonRight2",
	"PylonRight1"
];
_pylonMagazines = [
	"PylonMissile_1Rnd_LG_scalpel",
	"PylonRack_3Rnd_LG_scalpel",
	"PylonRack_4Rnd_LG_scalpel",
	"PylonWeapon_300Rnd_20mm_shells",
	"PylonRack_20Rnd_Rocket_03_HE_F",
	"PylonRack_20Rnd_Rocket_03_AP_F",
	"PylonRack_19Rnd_Rocket_Skyfire",
	"PylonRack_1Rnd_Missile_AA_03_F",
	"PylonRack_1Rnd_Missile_AGM_01_F",
	"PylonMissile_1Rnd_Bomb_03_F",
	"PylonMissile_1Rnd_BombCluster_02_F"
];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
