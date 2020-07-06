/*
 * hqs_add_markers.sqf
 * This script adds markers for each sides hqs.
 */
/*
if (isServer) then {
//West
    [] spawn {
        _w_hq_marker = createMarker ["WestHQ",getPosATL w_hq];
        _w_hq_marker setMarkerType "mil_Dot";
        _w_hq_marker setMarkerColor "ColorBlue";
        _w_hq_marker setMarkerText "WestHQ";
        _w_hq_marker setMarkerAlphaLocal 0;
        while {(alive w_hq)} do {
            _w_hq_marker setMarkerPos getPos w_hq;
            sleep 1;
        };
        if (!(alive w_hq)) then { deleteMarker _w_hq_marker; };
    };
    [] spawn {
        _w_ahq_marker = createMarker ["WestAHQ",getPosATL w_ahq];
        _w_ahq_marker setMarkerType "mil_Dot";
        _w_ahq_marker setMarkerColor "ColorBlue";
        _w_ahq_marker setMarkerText "WestAHQ";
        _w_ahq_marker setMarkerAlphaLocal 0;
        while {(alive w_ahq)} do {
            _w_ahq_marker setMarkerPos getPos w_ahq;
            sleep 1;
        };
        if (!(alive w_ahq)) then { deleteMarker _w_ahq_marker; };
    };
    [] spawn {
        _w_mhq_marker = createMarker ["WestMHQ",getPosATL w_mhq];
        _w_mhq_marker setMarkerType "mil_Dot";
        _w_mhq_marker setMarkerColor "ColorBlue";
        _w_mhq_marker setMarkerText "WestMHQ";
        _w_mhq_marker setMarkerAlphaLocal 0;
        while {(alive w_mhq)} do {
            _w_mhq_marker setMarkerPos getPos w_mhq;
            sleep 1;
        };
        if (!(alive w_mhq)) then { deleteMarker _w_mhq_marker; };
    };
    w_markerArray = ["WestHQ","WestAHQ","WestMHQ"];
    onPlayerConnected "{_x setMarkerPos (getMarkerPos _x)} forEach w_markerArray";
//EAST
    [] spawn {
        _e_hq_marker = createMarker ["EastHQ",getPosATL e_hq];
        _e_hq_marker setMarkerType "mil_Dot";
        _e_hq_marker setMarkerColor "ColorRed";
        _e_hq_marker setMarkerText "EastHQ";
        _e_hq_marker setMarkerAlphaLocal 0;
        while {(alive e_hq)} do {
            _e_hq_marker setMarkerPos getPos e_hq;
            sleep 1;
        };
        if (!(alive e_hq)) then { deleteMarker _e_hq_marker; };
    };
    [] spawn {
        _e_ahq_marker = createMarker ["EastAHQ",getPosATL e_ahq];
        _e_ahq_marker setMarkerType "mil_Dot";
        _e_ahq_marker setMarkerColor "ColorRed";
        _e_ahq_marker setMarkerText "EastAHQ";
        _e_ahq_marker setMarkerAlphaLocal 0;
        while {(alive e_ahq)} do {
            _e_ahq_marker setMarkerPos getPos e_ahq;
            sleep 1;
        };
        if (!(alive e_ahq)) then { deleteMarker _e_ahq_marker; };
    };
    [] spawn {
        _e_mhq_marker = createMarker ["EastMHQ",getPosATL e_mhq];
        _e_mhq_marker setMarkerType "mil_Dot";
        _e_mhq_marker setMarkerColor "ColorRed";
        _e_mhq_marker setMarkerText "EastMHQ";
        _e_mhq_marker setMarkerAlphaLocal 0;
        while {(alive e_mhq)} do {
            _e_mhq_marker setMarkerPos getPos e_mhq;
            sleep 1;
        };
        if (!(alive e_mhq)) then { deleteMarker _e_mhq_marker; };
    };
    e_markerArray = ["EastHQ","EastAHQ","EastMHQ"];
    onPlayerConnected "{_x setMarkerPos (getMarkerPos _x)} forEach e_markerArray";
};
*/
