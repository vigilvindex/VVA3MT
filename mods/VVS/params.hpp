/* params.cpp
Description: Parameter data for the VVS module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/07/21 Updated: 2016/08/16 Version: 0.0.1
*/
class modVVSSwitch {
    title = "Virtual Vehicle Spawn:";
    values[]= {0,1};
    texts[]= {"Disabled", "Enabled"};
    default = 1;
};
class modVVSSide {
    title = "Virtual Vehicle Spawn - Side Only:";
    values[]= {0,1};
    texts[]= {"Disabled", "Enabled"};
    default = 0;
};
class modVVSSpacer {
  title = " ";
  values[] = {0};
  texts[] = {" "};
  default = 0;
};