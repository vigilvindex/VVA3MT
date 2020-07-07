// _co = 0 call VVM_fnc_getRole;
_roles = [ // KEY, TITLE, INDEX
	["CO","Commanding Officer"], // 0
	["SL","Squad Leader"], // 1
	["FTL","Fire Team Leader"], // 2
	["MED","Medic"], // 3
	["ENG","Engineer (Demolition)"], // 4
	["ENGM","Engineer (Mine)"], // 5
	["EOD","Explosive Ordnance Disposal"], // 6
	["UAV","UAV Operator"], // 7
	["R","Rifleman"], // 8
	["RAT","Rifleman (AT)"], // 9
	["GRE","Grenadier"], // 10
	["AR","Automatic Rifleman"], // 11
	["AAR","Assistant Automatic Rifleman"], // 12
	["MMG","Medium Machine Gun"], // 13
	["MMGA","Medium Machine Gun Assistant"], // 14
	["HMG","Heavy Machine Gun (Deployable)"], // 15
	["HMGA","Heavy Machine Gun Assistant (Deployable)"], // 16
	["MAT","Medium AT"], // 17
	["MATA","Medium AT Assistant"], // 18
	["HAT","Heavy AT (Deployable)"], // 19
	["HATA","Heavy AT Assistant (Deployable)"], // 20
	["MRT","Mortar (Deployable)"], // 21
	["MRTA","Mortar Assistant (Deployable)"], // 22
	["MSAM","Medium SAM"], // 23
	["MSAMA","Medium SAM Assistant"], // 24
	["HSAM","Heavy SAM (Deployable)"], // 25
	["HSAMA","Heavy SAM Assistant (Deployable)"], // 26
	["DM","Designated Marksman"], // 27
	["SN","Sniper"], // 28
	["SP","Spotter"], // 29
	["DIV","Diver"], // 30
	["CAR","Carbineer"], // 31
	["SMG","Sub Machine Gunner"], // 32
	["VC","Vehicle Commander"], // 33
	["VG","Vehicle Gunner"], // 34
	["VD","Vehicle Driver"], // 35
	["P","Pilot"], // 36
	["PP","Air Vehicle Pilot"], // 37
	["PCC","Air Vehicle Crew Chief (Repair)"], // 38
	["PC","Air Vehicle Crew"] // 39
];
_return = _roles select _this;
_return;
