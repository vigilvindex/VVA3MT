private ["_return","_select"];
_select = [];
_return = [
	"ItemWatch",					// 0 Watch (Vanilla)
	"ChemicalDetector_01_watch_F",	// 1 Chemical Detector (Contact)
	"gm_watch_kosei_80",			// 2 Kosei C80 (GM)
	"ACE_Altimeter",				// 3 Altimeter Watch (ACE)
	"tf_microdagr",					// 4 MicroDAGR Radio Programmer (TFAR)
	"LIB_GER_ItemWatch"				// 5 Watch (IFA)
];
if ((!isNil "_this") AND (count _this > 0)) then {{_select pushBackUnique (_return select _x)} forEach _this;_return = _select;};
_return;
