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
    class createVehicle {};
    class getVehicle {};
  };
  class briefing {
    file = "mods\VVM\functions\briefing";
  };
  class compositions {
    file = "mods\VVM\functions\compositions";
    class createArsenal {};
    class createFactionRoleBox {};
    class createFlagpole {};
    class createGarage {};
    class createMedicalBox {};
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
  class environment {
    file = "mods\VVM\functions\environment";
  };
  class loadouts {
    file = "mods\VVM\functions\loadouts";
    class clearGear {};
    class getFactionRole {};
    class getItems {};
    class getMagazines {};
    class getRole {};
    class getWeapon {};
    class parseCfgWeapons {};
    class parseRole {};
    class parseWeapon {};
    class setLoadout {};
    class setTraits {};
  };
  class locations {
    file = "mods\VVM\functions\locations";
    class getMapBaseSpawnLocs {};
    class getMapLocations {};
    class getMapDynamicLocations {};
  };
  class locations_maps {
    file = "mods\VVM\functions\locations\maps";
    class getMapAltis {};
    class getMapChernarus {};
    class getMapEnoch {};
    class getMapMalden {};
    class getMapStratis {};
    class getMapTakistan {};
    class getMapTanoa {};
    class getMapVr {};
    class getMapWeferlingen {};
  };
  class locations_strat {
    file = "mods\VVM\functions\locations\strategic";
    class getMapAir {};
    class getMapFactory {};
    class getMapFuel {};
    class getMapMilitary {};
    class getMapPort {};
    class getMapPower {};
    class getMapRadio {};
    class getMapRoads {};
    class getMapDynamicRoads {};
  };
  class locations_tech {
    file = "mods\VVM\functions\locations\technical";
    class getMapArea {};
    class getMapCenter {};
    class getMapCenterPosition {};
    class getMapSize {};
    class getSafePosition {};
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
    class getBoundingBox {};
  };
  class positions_shk {
		file = "mods\VVM\functions\positions\shk";
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
    class createTask {};
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
