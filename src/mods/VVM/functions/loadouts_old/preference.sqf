// Setting preferred kits for UIDs provided.

_playerArray = ["U_B_CombatUniform_mcam_vest", "H_HelmetSpecB_paint1", "H_HelmetB_light_black", "U_B_CTRG_3", "U_I_CombatUniform_shortsleeve"];

// Player Array [NATO UNIFORM, NATO E HELMET, NATO L HELMET, CTRG UNIFORM, AAF UNIFORM]
switch (getPlayerUID player) do {
// switch (name player) do {
	
	// Single Player	
	case "_SP_PLAYER_": {_playerArray = ["U_B_CombatUniform_mcam_vest", "H_HelmetSpecB_paint1", "H_HelmetB_light_black", "U_B_CTRG_3", "U_I_CombatUniform_shortsleeve"]; hint "Found SP";};
	
	// Folau
	case "76561198007179126": {_playerArray = ["U_B_CombatUniform_mcam_vest", "H_HelmetSpecB_paint1", "H_HelmetB_light_black", "U_B_CTRG_3", "U_I_CombatUniform_shortsleeve"]; systemChat "Found Folau (UID)";}; 
	case "Folau": {_playerArray = ["U_B_CombatUniform_mcam_vest", "H_HelmetSpecB_paint1", "H_HelmetB_light_grass", "U_B_CTRG_3", "U_I_CombatUniform_shortsleeve"]; hint "Found Folau (NAME)";}; 	
	// Lawman
	case "Lawman": {_playerArray = ["U_B_CombatUniform_mcam", "H_HelmetSpecB", "H_HelmetB_light", "U_B_CTRG_1", "U_I_CombatUniform"]; hint "Found Lawman (NAME)";}; 	
	
	default {_playerArray = ["U_B_CombatUniform_mcam_vest", "H_HelmetSpecB_paint1", "H_HelmetB_light_black", "U_B_CTRG_3", "U_I_CombatUniform_shortsleeve"]; hint "DEFAULTING";};
	
};

// Get original settings
_originalHelmet = headgear _unit;
_originalUniform = uniform _unit;
// Save uniform items
_uniformItems = uniformItems _unit;

// MTP Uniforms (Select 0)
if (_originalUniform in ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_vest"]) then {
	_unit forceAddUniform (_playerArray select 0);
	
	{
	//make sure items can fit due to different uniform sizes
	if ( _unit canAddItemToUniform _x ) then {
		_unit addItemToUniform _x;
	}else{
		//Just add it to the backpack if not
		_unit addItemToBackpack _x;
	};
	}forEach _uniformItems;
};

// Enhanced Helmets (Select 1)
if (_originalHelmet in ["H_HelmetSpecB", "H_HelmetSpecB_paint1", "H_HelmetSpecB_paint2", "H_HelmetSpecB_blk", "H_HelmetSpecB_sand"]) then {
	removeHeadgear _unit;
	_unit addHeadgear (_playerArray select 1);
};

// Enhanced Helmets (Select 2)
if (_originalHelmet in ["H_HelmetB_light_grass", "H_HelmetB_light_desert", "H_HelmetB_light_black", "H_HelmetB_light_sand", "H_HelmetB_light"]) then {
	removeHeadgear _unit;
	_unit addHeadgear (_playerArray select 2);
};

// CTRG Uniforms (Select 3)
if (_originalUniform in ["U_B_CTRG_3", "U_B_CTRG_1"]) then {
	_unit forceAddUniform (_playerArray select 3);
	
	{
	//make sure items can fit due to different uniform sizes
	if ( _unit canAddItemToUniform _x ) then {
		_unit addItemToUniform _x;
	}else{
		//Just add it to the backpack if not
		_unit addItemToBackpack _x;
	};
	}forEach _uniformItems;
};

// AAF Uniforms (Select 4)
if (_originalUniform in ["U_I_CombatUniform", "U_I_CombatUniform_shortsleeve"]) then {
	_unit forceAddUniform (_playerArray select 4);
	
	{
	//make sure items can fit due to different uniform sizes
	if ( _unit canAddItemToUniform _x ) then {
		_unit addItemToUniform _x;
	}else{
		//Just add it to the backpack if not
		_unit addItemToBackpack _x;
	};
	}forEach _uniformItems;
};
