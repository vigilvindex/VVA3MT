_classnames = [
	// Control Towers
	"Land_Airport_Tower_F", // 0 Airport Control Tower (Altis/Vanilla)
	"Land_Airport_01_controlTower_F", // 1 Airport Control Tower Metal (Tanoa/Apex)
	"Land_Airport_02_controlTower_F", // 2 Airport Control Tower Yellow (Tanoa/Apex)
	"Land_ControlTower_02_F", // 3 Airfield Control Tower Military (Livonia/Contact)
	"Land_Mil_ControlTower", // 4 ATC Tower Interior (CUP)
	"Land_Mil_ControlTower_dam", // 5 ATC Tower Interior Damaged (CUP)
	"Land_Mil_ControlTower_no_interior_CUP", // 6 ATC Tower (CUP)
	"Land_Mil_ControlTower_no_interior_dam_CUP", // 7 ATC Tower (CUP)
	"Land_Mil_ControlTower_EP1", // 8 ATC Tower Interior ME (CUP)
	"Land_Mil_ControlTower_dam_EP1", // 9 ATC Tower Interior ME Damaged (CUP)
	"Land_Mil_ControlTower_no_interior_EP1_CUP", // 10 ATC Tower ME (CUP)
	"Land_Mil_ControlTower_no_interior_dam_EP1_CUP", // 11 ATC Tower ME Damaged (CUP)
	"Jbad_Mil_ControlTower", // 12 Control Tower (JBAD)
	// Terminals
	"Land_Airport_01_terminal_F", // 13 Airport Terminal Wooden (Apex)
	"Land_Airport_02_terminal_F", // 14 Airport Terminal White (Apex)
	"Land_Letistni_hala", // 15 Airport Hall Painted Brick (CUP)
	// Hangars
	"Land_Hangar_F", // 16 Hangar (Vanilla)
	"Land_TentHangar_V1_F", // 17 Tent Hangar (Vanilla)
	"Land_Airport_01_hangar_F", // 18 Hangar Small (Tanoa/Apex)
	"Land_ServiceHangar_01_L_F", // 19 Service Hangar Military Left (Livonia/Contact)
	"Land_ServiceHangar_01_R_F", // 20 Service Hangar Military Left (Livonia/Contact)
	"Land_Mil_hangar_EP1", // 21 Hangar ME Tan (CUP)
	"WarfareBAirport", // 22 Airport (CUP)
	"Land_Ss_hangard", // 23 Hangar Beige (CUP)
	"Land_Ss_hangar" // 24 Hangar Green (CUP)
];
_map_center = [false] call VVM_fnc_getMapCenter;
_map_size = [false] call VVM_fnc_getMapSize;
_return = [];
{ _return set [count _return,(_map_center nearObjects [_x,_map_size])]; } forEach _classnames;
_return;
