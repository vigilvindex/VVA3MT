/* Name: vv_fnc_set_ai_group_skill.sqf
 * Description: Sets the skill settings for a group of AI.
 * Authors: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2013/09/20
 * Arguments:
 *  0 - DEBUG boolean (true/false)
 *  1 - GROUP object (_group)
 *  2 - SKILL number (0)
 * Usage:
 * Example: https://community.bistudio.com/wiki/CfgAISkill
aimingAccuracy[] = {0, 0, 1, 1};
aimingShake[] = {0, 0, 1, 1};
aimingSpeed[] = {0, 0.5, 1, 1};
commanding[] = {0, 0, 1, 1};
courage[] = {0, 0, 1, 1};
endurance[] = {0, 0, 1, 1};
general[] = {0, 0, 1, 1};
reloadSpeed[] = {0, 0, 1, 1};
spotDistance[] = {0, 0.2, 1, 0.4};
spotTime[] = {0, 0, 1, 0.7};
 */
private["_debug"];
_debug = _this select 0;
_group = _this select 1;
_skill = _this select 2;
switch {(_skill)} do {
  case 0: { // Novice >= 0.05 & < 0.25
    _random_skill = [FALSE,[0.5,0.25]] call VVM_fnc_randomRange;
  };
  case 1: { // Rookie >= 0.25 & <= 0.45
    _random_skill = [FALSE,[0.25,0.45]] call VVM_fnc_randomRange;
  };
  case 2: { // Recruit > 0.45 & <= 0.65
    _random_skill = [FALSE,[0.45,0.65]] call VVM_fnc_randomRange;
  };
  case 3: { // Veteran > 0.65 & <= 0.85
    _random_skill = [FALSE,[0.65,0.85]] call VVM_fnc_randomRange;
  };
  case 4: { // Expert > 0.85 & <= 1
    _random_skill = [FALSE,[0.85,1]] call VVM_fnc_randomRange;
  };
};
_leader = leader _group;
_leader setskill 0.50;
{ _x setskill 0.3;
  _x setUnitAbility 0.3;
  _x setskill ["aimingAccuracy", random [0.1,0.2,0.3]];
  _x setskill ["aimingShake", random [0.4,0.6,0.8]];
  _x setskill ["aimingSpeed", random [0.01,0.1,0.3]];
  _x setskill ["spotDistance", random [0.3,0.5,0.7]];
  _x setskill ["spotTime", random [0.5,0.7,0.9]];
  _x setskill ["commanding", random [0.8,1,1.2]];
  _x setskill ["courage", random [0.4,0.6,0.8]];
  _x setskill ["general", random [0.1,0.3,0.5]];
  _x setskill ["reloadSpeed", random [0.01,0.1,0.3]];
} forEach units _group;
