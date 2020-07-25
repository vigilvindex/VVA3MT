// _co = [0] call VVM_fnc_getRole; _allroles = [-1] call VVM_fnc_getRole;
private ["_return","_roles"];
_return = [];
_roles = [ // INDEX, KEY, TITLE
	[0,"CO","Commanding Officer"],
	[1,"SL","Squad Leader"],
	[2,"FTL","Fire Team Leader"],
	[3,"MED","Medic"],
	[4,"ENG","Engineer (Demolition)"],
	[5,"ENGM","Engineer (Mine)"],
	[6,"EOD","Explosive Ordnance Disposal"],
	[7,"UAV","UAV Operator"],
	[8,"R","Rifleman"],
	[9,"RAT","Rifleman (AT)"],
	[10,"GRE","Grenadier"],
	[11,"AR","Automatic Rifleman"],
	[12,"AAR","Assistant Automatic Rifleman"],
	[13,"MMG","Medium Machine Gun"],
	[14,"MMGA","Medium Machine Gun Assistant"],
	[15,"HMG","Heavy Machine Gun (Deployable)"],
	[16,"HMGA","Heavy Machine Gun Assistant (Deployable)"],
	[17,"MAT","Medium AT"],
	[18,"MATA","Medium AT Assistant"],
	[19,"HAT","Heavy AT (Deployable)"],
	[20,"HATA","Heavy AT Assistant (Deployable)"],
	[21,"MRT","Mortar (Deployable)"],
	[22,"MRTA","Mortar Assistant (Deployable)"],
	[23,"MSAM","Medium SAM"],
	[24,"MSAMA","Medium SAM Assistant"],
	[25,"HSAM","Heavy SAM (Deployable)"],
	[26,"HSAMA","Heavy SAM Assistant (Deployable)"],
	[27,"DM","Designated Marksman"],
	[28,"SN","Sniper"],
	[29,"SP","Spotter"],
	[30,"DIV","Diver"],
	[31,"CAR","Carbineer"],
	[32,"SMG","Sub Machine Gunner"],
	[33,"VC","Vehicle Commander"],
	[34,"VG","Vehicle Gunner"],
	[35,"VD","Vehicle Driver"],
	[36,"P","Pilot"],
	[37,"PP","Air Vehicle Pilot"],
	[38,"PCC","Air Vehicle Crew Chief (Repair)"],
	[39,"PC","Air Vehicle Crew"],
	[40,"RAD","Radio Operator"],
	[41,"CBRN","CBRN Specialist"]
];
if ((_this select 0) == -1) then {
	_return = _roles;
} else {
	_return = _roles select (_this select 0);
};
_return;
