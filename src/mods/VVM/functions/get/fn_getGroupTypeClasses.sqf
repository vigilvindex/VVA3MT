/* Name: fn_getGroupTypeClasses.sqf
Description: Returns an array of class names for a group type of a faction.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/12 Updated: 2016/08/19 Version: 0.0.1
Dependencies: n/a
Arguments: index name (default) TYPE {Required} min,max "values"
  d debug   (false) BOOLEAN {N} false,true "Disabled","Enabled"
  s side    (0)     SCALAR  {N} 0,3        "East","West","Independent","Civilian"
  f faction (0)     SCALAR  {N} 0,4        "CSAT,NATO,AAF,CIV","CSAT (Pacific),NATO (Pacific),FIA","Viper,CTRG,Syndikat","FIA,FIA","Gendarmerie"
  t type    (0)     SCALAR  {N} 0,6        "Infantry","Motorized","Support","Mechanized","SpecOps","Armored","UInfantry"
  c class   (0)     SCALAR  {N} 0,4        "Infantry,InfantryAA,InfantryAT,InfanftryRecon,InfantrySniper","Motorized,MotorizedAA,MotorizedART,MotorizedAT","Support,SupportART","Mechanized,MechanizedAA,MechanizedAT,MechanizedSupport","SpecOps,SpecOpsDivers,SpecOpsUAV,SpecOpsUGV","Armored,ArmoredAA,ArmoredART","UInfantry"
Returns: ARRAY on success. FALSE on failure.
Usage: [["d",false],["s",1],["f",1],["t",1],["c",1]] call VVM_fnc_getGroupTypeClasses;
*/
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false;};
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false;};
private ["_debug","_side","_faction","_type","_class","_return"];
{ if (_x isEqualType []) then {
    if (_x select 0 isEqualType "") then {
      switch (toLower (_x select 0)) do {
        case "d": {_debug = [_x select 1] param [0,false,[true]];};
        case "s": {_side = [_x select 1] param [0,0,[0]];};
        case "f": {_faction = [_x select 1] param [0,0,[0]];};
        case "t": {_type = [_x select 1] param [0,0,[0]];};
        case "c": {_class = [_x select 1] param [0,0,[0]];};
      };
    };
  };
} forEach _this;
{ if (isNil _x) then {
    switch (_forEachIndex) do {
      case 0: {_debug = false;};
      case 1: {_side = 0;};
      case 2: {_faction = 0;};
      case 3: {_type = 0;};
      case 4: {_class = 0;};
    };
  };
} forEach ["_debug","_side","_faction","_type","_class"];
if (_debug) then {
  { diag_log format ["# %1 # %2 # %3 # _param %4 = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_forEachIndex,_x];
  } forEach [_debug,_side,_faction,_type,_class];
};
switch (_side) do {
  case 0: { // East
    switch (_faction) do {
      case 0: { // CSAT "OPF_F"
        switch (_type) do {
          case 0: {
            switch (_class) do {
              case 0: {_return = ["OIA_InfAssault","OIA_InfSentry","OIA_InfSquad","OIA_InfSquad_Weapons","OIA_InfTeam"];};
              case 1: {_return = ["OIA_InfTeam_AA"];};
              case 2: {_return = ["OIA_InfTeam_AT"];};
              case 3: {_return = ["OI_reconPatrol","OI_reconSentry","OI_reconTeam","OIA_ReconSquad"];};
              case 4: {_return = ["OI_SniperTeam"];};
            };
          };
          case 1: {
            switch (_class) do {
              case 0: {_return = ["OIA_MotInf_Team","OIA_MotInf_MGTeam","OIA_MotInf_GMGTeam","OIA_MotInf_Reinforce","O_MotInf_ReconViperTeam","O_MotInf_AssaultViperTeam"];};
              case 1: {_return = ["OIA_MotInf_AA"];};
              case 2: {_return = ["OIA_MotInf_MortTeam"];};
              case 3: {_return = ["OIA_MotInf_AT"];};
            };
          };
          case 2: {
            switch (_class) do {
              case 0: {_return = ["OI_recon_EOD","OI_support_CLS","OI_support_ENG","OI_support_EOD","OI_support_GMG","OI_support_MG"];};
              case 1: {_return = ["OI_support_Mort"];};
            };
          };
          case 3: {
            switch (_class) do {
              case 0: {_return = ["OIA_MechInfSquad"];};
              case 1: {_return = ["OIA_MechInf_AA"];};
              case 2: {_return = ["OIA_MechInf_AT"];};
              case 3: {_return = ["OIA_MechInf_Support"];};
            };
          };
          case 4: {
            switch (_class) do {
              case 0: {_return = ["OI_ViperTeam"];};
              case 1: {_return = ["OI_diverTeam","OI_diverTeam_Boat","OI_diverTeam_SDV"];};
              case 2: {_return = ["OI_AttackTeam_UAV","OI_ReconTeam_UAV","OI_SmallTeam_UAV"];};
              case 3: {_return = ["OI_AttackTeam_UGV","OI_ReconTeam_UGV"];};
            };
          };
          case 5: {
            switch (_class) do {
              case 0: {_return = ["OIA_TankPlatoon","OIA_TankSection"];};
              case 1: {_return = ["OIA_TankPlatoon_AA"];};
              case 2: {_return = ["OIA_SPGPlatoon_Scorcher","OIA_SPGSection_Scorcher"];};
            };
          };
          case 6: {
            switch (_class) do {
              case 0: {_return = ["OIA_GuardSentry","OIA_GuardSquad","OIA_GuardTeam"];};
            };
          };
        };
      };
      case 1: { // CSAT (Pacific) "OPF_T_F"
        switch (_type) do {
          case 0: {
            switch (_class) do {
              case 0: {_return = ["O_T_InfSentry","O_T_InfSquad","O_T_InfSquad_Weapons","O_T_InfTeam"];};
              case 1: {_return = ["O_T_InfTeam_AA"];};
              case 2: {_return = ["O_T_InfTeam_AT"];};
              case 3: {_return = ["O_T_reconPatrol","O_T_reconSentry","O_T_reconTeam"];};
              case 4: {_return = ["O_T_SniperTeam"];};
            };
          };
          case 1: {
            switch (_class) do {
              case 0: {_return = ["O_T_MotInf_Team","O_T_MotInf_MGTeam","O_T_MotInf_GMGTeam","O_T_MotInf_ReconViperTeam","O_T_MotInf_AssaultViperTeam","O_T_MotInf_Reinforcements"];};
              case 1: {_return = ["O_T_MotInf_AA"];};
              case 2: {_return = ["O_T_MotInf_MortTeam"];};
              case 3: {_return = ["O_T_MotInf_AT"];};
            };
          };
          case 2: {
            switch (_class) do {
              case 0: {_return = ["O_T_recon_EOD","O_T_support_CLS","O_T_support_ENG","O_T_support_EOD","O_T_support_GMG","O_T_support_MG"];};
              case 1: {_return = ["O_T_support_Mort"];};
            };
          };
          case 3: {
            switch (_class) do {
              case 0: {_return = ["O_T_MechInfSquad"];};
              case 1: {_return = ["O_T_MechInf_AA"];};
              case 2: {_return = ["O_T_MechInf_AT"];};
              case 3: {_return = ["O_T_MechInf_Support"];};
            };
          };
          case 4: {
            switch (_class) do {
              case 0: {_return = ["O_T_ViperTeam"];};
              case 1: {_return = ["O_T_diverTeam","O_T_diverTeam_Boat","O_T_diverTeam_SDV"];};
              case 2: {_return = ["O_T_AttackTeam_UAV","O_T_ReconTeam_UAV","O_T_SmallTeam_UAV"];};
              case 3: {_return = ["O_T_AttackTeam_UGV","O_T_ReconTeam_UGV"];};
            };
          };
          case 5: {
            switch (_class) do {
              case 0: {_return = ["O_T_TankPlatoon","O_T_TankSection"];};
              case 1: {_return = ["O_T_TankPlatoon_AA"];};
              case 2: {_return = ["O_T_SPGPlatoon_Scorcher","O_T_SPGSection_Scorcher"];};
            };
          };
          case 6: {_return = false;};
        };
      };
      case 2: {_return = false;}; // Viper "OPF_V_F"
      case 3: {_return = false;}; // FIA "OPF_G_F"
    };
  };
  case 1: { // West
    switch (_faction) do {
      case 0: { // NATO "BLU_F"
        switch (_type) do {
          case 0: {
            switch (_class) do {
              case 0: {_return = ["BUS_InfAssault","BUS_InfSentry","BUS_InfSquad","BUS_InfSquad_Weapons","BUS_InfTeam"];};
              case 1: {_return = ["BUS_InfTeam_AA"];};
              case 2: {_return = ["BUS_InfTeam_AT"];};
              case 3: {_return = ["BUS_ReconPatrol","BUS_ReconSentry","BUS_ReconTeam","BUS_ReconSquad"];};
              case 4: {_return = ["BUS_SniperTeam"];};
            };
          };
          case 1: {
            switch (_class) do {
              case 0: {_return = ["BUS_MotInf_Team","BUS_MotInf_MGTeam","BUS_MotInf_GMGTeam"];};
              case 1: {_return = ["BUS_MotInf_AA"];};
              case 2: {_return = ["BUS_MotInf_MortTeam"];};
              case 3: {_return = ["BUS_MotInf_AT"];};
            };
          };
          case 2: {
            switch (_class) do {
              case 0: {_return = ["BUS_Recon_EOD","BUS_Support_CLS","BUS_Support_ENG","BUS_Support_EOD","BUS_Support_GMG","BUS_Support_MG"];};
              case 1: {_return = ["BUS_Support_Mort"];};
            };
          };
          case 3: {
            switch (_class) do {
              case 0: {_return = ["BUS_MechInfSquad"];};
              case 1: {_return = ["BUS_MechInf_AA"];};
              case 2: {_return = ["BUS_MechInf_AT"];};
              case 3: {_return = ["BUS_MechInf_Support"];};
            };
          };
          case 4: {
            switch (_class) do {
              case 0: {_return = false;};
              case 1: {_return = ["BUS_DiverTeam","BUS_DiverTeam_Boat","BUS_DiverTeam_SDV"];};
              case 2: {_return = ["BUS_AttackTeam_UAV","BUS_ReconTeam_UAV","BUS_SmallTeam_UAV"];};
              case 3: {_return = ["BUS_AttackTeam_UGV","BUS_ReconTeam_UGV"];};
            };
          };
          case 5: {
            switch (_class) do {
              case 0: {_return = ["BUS_TankPlatoon","BUS_TankSection"];};
              case 1: {_return = ["BUS_TankPlatoon_AA"];};
              case 2: {_return = ["BUS_SPGPlatoon_Scorcher","BUS_SPGSection_Scorcher","BUS_SPGSection_MLRS"];};
            };
          };
          case 6: {_return = [];};
        };
      };
      case 1: { // NATO (Pacific) "BLU_T_F"
        switch (_type) do {
          case 0: {
            switch (_class) do {
              case 0: {_return = ["B_T_InfSentry","B_T_InfSquad","B_T_InfSquad_Weapons","B_T_InfTeam"];};
              case 1: {_return = ["B_T_InfTeam_AA"];};
              case 2: {_return = ["B_T_InfTeam_AT"];};
              case 3: {_return = ["B_T_ReconPatrol","B_T_ReconSentry","B_T_ReconTeam"];};
              case 4: {_return = ["B_T_SniperTeam"];};
            };
          };
          case 1: {
            switch (_class) do {
              case 0: {_return = ["B_T_MotInf_Team","B_T_MotInf_MGTeam","B_T_MotInf_GMGTeam","B_T_MotInf_Reinforcements"];};
              case 1: {_return = ["B_T_MotInf_AA"];};
              case 2: {_return = ["B_T_MotInf_MortTeam"];};
              case 3: {_return = ["B_T_MotInf_AT"];};
            };
          };
          case 2: {
            switch (_class) do {
              case 0: {_return = ["B_T_Recon_EOD","B_T_Support_CLS","B_T_Support_ENG","B_T_Support_EOD","B_T_Support_GMG","B_T_Support_MG"];};
              case 1: {_return = ["B_T_Support_Mort"];};
            };
          };
          case 3: {
            switch (_class) do {
              case 0: {_return = ["B_T_MechInfSquad"];};
              case 1: {_return = ["B_T_MechInf_AA"];};
              case 2: {_return = ["B_T_MechInf_AT"];};
              case 3: {_return = ["B_T_MechInf_Support"];};
            };
          };
          case 4: {
            switch (_class) do {
              case 0: {_return = false;};
              case 1: {_return = ["B_T_DiverTeam","B_T_DiverTeam_Boat","B_T_DiverTeam_SDV"];};
              case 2: {_return = ["B_T_AttackTeam_UAV","B_T_ReconTeam_UAV","B_T_SmallTeam_UAV"];};
              case 3: {_return = ["B_T_AttackTeam_UGV","B_T_ReconTeam_UGV"];};
            };
          };
          case 5: {
            switch (_class) do {
              case 0: {_return = ["B_T_TankPlatoon","B_T_TankSection"];};
              case 1: {_return = ["B_T_TankPlatoon_AA"];};
              case 2: {_return = ["B_T_SPGPlatoon_Scorcher","B_T_SPGSection_Scorcher","B_T_SPGSection_MLRS"];};
            };
          };
          case 6: {_return = false;};
        };
      };
      case 2: { // CTRG "BLU_CTRG_F"
        switch (_type) do {
          case 0: {_return = ["CTRG_InfSentry","CTRG_InfSquad","CTRG_InfTeam"];};
          case 1: {_return = ["CTRG_MotInf_AssaultTeam","CTRG_MotInf_ReconTeam"];};
        };
      };
      case 3: { // FIA "BLU_G_F"
        switch (_type) do {
          case 0: {
            switch (_class) do {
              case 0: {_return = ["IRG_InfAssault","IRG_InfSentry","IRG_InfSquad","IRG_InfSquad_Weapons","IRG_InfTeam"];};
              case 1: {_return = false;};
              case 2: {_return = ["IRG_InfTeam_AT"];};
              case 3: {_return = ["IRG_ReconSentry"];};
              case 4: {_return = ["IRG_SniperTeam_M"];};
            };
          };
          case 1: {_return = ["IRG_MotInf_Team","IRG_Technicals"];};
          case 2: {_return = ["IRG_Support_CLS","IRG_Support_ENG","IRG_Support_EOD"];};
        };
      };
      case 4: { // Gendarmerie "BLU_GEN_F"
        switch (_type) do {
          case 0: {_return = ["GENDARME_Inf_Patrol"];};
          case 1: {_return = ["GENDARME_MotInf_Patrol"];};
        };
      };
    };
  };
  case 2: { // Independent
    switch (_faction) do {
      case 0: { // AAF "IND_F"
        switch (_type) do {
          case 0: {
            switch (_class) do {
              case 0: {_return = ["HAF_InfSentry","HAF_InfSquad","HAF_InfSquad_Weapons","HAF_InfTeam"];};
              case 1: {_return = ["HAF_InfTeam_AA"];};
              case 2: {_return = ["HAF_InfTeam_AT"];};
              case 3: {_return = ["HAF_SniperTeam"];};
            };
          };
          case 1: {
            switch (_class) do {
              case 0: {_return = ["HAF_MechInfSquad"];};
              case 1: {_return = ["HAF_MechInf_AA"];};
              case 2: {_return = ["HAF_MechInf_AT"];};
              case 3: {_return = ["HAF_MechInf_Support"];};
            };
          };
          case 2: {
            switch (_class) do {
              case 0: {_return = ["HAF_Support_CLS","HAF_Support_ENG","HAF_Support_EOD","HAF_Support_GMG","HAF_Support_MG"];};
              case 1: {_return = ["HAF_Support_Mort"];};
            };
          };
          case 3: {
            switch (_class) do {
              case 0: {_return = false;};
              case 1: {_return = ["HAF_DiverTeam","HAF_DiverTeam_Boat","HAF_DiverTeam_SDV"];};
              case 2: {_return = ["HAF_AttackTeam_UAV","HAF_ReconTeam_UAV","HAF_SmallTeam_UAV"];};
              case 3: {_return = ["HAF_AttackTeam_UGV","HAF_ReconTeam_UGV"];};
            };
          };
          case 4: {
            switch (_class) do {
              case 0: {_return = ["HAF_TankPlatoon","HAF_TankSection"];};
              case 1: {_return = ["HAF_TankPlatoon_AA"];};
            };
          };
        };
      };
      case 1: {_return = false;}; // FIA "IND_G_F"
      case 2: { // Syndikat "IND_C_F"
        _return = ["BanditFireTeam","BanditShockTeam","BanditCombatGroup","ParaFireTeam","ParaShockTeam","ParaCombatGroup"];
      };
    };
  };
  case 3: {_return = false;}; // Civilian "CIV_F"
};
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_side,_faction,_type,_class];
_return;
