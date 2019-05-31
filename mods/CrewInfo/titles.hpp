// DEFINES
#define CT_STRUCTURED_TEXT 13
#define ST_LEFT 0
// Dialogs
titles[]={"crewinfomessage"};
class crewinfomessage	{
	idd = 10100;
	movingEnable = 0;
	duration = 1000000000;
	fadeIn = 0;
	name = "crewinfomessage";
	controlsBackground[] = {"crewinfotext", "crewinfoteamtext"};
	onLoad = "uiNamespace setVariable ['crewinfodisplay', _this select 0];";
	onunLoad = "uiNamespace setVariable ['crewinfodisplay', objnull];";
	class crewinfotext {
		idc = 10101;
		type = CT_STRUCTURED_TEXT;
		style = ST_LEFT;
		x = (SafeZoneX + 0.02);
		y = (SafeZoneY + 1.25);
		w = 0.3;
		h = 0.6;
		size = 0.018;
		colorBackground[] = { 0, 0, 0, 0 };
		colorText[] = {0,0,0,0.7};
		text = "";
	};
	class crewinfoteamtext {
		idc = 10103;
		type = CT_STRUCTURED_TEXT;
		style = ST_LEFT;
		x = (SafeZoneW + SafezoneX) - 0.25;
		y = (1 + ((0 + SafeZoneY) * -1) - 0.14);
		w = 0.25;
		h = 0.14;
		size = 0.02;
		colorBackground[] = { 0, 0, 0, 0 };
		colorText[] = {0,0,0,0.7};
		text = "";
	};
};
