// USAGE: _result = [UNIT,FACTION,ROLE] call VVLO_fnc_setLoadout;
// TODO: Name, Surname, Rank
_this setVariable ["BIS_enableRandomization", false]; // Disable gear randomization.
// Set Traits
_result = [_this,0,0,0,0] call VVLO_fnc_setTraits; // TRAITS = ["engineer","explosiveSpecialist","medic","UAVHacker"]; 1 = ON, 0 = OFF.
_this setUnitTrait ["engineer",1]; // Set Trait
// GEAR Specific
if (_ai == true) then {
	_this setFace "WhiteHead_01"; // Add Face
	[_this, "Male02GRE"] remoteExec ["setSpeaker", 0, _this]; // Add voice.
};
_this forceAddUniform "U_O_CombatUniform_ocamo"; // Add Uniform
_this addHeadGear "H_HelmetLeaderO_ocamo"; // Add Headgear
_this addGoggles "G_Tactical_Clear"; // Add Facewear
_this addVest "V_TacVest_blk_POLICE"; // Add Vest
_this addBackpack "TK_RPG_Backpack_EP1"; // Add Backpack
// ITEMS
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "ItemWatch";
_this linkItem "ItemRadio";
_this linkItem "ItemGPS";
_this addItem "MineDetector";
_this addItem _firstaid;
_this linkItem _uavterminal;
_this addItem "NVGoggles";
_this assignItem "NVGoggles";
// WEAPONS
_this addWeapon "BAF_L85A2_RIS_SUSAT"; // Add Weapons
// ATTACHMENTS
_this addPrimaryWeaponItem "muzzle_snds_H";
_this addHandgunItem "muzzle_snds_L";
// MAGAZINES
_this addMagazines ["Laserbatteries",4];
_this addMagazines [_riflemag,_defMags];
_this addMagazines [_riflemag_tr,_defMags_tr];
_this addMagazines [_smokegrenade,2];
_this addMagazines [_chem,2];
_this addMagazines [_grenade,1];
_this addMagazines [_satchel,2];
_this addMagazines [_pistolmag,2];
_this selectWeapon primaryWeapon _this; // Select Default Weapon