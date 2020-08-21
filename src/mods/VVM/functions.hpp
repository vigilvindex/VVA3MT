/* CfgFunctions.cpp
Description: Defines functions for VVM module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/09 Updated: 2020/08/14 Version: 0.0.1
*/
class VVM {
	tag = "VVM";
  class actions {
    file = "mods\VVM\functions\actions";
  };
  class ai {
    file = "mods\VVM\functions\ai";
    class createGroup {};
    class createSquad {};
    class createUnit {};
    class createVehicle {};
    class getMilOrg {};
    class getVehicle {};
  };
  class briefing {
    file = "mods\VVM\functions\briefing";
    class createBriefing {};
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
    class getClimate {};
  };
  class loadouts {
    file = "mods\VVM\functions\loadouts";
    class clearGear {};
    class getFaces {};
    class getInsignias {};
    class getFactionRole {};
    class getItems {};
    class getMagazines {};
    class getRole {};
    class getVoices {};
    class getWeapon {};
    class parseRole {};
    class parseWeapon {};
    class setLoadout {};
    class setTraits {};
  };
  class loadouts_attachments {
    file = "mods\VVM\functions\loadouts\attachments";
    class getBipods {};
    class getMuzzles {};
    class getOptics {};
    class getPointers {};
  };
  class loadouts_clothes {
    file = "mods\VVM\functions\loadouts\clothes";
    class getBackpacks {};
    class getFacewear {};
    class getHeadgear {};
    class getUniforms {};
    class getVests {};
  };
  class loadouts_items {
    file = "mods\VVM\functions\loadouts\items";
    class getBinoculars {};
    class getCompasses {};
    class getMaps {};
    class getMeds {};
    class getNvgs {};
    class getRadios {};
    class getTerminals {};
    class getTools {};
    class getWatches {};
  };
  class loadouts_munitions {
    file = "mods\VVM\functions\loadouts\munitions";
    class getChemlights {};
    class getExplosives {};
    class getFlares {};
    class getGrenades {};
    class getMines {};
    class getSmokes {};
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
    class orbatMarker {};
    class setRespawnMarkerAlpha {};
    class signalsMarker {};
  };
  class markers_gkb {
    file = "mods\VVM\functions\markers\gkb";
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
    class militaryMarkers {};
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
  class tools {
    file = "mods\VVM\functions\tools";
    class clickMapPositionToClipboard {};
    class displayMapDateTime {};
    class displayText {};
    class getCursorClassname {};
    class getRandomRange {};
    class parseCfg {};
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
