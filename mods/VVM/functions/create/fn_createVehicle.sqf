/*
Name: fn_createVehicle.sqf
Description: Creates a vehicle.
Authors: vigil.vindex@gmail.com
Licence: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/19 Updated: 2016/08/19 Version: 0.0.1
Dependencies: n/a
Arguments:  index name      (default) TYPE    {Required}  min,max "values"
            d     debug     (false)   BOOLEAN {N}         *       "Disabled","Enabled"
            p     position  ([x,y,z]) ARRAY   {Y}         *       ""
            t     type      (0)       SCALAR  {N}         0,5     "Car","Boat","Heli","Plane","Sub","Tank","Armored"
            m     markers   ([])      ARRAY   {N}         *       ""
            r     radius    (0)       SCALAR  {N}         *       "Metres"
            s     special   (0)       SCALAR  {N}         0,3     "NONE","FLY","FORM","CAN_COLLIDE"
            a     azimuth   (0)       SCALAR  {N}         0,359   "Degrees"
Returns: OBJECT on success. FALSE on failure.
Usage: [["d",_debug],["p",_position],["t",_type],["m",_markers],["r",_radius],["s",_special],["a",_azimuth]] call VVM_fnc_createVehicle;
Examples:
  [["p",[5,5,1]]] call VVM_fnc_createVehicle;
  [["p",[5,5,1],["t",0],["s",1]]] call VVM_fnc_createVehicle;
  [["d",_debug],["p",[0,0,0]]] call VVM_fnc_createVehicle;
Todo:
*/
/*
if !(_this isEqualType [];) then { // If the arguments passed to the function are not an array.
  exitWith {
    diag_log format ["# %1 # %2 # ! Function called without required arguments array. _this = %3 #",time,__FILE__,_this];
    false;
  }; // Exit with a message to the server log and return false.
} else { // Otherwise.
  { // For each argument in the array.
    if !(_x isEqualType [];) then { // If the argument is not an array.
      exitWith { diag_log format ["# %1 # %2 # ! Function called without required argument type. _x = %3 #",time,__FILE__,_x]; false }; // Exit with a message to the server log and return false.
    } else { // Otherwise.
      switch (_x select 0) do { // Based on the value of the first element of the argument array.
        case "d": { (_x select 1) params ["_debug",false,[true]]; }; // If it is "d". Check the second element of the argument array is a boolean, and if not set the default value to false.
        case "p": { // If it is "p".
          if ((_x select 1) isEqualType []) then { // If the second element of the argument array is an array.
            (_x select 1) params ["_position",[0,0,0],[[]],[2,3]]; // Check the second element of the argument array is an array, and if not set the default value to [0,0,0].
          } else { // Otherwise.
            exitWith { diag_log format ["# %1 # %2 # ! Function called without required arguments. _x = %3 #",time,__FILE__,(_x select 1)]; false }; // Exit with a message to the server log and return false.
          };
        };
        case "t": { (_x select 1) params ["_type",0,[0]]; }; // If it is "t". Check the second element of the argument array is a scalar, and if not set the default value to 0.
        case "m": { (_x select 1) params ["_markers",[],[[]]]; }; // If it is "m". Check the second element of the argument array is an array, and if not set the default value to an empty array.
        case "r": { (_x select 1) params ["_radius",0,[0]]; }; // If it is "r". Check the second element of the argument array is a scalar, and if not set the default value to 0.
        case "s": { (_x select 1) params ["_special",0,[0]]; }; // If it is "s". Check the second element of the argument array is a scalar, and if not set the default value to 0.
        case "a": { (_x select 1) params ["_azimuth",0,[0]]; }; // If it is "a". Check the second element of the argument array is a scalar, and if not set the default value to 0.
        default { exitWith { diag_log format ["# %1 # %2 # ! Function called without required arguments. _x = %3 #",time,__FILE__,(_x select 1)]; false }; }; // Exit with a message to the server log and return false.
      };
    };
  } forEach _this;
  { // For each argument expected.
    if (isnil _x) then { // If the argument is not defined.
      switch (_x) do { // Based on the value of the argument.
          case "_debug": {(_x) params [(_x),false];}; // Set the default value.
          case "_type": {(_x) params [(_x),0];}; // Set the default value.
          case "_markers": {(_x) params [(_x),[]];}; // Set the default value.
          case "_radius": {(_x) params [(_x),0];}; // Set the default value.
          case "_special": {(_x) params [(_x),0;}; // Set the default value.
          case "_azimuth": {(_x) params [(_x),0];}; // Set the default value.
      };
    };
  } forEach ["_debug","_position","_type","_markers","_radius","_special","_azimuth"];
  private ["_params","_return","_specials","_types"]; // Create internal variables for the function.
  _params = [_debug,_position,_type,_markers,_radius,_special,_azimuth,_specials,_types]; // Create an array of variables.
  _specials = ["NONE","FLY","FORM","CAN_COLLIDE"]; // Create an array of special conditions for the createVehicle command.
  _types = ["Chemlight_blue"]; // Create an array of the vehicle types.
  _special = _specials select _special; // Select the special condition.
  _type = _types select _type; // Select the vehicle type.
  if (_debug) then { { diag_log format ["# %1 # %2 # %3 = %4",time,__FILE__,str _x,(_x)]; } forEach _params; }; // If debug is enabled log the variables to the server log.
  _return = createVehicle [_type,_position,_markers,_radius,_special]; // Create the vehicle.
  if (_debug) then { diag_log format ["# %1 # %2 # _return = %3 #",time,__FILE__,_return]; }; // If debug is enabled log the returned vehicle object to the server log.
  { _x = nil; } forEach _params; _params = nil; exitWith { _return; }; // Delete all internal variables and return the object.
};
*/
