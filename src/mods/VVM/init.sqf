/* Name: init.sqf - Description: Initialises the VVM module. - Authors: vigil.vindex@gmail.com - License: https://creativecommons.org/licenses/by-sa/4.0/ - Created: 2013/08/09 Updated: 2016/08/16 Version: 0.0.1 */
if (isNil "modVVMSwitch") then {modVVMSwitch = 0};
if (modVVMSwitch == 1) then {
  if (modDebug == 1) then {
    diag_log format ["# %1 # %2 # %3 # Loading VVM. #",time,__FILE__ select [count PATH],__LINE__];
	  systemChat "Loading VVM.";
  };
  if (isServer) then {
    [] call VVM_fnc_parseCfg;
    [] call VVM_fnc_militaryMarkers;
    [] call VVM_fnc_clickMapPositionToClipboard;
    [] call VVM_fnc_displayMapDateTime;
    [] spawn {
      [["TEXT1","<t align = 'center' shadow = '1' size = '1.0'>%1</t><br/>"],["0500, ALTIS","<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"]] call VVM_fnc_displayText;
    };
    // [{([daytime,"HH:MM:SS"] call BIS_fnc_timeToString) remoteExec ["systemChat",0]},[],0,1,0] call VVM_fnc_cronJobAdd;
    EASTHQPOS = nil;
    WESTHQPOS = nil;
    GUERHQPOS = nil;
    _locations = [] call VVM_fnc_getMapBaseSpawnLocs;
    { _loc = floor random count _locations;
      _location = _locations select _loc;
      _string = format["
        %1HQPOS = %2;
        [%1HQPOS] call compile preprocessFileLineNumbers 'mods\VVM\functions\compositions\hqs\HQ_%1_DES.sqf';
        _side = _x;
        {if (side _x == _side) then {_x setPos %1HQPOS}} forEach allPlayers;
      ",_x,_location,_forEachIndex];
      _code = compile _string;
      call _code;
      _locations deleteAt _loc;
    } forEach [WEST,EAST,INDEPENDENT];
    diag_log format["WESTHQPOS = %1",WESTHQPOS];
    diag_log format["EASTHQPOS = %1",EASTHQPOS];
    diag_log format["GUERHQPOS = %1",GUERHQPOS];
    respawn_east = [["n","respawn_east"],["p",EASTHQPOS],["c",9],["ty",8],["a",0]] call VVM_fnc_createMarker;
    respawn_west = [["n","respawn_west"],["p",WESTHQPOS],["c",2],["ty",8],["a",0]] call VVM_fnc_createMarker;
    respawn_guerrila = [["n","respawn_guerrila"],["p",GUERHQPOS],["c",4],["ty",8],["a",0]] call VVM_fnc_createMarker;
    _wrolebox = [["p",([WESTHQPOS,1,3,1] call BIS_fnc_findSafePos)],["f",1]] call VVM_fnc_createFactionRoleBox; _wrolebox setPos (getPos _wrolebox);
    _erolebox = [["p",([EASTHQPOS,1,3,1] call BIS_fnc_findSafePos)],["f",0]] call VVM_fnc_createFactionRoleBox; _erolebox setPos (getPos _erolebox);
    _irolebox = [["p",([GUERHQPOS,1,3,1] call BIS_fnc_findSafePos)],["f",2]] call VVM_fnc_createFactionRoleBox; _irolebox setPos (getPos _irolebox);
    //_wmedbox = [["p",([WESTHQPOS,1,3,1] call BIS_fnc_findSafePos)]] call VVM_fnc_createMedicalBox;
    //_loadout = [w1,"NATO",0] call VVM_fnc_setLoadout;
    //[[1500,1500],[3000,3000]] call VVM_fnc_bordersToMapGlobal;

    // West
    _w_group = [0] call VVM_fnc_createGroup;
    _w_unit = [_w_group,0,0,0,([WESTHQPOS,1,1,1] call BIS_fnc_findSafePos),6,1] call VVM_fnc_createUnit;
    _w_unit = [_w_group,0,0,1,([WESTHQPOS,1,1,1] call BIS_fnc_findSafePos),3,0] call VVM_fnc_createUnit;
    _w_group setFormation "FILE";
    diag_log format["Group Waypoints = %1",count waypoints _w_group];
	  [_w_group,(currentWaypoint _w_group)] setWaypointPosition [getPosASL ((units _w_group) select 0), -1];
	  for "_i" from count waypoints _w_group - 1 to 0 step -1 do { deleteWaypoint [_w_group, _i] };
    diag_log format["Group Waypoints = %1",count waypoints _w_group];
    // diag_log format["VVM_AI_W_HQ1 = %1",getPos VVM_AI_W_HQ1];
    // diag_log format["VVM_AI_W_HQ1 BOX = %1",(0 boundingBoxReal VVM_AI_W_HQ1)];
    _w_hq_positions = VVM_AI_W_HQ1 buildingPos -1;
    // diag_log format["_w_hq_positions = %1",_w_hq_positions];
    { _xPos = _x select 0; _yPos = _x select 1; _zPos = _x select 2; _wp = [_xPos,_yPos,_zPos + 0.5];
      // diag_log format["Waypoint %1 = %2",_forEachIndex,_wp];
      [format["VVM_AI_WP_W_A1_%1",_forEachIndex],"onEachFrame",{
        drawIcon3D["a3\ui_f\data\map\groupicons\badge_simple.paa",[1,1,1,0.5],(_this select 0),1,1,0,format["%1-%2","WP",str (_this select 1)]];
      },[_wp,_forEachIndex]] call BIS_fnc_addStackedEventHandler;
      if (_forEachIndex == (count _w_hq_positions) - 1) then {
        [["g",_w_group],["t",_wp],["ty",7],["s",1],["b",2],["to",[0.1,0.5,1]],["cr",0],["r",0]] call VVM_fnc_createWaypoint; // diag_log "WP CYCLE";
      } else {
        [["g",_w_group],["t",_wp],["ty",0],["s",1],["b",2],["to",[0.1,0.5,1]],["cr",0],["r",0]] call VVM_fnc_createWaypoint; // diag_log "WP MOVE";
      };
    } forEach _w_hq_positions;
    diag_log format["Group Waypoints = %1",count waypoints _w_group];
    
/*  // East
    _e_group = [1] call VVM_fnc_createGroup;
    _e_unit = [_e_group,1,1,0,([EASTHQPOS,1,1,1] call BIS_fnc_findSafePos),6,1] call VVM_fnc_createUnit;
    _e_unit = [_e_group,1,1,1,([EASTHQPOS,1,1,1] call BIS_fnc_findSafePos),3,0] call VVM_fnc_createUnit;
	  [_e_group,(currentWaypoint _e_group)] setWaypointPosition [getPosASL ((units _e_group) select 0), -1];
	  for "_i" from count waypoints _e_group - 1 to 0 step -1 do { deleteWaypoint [_e_group, _i] };
    // diag_log format["VVM_AI_E_HQ1 = %1",getPos VVM_AI_E_HQ1];
    _e_hq_positions = VVM_AI_E_HQ1 buildingPos -1;
    // diag_log str _e_hq_positions;
    { _xPos = _x select 0; _yPos = _x select 1; _zPos = _x select 2; _wp = [_xPos,_yPos,_zPos + 0.5];
      // diag_log format["Waypoint %1 = %2",_forEachIndex,_wp];
      [format["VVM_AI_WP_E_A1_%1",_forEachIndex], "onEachFrame",{
        drawIcon3D["a3\ui_f\data\map\groupicons\badge_simple.paa",[1,1,1,0.5],(_this select 0),1,1,0,format["%1-%2","WP",str (_this select 1)]];
      },[_wp,_forEachIndex]] call BIS_fnc_addStackedEventHandler;
      if (_forEachIndex == (count _e_hq_positions) - 1) then {
        [["g",_e_group],["t",_wp],["ty",7],["s",1],["b",2],["to",[0.1,0.5,1]],["cr",0],["r",0]] call VVM_fnc_createWaypoint; // diag_log "WP CYCLE";
      } else {
        [["g",_e_group],["t",_wp],["ty",0],["s",1],["b",2],["to",[0.1,0.5,1]],["cr",0],["r",0]] call VVM_fnc_createWaypoint; // diag_log "WP MOVE";
      };
    } forEach _e_hq_positions;
    // Independent
    _i_group = [2] call VVM_fnc_createGroup;
    _i_unit = [_i_group,2,2,0,([GUERHQPOS,1,1,1] call BIS_fnc_findSafePos),6,1] call VVM_fnc_createUnit;
    _i_unit = [_i_group,2,2,1,([GUERHQPOS,1,1,1] call BIS_fnc_findSafePos),3,0] call VVM_fnc_createUnit;
	  [_i_group,(currentWaypoint _i_group)] setWaypointPosition [getPosASL ((units _i_group) select 0), -1];
	  for "_i" from count waypoints _i_group - 1 to 0 step -1 do { deleteWaypoint [_i_group, _i] };
    // diag_log format["VVM_AI_I_HQ1 = %1",getPos VVM_AI_I_HQ1];
    _i_hq_positions = VVM_AI_I_HQ1 buildingPos -1;
    // diag_log str _i_hq_positions;
    { _xPos = _x select 0; _yPos = _x select 1; _zPos = _x select 2; _wp = [_xPos,_yPos,_zPos + 0.5];
      // diag_log format["Waypoint %1 = %2",_forEachIndex,_wp];
      [format["VVM_AI_WP_I_A1_%1",_forEachIndex],"onEachFrame",{
        drawIcon3D["a3\ui_f\data\map\groupicons\badge_simple.paa",[1,1,1,0.5],(_this select 0),1,1,0,format["%1-%2","WP",str (_this select 1)]];
      },[_wp,_forEachIndex]] call BIS_fnc_addStackedEventHandler;
      if (_forEachIndex == (count _i_hq_positions) - 1) then {
        [["g",_i_group],["t",_wp],["ty",7],["s",1],["b",2],["to",[0.1,0.5,1]],["cr",0],["r",0]] call VVM_fnc_createWaypoint; // diag_log "WP CYCLE";
      } else {
        [["g",_i_group],["t",_wp],["ty",0],["s",1],["b",2],["to",[0.1,0.5,1]],["cr",0],["r",0]] call VVM_fnc_createWaypoint; // diag_log "WP MOVE";
      };
    } forEach _i_hq_positions;
*/
/*  _aomarker = [[[1000,1000],[1000,2000],[2000,2000],[2000,1000],[1000,1000]],10,["ColorOrange",1]] call VVM_fnc_lineToMapGlobal;
    _aotextmarker= [[1250,950],[0,2],["AREA OF OPERATION","ColorBlack",0.5]] call VVM_fnc_textToMapGlobal;
    _qrfmarker = [[1170,785],[45,450,80,10],["ColorRed",1],["QRF!","center","ColorBlack",0.5]] call VVM_fnc_arrowToMapGlobal;
    _loamarker = [[[1365,2260],[2220,1490]],10,["ColorBlue",1]] call VVM_fnc_lineToMapGlobal;
    _loatextmarker= [[1465,2210],[([2220,1490] getDir [1365,2260])+5,2],["LOA 1","ColorBlue",0.5]] call VVM_fnc_textToMapGlobal;
    _loamarker2 = [[[1095,2110],[2065,1210]],10,["ColorBlue",1]] call VVM_fnc_lineToMapGlobal;
    _loatextmarker2= [[1195,2060],[([2065,1210] getDir [1095,2110])+5,2],["LOA 2","ColorBlue",0.5]] call VVM_fnc_textToMapGlobal;
*/
  };
};
