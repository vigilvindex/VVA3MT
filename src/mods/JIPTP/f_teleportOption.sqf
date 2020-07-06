private ["_teleAction","_preText","_postText"];
// Either give fancy ACE menu or basic ADDACTION.
sleep 10;
[] call {
	_preText = "<br/><t size='1.4' color='#72E500'>Spawn On Team</t><br/><br/>This mission has JIP teleport enabled.<br/><br/>";
	_postText = "This option will automatically be removed after 3 minutes, if not used.<br/><br/>";
	if (true) exitWith {
		hintSilent parseText (_preText + "To use this feature open your <t color='#FF7F00'>ACE Self-Interaction</t> menu <t color='#777777'>(Windows Key + Left Ctrl)</t> then go to <t color='#FF7F00'>Team Management</t><br/> and select <t color='#FF7F00'>Spawn on Team</t><br/><br/><br/>" + _postText);
		systemChat "Spawn On Team is ENABLED - Use: ACE Self-Interact > Team Management > Spawn On Team";
		ace_jip_action = ['JIP','Spawn On Team','mods\JIPTP\JIP.paa',{null = execVM 'mods\JIPTP\fn_teleportPlayer.sqf';},{true}] call ace_interact_menu_fnc_createAction;
		[player, 1, ["ACE_SelfActions","ACE_TeamManagement"], ace_jip_action] call ace_interact_menu_fnc_addActionToObject;
		sleep 180;
		[player, 1, ["ACE_SelfActions","ACE_TeamManagement","JIP"]] call ace_interact_menu_fnc_removeActionFromObject;
	};
	hintSilent parseText (_preText + "Use <t color='#FF7F00'>Action Menu</t> <t color='#777777'>(Mouse Wheel)</t> to spawn near your teams current location.<br/><br/><br/>" + _postText);
	systemChat "Spawn On Team is ENABLED - Use: Action Menu > Spawn On Team";
	_teleAction = player addAction ["<t color='#FF7F00'>Spawn On Team</t>","null = execVM 'mods\JIPTP\fn_teleportPlayer.sqf';"];
	sleep 180;
	player removeAction _teleAction;
};
