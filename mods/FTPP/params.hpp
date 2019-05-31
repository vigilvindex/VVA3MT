/* params.cpp
Description: Parameter data for the RestrictView module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/07/21 Updated: 2019/02/04 Version: 0.0.1
*/
class modFTPPSwitch {
    title = "Restrict View For Infantry Or Vehicles To First/Third Person Perspective:";
    values[]= {0,1,2,3};
    texts[]= {"Disabled", "Enabled - INF: FP VEH: FP/TP", "Enabled - INF: FP/TP VEH: FP", "Enabled - INF: FP VEH: FP"};
    default = 0;
};
class modFTPPSpacer {
  title = " ";
  values[] = {0};
  texts[] = {" "};
  default = 0;
};
