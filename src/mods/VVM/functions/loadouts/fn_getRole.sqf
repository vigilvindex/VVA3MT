// _co = [0] call VVM_fnc_getRole; _allroles = [-1] call VVM_fnc_getRole;
private ["_return","_roles"];
_return = [];
_roles = [ // INDEX, KEY, TITLE
	[0,"CO","Commanding Officer"], // Officer
	[1,"SL","Squad Leader"], // Squad Leader
	[2,"FTL","Fire Team Leader"], // Team Leader
	[3,"MED","Medic"], // Combat Life Saver
	[4,"ENG","Engineer (Demolition)"], // Explosive Specialist
	[5,"ENGM","Engineer (Mine)"], // Mine Specialist
	[6,"EOD","Explosive Ordnance Disposal"], // ? Engineer / Repair Specialist
	[7,"UAV","UAV Operator"], // UAV Operator
	[8,"R","Rifleman"], // Rifleman
	[9,"RAT","Rifleman (AT)"], // Rifleman AT
	[10,"GRE","Grenadier"], // Grenadier
	[11,"AR","Automatic Rifleman"], // Autorifleman
	[12,"AAR","Assistant Automatic Rifleman"], // Asst. Autorifleman
	[13,"MMG","Medium Machine Gun"], // Heavy Gunner / Machine Gunner
	[14,"MMGA","Medium Machine Gun Assistant"], // Ammo Bearer
	[15,"HMG","Heavy Machine Gun (Deployable)"], // Gunner (HMG)
	[16,"HMGA","Heavy Machine Gun Assistant (Deployable)"], // Asst. Gunner (HMG/GMG)
	[17,"MAT","Medium AT"], // Missile Specialist AT
	[18,"MATA","Medium AT Assistant"], // Asst. Missile Specialist AT
	[19,"HAT","Heavy AT (Deployable)"], // ?
	[20,"HATA","Heavy AT Assistant (Deployable)"], // ?
	[21,"MRT","Mortar (Deployable)"], // Gunner Mk6
	[22,"MRTA","Mortar Assistant (Deployable)"], // Asst. Gunner Mk6
	[23,"MSAM","Medium SAM"], // Missile Specialist AA
	[24,"MSAMA","Medium SAM Assistant"], // Asst. Missile Specialist AA
	[25,"HSAM","Heavy SAM (Deployable)"], // ?
	[26,"HSAMA","Heavy SAM Assistant (Deployable)"], // ?
	[27,"DM","Designated Marksman"], // Marksman / Sharpshooter
	[28,"SN","Sniper"], // Sniper
	[29,"SP","Spotter"], // Spotter
	[30,"DIV","Diver"], // Assault Diver
	[31,"CAR","Carbineer"], // ?
	[32,"SMG","Sub Machine Gunner"], // ?
	[33,"VC","Vehicle Commander"], // Crewman
	[34,"VG","Vehicle Gunner"], // Crewman
	[35,"VD","Vehicle Driver"], // Crewman
	[36,"P","Pilot"], // Pilot / Fighter Pilot
	[37,"PP","Air Vehicle Pilot"], // Heli Pilot
	[38,"PCC","Air Vehicle Crew Chief (Repair)"], // ? Heli Crew
	[39,"PC","Air Vehicle Crew"], // Heli Crew
	[40,"RAD","Radio Operator"], // Radio Operator
	[41,"CBRN","CBRN Specialist"] // CBRN Specialist
];
if ((_this select 0) == -1) then {
	_return = _roles;
} else {
	_return = _roles select (_this select 0);
};
_return;
