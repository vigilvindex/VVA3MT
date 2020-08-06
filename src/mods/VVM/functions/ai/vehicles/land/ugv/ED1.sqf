_key = "ED1"; // https://armedassault.fandom.com/wiki/ED-1_Mini_UGV
_year = 2035;
_sides = [WEST,EAST,INDEPENDENT,CIVILIAN];
_name = "ED-1";
_factions = ["NATO","CSAT","AAF","LDF","IDAP"];
_content = ["Contact"];
_type = "UGV / UGCV";
_amphibious = false;
_variants = [
	"B_UGV_02_Demining_F",		// 0
	"B_UGV_02_Science_F",		// 1
	"O_UGV_02_Demining_F",		// 2
	"I_UGV_02_Demining_F",		// 3
	"I_UGV_02_Science_F",		// 4
	"I_E_UGV_02_Demining_F",	// 5
	"I_E_UGV_02_Science_F",		// 6
	"C_IDAP_UGV_02_Demining_F"	// 7
];
_pylons  = [];
_pylonMagazines = [];
_insigniaNations = [];
_return = [_variants,_pylons,_pylonMagazines,_insigniaNations];
_return;
