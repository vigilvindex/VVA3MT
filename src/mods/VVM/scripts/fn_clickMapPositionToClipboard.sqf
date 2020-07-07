/* Function: GKB_clickToClipboard - Author: Gekkibi - Licence: http://creativecommons.org/licenses/by-nc-sa/3.0/
 * Description: Copies map clicks to clipboard. Coordinates are rounded to the nearest multiple of 5.
 * Parameters: No parameters.
 * Returns: Nil
 * Example: [] call GKB_fnc_clickMapPositionToClipboard; // Call during init.
 */
if (local player) then {
	copyToClipboard "";
	onMapSingleClick "
		copyToClipboard (
			copyFromClipboard +
			'[' +
			str(
				ceil ((_pos select 0) / 5) * 5
			) +
			', ' +
			str(
				ceil ((_pos select 1) / 5) * 5
			) +
			'], '
		);
		true
	";
};
