/* Name: vv_fnc_get_classname_groups.sqf
 * Description: Returns an array of classnames for groups.
 * Authors: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/4.0/
 * Created: 2016/08/10 Updated: 2016/08/11
 * Returns: classnames (array) ["classname1","classname2"]
 * Arguments: index: name (type) values {default}
 *   0: debug: (boolean) true,false {false}
 *   1: side: (int) 0,1,2,3 {0}
        0: east
        1: west
        2: independent
        3: civilian
 *   2: faction: (int) 0,1,2,3 {0}
        east 0: csat
        east 1: cast (pacific)
        west 0: nato
        west 1: nato (pacific)
        independent 0: aaf
        independent 1: fia
        civilian 0: civilian
 *   3: class: (string) airforce,army,navy
 *   4: type: (string) man,vehicle
 *   5: subtype: (string) man[leader,infantry,medic]vehicle[vehicle,armor,boat,heli,plane,drone]
 * Example: _units = [FALSE,"east","opfor","army","man","infantry"] call VVM_fnc_getClassGroups;
 * Todo:
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
  case 0: {
    switch (_faction) do {
      case 0: {
        switch (_class) do {
          case "airforce": {
            switch (_type) do {
              case "man": {
                switch (_sub_type) do {};
              };
              case "vehicle": {
                switch (_sub_type) do {};
              };
            };
          };
          case "army": {
            switch (_type) do {
              case "man": {
                switch (_sub_type) do {};
              };
              case "vehicle": {
                switch (_sub_type) do {};
              };
            };
          };
          case "navy": {
            switch (_type) do {
              case "man": {
                switch (_sub_type) do {};
              };
              case "vehicle": {
                switch (_sub_type) do {};
              };
            };
          };
        };
      }; // CSAT
      case 1: {}; // CSAT Pacific
    };
  };
  case 1: {
    switch (_faction) do {
      case 0: {
        switch (_class) do {
          case "airforce": {
            switch (_type) do {
              case "man": {
                switch (_sub_type) do {};
              };
              case "vehicle": {
                switch (_sub_type) do {};
              };
            };
          };
          case "army": {
            switch (_type) do {
              case "man": {
                switch (_sub_type) do {};
              };
              case "vehicle": {
                switch (_sub_type) do {};
              };
            };
          };
          case "navy": {
            switch (_type) do {
              case "man": {
                switch (_sub_type) do {};
              };
              case "vehicle": {
                switch (_sub_type) do {};
              };
            };
          };
        };
      }; // NATO
      case 1: {}; // NATO Pacific
    };
  };
  case 2: {
    switch (_faction) do {
      case "aaf": {};
      case "fia": {};
    };
  };
  case 3: {
    switch (_faction) do {
      case "altian": {
        switch (_class) do {
          case "airforce": {
            switch (_type) do {
              case "man": {
                switch (_sub_type) do {};
              };
              case "vehicle": {
                switch (_sub_type) do {};
              };
            };
          };
          case "army": {
            switch (_type) do {
              case "man": {
                switch (_sub_type) do {};
              };
              case "vehicle": {
                switch (_sub_type) do {};
              };
            };
          };
          case "navy": {
            switch (_type) do {
              case "man": {
                switch (_sub_type) do {};
              };
              case "vehicle": {
                switch (_sub_type) do {};
              };
            };
          };
        };
      };
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
