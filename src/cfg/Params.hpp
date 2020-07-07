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
  #ifdef modFTPP
    #include "..\mods\FTPP\params.hpp"
  #endif
  #ifdef modJIPTP
    #include "..\mods\JIPTP\params.hpp"
  #endif
  #ifdef modVVDT
    #include "..\mods\VVDT\params.hpp"
  #endif
  #ifdef modVVM
    #include "..\mods\VVM\params.hpp"
  #endif
  #ifdef modVVS
    #include "..\mods\VVS\params.hpp"
  #endif
  #ifdef modVVW
    #include "..\mods\VVW\params.hpp"
  #endif
};