// Uses the loaded config to set up the AI appearance / equipment

#include "config.sqf";
#include "dataArrays.sqf";

_faceGroup = "";

{
	if(!(isplayer _x)) then {

		// Get the appropriate unit's side
		switch (side _x) do {
			case west: {_faceGroup = _faceGroupWest};
			case east: {_faceGroup = _faceGroupEast};
			case independent: {_faceGroup = _faceGroupIndep};
			case civilian: {_faceGroup = _faceGroupCiv};
			default {_faceGroup = "greece"};
		};
	
		// Set the faces of all AI units to the preferred group
		switch (_faceGroup) do {
			case "asia": { _x setFace selectRandom _asiaFaces };
			case "greece": { _x setFace selectRandom _greekFaces };
			case "persia": { _x setFace selectRandom _persiaFaces };
			case "tanoa": { _x setFace selectRandom _tanoaFaces };
			case "white": { _x setFace selectRandom _westFaces };
			default { };
		};
		
		// Remove NVGs if day OR told to
		if ((dayTime > 5 and dayTime < 20) or _forceNoNVG == 1) then {
		
			switch (side _x) do {
				case west: { 		
					_x unassignItem "NVGoggles";
					_x removeItem "NVGoggles";
					_x unassignItem "NVGoggles_tna_F";
					_x removeItem "NVGoggles_tna_F";
				};
				case east: {			
					_x unassignItem "NVGoggles_OPFOR";
					_x removeItem "NVGoggles_OPFOR";
				};
				case independent: {			
					_x unassignItem "NVGoggles_INDEP";
					_x removeItem "NVGoggles_INDEP";
				};
				default { };
			};

		};
		
		// Add flashlights if needed
		if (_forceFlashlight == 1) then {
			_x removePrimaryWeaponItem "acc_pointer_IR";
			_x addPrimaryWeaponItem "acc_flashlight";
		};
		
		// Randomise uniform (mostly NATO MTP)		
		if (uniform _x in _natoMTPUni) then {_x forceAddUniform selectRandom _natoMTPUniNoT};
		if (headgear _x in _natoHelmetReg) then {_x addHeadgear selectRandom _natoHelmetSpecB};
		if (headgear _x in _natoHelmetSpecB) then {_x addHeadgear selectRandom _natoHelmetSpecB};
		if (headgear _x in _natoHelmetLight) then {_x addHeadgear selectRandom _natoHelmetLight};
		
		if (uniform _x in _aafUni) then {_x forceAddUniform selectRandom _aafUni};
	};
} foreach (allUnits); 