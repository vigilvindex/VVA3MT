/* Name: vv_hide_respawn_markers.sqf
 * Description: This script checks player side and hides respawn markers for other sides.
 * Author: vigil.vindex@gmail.com
 * Licence: https://creativecommons.org/licenses/by-sa/3.0/
 * Last Updated: 2014/05/20
 * Usage: [] execVM "mods\VVM\scripts\vv_hide_respawn_markers.sqf";
 * Returns: Nothing.
 * Arguments: None.
 * TODO: Should check if the marker exists before hiding it.
 */
if (!isDedicated) then {
  waitUntil{ !isNil {player} };
  waitUntil{ player == player };
  switch (side player) do {
    case WEST: { //BLUFOR
      "respawn_east" setMarkerAlphaLocal 0;
      "respawn_guerrila" setMarkerAlphaLocal 0;
      "respawn_civilian" setMarkerAlphaLocal 0;
    };
    case EAST: { //OPFOR
      "respawn_west" setMarkerAlphaLocal 0;
      "respawn_guerrila" setMarkerAlphaLocal 0;
      "respawn_civilian" setMarkerAlphaLocal 0;
    };
    case RESISTANCE: { //INDFOR
      "respawn_east" setMarkerAlphaLocal 0;
      "respawn_west" setMarkerAlphaLocal 0;
      "respawn_civilian" setMarkerAlphaLocal 0;
    };
    case CIVILIAN: { //CIVFOR
      "respawn_east" setMarkerAlphaLocal 0;
      "respawn_guerrila" setMarkerAlphaLocal 0;
      "respawn_west" setMarkerAlphaLocal 0;
    };
  };
};
