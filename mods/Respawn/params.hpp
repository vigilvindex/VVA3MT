// https://community.bistudio.com/wiki/Arma_3_Respawn
class modRespawnSwitch {
  title = "BIS Respawn Module:";
  values[] = {0,1};
  texts[] = {"Disabled","Enabled"};
  default = 1;
};
class respawn { // http://goo.gl/Xd3vW#respawn
    title    = "BIS Respawn Mode:";
    values[] = {0,1,2,3};
    texts[]  = {"NONE", "BIRD", "INSTANT", "BASE", "GROUP", "SIDE"};
    default  = 3;
};
class respawnButton { // http://goo.gl/Xd3vW#respawnButton
    title    = "BIS Respawn Button:";
    values[] = {0,1};
    texts[]  = {"Disabled", "Enabled"};
    default  = 1;
};
class respawnDelay { // http://goo.gl/Xd3vW#respawnDelay
    title    = "BIS Respawn Delay:";
    values[] = {0,10,20};
    texts[]  = {"None", "10 Seconds", "20 Seconds"};
    default  = 10;
};
class respawnDialog { // http://goo.gl/Xd3vW#respawnDialog
    title    = "BIS Respawn Dialog:";
    values[] = {0,1,2};
    texts[]  = {"Disabled", "Enabled"};
    default  = 1;
};
class respawnOnStart { // http://goo.gl/Xd3vW#respawnOnStart
    title    = "BIS Respawn On Start:";
    values[] = {-1,0,1};
    texts[]  = {"Disabled", "Enabled", "Enabled + Respawn"};
    default  = -1;
};
class respawnVehicleDelay { // http://goo.gl/Xd3vW#respawnVehicleDelay
    title    = "BIS Respawn Vehicle Delay:";
    values[] = {0,60,120};
    texts[]  = {"None", "1 Minute", "2 Minutes"};
    default  = 60;
};
class modRespawnSpacer {
  title = " ";
  values[] = {0};
  texts[] = {" "};
  default = 0;
};