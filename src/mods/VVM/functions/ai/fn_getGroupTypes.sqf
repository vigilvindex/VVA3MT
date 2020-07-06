/* Name: fn_getGroupTypes.sqf
Description: Returns an array of group types for a faction.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/12 Updated: 2016/08/19 Version: 0.0.1
Dependencies: n/a
Arguments: index name (default) TYPE {Required} min,max "values"
  d debug    (false)   BOOLEAN {N} false,true "Disabled","Enabled"
  s side     (0)       SCALAR  {N} 0,3        "East","West","Independent","Civilian"
  f faction  (0)       SCALAR  {N} 0,4        "CSAT,NATO,AAF,CIV","CSAT (Pacific),NATO (Pacific),FIA","Viper,CTRG,Syndikat","FIA,FIA","Gendarmerie"
Returns: ARRAY on success. FALSE on failure.
Usage: [["d",false],["s",1],["f",1]] call VVM_fnc_getGroupTypes;
*/
if (isNil "_this") exitWith {["%1 Function called without arguments.",time] call BIS_fnc_error;false;};
if !(_this isEqualType []) exitWith {["%1 Function called without arguments array.",time] call BIS_fnc_error;false;};
private ["_debug","_side","_faction","_return"];
{ if (_x isEqualType []) then {
    if (_x select 0 isEqualType "") then {
      switch (toLower (_x select 0)) do {
        case "d": {_debug = [_x select 1] param [0,false,[true]];};
        case "s": {_side = [_x select 1] param [0,0,[0]];};
        case "f": {_faction = [_x select 1] param [0,0,[0]];};
      };
    };
  };
} forEach _this;
{ if (isNil _x) then {
    switch (_forEachIndex) do {
      case 0: {_debug = false;};
      case 1: {_side = 0;};
      case 2: {_faction = 0;};
    };
  };
} forEach ["_debug","_side","_faction"];
if (_debug) then {
  { diag_log format ["# %1 # %2 # %3 # _param %4 = %5 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_forEachIndex,_x];
  } forEach [_debug,_side,_faction];
};
switch (_side) do {
  case 0: { // East
    switch (_faction) do {
      case 0: {_return = ["Infantry","Motorized_MTP","Support","Mechanized","SpecOps","Armored","UInfantry"];}; // CSAT "OPF_F"
      case 1: {_return = ["Infantry","Motorized_MTP","Support","Mechanized","SpecOps","Armored"];}; // CSAT (Pacific) "OPF_T_F"
      case 2: {_return = [];}; // Viper "OPF_V_F"
      case 3: {_return = [];}; // FIA "OPF_G_F"
    };
  };
  case 1: { // West
    switch (_faction) do {
      case 0: {_return = ["Infantry","Motorized","Support","Mechanized","SpecOps","Armored"];}; // NATO "BLU_F"
      case 1: {_return = ["Infantry","Motorized","Support","Mechanized","SpecOps","Armored"];}; // NATO (Pacific) "BLU_T_F"
      case 2: {_return = ["Infantry","Motorized"];}; // CTRG "BLU_CTRG_F"
      case 3: {_return = ["Infantry","Motorized_MTP","Support"];}; // FIA "BLU_G_F"
      case 4: {_return = ["Infantry","Motorized"];}; // Gendarmerie "BLU_GEN_F"
    };
  };
  case 2: { // Independent
    switch (_faction) do {
      case 0: {_return = ["Infantry","Motorized","Support","Mechanized","SpecOps","Armored"];}; // AAF "IND_F"
      case 1: {_return = [];}; // FIA "IND_G_F"
      case 2: {_return = ["Infantry"];}; // Syndikat "IND_C_F"
    };
  };
  case 3: {_return = [];}; // Civilian "CIV_F"
};
if (_debug) then {diag_log format ["# %1 # %2 # %3 # _return = %4 #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__,_return];};
{_x = nil;} forEach [_debug,_side,_faction];
_return;
