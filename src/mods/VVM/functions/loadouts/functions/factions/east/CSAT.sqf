_name = "CSAT"; // FACTION TITLE https://armedassault.fandom.com/wiki/CSAT
_side = EAST; // FACTION SIDE
_year = 2035; // FACTION YEAR
_classname = "OPF_F"; // FACTION CLASSNAME
_content = ["Vanilla","Tanoa","Mark"]; // FACTION CONTENT = Vanilla; DLC: TANOA,TANKS,MARKS,GM; MODS: CUP,RHS,BAF;
_climates = [0,1,2]; // "Arid","Urban","Lush": _environment selectRandom _environments; _uniform + _environment;
_traits = [0,0,0,0]; // [ENG,EXP,MED,UAV] 0 = OFF, 1 = ON.
_roles = ["co","sl","ftl","r","rat","gre","ar","aar","mmg","mmga","hmg","hmga","mat","mata","hat","hata","mrt","mrta","msam","msama","hsam","hsama","dm","sn","sp","med","eng","engm","eod","uav","div","car","smg","vc","vg","vd","p"]; // FACTION ROLES
_voices = ["Male01PER","Male02PER","Male03PER"]; // FACTION VOICES
_faces = ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"/*,"PersianHead_A3_04_a","PersianHead_A3_04_l","PersianHead_A3_04_sa"*/]; // FACTION FACES
_uniforms = [	"U_O_CombatUniform_ocamo","U_O_CombatUniform_oucamo","U_O_T_Soldier_F","U_O_SpecopsUniform_ocamo", // BASE _uniforms select 0;
				"U_O_OfficerUniform_ocamo","U_O_T_Officer_F",  // CO _uniforms select 4;
				"U_O_FullGhillie_ard","U_O_FullGhillie_sard","U_O_FullGhillie_lsh","U_O_T_FullGhillie_tna_F", // SN _uniforms select 6;
				"U_O_GhillieSuit","U_O_T_Sniper_F", // SP _uniforms select 10;
				"U_O_PilotCoveralls","U_O_Wetsuit","U_B_Wetsuit", // DIV _uniforms select 13; P _uniforms select 12;
				"U_O_V_Soldier_Viper_hex_F","U_O_V_Soldier_Viper_F"]; // FACTION UNIFORMS
_headgear = [	"H_HelmetO_ocamo","H_HelmetO_oucamo","H_HelmetO_ghex_F", // BASE _headgear select 0;
				"H_HelmetLeaderO_ocamo","H_HelmetLeaderO_oucamo","H_HelmetLeaderO_ghex_F",
				"H_HelmetSpecO_blk","H_HelmetSpecO_ocamo","H_HelmetSpecO_ghex_F",
				"H_Beret_blk","H_Beret_CSAT_01_F", // CO _headgear select 10;
				"H_HelmetCrew_O","H_HelmetCrew_O_ghex_F","H_CrewHelmetHeli_O",
				"H_PilotHelmetHeli_O","H_PilotHelmetHeli_B","H_PilotHelmetFighter_O", // P _headgear select 10;
				"H_Cap_brn_SPECOPS","H_MilCap_ocamo","H_MilCap_ghex_F",
				"H_HelmetO_ViperSP_hex_F","H_HelmetO_ViperSP_ghex_F"]; // FACTION HEADGEAR
_backpacks = [	"B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_ghex_F","B_FieldPack_blk", // BASE _backpacks select 0;
				"B_AssaultPack_blk","B_AssaultPack_ocamo","B_Carryall_ocamo","B_Carryall_oucamo","B_Carryall_ghex_F", // MED _backpacks select 6;
				"O_AA_01_weapon_F","O_AT_01_weapon_F", // AA _backpacks select 0; AT_backpacks select 0;
				"O_GMG_01_weapon_F","O_GMG_01_high_weapon_F","O_GMG_01_A_weapon_F", // MK32 GMG - NORMAL, RAISED, AUTO _backpacks select 0;
				"O_HMG_01_weapon_F","O_HMG_01_high_weapon_F","O_HMG_01_A_weapon_F", // MK30 HMG - NORMAL, RAISED, AUTO _backpacks select 0;
				"O_HMG_01_support_F","O_HMG_01_support_high_F", // TRIPOD - NORMAL, RAISED _backpacks select 0;
				"O_Mortar_01_support_F","O_Mortar_01_weapon_F", // MK6 - BIPOD _backpacks select 0; TUBE _backpacks select 0;
				"O_UAV_01_backpack_F","B_Bergen_hex_F", // UAV _backpacks select 0;
				"B_TacticalPack_blk","B_TacticalPack_ocamo","B_TacticalPack_oucamo","B_TacticalPack_oli","B_TacticalPack_rgr",
				"B_ViperHarness_blk_F","B_ViperHarness_hex_F","B_ViperHarness_ghex_F","B_ViperHarness_khk_F","B_ViperHarness_oli_F",
				"B_ViperLightHarness_blk_F","B_ViperLightHarness_hex_F","B_ViperLightHarness_ghex_F","B_ViperLightHarness_khk_F","B_ViperLightHarness_oli_F"]; // FACTION BACKPACKS
