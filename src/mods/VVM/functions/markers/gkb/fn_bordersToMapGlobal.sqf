/* Function: GKB_bordersToMapGlobal - Author: Gekkibi - Licence: http://creativecommons.org/licenses/by-nc-sa/3.0/
 * Description: Simulates authentic map by not showing the entire map.
 * Example: [[5800,5400],[sqrt 2 * 2000,2000]] call GKB_fnc_bordersToMapGlobal;
 * Returns: Nil
 * Parameters:
 * 	1st	Numbers in array	Center of the visible area
 * 	2nd	Numbers in array	Width and height of the visible area
 */
#define backgroundColor ["ColorBlack","SolidFull"]
#define borderColor ["ColorWhite","SolidFull"]
#define lineColor ["ColorBlack","Border"]
#define mapAdjustment 10000
#define edgeWidth 10
private ["_marker","_position","_size"];
_position = _this select 0;
_size = _this select 1;
{	for "_y" from 1 to 9001 do {
		_marker = "VVM_bordersToMap_" + str(_y);
		if (markerShape _marker == "") exitWith {};
	};
	createMarker [_marker, [(_position select 0) + (_x select 0 select 0), (_position select 1) + (_x select 0 select 1)]];
	_marker setMarkerShape "RECTANGLE";
	_marker setMarkerSize (_x select 1);
	_marker setMarkerColor (_x select 2 select 0);
	_marker setMarkerBrush (_x select 2 select 1);
} forEach [
	[[(_size select 0) / -2 - mapAdjustment,0],[mapAdjustment,mapAdjustment],backgroundColor],
	[[(_size select 0) / 2 + mapAdjustment,0],[mapAdjustment,mapAdjustment],backgroundColor],
	[[0,(_size select 1) / 2 + mapAdjustment],[mapAdjustment,mapAdjustment],backgroundColor],
	[[0,(_size select 1) / -2 - mapAdjustment],[mapAdjustment,mapAdjustment],backgroundColor],
	[[(_size select 0) / -2 - edgeWidth,0],[edgeWidth,(_size select 1) / 2],borderColor],
	[[(_size select 0) / 2 + edgeWidth,0],[edgeWidth,(_size select 1) / 2],borderColor],
	[[0,(_size select 1) / 2 + edgeWidth],[(_size select 0) / 2 + 2 * edgeWidth,edgeWidth],borderColor],
	[[0,(_size select 1) / -2 - edgeWidth],[(_size select 0) / 2 + 2 * edgeWidth,edgeWidth],borderColor],
	[[0,0],[(_size select 0) / 2,(_size select 1) / 2],lineColor]
];
