/* CfgFunctions.cpp
Description: Loads function scripts for VVM module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2016/08/09 Updated: 2016/08/15 Version: 0.0.1
*/
class VVRush {
	tag = "VVRush";
  class create {
    file = "mods\VVRush\functions\create";
    class createRoundEnd {};
    class createRoundStart {};
  };
  class get {
    file = "mods\VVRush\functions\get";
    class getMapRushLocations {};
  };
  class set {
    file = "mods\VVRush\functions\set";
    class setScore {};
  };
};