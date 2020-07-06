/* Name: params.cpp
Description: Parameter data for the VVM module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/07/21 Updated: 2016/08/16 Version: 0.0.1
*/
class modVVRushSwitch {
  title    = "VVRush Module:";
  values[] = {0,1};
  texts[]  = {"Disabled","Enabled"};
  default  = 1;
};
class modVVRushRoundsSwitch {
  title    = "VVRush Module: Rounds";
  values[] = {1,2,3,4,5,6,7,8,9};
  texts[]  = {"1","2","3","4","5","6","7","8","9"};
  default  = 3;
};
class modVVRushPrepTimeSwitch {
  title    = "VVRush Module: Preparation Time (Minutes)";
  values[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60};
  texts[]  = {"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60"};
  default  = 5;
};
class modVVRushRoundTimeSwitch {
  title    = "VVRush Module: Round Time (Minutes)";
  values[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60};
  texts[]  = {"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60"};
  default  = 10;
};
class modVVRushDefuseTimeSwitch {
  title    = "VVRush Module: Defusal Time (Seconds)";
  values[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60};
  texts[]  = {"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60"};
  default  = 20;
};
class modVVRushArsenalSwitch {
  title    = "VVRush Module: Arsenal Restricted To Side";
  values[] = {0,1};
  texts[]  = {"Disabled","Enabled"};
  default  = 0;
};
class modVVRushMarkerSwitch {
  title    = "VVRush Module: Marker Behaviour Type";
  values[] = {0,1,2};
  texts[]  = {"No Markers","Show Rough Marker","Show Precise Markers"};
  default  = 1;
};
class modVVRushASDistanceSwitch {
  title    = "VVRush Module: Minimum Distance From Objective For Attackers Spawn Location (Metres)";
  values[] = {100,200,300,400,500,600,700,800,900,1000,1100,1200,1300,1400,1500,1600,1700,1800,1900,2000};
  texts[]  = {"100","200","300","400","500","600","700","800","900","1000","1100","1200","1300","1400","1500","1600","1700","1800","1900","2000"};
  default  = 200;
};
class modVVRushLocationSwitch {
  title    = "VVRush Module: Location Selection Type";
  values[] = {0,1};
  texts[]  = {"Random","Static"};
  default  = 0;
};
class modVVRushSpacer {
  title = " ";
  values[] = {0};
  texts[] = {" "};
  default = 0;
};