_vests = [		"V_HarnessO_brn","V_HarnessO_gry","V_HarnessO_ghex_F", // BASE _vests select 0;
				"V_HarnessOGL_brn","V_HarnessOGL_gry","V_HarnessOGL_ghex_F", // GRE _vests select 3;
				"V_BandollierB_khk","V_BandollierB_blk","V_BandollierB_ghex_F","V_BandollierB_rgr","V_BandollierB_oli","V_BandollierB_cbr",
				"V_Chestrig_khk","V_Chestrig_blk","V_Chestrig_rgr","V_Chestrig_oli",
				"V_RebreatherIR","V_RebreatherB", // DIV _vest select 16;
				"V_TacVest_khk","V_TacVest_blk","V_TacVest_oli","V_TacVest_brn","V_TacVestIR_blk",
				"V_PlateCarrier1_rgr_noflag_F","V_PlateCarrier2_rgr_noflag_F","V_Rangemaster_belt"]; // FACTION VESTS
_primaries = ["KATIBA","KATIBA-CARBINE","CAR-95","CMR-76","RAHIM","ASP-1","CAR-95-1","ZAFIR","NAVID","CYRUS","MAR-10","M320","GM6-LYNX","STING","SDAR"]; // FACTION PRIMARY WEAPONS
_secondaries = ["ROOK-40","ZUBR"]; // FACTION SECONDARY WEAPONS
_launchers = ["RPG-42","TITAN-COMPACT","TITAN","9M135-VORONA"]; // FACTION LAUNCHER WEAPONS
_roles = [ // ROLE, TRAITS, VOICE, FACE, UNIFORM, HEADGEAR, BACKPACK, VEST, NVG, FACEWEAR, BINOCULAR, TERMINAL, PRIMARY, SECONDARY, LAUNCHER, MEDICAL, CHEMLIGHTS, SMOKES, GRENADES, EXPLOSIVES, MINES, COMPASS, MAP, WATCH, RADIO, TOOLS
	["co",		-1,			selectRandom _voices,	selectRandom _faces,	4,	10,	-1,	-1,	0,	-1,	0,	0,	0,	1,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["sl",		-1,			selectRandom _voices,	selectRandom _faces,	0,	9,	-1,	-1,	0,	-1,	0,	0,	0,	1,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["ftl",		-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["med",		[0,0,1,0],	selectRandom _voices,	selectRandom _faces,	0,	0,	6,	-1,	0,	-1,	0,	0,	0,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["eng",		[1,0,0,0],	selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["engm",	[0,1,0,0],	selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["eod",		[1,1,0,0],	selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["uav",		[0,0,0,1],	selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["r",		-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["rat",		-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["ar",		-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["aar",		-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["mat",		-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["mata",	-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["hat",		-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["hata",	-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["mmg",		-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	2,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["mmga",	-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["hmg",		-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	3,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["hmga",	-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["msam",	-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	2,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["msama",	-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["hsam",	-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	2,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["hsama",	-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["mrt",		-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["mrta",	-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["gre",		-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["dm",		-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	1,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["sn",		-1,			selectRandom _voices,	selectRandom _faces,	6,	0,	-1,	-1,	0,	-1,	0,	0,	5,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["sp",		-1,			selectRandom _voices,	selectRandom _faces,	10,	0,	-1,	-1,	0,	-1,	0,	0,	4,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["div",		-1,			selectRandom _voices,	selectRandom _faces,	13,	-1,	-1,	16,	4,	-1,	0,	0,	7,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["vc",		-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	6,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["vd",		-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	6,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["vg",		-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	6,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["p",		-1,			selectRandom _voices,	selectRandom _faces,	12,	10,	-1,	-1,	0,	-1,	0,	0,	6,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["car",		-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	0,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0],
	["smg",		-1,			selectRandom _voices,	selectRandom _faces,	0,	0,	-1,	-1,	0,	-1,	0,	0,	6,	0,	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0]
];  // FACTION ROLES
_role = 0; _result = _roles select _role; // SELECT FACTION ROLE
{ /* Expand SCALAR to STRINGS. */ } forEach _result;
_result;