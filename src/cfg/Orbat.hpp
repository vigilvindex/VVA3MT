class CfgORBAT { // https://community.bistudio.com/wiki/Arma_3_ORBAT_Viewer
	class WEST {
		id = 0; // Unit ID
		idType = 0; // Unit ID type
		side = "West"; // Unit side from CfgChainOfCommand >> Sides
		size = "Division"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
		type = "HQ"; // Unit type from CfgChainOfCommand >> Types
		insignia = "\ca\missions_f\data\orbat\7thInfantry_ca.paa"; // Unit insignia, displayed in ORBAT background and in tooltip
		colorInsignia[] = {0,0,1,1}; // Insignia image color (white default), can be either RGBA array, or class from CfgMarkerColors
		commander = "Command"; // Name of unit commander. Can be either direct name, or class from CfgWorlds >> GenericNames (random name from the list is then selected)
		commanderRank = "Commander"; // Rank of unit commander (by default selected based on unit size)
		tags[] = {BIS,USArmy,Kerry,Hutchison,Larkin}; // Group tags. When opening ORBAT viewer, user can define what tags will be accepted.
		text = "%1 Combat Technology Research %3"; // Custom text and short text, can still use some arguments when defined: %1 - ID (e.g. "7th"), %2 - Type (e.g. "Infantry"), %3 - Size (e.g. "Division")
		textShort = "%1 CTR %3";
		texture = "\ca\missions_f\data\orbat\customTexture_ca.paa"; // Custom texture, will replace icon set by 'type' param.
		color[] = {0,0,1,1}; // Custom color, will replace color set by 'side' param. Can be either RGBA array, or class from CfgMarkerColors
        description = "All of your text would go here."; // A brief description of the group or unit.
		assets[] = {{B_Heli_Transport_03_F,5},{B_Heli_Light_01_F,3},{B_Heli_Light_01_armed_F,4},B_Heli_Transport_01_camo_F}; // Will display pictures of all available assets to the unit commander
		subordinates[] = {Alpha,Bravo,Charlie,Delta,Echo,Foxtrot}; // Subordinates, searched on the same level as this class.
		class Alpha {
			id = 1;
			type = "Armored";
			size = "BCT";
			side = "West";
			commander = "NATOMen";
			tags[] = {"BLUFOR", "USArmy","Kerry"};
 		};
	};
};