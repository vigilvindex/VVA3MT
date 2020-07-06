/* tort_WeatherMatrix - Version: 0.9.2 - Author: tortuosit - Date: 20140726
Disclaimer: Feel free to use and modify this code. Please report errors and enhancements back so that anybody can profit.
Script version - Example call:
0 = [
   08, [10,-50,80],
   09, [40,01,20],
   16, [-30,77,30],
   17, [30,77,90],
   22, [30,77,90],
   08, [10,50,70],
   12, [10,50,80],
   16, [30,77,90],
   17, [30,77,90]
] execVM "scripts\tort_WeatherMatrix.sqf";
Or as a oneliner: 0 = [8,[10,-50,80], 9,[40,1,20], 16,[-30,77,30], 17,[30,77,90], 22,[30,77,90], 8,[10,50,70], 12,[10,50,80], 16,[30,77,90], 17,[30,77,90]] execVM "\@tort_WeatherMatrix\script\tort_WeatherMatrix.sqf";
*/
if ((!(isNil "tort_dynamicweather")) || (!(isNil "tort_weathermatrix"))) exitWith{}; // no multi instances
tort_weathermatrix = true;
private ["_elements", "_now", "_prevElem", "_parameters", "_inner", "_here", "_nextElem", "_overcast", "_fog", "_wind", "_oPrev", "_oNext", "_fPrev", "_fNext", "_wPrev", "_wNext", "_length", "_elapsed", "_percentElapsed", "_remainingSeconds", "_i", "_nextElemWeather"];
_elements = count _this - 1; _parameters = _this;
_now = (date select 3) + ((date select 4)/60);
// check params array and in case of userconfig version, re-build
if (typeName (_this select 1) == "SCALAR") then {
   _parameters = [];
   for "_i" from 0 to (_elements) do {
      switch (_i % 4) do {
         case 0: {_parameters = _parameters + [_this select _i]};
         case 1: {_inner = [_this select _i]};
         case 2: {_inner = _inner + [_this select _i]};
         case 3: {_inner = _inner + [_this select _i]; _parameters = _parameters + [_inner]};
      };
   };
   _elements = count _parameters - 1;
};
// find out at which place in matrix we currently are
for "_i" from 0 to (_elements-1) step 2 do {
   if ((_parameters select _i) > _now) exitWith{_nextElem = _i}
};
if (isNil "_nextElem") then {_nextElem = 0};
_prevElem = _nextElem - 2; if (_prevElem < 0) then {_prevElem = _elements - 1};
// find out about current cycles length
if ((_parameters select _prevElem) < (_parameters select _nextElem)) then {
   _length = (_parameters select _nextElem) - (_parameters select _prevElem);
} else {
   _length = 24 - (_parameters select _prevElem) + (_parameters select _nextElem);
};
// find out how far we are in current cycle (in %)
if ((_parameters select _prevElem) <= _now) then {
   _elapsed = (_now - (_parameters select _prevElem));
} else {
   _elapsed = 24 - (_parameters select _prevElem) + _now;
};
_percentElapsed = _elapsed / _length; // cycle ran "_percentElapsed" percent
// waiting time until next?
if (_now < (_parameters select _nextElem)) then {
   _remainingSeconds = ((_parameters select _nextElem) - _now) * 3600;
} else {
   _remainingSeconds = (24 - _now + (_parameters select _nextElem)) * 3600;
};
// set initial weather variables
_oPrev = _parameters select (_prevElem + 1) select 0; _oNext = _parameters select (_nextElem + 1) select 0;
_fPrev = _parameters select (_prevElem + 1) select 1; _fNext = _parameters select (_nextElem + 1) select 1;
_wPrev = _parameters select (_prevElem + 1) select 2; _wNext = _parameters select (_nextElem + 1) select 2;
if (_oPrev < 0) then {_oPrev = random(abs(_oPrev));}; if (_oNext < 0) then {_oNext = random(abs(_oNext));};
if (_fPrev < 0) then {_fPrev = random(abs(_fPrev));}; if (_fNext < 0) then {_fNext = random(abs(_fNext));};
if (_wPrev < 0) then {_wPrev = random(abs(_wPrev));}; if (_wNext < 0) then {_wNext = random(abs(_wNext));};
_overcast = _oPrev; _fog = _fPrev; _wind = _wPrev;
if (_oPrev != _oNext) then {_overcast = _oPrev - ((_oPrev - _oNext)/abs(_oPrev - _oNext)) * (abs(_oPrev - _oNext) * _percentElapsed);};
if (_fPrev != _fNext) then {_fog = _fPrev - ((_fPrev - _fNext)/abs(_fPrev - _fNext)) * (abs(_fPrev - _fNext) * _percentElapsed);};
if (_wPrev != _wNext) then {_wind = _wPrev - ((_wPrev - _wNext)/abs(_wPrev - _wNext)) * (abs(_wPrev - _wNext) * _percentElapsed);};
_overcast = _overcast * 0.01; _fog = _fog * 0.01; _wind = _wind * 0.01;
// set initial weather
skiptime -24; 86400 setOvercast _overcast; skiptime 24;
sleep 0.5;simulWeatherSync;sleep 0.5;ForceWeatherChange;sleep 0.5;
0 setFog _fog; 0 setWindStr _wind; sleep 1;
hint format ["INITIAL WEATHER SET TO OC%1, FOG%2, WIND%3", round(_overcast * 100), round(_fog*100), round(_wind*100)];
sleep 5;
//sleep _remainingSeconds;
while {true} do {
   // waiting time until next
   if (_now < (_parameters select _nextElem)) then {
      _remainingSeconds = ((_parameters select _nextElem) - _now) * 3600;
   } else {
      _remainingSeconds = (24 - _now + (_parameters select _nextElem)) * 3600;
   };
   hint format ["[WEATHER AT %1h] OC%2, FOG%3, WIND%4. Next is done in %5 seconds", _now, round(_overcast * 100), round(_fog*100), round(_wind*100), _remainingSeconds];
   _overcast = 0.01 * (_parameters select (_nextElem + 1) select 0);
   if (_overcast < 0) then {_overcast = random(abs(_overcast));};
   _fog = 0.01 * (_parameters select (_nextElem + 1) select 1);
   if (_fog < 0) then {_fog = random(abs(_fog));};
   _wind = 0.01 * (_parameters select (_nextElem + 1) select 2);
   if (_wind < 0) then {_wind = random(abs(_wind));};
   _remainingSeconds setOvercast _overcast;
   _remainingSeconds setFog _fog;
   _remainingSeconds setWindStr _wind;
   sleep _remainingSeconds;
   _now = (_now + (_remainingSeconds / 3600)) % 24;
   _nextElem = _nextElem + 2; if (_nextElem > _elements) then {_nextElem = 0};
};
