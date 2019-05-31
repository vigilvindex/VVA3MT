/* params.cpp
Description: Parameter data for the RandomWeather module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/07/21 Updated: 2016/08/16 Version: 0.0.1
*/
class modRandomWeatherSwitch {
  title = "RandomWeather Module:";
  values[] = {0,1};
  texts[] = {"Disabled","Enabled"};
  default = 0;
};
class modRandomWeatherInitial {
  title = "RandomWeather Settings - Initial Weather Conditions:";
  values[] = {0,1,2,3,4};
  texts[] = {"Clear","Overcast","Rain","Fog","Random"};
  default = 0;
};
class modRandomWeatherDebugSwitch {
  title = "RandomWeather Settings - Debug:";
  values[] = {0,1};
  texts[] = {"Disabled","Enabled"};
  default = 0;
};
class modRandomWeatherSpacer {
  title = " ";
  values[] = {0};
  texts[] = {" "};
  default = 0;
};
