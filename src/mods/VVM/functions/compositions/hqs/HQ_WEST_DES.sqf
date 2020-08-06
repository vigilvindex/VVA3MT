private ["_position","_composition","_return","_marker"];
_position = _this select 0;
_composition = [
	["B_supplyCrate_F",[-3,2,0.5],360,1,0,[0,0],"VVM_AI_W_AMMOBOX1","",true,false], 
	["Land_HelipadSquare_F",[-29,-14,0],360,1,0,[0,0],"VVM_AI_W_HELIPAD1","",true,false], 
	["Land_RepairDepot_01_tan_F",[-13,-4,0.5],270,1,0,[0,0],"VVM_AI_W_GARAGE1","",true,false], 
	["Flag_NATO_F",[-3,-1,0],360,1,0,[0,0],"VVM_AI_W_FLAGPOLE1","",true,false], 
	["Land_Cargo_House_V3_F",[-11.7263,12.2719,0],360,1,0,[0,0],"VVM_AI_W_SPAWN1","",true,false], 
	["Land_Cargo_House_V3_F",[-20.1063,12.0718,0],360,1,0,[0,0],"VVM_AI_W_SPAWN2","",true,false], 
	["Land_Cargo_House_V3_F",[-28.5163,11.5818,0],360,1,0,[0,0],"VVM_AI_W_SPAWN3","",true,false], 
	["Land_Cargo_House_V3_F",[-36.8363,11.6618,0],360,1,0,[0,0],"VVM_AI_W_SPAWN4","",true,false], 
	["Land_Cargo_House_V3_F",[-45.6863,11.2018,0],360,1,0,[0,0],"VVM_AI_W_SPAWN5","",true,false], 
	["Land_Cargo_House_V3_F",[-58.4063,-27.7482,0],270,1,0,[0,0],"VVM_AI_W_SPAWN9","",true,false], 
	["Land_Cargo_House_V3_F",[-58.7463,-19.7782,0],270,1,0,[0,0],"VVM_AI_W_SPAWN8","",true,false], 
	["Land_Cargo_House_V3_F",[-58.9363,-11.3782,0],270,1,0,[0,0],"VVM_AI_W_SPAWN7","",true,false], 
	["Land_Cargo_House_V3_F",[-59.5563,-3.1582,0],270,1,0,[0,0],"VVM_AI_W_SPAWN6","",true,false], 
	["Land_Cargo_HQ_V3_F",[4.9137,7.94183,0],270,1,0,[0,0],"VVM_AI_W_HQ1","",true,false], 
	["Land_Cargo_Patrol_V3_F",[-58.9363,8.68182,0],90,1,0,[0,-0],"VVM_AI_W_POST1","",true,false], 
	["Land_Cargo_Patrol_V3_F",[1.39374,-24.5082,0],360,1,0,[0,0],"VVM_AI_W_POST2","",true,false], 
	["Land_Cargo_Tower_V3_F",[-55.9963,-39.4282,0],88.825,1,0,[0,0],"VVM_AI_W_TOWER1","",true,false], 
	//["Land_Cargo20_sand_F",[-10.2338,-25.298,-0.000999451],115.123,1,0,[1.10604,8.6616],"","",true,false], 
	//["Land_Cargo40_sand_F",[-45.5822,-24.4449,0.0406694],87.6371,1,0,[0.845812,-0.213951],"","",true,false], 
	["Land_HBarrierWall6_F",[-11.0063,-32.1482,0],180,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-11.2863,1.68182,0],180,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-13.4363,19.3818,0],360,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-14.7663,-29.7582,0],270,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-14.9563,-21.4382,0],270,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-19.8463,1.49182,0],180,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-2.55627,-31.6482,0],180,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-22.0363,18.9918,0],360,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-28.3463,1.0918,0],180,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-3.66626,-5.16815,0],180,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-30.5663,18.7819,0],360,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-36.7263,0.791809,0],180,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-39.0863,18.4818,0],360,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-4.36627,-14.2881,0],360,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-4.90625,19.6618,0],360,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-41.2663,-29.7182,0],90,1,0,[0,-0],"","",true,false], 
	["Land_HBarrierWall6_F",[-41.5763,-21.1882,0],90,1,0,[0,-0],"","",true,false], 
	["Land_HBarrierWall6_F",[-43.8163,-33.3782,0],180,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-45.1463,0.691833,0],180,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-47.6563,18.1519,0],360,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-48.0163,-44.8082,0],90,1,0,[0,-0],"","",true,false], 
	["Land_HBarrierWall6_F",[-48.1463,-36.4882,0],90,1,0,[0,-0],"","",true,false], 
	["Land_HBarrierWall6_F",[-48.3263,-28.0882,0],90,1,0,[0,-0],"","",true,false], 
	["Land_HBarrierWall6_F",[-48.7063,-19.6982,0],90,1,0,[0,-0],"","",true,false], 
	["Land_HBarrierWall6_F",[-48.9863,-11.2682,0],90,1,0,[0,-0],"","",true,false], 
	["Land_HBarrierWall6_F",[-49.3163,-2.87817,0],90,1,0,[0,-0],"","",true,false], 
	["Land_HBarrierWall6_F",[-52.1763,-48.4482,0],180,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-56.1163,17.9218,0],360,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-6.38629,-27.7382,0],270,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-6.86627,-19.3382,0],270,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-60.5262,-48.7182,0],180,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-64.6163,17.5319,0],360,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-65.6763,-46.1782,0],270,1,0,[0,0],"","",true,false],
	["Land_HBarrierWall6_F",[-65.9063,-37.8082,0],270,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-66.1763,-29.4282,0],270,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-66.3963,-21.0482,0],270,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-66.5363,-12.6482,0],270,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-66.7463,-4.2182,0],270,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-66.9763,4.19183,0],270,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-67.0763,12.5319,0],270,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-7.66626,-2.60815,0],270,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[11.9237,20.0918,0],360,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[14.1637,-30.8582,0],180,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[15.6237,16.1618,0],90,1,0,[0,-0],"","",true,false], 
	["Land_HBarrierWall6_F",[15.8538,7.81183,0],90,1,0,[0,-0],"","",true,false], 
	["Land_HBarrierWall6_F",[16.0037,-0.558167,0],90,1,0,[0,-0],"","",true,false], 
	["Land_HBarrierWall6_F",[16.2337,-8.9682,0],90,1,0,[0,-0],"","",true,false], 
	["Land_HBarrierWall6_F",[16.4937,-17.3582,0],90,1,0,[0,-0],"","",true,false], 
	["Land_HBarrierWall6_F",[16.6937,-25.7881,0],90,1,0,[0,-0],"","",true,false], 
	["Land_HBarrierWall6_F",[3.52374,19.8718,0],360,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[3.94373,-14.0782,0],360,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[4.83374,-5.00818,0],180,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[5.78369,-31.2881,0],180,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[9.03369,-16.9781,0],90,1,0,[0,-0],"","",true,false]
];
_return = [_position,0,_composition,0] call BIS_fnc_objectsMapper;
// Perimeter Marker
_positions = [];
{_positions pushBack getPos _x} forEach _return;
_box = [["p",_positions]] call VVM_fnc_getBoundingBox;
_boxmarker = [_box,10,["ColorBlue",1]] call VVM_fnc_lineToMapGlobal;
_pos = _box select 0;
_boxtext = [[(_pos select 0) + 12 ,(_pos select 1)],[0,0.3],["WEST HQ","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
// Garage
VVM_AI_W_GARAGE1 allowDamage false; VVM_AI_W_GARAGE1 setPos (getPos VVM_AI_W_GARAGE1);
VVM_AI_W_HELIPAD1 allowDamage false;
_marker = [["n","VVM_AI_W_HELIPADMARKER1"],["p",(getPos VVM_AI_W_HELIPAD1)],["a",0],["ty",0]] call VVM_fnc_createMarker;
[VVM_AI_W_GARAGE1,["Garage",VVS_fnc_openVVS,["VVM_AI_W_HELIPADMARKER1","All"]]] remoteExec ["addAction",0,true];
_garpos = getPos VVM_AI_W_GARAGE1;
_garbox = [["p",[_garpos]],["m",0.5]] call VVM_fnc_getBoundingBox;
_garboxmarker = [_garbox,0.5,["ColorBlue",1]] call VVM_fnc_lineToMapGlobal;
_garboxtextpos = _garbox select 0;
_garboxtext = [[(_garboxtextpos select 0),(_garboxtextpos select 1)],[0,0.01],["GARAGE","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
// Ammobox
VVM_AI_W_AMMOBOX1 allowDamage false; VVM_AI_W_AMMOBOX1 setPos (getPos VVM_AI_W_AMMOBOX1);
[VVM_AI_W_AMMOBOX1,["Arsenal",{["Open",true] call BIS_fnc_arsenal;}]] remoteExec ["addAction",0,true];
_ammopos = getPos VVM_AI_W_AMMOBOX1;
_ammobox = [["p",[_ammopos]],["m",0.5]] call VVM_fnc_getBoundingBox;
_ammoboxmarker = [_ammobox,0.5,["ColorBlue",1]] call VVM_fnc_lineToMapGlobal;
_ammoboxtextpos = _ammobox select 0;
_ammoboxtext = [[(_ammoboxtextpos select 0),(_ammoboxtextpos select 1)],[0,0.01],["ARSENAL","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
// Flag Teleport & Halo
VVM_AI_W_FLAGPOLE1 allowDamage false;
[VVM_AI_W_FLAGPOLE1,["Halo Jump",{}]] remoteExec ["addAction",0,true];
[VVM_AI_W_FLAGPOLE1,["Teleport",{}]] remoteExec ["addAction",0,true];
_flagpos = getPos VVM_AI_W_FLAGPOLE1;
_flagbox = [["p",[_flagpos]],["m",0.5]] call VVM_fnc_getBoundingBox;
_flagboxmarker = [_flagbox,0.5,["ColorBlue",1]] call VVM_fnc_lineToMapGlobal;
_flagboxtextpos = _flagbox select 0;
_flagboxtext = [[(_flagboxtextpos select 0),(_flagboxtextpos select 1)],[0,0.01],["FLAGPOLE","ColorWhite",1]] call VVM_fnc_textToMapGlobal;
// Medical Box
