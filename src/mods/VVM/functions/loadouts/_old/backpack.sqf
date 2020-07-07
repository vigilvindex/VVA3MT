// ================================
// COMMAND
// ================================

// BACKPACK: PLATOON MEDIC
case "plm": {
	[_bagday,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addItemCargoGlobal [_medkit,1];
	(unitBackpack _unit) addItemCargoGlobal [_firstaid, 20];
};

// BACKPACK: UAV
case "uav": {
	[_baguav,_unit] call f_fnc_addBackpack;
};
// BACKPACK: UAV MEDICAL
case "uavm": {
	[_bagMedUav,_unit] call f_fnc_addBackpack;
};

// BACKPACK: UAV LOGISTICS
case "uavl": {
	[_bagUtilUav,_unit] call f_fnc_addBackpack;
};

case "fo": {
	[_bagremote, _unit] call f_fnc_addBackpack;
};

// ================================
// INFANTRY
// ================================

// BACKPACK: SECTION IC
case "sl": {
	[_bagsmall,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 4];
	(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 2];
	(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade,2];
	(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadealt,2];
	(unitBackpack _unit) addItemCargoGlobal [_firstaid, 4];
};

case "sl_l": {
	[_bagsmall,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 4];
	(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 2];
	(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade,2];
	(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadealt,2];
	(unitBackpack _unit) addItemCargoGlobal [_firstaid, 4];
	(unitBackpack _unit) addMagazineCargoGlobal [_ARmag, 1];
};

// BACKPACK: SECTION FTL (Rifle Version)
case "ftlr": {
	[_bagsmall,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 4];
	(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 2];
	(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade,2];
	(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadealt,2];
	(unitBackpack _unit) addItemCargoGlobal [_firstaid, 4];
};

// BACKPACK: SECTION FTL (Grenadier Version)
case "ftlg": {
	[_bagsmall,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 2];
	(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 2];
	(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade,2];
	(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadealt,2];
	(unitBackpack _unit) addItemCargoGlobal [_firstaid, 2];
	(unitBackpack _unit) addMagazineCargoGlobal [_glmag, 5];
	(unitBackpack _unit) addMagazineCargoGlobal [_glsmoke, 4];
	(unitBackpack _unit) addMagazineCargoGlobal [_glsmokealt2, 2];
	(unitBackpack _unit) addMagazineCargoGlobal [_glflare,2];
	(unitBackpack _unit) addMagazineCargoGlobal [_glflarealt,2];
};

// BACKPACK: MEDIC
case "m": {
	[_bagsmall,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addItemCargoGlobal [_medkit,1];
	(unitBackpack _unit) addItemCargoGlobal [_firstaid, 10];
};

// BACKPACK: COMBAT LIFE SAVER
case "cls": {
	[_bagsmall,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addItemCargoGlobal [_firstaid, 10];
};

// BACKPACK: GRENADIER
case "g": {
	[_bagsmall,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addMagazineCargoGlobal [_glmag, 5];
	(unitBackpack _unit) addMagazineCargoGlobal [_glsmoke, 4];
	(unitBackpack _unit) addMagazineCargoGlobal [_glsmokealt2, 2];
	(unitBackpack _unit) addMagazineCargoGlobal [_glflare,2];
	(unitBackpack _unit) addMagazineCargoGlobal [_glflarealt,2];
};

// BACKPACK: RIFLEMAN AT (RAT)
case "rat": {
	[_bagsmall,_unit] call f_fnc_addBackpack;
	if (!isNil "_RATmag") then { (unitBackpack _unit) addMagazineCargoGlobal [_RATmag, 3]; };	// HEAT
	if (!isNil "_RATmag") then { (unitBackpack _unit) addMagazineCargoGlobal [_RATmag2, 1]; };	// HE
};

// BACKPACK: RIFLEMAN AT (RAT)
case "rat_pcml": {
	[_bagsmall,_unit] call f_fnc_addBackpack;
	if (!isNil "_RATmag") then { (unitBackpack _unit) addMagazineCargoGlobal [_RATmag, 3]; };	// HEAT
};

// BACKPACK: AUTORIFLEMAN
case "ar": {
	[_bagsmall,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addMagazineCargoGlobal [_ARmag, 2];
	(unitBackpack _unit) addMagazineCargoGlobal [_ARmag_Tr, 1];
};

// BACKPACK: AAR
case "aar": {
	[_bagmedium,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addMagazineCargoGlobal [_ARmag, 2];
	(unitBackpack _unit) addMagazineCargoGlobal [_ARmag_tr, 2];
};

// BACKPACK: AMMOBEARER
case "ammo": {
	[_baglarge,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 6];
	(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 4];
	(unitBackpack _unit) addMagazineCargoGlobal [_glmag, 4];
	(unitBackpack _unit) addMagazineCargoGlobal [_glsmoke, 2];
	(unitBackpack _unit) addMagazineCargoGlobal [_glflare, 2];
	(unitBackpack _unit) addMagazineCargoGlobal [_ARmag_tr, 2];
	(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
	(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadealt, 2];
	if (!isNil "_RATmag") then { (unitBackpack _unit) addMagazineCargoGlobal [_RATmag, 1]; }; // RHS Single shot RPGs
};

// BACKPACK: DESIGNATED MARKSMAN (DM) UNUSED
case "dm": {
	[_bagsmall,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addMagazineCargoGlobal [_DMriflemag, 2];
};

// ================================
// SUPPORT
// ================================

// BACKPACK: MORTAR GUNNER (MTRG)
case "mtrg": {
	[_bagmtrg,_unit] call f_fnc_addBackpack;
};

// BACKPACK: MORTAR ASSISTANT GUNNER (MTRAG)
case "mtrag": {
	[_bagmtrag,_unit] call f_fnc_addBackpack;
};

// BACKPACK: MMG GUNNER (MMG)
case "mmgg": {
	[_bagmedium,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag, 1];
	(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag_tr, 1];
};

// BACKPACK: MMG ASSISTANT GUNNER (MMGAG)
case "mmgag": {
	[_bagmedium,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag, 2];
	(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag_tr, 2];
};

// BACKPACK: HEAVY MG GUNNER (HMGG)
case "hmgg": {
	[_baghmgg,_unit] call f_fnc_addBackpack;
};

// BACKPACK: HEAVY MG ASSISTANT GUNNER (HMGAG)
case "hmgag": {
	[_baghmgag,_unit] call f_fnc_addBackpack;
};
// BACKPACK: MAT GUNNER (MATG)
case "matg": {
	[_bagmedium,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addMagazineCargoGlobal [_MATmag1, 2];
};

// BACKPACK: MAT ASSISTANT (MATAG)
case "matag": {
	[_baglarge,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addMagazineCargoGlobal [_MATmag1, 3];
};

// LOADOUT: HEAVY AT GUNNER (HATG)
case "hatg": {
	[_baghatg,_unit] call f_fnc_addBackpack;
};

// LOADOUT: HEAVY AT ASSISTANT GUNNER (HATAG)
case "hatag": {
	[_baghatag,_unit] call f_fnc_addBackpack;
};

// BACKPACK: MEDIUM SAM GUNNER (MSAMG)
case "msamg": {
	[_baglarge,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addMagazineCargoGlobal [_SAMmag, 3];
};

// BACKPACK: MEDIUM SAM ASSISTANT GUNNER (MSAMAG)
case "msamag": {
	[_baglarge,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addMagazineCargoGlobal [_SAMmag, 3];
};

// BACKPACK: HEAVY SAM GUNNER (HSAMG)
case "hsamg": {
	[_baghsamg,_unit] call f_fnc_addBackpack;
};

// BACKPACK: HEAVY SAM ASSISTANT GUNNER (HSAMAG)
case "hsamag": {
	[_baghsamag,_unit] call f_fnc_addBackpack;
};

// ================================
// CREW
// ================================
// BACKPACK: CREW CHIEFS & VEHICLE DRIVERS
case "para": {
	["B_Parachute",_unit] call f_fnc_addBackpack;
};

// BACKPACK: CREW CHIEFS & VEHICLE DRIVERS
case "cc": {
	[_bagsmall,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
};

// ================================
// ENGINEERING
// ================================

// BACKPACK: ENGINEER (DEMO)
case "eng": {
	[_bagsmall,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
	(unitBackpack _unit) addItemCargoGlobal [_satchel,3];
};

case "exp": {
	[_bagday,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
	(unitBackpack _unit) addItemCargoGlobal ["SatchelCharge_Remote_Mag",1];
	(unitBackpack _unit) addItemCargoGlobal [_satchel,3];
};

// BACKPACK: ENGINEER (MINES)
case "engm": {
	[_baglarge,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
	(unitBackpack _unit) addMagazineCargoGlobal [_ATmine,2];
};

// ================================
// DIVERS
// ================================

// BACKPACK: DESIGNATED MARKSMAN (DM) UNUSED
case "dtl": {
	[_bagmediumdiver,_unit] call f_fnc_addBackpack;
};

case "div": {
	[_bagmediumdiver,_unit] call f_fnc_addBackpack;
};

case "divm": {
	[_bagmediumdiver,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addItemCargoGlobal [_medkit,1];
	(unitBackpack _unit) addItemCargoGlobal [_firstaid, 6];
};

case "dexp": {
	[_bagmediumdiver,_unit] call f_fnc_addBackpack;
	(unitBackpack _unit) addItemCargoGlobal [_satchel,3];
};

// ================================
// OTHERS
// ================================
// OTHERS
case "small": {
	[_bagsmall,_unit] call f_fnc_addBackpack;
};

case "medium": {
	[_bagmedium,_unit] call f_fnc_addBackpack;
};

case "large": {
	[_baglarge,_unit] call f_fnc_addBackpack;
};
