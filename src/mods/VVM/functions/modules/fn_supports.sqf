/*
As all supports only require 1 requester module to be in the mission just place one in the editor.
It does not have to be synced to anything and will save headaches trying to set one up from script.
You could also do the same with the provider. 
Again does not have to be synced and allows you to set up things like vehciles to use, crate inits etc
When you wish these to become available to the player just use the provided BIS functions. e.g ..
*/
// [player, requester, provider] call BIS_fnc_addSupportLink; // Will sync the modules up and you will get the supports activated in game. To change the number of a type of support available use ..
// [requester, "Drop", 0] call BIS_fnc_limitSupport; // types can be "Artillery", "Transport", "CAS_Heli", "CAS_Bombing" and "Drop".
_center = createCenter sideLogic; // Create a side logic
_logicGroup = createGroup _center; // Create a group for our modules
_requester = _logicGroup createUnit ["SupportRequester",getpos player, [], 0, "FORM"]; // Spawn a SupportRequestor module
{[_requester,_x,0] call BIS_fnc_limitSupport} forEach ["Artillery","CAS_Heli","CAS_Bombing","UAV","Drop","Transport"]; // Setup requestor limit values
_pos = [player, 1000, (floor (random 360))] call BIS_fnc_relPos; // Create a position 1km away from player in random direction
_provider = _logicGroup createUnit ["SupportProvider_Virtual_Drop", _pos, [], 0, "FORM"]; // Spawn a SupportProvider module of type Virtual_Drop
{_provider setVariable [(_x select 0),(_x select 1)]} forEach [
	["BIS_SUPP_crateInit",""],		// init code for crate
	["BIS_SUPP_vehicles",[]],		// types of vehicles to use
	["BIS_SUPP_vehicleinit",""],	// init code for vehicle
	["BIS_SUPP_filter","SIDE"]		// whether default vehicles comes from "SIDE" or "FACTION"
]; // Setup provider values
[_requester,"Drop",1] call BIS_fnc_limitSupport; // Set our limit on the requester for drops to 1
[player,_requester,_provider] call BIS_fnc_addSupportLink; // Sync the modules and the player together.

	_oldUnit = _this select 1;
_oldGroup = group _oldUnit;

//We dont care if he was not the leader
if (leader _oldGroup == _oldUnit) then {

	h = [_oldUnit, _oldGroup] spawn {

		_oldUnit = _this select 0;
		_oldGroup = _this select 1;

		_oldProviders = _oldUnit getVariable ["BIS_SUPP_allProviderModules",[]];
		_HQ = _oldUnit getVariable ["BIS_SUPP_HQ",nil];

		//Wait for a new leader to be assigned			
		waitUntil { leader _oldGroup != _oldUnit };
		_leader = leader _oldGroup;

		if ((count _oldProviders) > 0) then {
		  {
				_providerModule = _x;
				{
					 if (typeOf _x == "SupportRequester" && _oldUnit in (synchronizedObjects _x)) then {
						  [_leader, _x, _providerModule] call BIS_fnc_addSupportLink;
					 };
				}forEach synchronizedObjects _providerModule;
		  }forEach _oldProviders;
		};

		{
		  _used = _oldUnit getVariable [format ["BIS_SUPP_used_%1",_x], 0];
		  _leader setVariable [format ["BIS_SUPP_used_%1", _x], _used, true]
		} forEach [
		  "Artillery",
		  "CAS_Heli",
		  "CAS_Bombing",
		  "UAV",
		  "Drop",
		  "Transport"
		];
		_leader setVariable ["BIS_SUPP_transmitting", false];
		_leader kbAddTopic ["BIS_SUPP_protocol", "A3\Modules_F\supports\kb\protocol.bikb", "A3\Modules_F\supports\kb\protocol.fsm", {call compile preprocessFileLineNumbers "A3\Modules_F\supports\kb\protocol.sqf"}];
		if (!(isNil "_HQ")) then {
		  _leader setVariable ["BIS_SUPP_HQ", _HQ];
		};
	};
};

//initPlayerLocal.sqf

_player = _this select 0;

myTag_fnc_reSyncSupports = {
	if ( _this isEqualTo MissionLeader ) then {
		{
			[ _this, LeaderRequester, _x ] call BIS_fnc_addSupportLink;
		}forEach [ VirtualArty, VirtualTransport ];
	};
};

_player addEventHandler [ "Respawn", {
	( _this select 0 ) call myTag_fnc_reSyncSupports;
}];

_player call myTag_fnc_reSyncSupports;


onPlayerRespawn.sqf

_oldUnit = _this select 1;
_oldProviders = _oldUnit getVariable ["BIS_SUPP_allProviderModules",[]];
_HQ = _oldUnit getVariable ["BIS_SUPP_HQ",nil];

if ((count _oldProviders) > 0) then {
	{
		_providerModule = _x;
		{
			if (typeOf _x == "SupportRequester" && _oldUnit in (synchronizedObjects _x)) then {
				[player, _x, _providerModule] call BIS_fnc_addSupportLink;
			};
		}forEach synchronizedObjects _providerModule;
	}forEach _oldProviders;
};

{
	_used = _oldUnit getVariable [format ["BIS_SUPP_used_%1",_x], 0];
	player setVariable [format ["BIS_SUPP_used_%1", _x], _used, true]
} forEach [
	"Artillery",
	"CAS_Heli",
	"CAS_Bombing",
	"UAV",
	"Drop",
	"Transport"
];
player setVariable ["BIS_SUPP_transmitting", false];
player kbAddTopic ["BIS_SUPP_protocol", "A3\Modules_F\supports\kb\protocol.bikb", "A3\Modules_F\supports\kb\protocol.fsm", {call compile preprocessFileLineNumbers "A3\Modules_F\supports\kb\protocol.sqf"}];
if (!(isNil "_HQ")) then {
	player setVariable ["BIS_SUPP_HQ", _HQ];
};
This works for respawn type GROUP and SIDE. From what ive tested respawn types INSTANT and BASE already transfer your supports for you.

The above code transfers needed variables from old unit to new including amount of supply calls already used.

If you want to respawn the unit with a whole new set of support calls change

_used = _oldUnit getVariable [format ["BIS_SUPP_used_%1",_x], 0];
player setVariable [format ["BIS_SUPP_used_%1", _x], _used, true]
for

player setVariable [format ["BIS_SUPP_used_%1", _x], 0, TRUE]
TEST_MISSION

Event "Respawn" does not seem to work for type GROUP or SIDE, totally gets ignored? Is this correct or is this a bug? as i cant remember ever using type GROUP and event respawn. Is it because the swap is just a camera transfer rather than a new unit being created?

Something as simple as

player addEvenHandle ["Respawn", { player sidechat "respawn event" }];
just never happens but works fine for respawn types BASE and INSTANT.