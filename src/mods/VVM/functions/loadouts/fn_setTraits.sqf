
private ["_unit","_traits","_traitkeys"];
diag_log format ["# %1 # fn_setTraits.sqf _this = %2 #",time,_this];
_unit = _this select 0;
_traits = _this select 1;
_traitkeys = ["engineer","explosiveSpecialist","medic","UAVHacker"];
{_unit setUnitTrait [_x,_traits select _forEachIndex]} forEach _traitkeys;
