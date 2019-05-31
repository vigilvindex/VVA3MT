/* Params.hpp - Parameter data for the mission. - vigil.vindex@gmail.com - https://creativecommons.org/licenses/by-sa/4.0/ */
class Params { // https://community.bistudio.com/wiki/Arma_3_Mission_Parameters
  class modDebug {
    title    = "Debug:";
    values[] = {0,1};
    texts[]  = {"Disabled","Enabled"};
    default  = 1;
  };
  class modDebugSpacer {
    title = " ";
    values[] = {0};
    texts[] = {" "};
    default = 0;
  };
  #ifdef modCoreTime
    #include "..\mods\CoreTime\params.hpp"
  #endif
  #ifdef modCrewInfo
    #include "..\mods\CrewInfo\params.hpp"
  #endif
  #ifdef modCron
    #include "..\mods\Cron\params.hpp"
  #endif
  #ifdef modDateTime
    #include "..\mods\DateTime\params.hpp"
  #endif
  #ifdef modFTPP
    #include "..\mods\FTPP\params.hpp"
  #endif
  #ifdef modJIPTP
    #include "..\mods\JIPTP\params.hpp"
  #endif
  #ifdef modRandomWeather
    #include "..\mods\RandomWeather\params.hpp"
  #endif
  #ifdef modRespawn
    #include "..\mods\Respawn\params.hpp"
  #endif
  #ifdef modRevive
    #include "..\mods\Revive\params.hpp"
  #endif
  #ifdef modSHK
    #include "..\mods\SHK\params.hpp"
  #endif
  #ifdef modSpectator
    #include "..\mods\Spectator\params.hpp"
  #endif
  #ifdef modVVM
    #include "..\mods\VVM\params.hpp"
  #endif
  #ifdef modVVS
    #include "..\mods\VVS\params.hpp"
  #endif
};