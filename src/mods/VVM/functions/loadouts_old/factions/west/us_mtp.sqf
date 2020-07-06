// F3 - Folk ARPS Assign Gear Script - NATO
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ================================
// GENERAL EQUIPMENT USED BY MULTIPLE CLASSES
// ATTACHMENTS - PRIMARY

// ================================
// EASY BOOLEANS
// A set of toggles for standard changes
// ================================

_stealth_bool = False;
_gpsBool = False;
_nvgBool = False;
_flashBool = False;

// ================================
// ATTACHMENTS
// ================================
_scope_frontline = ["optic_Hamr", "optic_ACO", "optic_Holosight"]; // Standard choice for infantry - give them the chance for med range.
_scope_support = ["optic_ACO", "optic_Holosight"]; // Support infantry don't get extra options
_scope_dm = ["optic_SOS", "optic_AMS_snd", "optic_Hamr"]; // Designated Marksman Night
_scope_sniper = ["optic_LRPS"]; // Sniper

_attachSide = ["acc_pointer_IR","acc_flashlight"];
if (_flashBool) then {
	_attachSide = ["acc_flashlight"];
};

_flashHider = "";
_silencerStd = "muzzle_snds_H_snd_F"; // 6.5 silencer (black)
_silencerAr = "muzzle_snds_H_snd_F"; // 6.5 silencer (black)
_silencerDm = "muzzle_snds_H_snd_F"; // 6.5 silencer (black)

_bipod1 = ["bipod_01_F_snd"];

// ATTACHMENTS - HANDGUN
_hg_silencer1 = "muzzle_snds_L";
_hg_scope1 = "";

// Default setup
_attachments = [_attachSide, _scope_frontline]; // The default attachment set for most units, overwritten in the individual unitType

// Predefined Class Attachment Setup
_attach_mg = [_attachSide, _scope_frontline, _bipod1]; // MMG
_attach_ar = [_attachSide, _scope_frontline, _bipod1];	// Autorifle
_attach_dm = [_attachSide, _scope_dm, _bipod1];		// Designated Marksman
_attach_sp = [_attachSide, _scope_support];			// "Support" Roles
_attach_sn = [_scope_sniper, _bipod1];				// Snipers

_attach_recon = [_attachSide, _scope_frontline, _silencerStd];
_attach_recon_dm = [_attachSide, _scope_dm, _bipod1, _silencerDm];
_attach_none = [];

// Default setup
_hg_attachments= []; // The default attachment set for handguns, overwritten in the individual unitType


// ================================
// WEAPONS
// ================================

// Basic magazine counts given to most infantry, MMG etc get _defMags_tr as default count.
_defMags = 6;
_defMags_tr = 2;

// Standard-Issue Pistol (All Units)
_pistol = "hgun_P07_F";
_pistolmag = "16Rnd_9x21_Mag";

// Standard-issue Rifle (All front-line roles)
_rifle = ["arifle_MX_F"];
_riflemag = "30Rnd_65x39_caseless_mag";
_riflemag_tr = "30Rnd_65x39_caseless_mag_Tracer";

// Standard-issue Carbine (All support roles)
_carbine = ["arifle_MXC_F"];
_carbinemag = "30Rnd_65x39_caseless_mag";
_carbinemag_tr = "30Rnd_65x39_caseless_mag_Tracer";

// Rifle with GL and HE grenades (CO, DC, FTLs)
_glrifle = ["arifle_MX_GL_F"];
_glriflemag = "30Rnd_65x39_caseless_mag";
_glriflemag_tr = "30Rnd_65x39_caseless_mag_Tracer";
_glmag = "1Rnd_HE_Grenade_shell";

// Smoke for FTLs, Squad Leaders, etc
_glsmoke = "1Rnd_Smoke_Grenade_shell";
_glsmokealt1 = "1Rnd_SmokeBlue_Grenade_shell";
_glsmokealt2 = "1Rnd_SmokeOrange_Grenade_shell";

// Flares for FTLs, Squad Leaders, etc
_glflare = "UGL_FlareWhite_F";
_glflarealt = "UGL_FlareRed_F";
_glflarealt2 = "UGL_FlareGreen_F";
_glflarealt3 = "UGL_FlareYellow_F";

// Automatic Rifleman
_AR = "arifle_MX_SW_F";
_ARmag = "100Rnd_65x39_caseless_mag";
_ARmag_tr = "100Rnd_65x39_caseless_mag_Tracer";

// Medium MG
_MMG = "MMG_02_black_F";
_MMGmag = "130Rnd_338_Mag";
_MMGmag_tr = "130Rnd_338_Mag";

// Marksman rifle
_DMrifle = "arifle_MXM_F";
_DMriflemag = "30Rnd_65x39_caseless_mag";
_DMriflemag_tr = "30Rnd_65x39_caseless_mag_Tracer";

// Rifleman AT
_RAT = "launch_NLAW_F";
_RATmag = "NLAW_F";
_RATmag2 = "NLAW_F";

