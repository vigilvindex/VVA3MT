/* init.sqf
Description: Initialises the RandomWeather module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/07/21 Updated: 2016/08/16 Version: 0.0.1
*/
if (isNil "modRandomWeatherSwitch") then {modRandomWeatherSwitch = 0;};
if (modRandomWeatherSwitch == 1) then {
  diag_log format ["# %1 # %2 # %3 # Loading RandomWeather. #",time,__FILE__ select [count (parsingNamespace getVariable "MISSION_ROOT")],__LINE__];
  systemChat "Loading RandomWeather.";
  _handle = [] execVM "modules\RandomWeather\randomWeather2.sqf";
};
