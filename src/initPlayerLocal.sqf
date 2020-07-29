["InitializePlayer",[player,true]] call BIS_fnc_dynamicGroups; // https://community.bistudio.com/wiki/Arma_3_Dynamic_Groups
player addEventHandler ['Respawn',{{player addOwnedMine _x} count (getAllOwnedMines (_this select 1))}]; // Persistent mine ownership.