// Medium AT
_MAT = "launch_MRAWS_sand_F";
_MATmag1 = "MRAWS_HEAT_F";
_MATmag2 = "MRAWS_HE_F";

// Surface Air
_SAM = "launch_B_Titan_F";
_SAMmag = "Titan_AA";

// Heavy AT
_HAT = "launch_B_Titan_short_F";
_HATmag1 = "Titan_AT";
_HATmag2 = "Titan_AP";

// Sniper
_SNrifle = ["srifle_LRR_camo_F"];
_SNrifleMag = "7Rnd_408_Mag";

// Standard Submachine Gun/Personal Defence Weapon (Aircraft Pilot, Submachinegunner)
_smg = "SMG_01_F";
_smgmag = "30Rnd_45ACP_Mag_SMG_01";
_smgmag_tr = "30Rnd_45ACP_Mag_SMG_01_Tracer_Red";


// Diver
_diverWep = "arifle_SDAR_F";
_diverMag1 = "30Rnd_556x45_Stanag_red";
_diverMag2 = "20Rnd_556x45_UW_mag";

// ================================
// EQUIPMENT
// ================================

// Grenades
_grenade = "HandGrenade";
_grenadealt = "MiniGrenade";
_smokegrenade = "SmokeShell";
_smokegrenadealt = "SmokeShellBlue";

// misc medical items.
_firstaid = "FirstAidKit";
_medkit = "Medikit";

// Binoculars
_binos1 = "Binocular";
_binos2 = "Rangefinder";
_binos3 = "Laserdesignator";

// Night Vision Goggles (NVGoggles)
_nvg = "NVGoggles";

// UAV Terminal
_uavterminal = "B_UavTerminal";	  // BLUFOR - FIA

// Chemlights
_chem =  "Chemlight_blue";
_chemalt = "Chemlight_red";

// Engineer items
_ATmine = "ATMine_Range_Mag";
_satchel = "DemoCharge_Remote_Mag";
_APmine1 = "APERSBoundingMine_Range_Mag";
_APmine2 = "APERSMine_Range_Mag";

// ================================
// BACKBACKS
// ================================

// Infantry
_bagsmall 	= 		["B_AssaultPack_rgr", "B_AssaultPack_khk", "B_AssaultPack_mcamo"];
_bagmedium 	= 		["B_TacticalPack_mcamo"];
_bagday 	=		["B_Kitbag_rgr", "B_Kitbag_mcamo"];
_baglarge 	=  		["B_Carryall_mcamo"];

// Diver
_bagmediumdiver =  	"B_AssaultPack_blk";				// used by divers

// UAV
_baguav = 			"B_UAV_03_backpack_F";				// used by UAV operator
_bagMedUav = 		"B_UAV_06_medical_backpack_F";		// used by Medical UAV operator
_bagUtilUav = 		"B_UAV_06_backpack_F";				// used by Logistics UAV operator

// Remote Designator
_bagremote = 		"B_Static_Designator_01_weapon_F"; 	// Used by Forward Observer (AAF don't have one)

// Support
_baghmgg 	= 	"B_HMG_01_weapon_F";				// used by Heavy MG gunner
_baghmgag 	= 	"B_HMG_01_support_F";				// used by Heavy MG assistant gunner
_baghatg 	= 	"B_AT_01_weapon_F";					// used by Heavy AT gunner
_baghatag 	= 	"B_HMG_01_support_F";				// used by Heavy AT assistant gunner
_bagmtrg 	= 	"B_Mortar_01_weapon_F";				// used by Mortar gunner
_bagmtrag 	= 	"B_Mortar_01_support_F";			// used by Mortar assistant gunner
_baghsamg 	= 	"B_AA_01_weapon_F";					// used by Heavy SAM gunner
_baghsamag 	= 	"B_HMG_01_support_F";				// used by Heavy SAM assistant gunner

// ================================
// FACE, CLOTHES AND UNIFORMS
// ================================

// Define classes. This defines which gear class gets which uniform
// "medium" vests are used for all classes if they are not assigned a specific uniform
// FACE, CLOTHES AND UNIFORMS
_vlight = ["mtrag", "mtrg", "hsamag", "hsamg", "msamag", "mmgag", "matag", "log"];
_light = ["jtac", "fo", "leng", "mmgg", "matg", "uav", "msamg", "eng", "ugv", "uavm", "uavl"];
_heavy =  ["exp", "sl_l", "ftlr_l"];
_special = ["plm", "m", "ugv"];

// Basic clothing
// The outfit-piece is randomly selected from the array for each unit
_baseUniform = ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_vest"];
_baseHelmet = ["H_HelmetSpecB", "H_HelmetSpecB_paint1", "H_HelmetSpecB_paint2", "H_HelmetSpecB_blk", "H_HelmetSpecB_sand"];
_baseGlasses = ["", "G_Combat", "G_LowProfile", "G_Tactical_Clear", "G_Shades_Black", "G_Sport_Blackred", "G_Shades_Red", "G_Shades_Blue", "G_Shades_Green", "G_Tactical_Black"];

