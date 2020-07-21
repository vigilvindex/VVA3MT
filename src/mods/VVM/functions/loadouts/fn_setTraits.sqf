
private ["_unit","_traits","_traitkeys"];
_unit = _this select 0;
_traits = _this select 1;
_traitkeys = ["engineer","explosiveSpecialist","medic","UAVHacker"];
{_unit setUnitTrait [_x,_traits select _forEachIndex]} forEach _traitkeys;
