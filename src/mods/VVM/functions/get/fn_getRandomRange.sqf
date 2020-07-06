/* Name: vv_fnc_random_range.sqf
 * Description: Returns a random number from a range.
 * Authors: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2013/09/20
 * Arguments:
 *  0 - DEBUG boolean (true/false)
 *  1 - RANGE array float [0.2,0.7]
 * Returns: float (0.0)
 * Usage: _random = [DEBUG,RANGE] call vv_fnc_random_range;
 * Example: _random = [FALSE,[0.2,0.7]] call vv_fnc_random_range;
 */
private["_debug"];
_debug = _this select 0;
_range = _this select 1;
_random = random ((_range select 1) + 0.1);
while {_random < (_range select 0)} do {
  _random = random ((_range select 1) + 0.1);
};
if(_debug)then{
  diag_log format["#%1# vv_fnc_random_range.sqf # _random = %2",time,_random];
};
_random
