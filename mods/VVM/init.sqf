/* Name: init.sqf
Description: Initialises the VVM module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2013/08/09 Updated: 2016/08/16 Version: 0.0.1
*/
if (isNil "modVVMSwitch") then {modVVMSwitch = 0;};
if (modVVMSwitch == 1) then {
  if (modDebug == 1) then {
    diag_log format ["#%1#%2#%3#Loading VVM.#",time,__FILE__ select [count PATH],__LINE__];
	  systemChat "Loading VVM.";
  };
  if (isServer) then {
    if (!isNil "w1") then {
      _west = getPos w1;
      _marker = [["n","respawn_west"],["t","respawn_west"],["p",_west],["c",2]] call VVM_fnc_createMarker;
      [west,_west,"West HQ"] call BIS_fnc_addRespawnPosition;
      [["p",([_west,1,2,1,0,0.25,0] call BIS_fnc_findSafePos)],["c",1]] call VVM_fnc_createFlagpole;
      [["p",([_west,1,2,1,0,0.25,0] call BIS_fnc_findSafePos)],["s",1]] call VVM_fnc_createArsenal;
      [["p",([_west,1,50,10,0,0.25,0] call BIS_fnc_findSafePos)]] call VVM_fnc_createVVS;
    };
    if (!isNil "e1") then {
      _east = getPos e1;
      _marker = [["n","respawn_east"],["t","respawn_east"],["p",_east],["c",9]] call VVM_fnc_createMarker;
      [east,_east,"East HQ"] call BIS_fnc_addRespawnPosition;
      [["p",([_east,1,2,1,0,0.25,0] call BIS_fnc_findSafePos)],["c",0]] call VVM_fnc_createFlagpole;
      [["p",([_east,1,2,1,0,0.25,0] call BIS_fnc_findSafePos)],["s",0]] call VVM_fnc_createArsenal;
      [["p",([_east,1,50,10,0,0.25,0] call BIS_fnc_findSafePos)]] call VVM_fnc_createVVS;
    };
    if (!isNil "g1") then {
      _indy = getPos g1;
      _marker = [["n","respawn_guerrila"],["t","respawn_guerrila"],["p",_indy],["c",4]] call VVM_fnc_createMarker;
      [independent,_indy,"Independent HQ"] call BIS_fnc_addRespawnPosition;
      [["p",([_indy,1,2,1,0,0.25,0] call BIS_fnc_findSafePos)],["c",2]] call VVM_fnc_createFlagpole;
      [["p",([_indy,1,2,1,0,0.25,0] call BIS_fnc_findSafePos)],["s",2]] call VVM_fnc_createArsenal;
      [["p",([_indy,1,50,10,0,0.25,0] call BIS_fnc_findSafePos)]] call VVM_fnc_createVVS;
    };
    if (!isNil "c1") then {
      _civ = getPos c1;
      _marker = [["n","respawn_civilian"],["t","respawn_civilian"],["p",_civ],["c",8]] call VVM_fnc_createMarker;
      [civilian,_civ,"Civilian HQ"] call BIS_fnc_addRespawnPosition;
      [["p",([_civ,1,2,1,0,0.25,0] call BIS_fnc_findSafePos)],["c",3]] call VVM_fnc_createFlagpole;
      [["p",([_civ,1,2,1,0,0.25,0] call BIS_fnc_findSafePos)],["s",3]] call VVM_fnc_createArsenal;
      [["p",([_civ,1,50,10,0,0.25,0] call BIS_fnc_findSafePos)]] call VVM_fnc_createVVS;
    };
    [player,[]] remoteExec ["VVM_fnc_setRespawnMarkerAlpha",0,true];
    
    //_wall = [["s",[1100,1100,0]],["e",[1100,1200,0]],["t",2],["d",true]] call VVM_fnc_createWall;
    //_wall = [["s",[1100,1200,0]],["e",[1200,1200,0]],["t",2],["d",true]] call VVM_fnc_createWall;
    //_wall = [["s",[1200,1200,0]],["e",[1200,1300,0]],["t",2],["d",true]] call VVM_fnc_createWall;
    //_wall = [["s",[1200,1300,0]],["e",[1300,1300,0]],["t",2],["d",true]] call VVM_fnc_createWall;
    
    _ai_wp = [1500,1500,0];
    _ai_groups = 0;
/*  for "_i" from 0 to _ai_groups do {
      _group = [["s",2],["p",_respawn_east],["f",1],["t",0],["c",1],["sc",0]] call VVM_fnc_createGroup;
      _wp = [["g",_group],["t",_start],["n",format["E_WP1_%1",_i]],["de",format["Waypoint 1 %1",_i]],["ty",0],["s",3],["f",7],["c",4]] call VVM_fnc_createWaypoint;
      _wp = [["g",_group],["t",_end],["n",format["E_WP2_%1",_i]],["de",format["Waypoint 2 %1",_i]],["ty",7],["s",3],["f",7],["c",4]] call VVM_fnc_createWaypoint;
    };
*/  for "_i" from 0 to _ai_groups do {
      _group = [["s",2],["p",[1000,1000,0]],["f",1],["t",0],["c",1],["sc",0],["si",1]] call VVM_fnc_createGroup;
      _wp1 = [["g",_group],["t",[2000,2000,0]],["n",format["W_WP1_%1",_i]],["de",format["Waypoint 1 %1",_i]],["ty",0],["s",3],["f",8],["c",5],["b",2]] call VVM_fnc_createWaypoint;
      _wp2 = [["g",_group],["t",[2000,3000,0]],["n",format["W_WP2_%1",_i]],["de",format["Waypoint 2 %1",_i]],["ty",0],["s",3],["f",8],["c",5],["b",2]] call VVM_fnc_createWaypoint;
      _wp3 = [["g",_group],["t",[3000,3000,0]],["n",format["W_WP3_%1",_i]],["de",format["Waypoint 3 %1",_i]],["ty",0],["s",3],["f",8],["c",5],["b",2]] call VVM_fnc_createWaypoint;
      _wp4 = [["g",_group],["t",[3000,2000,0]],["n",format["W_WP4_%1",_i]],["de",format["Waypoint 4 %1",_i]],["ty",0],["s",3],["f",8],["c",5],["b",2]] call VVM_fnc_createWaypoint;
      _wp5 = [["g",_group],["t",[2000,2000,0]],["n",format["W_WP5_%1",_i]],["de",format["Waypoint 5 %1",_i]],["ty",7],["s",3],["f",8],["c",5],["b",2]] call VVM_fnc_createWaypoint;
      _wpm1 = [["n","W_WPM1"],["t","W_WP1"],["p",[2000,2000,0]],["c",0]] call VVM_fnc_createMarker;
      _wpm2 = [["n","W_WPM2"],["t","W_WP2"],["p",[2000,3000,0]],["c",0]] call VVM_fnc_createMarker;
      _wpm3 = [["n","W_WPM3"],["t","W_WP3"],["p",[3000,3000,0]],["c",0]] call VVM_fnc_createMarker;
      _wpm4 = [["n","W_WPM4"],["t","W_WP4"],["p",[3000,2000,0]],["c",0]] call VVM_fnc_createMarker;
      _wpm5 = [["n","W_WPM5"],["t","W_WP5"],["p",[2000,2000,0]],["c",0]] call VVM_fnc_createMarker;
      [] spawn {
        while {true} do {
          _hint = "";
          _waypoints = [];
          { _waypoints = _waypoints + waypoints group _x; } forEach allUnits;
          { _hint = _hint + format ["%1",_x]; _hint = _hint + " "; } forEach _waypoints;
          hint format ["%1",_hint];
          sleep 1;
        };
      };
    };
  };
};

