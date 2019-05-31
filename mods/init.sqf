/* init.sqf - Initialises modules. - vigil.vindex@gmail.com - https://creativecommons.org/licenses/by-sa/4.0/ */
diag_log format ["#%1#%2#%3#",time,__FILE__ select [count PATH],__LINE__];
#include "..\cfg\Modules.hpp"
#ifndef execNow
  #define execNow call compile preprocessfilelinenumbers
#endif
#ifdef modCoreTime
  execNow "mods\CoreTime\init.sqf";
#endif
#ifdef modCrewInfo
  execNow "mods\CrewInfo\init.sqf";
#endif
#ifdef modCron
  execNow "mods\Cron\init.sqf";
#endif
#ifdef modDateTime
  execNow "mods\DateTime\init.sqf";
#endif
#ifdef modFTPP
  execNow "mods\FTPP\init.sqf";
#endif
#ifdef modJIPTP
  execNow "mods\JIPTP\init.sqf";
#endif
#ifdef modRandomWeather
  execNow "mods\RandomWeather\init.sqf";
#endif
#ifdef modRespawn
  execNow "mods\Respawn\init.sqf";
#endif
#ifdef modRevive
  execNow "mods\Revive\init.sqf";
#endif
#ifdef modSHK
  execNow "mods\SHK\init.sqf";
#endif
#ifdef modSpectator
  execNow "mods\Spectator\init.sqf";
#endif
#ifdef modVVM
  execNow "mods\VVM\init.sqf";
#endif
#ifdef modVVS
  execNow "mods\VVS\init.sqf";
#endif