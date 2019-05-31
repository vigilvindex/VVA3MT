/* Functions.hpp - Configuration classes for Functions. - vigil.vindex@gmail.com - https://creativecommons.org/licenses/by-sa/4.0/ */
allowFunctionsLog = 1; // http://goo.gl/Xd3vW#allowFunctionsLog
allowFunctionsRecompile = 1; // http://goo.gl/Xd3vW#allowFunctionsRecompile
enableDebugConsole = 1; // http://goo.gl/Xd3vW#enableDebugConsole
class CfgFunctions { // https://community.bistudio.com/wiki/Description.ext#CfgFunctions
  class scriptsFolder {
  	tag = "scriptsFolder";
  	class scripts {
  		file = "scripts";
      class getParams {postInit = 1;};
      class postInit {postInit = 1;};
      class preInit {preInit = 1;};
  	};
  };
  #ifdef modSHK
    #include "..\mods\SHK\functions.hpp"
  #endif
  #ifdef modSpectator
    #include "..\mods\Spectator\functions.hpp"
  #endif
  #ifdef modVVM
    #include "..\mods\VVM\functions.hpp"
  #endif
  #ifdef modVVS
    #include "..\mods\VVS\functions.hpp"
  #endif
};