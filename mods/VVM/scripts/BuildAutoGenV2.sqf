cup_active = isClass(configFile >> "CfgPatches" >> "cup_terrains_a2_editorobjects");
marker_fnc = {
    params ["_x","_inArray","_checkDis","_createdMarkerObjects","_markerName","_markerInfo","_pushBackArray"];
    if((typeOf _x) in _inArray) then {
        private _check = false;
        private _prevX = _x;
        { if (_x distance _prevX < _checkDis) then { _check = true; }; } forEach _createdMarkerObjects;
        if !(_check) then {
            _createdMarkerObjects pushBack _x;
            private _pos = getPos _x;
            private _createdMarker = createMarker [format[_markerName,_pos],_pos];
            _createdMarker setMarkerShape (_markerInfo#0);
            _createdMarker setMarkerType (_markerInfo#1);
            _createdMarker setMarkerColor (_markerInfo#2);
            _createdMarker setMarkerText (_markerInfo#3);
            missionNamespace setVariable [format[_markerName, _forEachIndex], _createdMarker, true];
            _pushBackArray pushBack _createdMarker;
        };
    };
};
private _airfieldArray = [];
private _radioArray = [];
private _militaryBaseArray = [];
private _factoryArray = [];
private _portArray = [];
private _createdMarkerObjects = [];
switch (tolower worldName) do {
    case "altis";
  	case "malden": {
        {   [   _x, ["Land_Airport_Tower_F","Land_Hangar_F"],  //array of airfield buildings to find
                1000, //minimal exclusion distance. Any other buildings in this distance will NOT be marked. Feel free to change this to whatever you want 
                _createdMarkerObjects, "airfield_%1",["ICON","loc_CivilDefense","ColorBlue","Airfield"],_airfieldArray
            ] call marker_fnc;
        } forEach ([worldSize/2,worldSize/2,0] nearObjects ["Building", worldSize]);
        {   [   _x, ["Land_TTowerBig_1_F","Land_TTowerBig_2_F","Land_TTowerSmall_1_F","Land_TTowerSmall_2_F"],  //array of radio towers to find
                300, _createdMarkerObjects, "radio_marker_%1", ["ICON", "loc_Transmitter", "ColorBlue", "Radio Tower" ], _radioArray
            ] call marker_fnc;
            [   _x, ["Land_dp_mainFactory_F","Land_Factory_Main_F"],  //array of factory buildings to find
                300, _createdMarkerObjects, "factory_%1", [   "ICON", "loc_Stack", "ColorBlue", "Factory" ], _factoryArray
            ] call marker_fnc;
            [    _x, ["Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F","Land_i_Barracks_V1_F","Land_i_Barracks_V2_F"],  //array of airmilitary buildings to find
                300, _createdMarkerObjects, "_militaryBase_%1", [ "ICON", "loc_Bunker", "ColorBlue", "Military Outpost" ], _militaryBaseArray
            ] call marker_fnc;
            [   _x, ["Land_Pier_F"], //array of port related buildings to find
                500, _createdMarkerObjects, "port_%1", [ "ICON", "loc_Quay", "ColorBlue", "Port" ], _portArray
            ] call marker_fnc;
        } forEach ([worldSize/2,worldSize/2,0] nearObjects ["Building", worldSize]);
    };
    case "stratis";
    case "tanoa": {
        {   [   _x, ["Land_Airport_01_controlTower_F","Land_Airport_02_controlTower_F","Land_Hangar_F"],
                1000, _createdMarkerObjects, "airfield_%1", [ "ICON", "loc_CivilDefense", "ColorBlue", "Airfield" ], _airfieldArray
            ] call marker_fnc;
        } forEach ([worldSize/2,worldSize/2,0] nearObjects ["Building", worldSize]);
        {   [   _x, ["Land_TTowerBig_1_F","Land_TTowerBig_2_F","Land_TTowerSmall_1_F","Land_TTowerSmall_2_F"],
                300, _createdMarkerObjects, "radio_marker_%1", [ "ICON", "loc_Transmitter", "ColorBlue", "Radio Tower" ], _radioArray
            ] call marker_fnc;
            [   _x, ["Land_dp_mainFactory_F","Land_DPP_01_mainFactory_F","Land_SCF_01_boilerBuilding_F","Land_Factory_Main_F"],
                300, _createdMarkerObjects, "factory_%1", [ "ICON", "loc_Stack", "ColorBlue", "Factory" ], _factoryArray
            ] call marker_fnc;
            [   _x, ["Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_HQ_V4_F","Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F","Land_Cargo_Tower_V4_F","Land_i_Barracks_V1_F","Land_Barracks_01_camo_F","Land_i_Barracks_V2_F"],
                300, _createdMarkerObjects, "_militaryBase_%1", [ "ICON", "loc_Bunker", "ColorBlue", "Military Outpost" ], _militaryBaseArray
            ] call marker_fnc;
            [ _x, ["Land_Pier_F"], 500, _createdMarkerObjects, "port_%1", [ "ICON", "loc_Quay", "ColorBlue", "Port" ], _portArray ] call marker_fnc;
        } forEach ([worldSize/2,worldSize/2,0] nearObjects ["Building", worldSize]);
    };
	// CUPS
	case "chernarus";
	case "chernarus_summer";
	case "chernarus_winter";
    case "rahmadi";
	case "sara";
    case "takistan";
    case "zargabad";
	case "saralite": {
        {   [  _x, ["Land_Letistni_hala","Land_Mil_ControlTower","Land_Mil_ControlTower_EP1","Land_Mil_ControlTower_dam_EP1","Land_Mil_ControlTower_dam","Land_Ss_hangar","Land_Ss_hangard","Land_Mil_hangar_EP1"],
                1000, _createdMarkerObjects, "airfield_%1", [ "ICON", "loc_CivilDefense", "ColorBlue", "Airfield" ], _airfieldArray
            ] call marker_fnc;
        } forEach ([worldSize/2,worldSize/2,0] nearObjects ["Building", worldSize]);
        {   [   _x, ["Land_Com_tower_ep1","Land_Telek1", "Land_Radar","Land_Radar_EP1","Land_Vysilac_FM","Land_Vysilac_FM2"],
                300, _createdMarkerObjects, "radio_marker_%1", [ "ICON", "loc_Transmitter", "ColorBlue", "Radio Tower" ], _radioArray
            ] call marker_fnc;
            [   _x, ["Land_Ind_Vysypka","Land_Tovarna1","Land_Kamenolom_budova","Land_Shed_Ind02","Land_Shed_Ind02_dam","Land_pila","Land_Tovarna2","Land_Ind_Coltan_Main_EP1","Land_Ind_Oil_Tower_EP1","Land_Ind_Expedice_1","Land_Ind_Pec_03","Land_Ind_Pec_03b"],
                300, _createdMarkerObjects, "factory_%1", [ "ICON", "loc_Stack", "ColorBlue", "Factory" ], _factoryArray
            ] call marker_fnc;
            [   _x, ["Land_Mil_House","Land_Mil_House_dam","Land_Mil_House_EP1","Land_Mil_House_dam_EP1","Land_Barrack2_EP1","Land_Mil_Barracks_i","Land_Mil_Barracks_EP1","Land_Mil_Barracks_i_EP1","Land_Army_hut_long","Land_budova4","Land_budova4_in","Land_budova4_in","Land_Mil_Barracks"],
                200, _createdMarkerObjects, "_militaryBase_%1", [ "ICON", "loc_Bunker", "ColorBlue", "Military Outpost" ], _militaryBaseArray
            ] call marker_fnc;
            [   _x, ["Land_Molo_beton"], 500, _createdMarkerObjects, "port_%1", [ "ICON", "loc_Quay", "ColorBlue", "Port" ], _portArray ] call marker_fnc;
        } forEach ([worldSize/2,worldSize/2,0] nearObjects ["Building", worldSize]);
	};
};
publicVariable "_airfieldArray";
publicVariable "_radioArray";
publicVariable "_factoryArray";
publicVariable "_militaryBaseArray";
publicVariable "_portArray";
diag_log _portArray;
diag_log _radioArray;
diag_log _militaryBaseArray;
diag_log _airfieldArray;
diag_log _factoryArray;