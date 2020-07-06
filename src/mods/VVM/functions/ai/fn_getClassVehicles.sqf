/* Name: vv_fnc_get_classname_vehicles.sqf
 * Description: Returns an array of classnames for vehicles.
 * Authors: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/4.0/
 * Created: 2013/08/07
 * Updated: 2016/08/10
 * Returns: Array ["classname1","classname2"]
 * Arguments:
 *   0 - Debug: (boolean) TRUE,FALSE
 *   1 - Side: (string) east,west,civilian,independent
 *   2 - Faction: (string) csat,nato,aaf,fia,altian
 *   3 - Class: (string) airforce,army,navy
 *   4 - Type: (string) man,vehicle
 *   5 - Sub Type: (string) man[leader,infantry,medic]vehicle[vehicle,armor,boat,heli,plane,drone]
 * Example: _units = [FALSE,"east","opfor","army","man","infantry"] call VVM_fnc_getClassVehicles;
 * TODO:
 *  - Revise type "man" sub-types.
 *  - Add updated classnames.
 */
private ["_debug","_side","_faction","_class","_type","_sub_type","_return_array","_leaders","_infantry","_medics","_vehicles","_armor","_boats","_helis","_planes"];
_debug = _this select 0;
_side = _this select 1;
_faction = _this select 2;
_class = _this select 3;
_type = _this select 4;
_sub_type = _this select 5;
_return_array = [];
switch (_side) do {
  case "east": {
    switch (_faction) do {
      case "csat": {
        switch (_class) do {
          case "airforce": {
            switch (_type) do {
              case "man": {
                switch (_sub_type) do {
                  case "leader": { _leaders = []; };
                  case "infantry": { _infantry = ["O_helipilot_F"]; };
                  case "medic": { _medics = []; };
                };
              };
              case "vehicle": {
                switch (_sub_type) do {
                  case "vehicle": { _vehicles = []; };
                  case "armor": { _armor = []; };
                  case "boat": { _boats = []; };
                  case "heli": { _helis = ["O_Ka60_F"]; };
                  case "plane": { _planes = []; };
                };
              };
            };
          };
          case "army": {
            switch (_type) do {
              case "man": {
                switch (_sub_type) do {
                  case "leader": { _leaders = ["O_soldier_SL_F","O_soldier_TL_F"]; };
                  case "infantry": { _infantry = ["O_soldier_F","O_soldier_GL_F","O_soldier_AR_F","O_soldier_LAT_F","O_soldier_repair_F","O_soldier_M_F","O_soldier_exp_F"]; };
                  case "medic": { _medics = ["O_medic_F"]; };
                };
              };
              case "vehicle": {
                switch (_sub_type) do {
                  case "vehicle": { _vehicles = ["O_Ifrit_F","O_Quadbike_F"]; };
                  case "armor": { _armor = ["O_Ifrit_GMG_F","O_Ifrit_MG_F"]; };
                  case "boat": { _boats = []; };
                  case "heli": { _helis = []; };
                  case "plane": { _planes = []; };
                };
              };
            };
          };
          case "navy": {
            switch (_type) do {
              case "man": {
                switch (_sub_type) do {
                  case "leader": { _leaders = ["O_diver_TL_F"]; };
                  case "infantry": { _infantry = ["O_diver_exp_F","O_diver_F"]; };
                  case "medic": { _medics = []; };
                };
              };
              case "vehicle": {
                switch (_sub_type) do {
                  case "vehicle": { _vehicles = []; };
                  case "armor": { _armor = []; };
                  case "boat": { _boats = ["O_Assaultboat","O_SpeedBoat"]; };
                  case "heli": { _helis = []; };
                  case "plane": { _planes = []; };
                };
              };
            };
          };
        };
      };
    };
  };
  case "west": {
    switch (_faction) do {
      case "nato": {
        switch (_class) do {
          case "airforce": {
            switch (_type) do {
              case "man": {
                switch (_sub_type) do {
                  case "leader": { _leaders = []; };
                  case "infantry": { _infantry = ["B_helipilot_F"]; };
                  case "medic": { _medics = []; };
                };
              };
              case "vehicle": {
                switch (_sub_type) do {
                  case "vehicle": { _vehicles = []; };
                  case "armor": { _armor = []; };
                  case "boat": { _boats = []; };
                  case "heli": { _helis = ["B_AH9_F"]; };
                  case "plane": { _planes = []; };
                };
              };
            };
          };
          case "army": {
            switch (_type) do {
              case "man": {
                switch (_sub_type) do {
                  case "leader": { _leaders = ["B_Soldier_TL_F","B_Soldier_SL_F"]; };
                  case "infantry": { _infantry = ["B_Soldier_F","B_soldier_AR_F","B_soldier_exp_F","B_Soldier_GL_F","B_soldier_M_F","B_soldier_repair_F","B_soldier_LAT_F","B_Soldier_lite_F"]; };
                  case "medic": { _medics = ["B_medic_F"]; };
                };
              };
              case "vehicle": {
                switch (_sub_type) do {
                  case "vehicle": { _vehicles = ["B_Hunter_F","B_Quadbike_F"]; };
                  case "armor": { _armor = ["B_Hunter_HMG_F","B_Hunter_RCWS_F"]; };
                  case "boat": { _boats = []; };
                  case "heli": { _helis = []; };
                  case "plane": { _planes = []; };
                };
              };
            };
          };
          case "navy": {
            switch (_type) do {
              case "man": {
                switch (_sub_type) do {
                  case "leader": { _leaders = ["B_diver_TL_F"]; };
                  case "infantry": { _infantry = ["B_diver_exp_F","B_diver_F"]; };
                  case "medic": { _medics = []; };
                };
              };
              case "vehicle": {
                switch (_sub_type) do {
                  case "vehicle": { _vehicles = []; };
                  case "armor": { _armor = []; };
                  case "boat": { _boats = ["B_Assaultboat","B_SpeedBoat"]; };
                  case "heli": { _helis = []; };
                  case "plane": { _planes = []; };
                };
              };
            };
          };
        };
      };
    };
  };
  case "civilian": {
    switch (_faction) do {
      case "altian": {
        switch (_class) do {
          case "airforce": {
            switch (_type) do {
              case "man": {
                switch (_sub_type) do {
                  case "leader": { _leaders = []; };
                  case "infantry": { _infantry = []; };
                  case "medic": { _medics = []; };
                };
              };
              case "vehicle": {
                switch (_sub_type) do {
                  case "vehicle": { _vehicles = []; };
                  case "armor": { _armor = []; };
                  case "boat": { _boats = []; };
                  case "heli": { _helis = []; };
                  case "plane": { _planes = []; };
                };
              };
            };
          };
          case "army": {
            switch (_type) do {
              case "man": {
                switch (_sub_type) do {
                  case "leader": { _leaders = ["C_man_1"]; };
                  case "infantry": { _infantry = ["C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F"]; };
                  case "medic": { _medics = []; };
                };
              };
              case "vehicle": {
                switch (_sub_type) do {
                  case "vehicle": { _vehicles = ["C_offroad"]; };
                  case "armor": { _armor = []; };
                  case "boat": { _boats = []; };
                  case "heli": { _helis = []; };
                  case "plane": { _planes = []; };
                };
              };
            };
          };
          case "navy": {
            switch (_type) do {
              case "man": {
                switch (_sub_type) do {
                  case "leader": { _leaders = []; };
                  case "infantry": { _infantry = []; };
                  case "medic": { _medics = []; };
                };
              };
              case "vehicle": {
                switch (_sub_type) do {
                  case "vehicle": { _vehicles = []; };
                  case "armor": { _armor = []; };
                  case "boat": { _boats = ["C_Rubberboat"]; };
                  case "heli": { _helis = []; };
                  case "plane": { _planes = []; };
                };
              };
            };
          };
        };
      };
    };
  };
  case "independent": {
    switch (_faction) do {
      case "aaf": {};
      case "fia": {};
    };
  };
};
if (!isNil "_leaders") then { if ((count _leaders) > 0) then { { _return_array set [count _return_array,_x]; } forEach _leaders; }; };
if (!isNil "_infantry") then { if ((count _infantry) > 0) then { { _return_array set [count _return_array,_x]; } forEach _infantry; }; };
if (!isNil "_medics") then { if ((count _medics) > 0) then { { _return_array set [count _return_array,_x]; } forEach _medics; }; };
if (!isNil "_vehicles") then { if ((count _vehicles) > 0) then { { _return_array set [count _return_array,_x]; } forEach _vehicles; }; };
if (!isNil "_armor") then { if ((count _armor) > 0) then { { _return_array set [count _return_array,_x]; } forEach _armor; }; };
if (!isNil "_boats") then { if ((count _boats) > 0) then { { _return_array set [count _return_array,_x]; } forEach _boats; }; };
if (!isNil "_helis") then { if ((count _helis) > 0) then { { _return_array set [count _return_array,_x]; } forEach _helis; }; };
if (!isNil "_planes") then { if ((count _planes) > 0) then { { _return_array set [count _return_array,_x]; } forEach _planes; }; };
_return_array
