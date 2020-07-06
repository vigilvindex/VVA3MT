/* Name: restrict_view.sqf
 * Description: Restricts first/third person view.
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2019/02/04
 * Usage: _handle = [_args] execVM "modules\RestrictView\restrict_view.sqf";
 */
 if (!isDedicated) then {
	 [] spawn {
		while {true} do {
			sleep 0.1;
			waitUntil {((cameraView == "External") and ((vehicle player) == player) and alive player)};
			(player switchCamera "INTERNAL");
		};
	};
};
// NO 3RD PERSON - {God-Father} @ 1PARA Community
// Name :   personalViews.sqf
// Re-Created :   28/03/15   
// Description :   Forces camera views depending on settings in description.ext
// Usage       :   Execute this script from the init.sqf. Change the [0] to [1] or [2] or [3] depending on what you want.
//                 If you are using a parameter then change it to [("paramClassname" call BIS_fnc_getParamValue)]
//                 _handle = [0] execVM "personalViews.sqf";
//  0   Allow 3rd
//  1   1st for people. 3rd for vehicles
//  2   3rd for people. 1st for vehicles
//  3   1st for everything
_debug = false;
// if (isServer) exitWith {};
if (isDedicated) exitWith {};
params [["_input",0]];
if ((difficultyOption "ThirdPersonView" ) == 1) then {
    switch (_input) do {
        case 0: { 	if (_debug) then { systemchat "RestrictView: Disabled"; };	};
        case 1: {	if (_debug) then { systemchat "RestrictView: Enabled - INF: FP VEH: FP/TP"; };
					while {(true)} do {
						if ((vehicle player) == player) then {
							switch (CameraView) do {
								case "EXTERNAL":    {(vehicle player) switchCamera "Internal";};
								case "INTERNAL":    {};
								case "GUNNER":      {};
								default             {};
							}; 
						};
						sleep 0.1;
					};
                };
        case 2: {   if (_debug) then { systemchat "RestrictView: Enabled - INF: FP/TP VEH: FP"; };
                    while {(true)} do {
                        if ((vehicle player) != player) then {
                            switch (CameraView) do {
                                case "EXTERNAL":    {(vehicle player) switchCamera "Internal";};
                                case "INTERNAL":    {};
                                case "GUNNER":      {};
                                default             {};
                            };
                        };
                        sleep 0.1;
                    };
                };
        case 3: {   if (_debug) then { systemchat "RestrictView: Enabled - INF: FP VEH: FP"; };
                    while {(true)} do {
						switch (CameraView) do {
							case "EXTERNAL":    {(vehicle player) switchCamera "Internal";};
							case "INTERNAL":    {};
							case "GUNNER":      {};
							default             {};
						};
                        sleep 0.1;
                    };
                };
    };
};