/*
[] execVM "mods\VVM\scripts\BuildAutoGenV2.sqf"
_base = [[7600.99,10609.7,-27.4461],373.76,230.64,0];
_base_marker = [["n","Base1"],["p",_base select 0],["t","Base1"],["s",[_base select 1,_base select 2]],["sh",1]] call vvMOD_fnc_createMarker;
_radio = [[7000.13,10085.3,-117.032],373.76,230.64,0];
_radio_marker = [["n","Radio1"],["p",_radio select 0],["t","Radio1"],["s",[_radio select 1,_radio select 2]],["sh",1]] call vvMOD_fnc_createMarker;
for "_i" from 0 to 9 do {
  _pos = ["Base1",0,[],1] call ShkPos_fnc_findRandomPositionInMarker;
  _pos = [_pos,0,10,1,0,0,0,[],[_pos,_pos]] call BIS_fnc_findSafePos;
  _group = [["si",0],["p",_pos]] call vvMOD_fnc_createGroup;
  { _x setPos _pos; } forEach units _group;
  0 = [leader _group,100,700,"Base1","Base1",700,FALSE,"SAFE","RED","NORMAL","FILE",0,30,0,[true,35,25,3,1]] execVM "scripts\USPS.sqf";
  _rpos = ["Radio1",0,[],1] call ShkPos_fnc_findRandomPositionInMarker;
  _rpos = [_rpos,0,10,1,0,0,0,[],[_rpos,_rpos]] call BIS_fnc_findSafePos;
  _rgroup = [["si",1],["p",_rpos]] call vvMOD_fnc_createGroup;
  { _x setPos _rpos; } forEach units _rgroup;
  0 = [leader _rgroup,100,700,"Radio1","Radio1",700,FALSE,"SAFE","RED","NORMAL","FILE",0,30,0,[true,35,25,3,1]] execVM "scripts\USPS.sqf";
};
_locations = [true] call vvMOD_fnc_getMapLocations;
{ _name = _x select 0;
  _type = _x select 1;
  _pos =  _x select 2;
  _radx = _x select 3;
  _rady = _x select 4;
  _angle = _x select 5;
  _marker = [["n",format ["Marker%1",_forEachIndex]],["p",_pos],["t",_name],["s",[_radx,_rady]],["sh",1]] call vvMOD_fnc_createMarker;
  _marker = [["n",_name],["p",_pos],["t",_name]] call vvMOD_fnc_createMarker;
  // systemChat format ["# Name: %1, Type: %2, Pos: %3, Angle: %4, Size X: %5 Y: %6 #",_name,_type,_pos,_angle,_radx,_rady];
  // diag_log format ["# Name: %1, Type: %2, Pos: %3, Angle: %4, Size X: %5 Y: %6 #",_name,_type,_pos,_angle,_radx,_rady];
} forEach _locations;
_locations = [true] call vvMOD_fnc_getMapDynamicLocations;
{ _name = text _x;
  _type = type _x;
  _pos =  locationPosition _x;
  _size = size _x;
  _radx = _size select 0;
  _rady = _size select 1;
  _angle = direction _x;
  _importance = importance _x;
  _marker = [["n",format ["Marker%1",_forEachIndex]],["p",_pos],["t",_name],["s",[_radx,_rady]],["sh",1]] call vvMOD_fnc_createMarker;
  systemChat format ["# Name: %1, Type: %2, Pos: %3, Angle: %4, Size X: %5 Y: %6 #",_name,_type,_pos,_angle,_radx,_rady];
  diag_log format ["# Name: %1, Type: %2, Pos: %3, Angle: %4, Size X: %5 Y: %6 #",_name,_type,_pos,_angle,_radx,_rady];
} forEach _locations;
[configFile >> "CfgGroups"] execVM "scripts\ConfigParser.sqf";
_map_center = worldSize / 2;
_map_center_marker = [["n","_MapCenterMarker"],["p",[_map_center,_map_center,0]]] call vvMOD_fnc_createMarker;
_sectorWidth = 1000;
_sectorPosition = [_sectorWidth/2,_sectorWidth/2];
_sectors = [];
for "_gridY" from (_sectorWidth/2) to worldSize step (_sectorWidth) do {
  _sectorPosition set [0,_sectorWidth/2];
  _sectorPosition set [1,_gridY];
  for "_gridX" from (_sectorWidth/2) to worldSize step (_sectorWidth) do {
    _sectorPosition set [0,_gridX];
    _sectorMarker = [["n",format["_marker_%1_%2",_gridY,_gridX]],["t",format["SECTOR_%1_%2",_gridY,_gridX]],["p",[_gridY,_gridX,0]]] call vvMOD_fnc_createMarker;
  };
};
for "_i" from 0 to 9 do {
  _pos = ["leport_marker",0,[],1] call ShkPos_fnc_findRandomPositionInMarker;
  _pos = [_pos,0,10,1,0,0,0,[],[_pos,_pos]] call BIS_fnc_findSafePos;
  _group = [["s",2],["p",_pos],["f",1],["sc",1]] call vvMOD_fnc_createGroup;
  { _x setPos _pos; } forEach units _group;
  0 = [leader _group,100,700,"leport_marker","leport_marker",700,FALSE,"SAFE","RED","NORMAL","FILE",0,30,0,[true,35,25,3,1]] execVM "scripts\USPS.sqf"
};
*/
