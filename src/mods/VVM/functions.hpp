/* CfgFunctions.cpp
Description: Loads function scripts for VVM module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/09 Updated: 2020/06/16 Version: 0.0.1
*/
class VVM {
	tag = "VVM";
  class ai {
    file = "mods\VVM\functions\ai";
  };
  class briefing {
    file = "mods\VVM\functions\briefing";
  };
  class compositions {
    file = "mods\VVM\functions\compositions";
    class createFlagpole {};
    class createGarage {};
    class createVVS {};
  };
  class environment {
    file = "mods\VVM\functions\environment";
  };
  class locations {
    file = "mods\VVM\functions\locations";
    class getSafePosition {};
    class getMapLocations {};
    class getMapCenterPosition {};
  };
  class markers {
    file = "mods\VVM\functions\markers";
    class createMarker {};
    class setRespawnMarkerAlpha {};
  };
  class modules {
    file = "mods\VVM\functions\modules";
  };
  class tasks {
    file = "mods\VVM\functions\task";
  };
  class triggers {
    file = "mods\VVM\functions\triggers";
    class createTrigger {};
  };
  class waypoints {
    file = "mods\VVM\functions\waypoints";
    class createWaypoint {};
  };
};
