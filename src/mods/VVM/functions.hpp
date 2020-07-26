/* CfgFunctions.cpp
Description: Loads function scripts for VVM module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/09 Updated: 2020/06/16 Version: 0.0.1
*/
class VVM {
	tag = "VVM";
  class actions {
    file = "mods\VVM\functions\actions";
  };
  class ai {
    file = "mods\VVM\functions\ai";
  };
  class briefing {
    file = "mods\VVM\functions\briefing";
  };
  class compositions {
    file = "mods\VVM\functions\compositions";
    class createArsenal {};
    class createFlagpole {};
    class createGarage {};
    class createVVS {};
  };
  class cron {
    file = "mods\VVM\functions\cron";
    class cronInit {
		  postInit = 1;
		};
		class cronJobAdd {};
		class cronJobRemove {};
		class cronJobRun {};
  };
  class data {
    file = "mods\VVM\functions\data";
  };
  class environment {
    file = "mods\VVM\functions\environment";
  };
  class loadouts {
    file = "mods\VVM\functions\loadouts";
    class clearGear {};
    class getAttachments {};
    class getFactionRole {};
    class getItems {};
    class getMagazines {};
    class getRole {};
    class getWeapon {};
    class parseRole {};
    class parseWeapon {};
    class setLoadout {};
    class setTraits {};
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
    class arrowToMapGlobal {};
    class arrowToMapLocal {};
    class bordersToMapGlobal {};
    class bordersToMapLocal {};
    class lineToMapGlobal {};
    class lineToMapLocal {};
    class textToMapFont {};
    class textToMapGlobal {};
    class textToMapLocal {};
  };
  class modules {
    file = "mods\VVM\functions\modules";
  };
  class positions {
		file = "mods\VVM\functions\positions";
		class executeFindPosition {};
		class findClosestPosition {};
		class findPosition {};
		class findRandomPositionInMarker {};
		class getMarkerCorners {};
		class getMarkerShape {};
		class getPos {};
		class getPosFromCircle {};
		class getPosFromEllipse {};
		class getPosFromRectangle {};
		class getPosFromSquare {};
		class isBlacklisted {};
		class isInCircle {};
		class isInEllipse {};
		class isInRectangle {};
		class isSamePosition {};
		class rotatePosition {};
		class startingPositionRandomizer {};
  };
  class tasks {
    file = "mods\VVM\functions\tasks";
    class taskMaster {};
  };
  class triggers {
    file = "mods\VVM\functions\triggers";
    class createTrigger {};
  };
  class waypoints {
    file = "mods\VVM\functions\waypoints";
    class createWaypoint {};
    class patrol {};
  };
};
