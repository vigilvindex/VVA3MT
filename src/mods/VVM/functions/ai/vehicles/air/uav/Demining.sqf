_key = "Demining"; // https://armedassault.fandom.com/wiki/Demining_Drone
_year = 2035;
_sides = [CIVILIAN];
_name = "Demining Drone";
_factions = ["IDAP"];
_content = ["Orange"];
_type = "Small UAV";
_amphibious = false;
_variants = [
	"C_IDAP_UAV_06_antimine_F" // 0
];
_pylons  = [
	"pylons1" // 0
];
_pylonMagazines = [
	"PylonRack_4Rnd_BombDemine_01_F",		// 0
	"PylonRack_4Rnd_BombDemine_01_Dummy_F"	// 1
];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
