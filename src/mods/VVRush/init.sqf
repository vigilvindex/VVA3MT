/* Name: init.sqf - Description: Initialises the VVRush module. - Authors: vigil.vindex@gmail.com - License: https://creativecommons.org/licenses/by-sa/4.0/ - Created: 2020/06/09 Updated: 2020/07/02 Version: 0.0.1 */
if (isNil "modVVRushSwitch") then {modVVRushSwitch = 0;};
if (modVVRushSwitch == 1) then {
  if (modDebug == 1) then { diag_log format ["#%1#%2#%3#Loading VVRush.#",time,__FILE__ select [count PATH],__LINE__]; systemChat "Loading VVRush."; };
  if (isServer) then {
    scopeName "Main";
    // PARAMS
    if (isNil "modVVRushLocationSwitch") then {modVVRushLocationSwitch = 0;};
    if (isNil "modVVRushRoundsSwitch") then {modVVRushRoundsSwitch = 3;};
    if (isNil "modVVRushPrepTimeSwitch") then {modVVRushPrepTimeSwitch = 5;};
    if (isNil "modVVRushRoundTimeSwitch") then {modVVRushRoundTimeSwitch = 10;};
    if (isNil "modVVRushDefuseTimeSwitch") then {modVVRushDefuseTimeSwitch = 20;};
    if (isNil "modVVRushMarkerSwitch") then {modVVRushMarkerSwitch = 1;};
    if (isNil "modVVRushArsenalSwitch") then {modVVRushArsenalSwitch = 0;};
    if (isNil "modVVRushASDistanceSwitch") then {modVVRushASDistanceSwitch = 200;};
    // PREPARE
    VVR_ObjLocs = [] call VVRush_fnc_getMapRushLocations; // Get An Array Of Rush Location Buildings On The Map.
    VVR_GAMESTATE = 0; // Mission Control Flow Counter
    VVR_EREADY = false; // East Side Ready Switch
    VVR_WREADY = false; // West Side Ready Switch
    VVR_EDEAD = false; // East Side Eliminated Switch
    VVR_WDEAD = false; // West Side Eliminated Switch
    VVR_ESCORE = 0; // East Score Counter
    VVR_WSCORE = 0; // West Score Counter
    VVR_DEFUSED = false; // Objective Complete Switch
    VVR_DEFUSET = 10; // Objective Defuse Action Duration Time
    VVR_ROUNDS = 0; // Rounds Played Counter
    VVR_ROUNDSL = modVVRushRoundsSwitch; // Number Of Rounds To Play
    VVR_ROUNDTL = (modVVRushRoundTimeSwitch * 60); // Round Time Limit
    VVR_ROUNDTLE = false; // Round Time Limit Expired Switch
    VVR_PREPTL = (modVVRushPrepTimeSwitch * 60); // Defenders Preparation Time
    VVR_PREPTLE = false; // Preparation Time Expired Switch
    VVR_ROUNDSTART = false; // Round Started Switch
    VVR_ROUNDSTARTT = 0; // Round Start Time Counter
    VVR_MARKERS = modVVRushMarkerSwitch; // Map Marker Behaviour Switch
    VVR_ATTDIST = modVVRushASDistanceSwitch;
    VVR_LOCSWITCH = modVVRushLocationSwitch;
    {["Preload"] call BIS_fnc_arsenal;} remoteExec ["BIS_fnc_call",0,true];
    if (modVVRushArsenalSwitch == 0) then {
      [EAMMO,["Arsenal",{["Open",true] call BIS_fnc_arsenal;}]] remoteExec ["addAction",0,true]; // Add east arsenal.
      [WAMMO,["Arsenal",{["Open",true] call BIS_fnc_arsenal;}]] remoteExec ["addAction",0,true]; // Add west arsenal.
    } else {
      {if (hasInterface) then {null = [EAMMO,"EAST"] execVM "scripts\organized_arsenal.sqf";}} remoteExec ["BIS_fnc_call",0,true]; // Add east arsenal.
      {if (hasInterface) then {null = [WAMMO,"WEST"] execVM "scripts\organized_arsenal.sqf";}} remoteExec ["BIS_fnc_call",0,true]; // Add west arsenal.
    };
    [EFLAG,["Start Round",{{systemChat 'DEFENDERS READY!'; VVR_EREADY = true;} remoteExec ["BIS_fnc_call",0];}]] remoteExec ["addAction",0,true]; // Add east start action.
    [WFLAG,["Start Round",{{systemChat 'ATTACKERS READY!'; VVR_WREADY = true;} remoteExec ["BIS_fnc_call",0];}]] remoteExec ["addAction",0,true]; // Add west start action.
    [EFLAG,["End Match",{{systemChat 'DEFENDERS CONCEDED!';} remoteExec ["BIS_fnc_call",0]; ["end1",true] remoteExecCall ['BIS_fnc_endMission',0];}]] remoteExec ["addAction",0,true]; // Add east concede action.
    [WFLAG,["End Match",{{systemChat 'ATTACKERS CONCEDED!';} remoteExec ["BIS_fnc_call",0]; ["end1",true] remoteExecCall ['BIS_fnc_endMission',0];}]] remoteExec ["addAction",0,true]; // Add concede west action.
	  if (isClass (configFile >> "CfgPatches" >> "ace_common")) then {
      [EFLAG,["Heal All [ACE]",{{[_x, _x] call ace_medical_treatment_fnc_fullHeal} forEach allPlayers;}]] remoteExec ["addAction",0,true]; // Add east ace heal.
      [WFLAG,["Heal All [ACE]",{{[_x, _x] call ace_medical_treatment_fnc_fullHeal} forEach allPlayers;}]] remoteExec ["addAction",0,true]; // Add west ace heal.
	  }	else {
      [EFLAG,["Heal All",{{_x setDamage 0;} forEach allPlayers;}]] remoteExec ["addAction",0,true]; // Add east heal.
      [WFLAG,["Heal All",{{_x setDamage 0;} forEach allPlayers;}]] remoteExec ["addAction",0,true]; // Add west heal.
	  };
    ESIGN setObjectTextureGlobal [0,(format["mods\VVRush\img\0%1.jpg",VVR_ESCORE])]; // Set east score sign.
    WSIGN setObjectTextureGlobal [0,(format["mods\VVRush\img\0%1.jpg",VVR_WSCORE])]; // Set west score sign.
    "WAITING FOR TEAMS TO START ROUND!" remoteExec ["systemChat"];
    VVR_GameLoop = [] spawn {
      while {sleep 1; VVR_GAMESTATE <= 4 && VVR_ROUNDS <= VVR_ROUNDSL} do { // While Round Limit Is Not Reached.
        switch (VVR_GAMESTATE) do { // Check game state.
          case 0: { // Waiting for both sides to be ready.
            if ([VVR_EREADY,true] call BIS_fnc_areEqual && [VVR_WREADY,true] call BIS_fnc_areEqual) then {
              VVR_GAMESTATE = 1;
              VVR_EREADY = false;
              VVR_WREADY = false;
              "ROUND STARTED!" remoteExec ["systemChat"];
            };
          };
          case 1: { // Starting round.
            if ([VVR_ROUNDSTART,false] call BIS_fnc_areEqual) then {
              "ROUND PREPARATION PHASE STARTED!" remoteExec ["systemChat"];
              VVR_ROUNDSTARTT = time;
              VVR_ROUNDSTART = true;
              if (isNil "VVR_Positions") then {
                VVR_Positions = [];
                while {count VVR_Positions < 1} do {
                  VVR_ObjLoc = selectRandom VVR_ObjLocs;
                  VVR_Positions = [VVR_ObjLoc] call BIS_fnc_buildingPositions;
                };
                VVR_ObjLoc = selectRandom VVR_Positions;
              };
              /* _posCaller = getPosATL VVR_ObjBuilding; //_posCaller = getPosATL _caller;
              _lineStartZ = (_posCaller select 2) + 0.1;
              _lineEndZ = (_posCaller select 2) - 0.2;
              _posX = _posCaller select 0;
              _posY = _posCaller select 1;
              _posASL_start = ATLToASL [_posX,_posY,_lineStartZ];
              _posASL_end = ATLToASL [_posX,_posY,_lineEndZ];
              _intersections = lineIntersectsSurfaces [_posASL_start, _posASL_end, VVR_ObjLoc, VVR_ObjBuilding, true, 1];
              _intersect = (_intersections select 0) select 0;
              _intersectATL = ASLToATL _intersect; */
              VVR_Obj = createVehicle ["Land_DataTerminal_01_F", VVR_ObjLoc, [], 0, "CAN_COLLIDE"]; // Spawn rush objective.
              [VVR_Obj,"DEFUSE","\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa","\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
                "_this distance _target < 2", // Condition for the action to be shown.  && (side _caller == west)
                "_caller distance _target < 2", // Condition for the action to progress.  && (side _caller == west)
                {[_target,1] call BIS_fnc_dataTerminalAnimate; "BOMB DEFUSAL STARTED!" remoteExec ["systemChat"];}, // Code executed when action starts.
                {_current = _this select 4; _total = _this select 5; _progress = round ((_current / _total) * 100);
                _string = format ["BOMB IS BEING DEFUSED! %1%2 COMPLETE!",_progress,"%"];
                _string remoteExec ["systemChat"];
                _beepfile = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
                _beep = _beepfile + "beep.ogg";
                playSound3D [_beep,_target,true,getPosASL _target,3,1,10];
                _light = "#lightpoint" createVehicleLocal (getPos _target);
                _light setLightBrightness 1;
                _light setLightUseFlare true;
                _light setLightFlareSize 5;
                _light setLightFlareMaxDistance 5;
                _light setLightAmbient [0.5,0.0,0.0];
                _light setLightColor [0.5,0.0,0.0];
                [_light] spawn {sleep 0.5; deleteVehicle (_this select 0);};
                }, // Code executed on every progress tick.
                {[_target,3] call BIS_fnc_dataTerminalAnimate; "BOMB DEFUSED!" remoteExec ["systemChat"]; {VVR_DEFUSED = true;} remoteExec ["BIS_fnc_call",0];}, // Code executed on completion.
                {[_target,0] call BIS_fnc_dataTerminalAnimate; "BOMB DEFUSAL INTERRUPTED!" remoteExec ["systemChat"];}, // Code executed on interrupted.
                [], // Arguments passed to the scripts as _this select 3.
                VVR_DEFUSET,0,true,false
              ] remoteExec ["BIS_fnc_holdActionAdd",0,true]; // Add defuse objective action.
              VVR_DefPos = [getPos VVR_Obj, 1, 10, 1, 0, 20, 0] call BIS_fnc_findSafePos;
              VVR_AttPos = [getPos VVR_Obj, VVR_ATTDIST, VVR_ATTDIST + 100, 1, 0, 20, 0] call BIS_fnc_findSafePos;
              switch (VVR_MARKERS) do {
                case 0: {};
                case 1: {
                  _newPos = [(VVR_ObjLoc select 0) + floor random 50,(VVR_ObjLoc select 1) + floor random 50,0];
                  VVR_ObjMarker = [["n","ObjMarker"],["p",_newPos],["c",9],["sh",2],["s",[100,100]],["b",3],["a",0.5]] call VVM_fnc_createMarker;
                  _newAttPos = [(VVR_AttPos select 0) + floor random 25,(VVR_AttPos select 1) + floor random 25,0];
                  VVR_AttMarker = [["n","AttMarker"],["p",_newAttPos],["c",2],["sh",2],["s",[50,50]],["b",3],["a",0.5]] call VVM_fnc_createMarker;
                  };
                case 2: {
                  VVR_ObjMarker = [["n","ObjMarker"],["p",VVR_ObjLoc],["c",11]] call VVM_fnc_createMarker;
                  VVR_DefMarker = [["n","DefMarker"],["p",VVR_DefPos],["c",9]] call VVM_fnc_createMarker;
                  VVR_AttMarker = [["n","AttMarker"],["p",VVR_AttPos],["c",2]] call VVM_fnc_createMarker;
                };
                default {};
              };
              { if ((side _x) == East) then {_x setPos VVR_DefPos};} forEach allUnits; // Move defenders to location.
            };
            if (time >= (VVR_ROUNDSTARTT + VVR_PREPTL)) then { VVR_PREPTLE = true; };
            if ([VVR_PREPTLE,true] call BIS_fnc_areEqual) then {
              'ROUND ATTACK PHASE STARTED!' remoteExec ["systemChat"];
              { if ((side _x) == West) then {_x setPos VVR_AttPos};} forEach allUnits; // Move attackers to location.
              VVR_Trg1 = [["p",VVR_DefPos],["sc","[VVR_DEFUSED,true] call BIS_fnc_areEqual"]] call VVM_fnc_createTrigger; // Add trigger for bomb defusal round end condition.
              VVR_Trg2 = [["p",VVR_DefPos],["rx",4000],["ry",4000],["ab",1],["at",1],["sa","{VVR_EDEAD = true;} remoteExec ['BIS_fnc_call',0]; 'DEFENDERS ELIMINATED!' remoteExec ['systemChat'];"]] call VVM_fnc_createTrigger; // Add trigger for all defenders dead round end condition.
              VVR_Trg3 = [["p",VVR_DefPos],["rx",4000],["ry",4000],["ab",2],["at",1],["sa","{VVR_WDEAD = true;} remoteExec ['BIS_fnc_call',0]; 'ATTACKERS ELIMINATED!' remoteExec ['systemChat'];"]] call VVM_fnc_createTrigger; // Add trigger for all attackers dead round end condition.
              VVR_Trg4 = [["p",VVR_DefPos],["sc","time >= (VVR_ROUNDSTARTT + VVR_ROUNDTL)"],["sa","{VVR_ROUNDTLE = true;} remoteExec ['BIS_fnc_call',0]; 'ROUND TIME LIMIT ELAPSED!' remoteExec ['systemChat'];"]] call VVM_fnc_createTrigger; // Add trigger for time limit round end condition.
              VVR_GAMESTATE = 2;
            };
          };
          case 2: {  // Ending round.
            if ([VVR_EDEAD,true] call BIS_fnc_areEqual || [VVR_WDEAD,true] call BIS_fnc_areEqual || [VVR_DEFUSED,true] call BIS_fnc_areEqual || [VVR_ROUNDTLE,true] call BIS_fnc_areEqual) then {
              VVR_AttPos = nil;
              VVR_DefPos = nil;
              if (VVR_LOCSWITCH == 0) then {VVR_Positions = nil; VVR_ObjLoc = nil;};
              switch (VVR_MARKERS) do {
                case 0: {};
                case 1: {deleteMarker "ObjMarker"; deleteMarker "AttMarker";};
                case 2: {deleteMarker "AttMarker"; deleteMarker "DefMarker"; deleteMarker "ObjMarker";};
                default {};
              };
              deleteVehicle VVR_Obj;
              deleteVehicle VVR_Trg1;
              deleteVehicle VVR_Trg2;
              deleteVehicle VVR_Trg3;
              deleteVehicle VVR_Trg4;
              if ([VVR_DEFUSED,true] call BIS_fnc_areEqual) then {
                'ATTACKERS WON ROUND!' remoteExec ["systemChat"];
                VVR_WSCORE = VVR_WSCORE + 1;
                WSIGN setObjectTextureGlobal [0,(format["mods\VVRush\img\0%1.jpg",VVR_WSCORE])];
              }; // Set west score sign.
              if ([VVR_ROUNDTLE,true] call BIS_fnc_areEqual) then {
                'DEFENDERS WON ROUND!' remoteExec ["systemChat"];
                VVR_ESCORE = VVR_ESCORE + 1;
                ESIGN setObjectTextureGlobal [0,(format["mods\VVRush\img\0%1.jpg",VVR_ESCORE])];
              }; // Set east score sign.
              if ([VVR_WDEAD,true] call BIS_fnc_areEqual) then {
                'DEFENDERS WON ROUND!' remoteExec ["systemChat"];
                VVR_ESCORE = VVR_ESCORE + 1;
                ESIGN setObjectTextureGlobal [0,(format["mods\VVRush\img\0%1.jpg",VVR_ESCORE])];
              }; // Set east score sign.
              if ([VVR_EDEAD,true] call BIS_fnc_areEqual) then {
                'ATTACKERS WON ROUND!' remoteExec ["systemChat"];
                VVR_WSCORE = VVR_WSCORE + 1;
                WSIGN setObjectTextureGlobal [0,(format["mods\VVRush\img\0%1.jpg",VVR_WSCORE])];
              }; // Set west score sign.
              VVR_ROUNDS = VVR_ROUNDS + 1;
              VVR_DEFUSED = false;
              VVR_PREPTLE = false;
              VVR_GAMESTATE = 3;
              format ['ROUND ENDED! SCORE: WEST: %1 EAST: %2',VVR_WSCORE,VVR_ESCORE] remoteExec ["systemChat"];
            };
          };
          case 3: { // Preparing next round or ending mission.
            if (VVR_ROUNDS < VVR_ROUNDSL) then {
              'PREPARING NEXT ROUND!' remoteExec ["systemChat"];
              ["Terminate"] remoteExec ["BIS_fnc_EGSpectator",0];
              {forceRespawn _x} forEach allDead;
              { if ((side _x) == East) then {_x setPos getMarkerPos "respawn_east"};} forEach allPlayers; // Move east to respawn east location.
              { if ((side _x) == West) then {_x setPos getMarkerPos "respawn_west"};} forEach allPlayers; // Move west to respawn west location.
              VVR_ROUNDSTART = false;
              VVR_ROUNDTLE = false;
              VVR_GAMESTATE = 0;
            } else {
              format ['MISSION ENDED! FINAL SCORES: WEST: %1 EAST: %2',VVR_WSCORE,VVR_ESCORE] remoteExec ["systemChat"];
              ["end1",true] remoteExecCall ['BIS_fnc_endMission',0]; breakOut "Main"; // End mission.
            };
          };
        };
      };
    };
  };
};