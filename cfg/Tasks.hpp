/* Tasks.hpp - Configuration classes for Tasks. - vigil.vindex@gmail.com - https://creativecommons.org/licenses/by-sa/4.0/ */
taskManagement_drawDist = 2500;
taskManagement_markers2D = 1;
taskManagement_markers3D = 1;
taskManagement_propagate = 1;
class CfgTaskDescriptions {};
class CfgTaskTypes {}; // http://goo.gl/Xd3vW#CfgTaskTypes
class CfgTaskEnhancements {
	enable       = 1; // 0: disable new task features (default), 1: enable new task features & add new task markers and task widgets into the map
	3d           = 1; // 0: do not use new 3D markers (default), 1: replace task waypoints with new 3D markers
	3dDrawDist   = 0; // 3d marker draw distance (default: 2000)
	share        = 1; // 0: do not count assigned players (default), 1: count how many players have the task assigned
	propagate    = 1; // 0: do not propagate (default), 1: propagate shared tasks to subordinates
};