// Vests
_vlightRig = "V_Chestrig_rgr";
_lightRig = "V_PlateCarrier1_rgr";
_mediumRig = "V_PlateCarrier2_rgr"; 	// default for all infantry classes
_heavyRig = "V_PlateCarrierGL_rgr";
_specialRig = "V_PlateCarrierSpec_rgr";

// Lighter / Support Objects
_lightHelmet = ["H_HelmetB_light_grass", "H_HelmetB_light_desert", "H_HelmetB_light_black", "H_HelmetB_light_sand", "H_HelmetB_light"];
_lightUniform = ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_vest", "U_B_CombatUniform_mcam_tshirt"];

// Crewman
_crew = ["vc","vg","vd"];

_crewUniform = ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_vest"];
_crewHelmet = ["H_HelmetCrew_B"];
_crewRig = ["V_BandollierB_rgr"];
_crewGlasses = _baseGlasses;

// Diver
_diver = ["dtl", "div", "dexp", "divm"];

_diverUniform =  "U_B_Wetsuit";
_diverHelmet = [];
_diverRig = "V_RebreatherB";
_diverGlasses = [];

// Heli
_heli = ["hp", "hc"];

_heliUniform = "U_B_HeliPilotCoveralls";
_heliHelmet = "H_PilotHelmetHeli_B";
_heliCrewHelmet = "H_CrewHelmetHeli_B";
_heliRig = "V_TacChestrig_grn_F";
_heliGlasses = [];

// Pilot
_pilot = ["p"];

_pilotUniform = "U_B_pilotCoveralls";
_pilotHelmet = "H_PilotHelmetFighter_B";
_pilotRig = [];
_pilotGlasses = [];

// Ghillie
_ghillie = ["sn","sp"];

_ghillieUniform = ["U_B_GhillieSuit"];
_ghillieHelmet = ["H_HelmetB_camo"];
_ghillieRig = ["V_Chestrig_rgr"];
_ghillieGlasses = ["G_Bandanna_rgr"];

// Recon
_specOp = ["rsl", "rm", "rgren", "rrat", "rsc", "rdm"];

_sfuniform = _lightUniform;
_sfhelmet = ["H_Cap_blk", "H_Cap_oli", "H_Watchcap_blk", "H_Watchcap_cbr", "H_Watchcap_khk", "H_Watchcap_camo", "H_Cap_tan_specops_US", "H_Bandanna_khk", "H_Booniehat_khk", "H_Booniehat_mcamo"];
_sfRig = _vlightReg;
_sfGlasses = ["", "G_Tactical_Clear", "G_Lowprofile", "G_Shades_Black", "G_Sport_Blackred", "G_Shades_Red", "G_Shades_Blue", "G_Shades_Green", "G_Tactical_Black"];

// MARSOC

// ================================

// This block needs only to be run on an infantry unit
if (_isMan) then {
	// PREPARE UNIT FOR GEAR ADDITION
	// The following code removes all existing weapons, items, magazines and backpacks
	removeBackpack _unit;
	removeAllWeapons _unit;
	removeAllItemsWithMagazines _unit;
	removeAllAssignedItems _unit;

	// Add Toolequipment
	_unit linkItem "ItemMap";		// Add and equip the map
	_unit linkItem "ItemCompass";	// Add and equip a compass
	_unit linkItem "ItemRadio";		// Add and equip A3's default radio
	_unit linkItem "ItemWatch";		// Add and equip a watch
	
	if (_gpsBool) then {
		_unit linkItem "ItemGPS"; 		// Add and equip a GPS
	};
	
	// HANDLE CLOTHES
	// Handle clothes and helmets and such using the include file called next.
	#include "..\..\f\assignGear\f_assignGear_clothes.sqf";

	// ADD UNIVERSAL ITEMS
	// Add items universal to all units of this faction

	if (_nvgBool) then {
		_unit linkItem _nvg;			// Add and equip the faction's nvg
	};
	
	_unit addItem _firstaid;		// Add a single first aid kit (FAK)
	_unit addItem _firstaid;		// Add a single first aid kit (FAK)
	
};

// SETUP BACKPACKS
// Include the correct backpack file for the faction

_backpack = {
	_typeOfBackPack = _this select 0;
	_loadout = f_param_backpacks;
	if (count _this > 1) then {_loadout = _this select 1};
	switch (_typeOfBackPack) do
	{
		#include "f_backpack.sqf";
	};
};



// DEFINE UNIT TYPE LOADOUTS
// The following blocks of code define loadouts for each type of unit (the unit type
// is passed to the script in the first variable)
#include "unit_definitions.sqf";

// Handle weapon attachments
#include "..\..\f\assignGear\f_assignGear_attachments.sqf";


// ENSURE UNIT HAS CORRECT WEAPON SELECTED ON SPAWNING

_unit selectWeapon primaryWeapon _unit;