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
    [{format ["Current Time: %1",time] remoteExec ["systemChat",0];},[],0,1,0] call VVM_fnc_cronJobAdd;
    [[1500,1500],[2500,2500]] call VVM_fnc_bordersToMapGlobal;
    _aomarker = [[[1000,1000],[1000,2000],[2000,2000],[2000,1000],[1000,1000]],10,["ColorRed",1]] call VVM_fnc_lineToMapGlobal;
    _aotextmarker= [[1250,950],[0,2],["AREA OF OPERATION","ColorBlack",1]] call VVM_fnc_textToMapGlobal;
    _qrfmarker = [[2050,2050],[225,450,80,10],["ColorRed",1],["!! QRF !!","center","ColorBlack",1]] call VVM_fnc_arrowToMapGlobal;
  };
};