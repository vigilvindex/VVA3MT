/* Name: init.sqf
Description: Initialises the VVM module.
Authors: vigil.vindex@gmail.com
License: https://creativecommons.org/licenses/by-sa/4.0/
Created: 2013/08/09 Updated: 2016/08/16 Version: 0.0.1
*/
if (isNil "modVVMSwitch") then {modVVMSwitch = 0};
if (modVVMSwitch == 1) then {
  if (modDebug == 1) then {
    diag_log format ["# %1 # %2 # %3 # Loading VVM. #",time,__FILE__ select [count PATH],__LINE__];
	  systemChat "Loading VVM.";
  };
  [] execVM "mods\VVM\scripts\fn_clickMapPositionToClipboard.sqf";
  if (isServer) then {
    //[] call VVM_fnc_parseCfgWeapons;
    [{([daytime,"HH:MM:SS"] call BIS_fnc_timeToString) remoteExec ["systemChat",0]},[],0,1,0] call VVM_fnc_cronJobAdd;
    EASTHQPOS = [0,0,0];
    WESTHQPOS = [0,0,0];
    GUERHQPOS = [0,0,0];
    _locations = [] call VVM_fnc_getMapBaseSpawnLocs;
    { _loc = floor random count _locations;
      _location = _locations select _loc;
      _string = format["
        %1HQPOS = %2;
        [%1HQPOS] execVM 'mods\VVM\functions\compositions\hqs\HQ_%1_DES.sqf';
        _side = _x;
        {if (side _x == _side) then {_x setPos %1HQPOS}} forEach allPlayers;
      ",_x,_location];
      _code = compile _string;
      call _code;
      _locations deleteAt _loc;
    } forEach [EAST,WEST,INDEPENDENT];
    respawn_east = [["n","respawn_east"],["p",EASTHQPOS],["c",9],["ty",8],["a",0]] call VVM_fnc_createMarker;
    respawn_west = [["n","respawn_west"],["p",WESTHQPOS],["c",2],["ty",8],["a",0]] call VVM_fnc_createMarker;
    respawn_guerrila = [["n","respawn_guerrila"],["p",GUERHQPOS],["c",4],["ty",8],["a",0]] call VVM_fnc_createMarker;
    _wrolebox = [["p",([WESTHQPOS,1,3,1] call BIS_fnc_findSafePos)],["f",1]] call VVM_fnc_createFactionRoleBox; _wrolebox setPos (getPos _wrolebox);
    _erolebox = [["p",([EASTHQPOS,1,3,1] call BIS_fnc_findSafePos)],["f",0]] call VVM_fnc_createFactionRoleBox; _erolebox setPos (getPos _erolebox);
    _irolebox = [["p",([GUERHQPOS,1,3,1] call BIS_fnc_findSafePos)],["f",2]] call VVM_fnc_createFactionRoleBox; _irolebox setPos (getPos _irolebox);
    //_wmedbox = [["p",([WESTHQPOS,1,3,1] call BIS_fnc_findSafePos)]] call VVM_fnc_createMedicalBox;
    //_loadout = [w1,"NATO",0] call VVM_fnc_setLoadout;
    //[[1500,1500],[3000,3000]] call VVM_fnc_bordersToMapGlobal;
    [] spawn {
      _aomarker = [[[1000,1000],[1000,2000],[2000,2000],[2000,1000],[1000,1000]],10,["ColorOrange",1]] call VVM_fnc_lineToMapGlobal;
      _aotextmarker= [[1250,950],[0,2],["AREA OF OPERATION","ColorBlack",0.5]] call VVM_fnc_textToMapGlobal;
      _qrfmarker = [[1170,785],[45,450,80,10],["ColorRed",1],["QRF!","center","ColorBlack",0.5]] call VVM_fnc_arrowToMapGlobal;

      _loamarker = [[[1365,2260],[2220,1490]],10,["ColorBlue",1]] call VVM_fnc_lineToMapGlobal;
      _loatextmarker= [[1465,2210],[([2220,1490] getDir [1365,2260])+5,2],["LOA 1","ColorBlue",0.5]] call VVM_fnc_textToMapGlobal;
      _loamarker2 = [[[1095,2110],[2065,1210]],10,["ColorBlue",1]] call VVM_fnc_lineToMapGlobal;
      _loatextmarker2= [[1195,2060],[([2065,1210] getDir [1095,2110])+5,2],["LOA 2","ColorBlue",0.5]] call VVM_fnc_textToMapGlobal;

      _signalspos = [-30,405];
      _spx = _signalspos select 0;
      _spy = _signalspos select 1;
      _signalsmarker = [[[_spx,_spy],[_spx,_spy - 410],[_spx - 410,_spy - 410],[_spx - 410,_spy],[_spx,_spy]],10,["ColorWhite",1]] call VVM_fnc_lineToMapGlobal;
      _signalstextmarker= [[_spx - 360,_spy - 30],[0,1],[" SIGNALS - CHANNEL - FREQ ","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _signalstextmarker= [[_spx - 360,_spy - 60],[0,1],["LR 0 - 50HZ","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _signalstextmarker= [[_spx - 360,_spy - 90],[0,1],["LR 1 - 60HZ","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _signalstextmarker= [[_spx - 360,_spy - 120],[0,1],["LR 2 - 70HZ","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _signalstextmarker= [[_spx - 360,_spy - 150],[0,1],["SR 0 - 100HZ","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _signalstextmarker= [[_spx - 360,_spy - 180],[0,1],["SR 1 - 110HZ","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _signalstextmarker= [[_spx - 360,_spy - 210],[0,1],["SR 2 - 120HZ","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _signalstextmarker= [[_spx - 360,_spy - 240],[0,1],["SR 3 - 130HZ","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _signalstextmarker= [[_spx - 360,_spy - 270],[0,1],["SR 4 - 140HZ","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _signalstextmarker= [[_spx - 360,_spy - 300],[0,1],["SR 5 - 150HZ","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _signalstextmarker= [[_spx - 360,_spy - 330],[0,1],["SR 6 - 160HZ","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _signalstextmarker= [[_spx - 360,_spy - 360],[0,1],["SR 7 - 170HZ","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _signalstextmarker= [[_spx - 360,_spy - 390],[0,1],["SR 8 - 180HZ","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      
      _orbatpos = [-30,985];
      _opx = _orbatpos select 0;
      _opy = _orbatpos select 1;
      _orbatmarker = [[[_opx,_opy],[_opx,_opy - 500],[_opx - 500,_opy - 500],[_opx - 500,_opy],[_opx,_opy]],10,["ColorWhite",1]] call VVM_fnc_lineToMapGlobal;
      _orbattextmarker= [[_opx - 460,_opy - 30],[0,1],  [" ORBAT - CALLSIGN - RADIO ","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _orbattextmarker= [[_opx - 460,_opy - 60],[0,1],  [" ","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _orbattextmarker= [[_opx - 460,_opy - 90],[0,1],  ["CO         LR 0, SR 0","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _orbattextmarker= [[_opx - 460,_opy - 120],[0,1], ["JTAC       LR 1, SR 0","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _orbattextmarker= [[_opx - 460,_opy - 150],[0,1], ["ALPHA SL   LR 0, SR 1","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _orbattextmarker= [[_opx - 460,_opy - 180],[0,1], ["ALPHA      SR 1","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _orbattextmarker= [[_opx - 460,_opy - 210],[0,1], ["BRAVO SL   LR 0, SR 2","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _orbattextmarker= [[_opx - 460,_opy - 240],[0,1], ["BRAVO      SR 2","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _orbattextmarker= [[_opx - 460,_opy - 270],[0,1], ["CHARLIE SL  LR 0, SR 3","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _orbattextmarker= [[_opx - 460,_opy - 300],[0,1], ["CHARLIE     SR 3","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _orbattextmarker= [[_opx - 460,_opy - 330],[0,1], ["DELTA SL   LR 0, SR 4","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _orbattextmarker= [[_opx - 460,_opy - 360],[0,1], ["DELTA      SR 4","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _orbattextmarker= [[_opx - 460,_opy - 390],[0,1], ["ECHO SL    LR 0, SR 5","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _orbattextmarker= [[_opx - 460,_opy - 420],[0,1], ["ECHO       SR 5","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _orbattextmarker= [[_opx - 460,_opy - 450],[0,1], ["EAGLE      LR 1","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
      _orbattextmarker= [[_opx - 460,_opy - 480],[0,1], ["HAWK       LR 1","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
    };
  };
};
