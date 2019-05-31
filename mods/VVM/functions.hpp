/* CfgFunctions.cpp
Description: Loads function scripts for VVM module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/09 Updated: 2016/08/15 Version: 0.0.1
*/
class VVM {
	tag = "VVM";
  class create {
    file = "mods\VVM\functions\create";
    class createArsenal {};
    class createBodylight {};
    class createFlagpole {};
    class createGarage {};
    class createGroup {};
    class createMarker {};
    class createObjective {};
    class createSmoke {};
    class createTask {};
    class createTrigger {};
    class createUnit {};
    class createVehicle {};
    class createVVS {};
    class createWall {};
    class createWaypoint {};
  };
  class get {
    file = "mods\VVM\functions\get";
    class getClassGroups {};
    class getClassUnits {};
    // class getClassVehicles {};
    class getFactionArray {};
    class getGroupTypeClasses {};
    class getGroupTypes {};
    class getMapArea {};
    class getMapCenter {};
    class getMapCenterPosition {};
    class getMapDynamicLocations {};
    class getMapDynamicRoads {};
    class getMapLocations {};
    class getMapMilitaryBuildings {};
    class getMapSize {};
    class getMapUnderwaterWrecks {};
    class getPositionBuildingPositions {};
    class getRandomRange {};
    class getSideArray {};
    class getSkillMM {};
  };
  class hqs {
    file = "mods\VVM\functions\hq";
    class HqsCreateAhq {};
    class HqsCreateHq {};
    class HqsCreateMarkers {};
    class HqsCreateMhq {};
    class HqsRespawn {};
    class HqsShowMarkers {};
  };
  class pop {
    file = "mods\VVM\functions\pop";
    class popMapCivilianCars {};
    class popMapEOS {};
    class popMapSLP {};
    class popMapUnderwaterWrecksEOS {};
    class popMapUnderwaterWrecksSLP {};
  };
  class set {
    file = "mods\VVM\functions\set";
    class setAiGroupSkill {};
    class setPosition {};
    class setRespawnMarkerAlpha {};
  };
  class test {
    file = "mods\VVM\functions\test";
    class testIfCase {};
  };
};
