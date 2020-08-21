/* Name: fn_createGroup.sqf
 * Description: Creates a group.
 * Usage: _group = [0] call VVM_fnc_createGroup;
 * Returns: GROUP on success, FALSE on failure.
 */
_sides = [WEST,EAST,INDEPENDENT,CIVILIAN];
_sidesText = ["WEST","EAST","GUER","CIV"];
_sidesIDs = [1,0,2,3];
_side = _this select 0;
_sideText = _sidesText select _side;
_sideObj = _sides select _side;
_sideGroups = [];
{if ((side _x) isEqualTo _sideObj) then {_sideGroups pushBackUnique _x}} forEach allGroups;
_groupIndex = count _sideGroups;
_groupVarName = switch (_side) do {
	case  0: {format["VVM_AI_W_G_%1",_groupIndex]};
	case  1: {format["VVM_AI_E_G_%1",_groupIndex]};
	case  2: {format["VVM_AI_I_G_%1",_groupIndex]};
	case  3: {format["VVM_AI_C_G_%1",_groupIndex]};
};
_deleteWhenEmpty = true;
_GroupSquad = _groupIndex;
_GroupSquads = ["Squad1","Squad2","Squad3","Squad4","Squad5","Squad6"];
_GroupPlatoon = 0;
_GroupPlatoons = ["Platoon1","Platoon2","Platoon3","Platoon4"];
_GroupCompany = 0;
_GroupCompanies = ["CompanyAlpha","CompanyBravo","CompanyCharlie","CompanyDelta","CompanyEcho","CompanyFoxtrot","CompanyGolf","CompanyHotel","CompanyIndia","CompanyKilo","CompanyLima","CompanyMike","CompanyNovember","CompanyOscar","CompanyPapa","CompanyQuebec","CompanyRomeo","CompanySierra","CompanyTango","CompanyUniform","CompanyVictor","CompanyWhiskey","CompanyXray","CompanyYankee","CompanyZulu"];
_GroupName = _groupIndex;
_GroupNames = ["Alpha","Bravo","Charlie","Delta","Echo","Foxtrot","Golf","Hotel","November","Kilo","Yankee","Zulu","Two","Three","Buffalo","Guardian","Convoy","Fox"];
_GroupColor = switch (_side) do {
	case 0: {4}; // Blue
	case 1: {2}; // Red
	case 2: {3}; // Green
	case 3: {7}; // Pink
};
_GroupColors = [
	"GroupColor0", // (nothing)
	"GroupColor1", // Black
	"GroupColor2", // Red
	"GroupColor3", // Green
	"GroupColor4", // Blue
	"GroupColor5", // Yellow
	"GroupColor6", // Orange
	"GroupColor7", // Pink
	"Six" // Six
];
// Regiment, Battalion, Company, Platoon, Squad
_string = "%GroupCompany-%GroupPlatoon-%GroupSquad";
_formations = ["COLUMN","STAG COLUMN","WEDGE","ECH LEFT","ECH RIGHT","VEE","LINE","FILE","DIAMOND"];
_formation = 7;
_GroupMarkerPrefixs = ["b_","o_","n_"]; // BLUFOR, OPFOR, NEUTRAL - https://community.bistudio.com/wiki/Military_Symbols
_GroupMarkerPrefix = _side;
_GroupMarkerPrefix = _GroupMarkerPrefixs select _GroupMarkerPrefix;
_GroupMarkerNames = ["inf","motor_inf","mech_inf","armor","air","maint","hq","supply","plane","art","mortar","med","recon","uav","empty"];
_GroupMarkerName = 0;
_GroupMarkerName = _GroupMarkerNames select _GroupMarkerName;
_colours = [
	[0,0.3,0.6,1],		// 0 Blufor
	[0.5,0,0,1],		// 1 Opfor
	[0,0.5,0,1],		// 2 Independent
	[0.4,0,0.5,1],		// 3 Civilian
	[0,0,0,1],			// 4 Black
	[1,1,1,1],			// 5 White
	[0,0,1,1],			// 6 Blue
	[0.9,0,0,1],		// 7 Red
	[0,0.8,0,1],		// 8 Green
	[0.5,0.5,0.5,1],	// 9 Grey
	[0.5,0.25,0,1],		// 10 Brown
	[0.85,0.4,0,1],		// 11 Orange
	[0.85,0.85,0,1],	// 12 Yellow
	[0.5,0.6,0.4,1],	// 13 Khaki
	[1,0.3,0.4,1],		// 14 Pink
	[0.7,0.6,0,1]		// 15 Unknown
]; // https://community.bistudio.com/wiki/Arma_3_CfgMarkerColors
_colour = _side;
_colour = _colours select _colour;
_side = _sides select _side;
_return = createGroup [_side,_deleteWhenEmpty];
_return setGroupIdGlobal [_string,(_GroupCompanies select _GroupCompany),(_GroupPlatoons select _GroupPlatoon),(_GroupSquads select _GroupSquad)];
_return setFormation (_formations select _formation);
_return addGroupIcon [format["%1%2",_GroupMarkerPrefix,_GroupMarkerName],[0,0]];
_return setGroupIconParams [_colour,"",1,true,true,_colour];
onGroupIconOverEnter {_group = _this select 1; _group setGroupIconParams [side _group call BIS_fnc_sideColor,groupID _group,1,true,true,side _group call BIS_fnc_sideColor] };
onGroupIconOverLeave {_group = _this select 1; _group setGroupIconParams [side _group call BIS_fnc_sideColor,"",1,true,true,side _group call BIS_fnc_sideColor]};
call compile format["%1 = _return;",_groupVarName];
diag_log format ["AI GROUP CREATED! HANDLE: %1, NAME: %2",_groupVarName,groupId _return];
_return;
