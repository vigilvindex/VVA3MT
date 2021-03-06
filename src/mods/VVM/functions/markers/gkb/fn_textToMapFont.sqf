/* Function: GKB_fnc_writeToMapFont - Author: Gekkibi, Modified by VigilVindex - Licence: http://creativecommons.org/licenses/by-nc-sa/3.0/
 * Description:	Defines marker axis positions, sizes, angles and offset for GKB_fnc_writeToMap.
 * Example:	_symbol = "G" call GKB_fnc_writeToMapFont; - Parameters: 1st String Symbol
 * Returns:	Marker axis positions, sizes, angles and offset in an array. [[[posX, posY], size, angle], ...], offset]
 */
private ["_return"];
switch (toUpper _this) do {
	case "0": {_return = [[[[-5,0],10,0],[[0,-10],4,90],[[0,10],4,90],[[5,0],10,0]],15];};
	case "1": {_return = [[[[-5,8],1,0],[[-3,0],11,0]],7];};
	case "2": {_return = [[[[-5,-5.5],5.5,0],[[-5,8],2,0],[[0,0],4,90],[[0,10],4,90],[[1,-10],5,90],[[5,5],5,0]],15];};
	case "3": {_return = [[[[-5,-8],2,0],[[-5,8],2,0],[[0,-10],4,90],[[0,10],4,90],[[2,0],3,90],[[5,-5.5],4.5,0],[[5,5.5],4.5,0]],15];};
	case "4": {_return = [[[[-5,3],4,0],[[-3,8.5],2.5,0],[[1,0],5,90],[[4,-6],5,0],[[4,6],5,0]],14];};
	case "5": {_return = [[[[-5,-8],2,0],[[-5,5],6,0],[[0,-10],4,90],[[0,0],4,90],[[1,10],5,90],[[5,-5],5,0]],15];};
	case "6": {_return = [[[[-5,0],10,0],[[0,-10],4,90],[[0,0],4,90],[[0,10],4,90],[[5,-5],5,0],[[5,8],2,0]],15];};
	case "7": {_return = [[[[0,10],6,90],[[1,-5],6,0],[[3,2],2,0],[[5,6],3,0]],15];};
	case "8": {_return = [[[[-5,-5.5],4.5,0],[[-5,5.5],4.5,0],[[0,-10],4,90],[[0,0],5,90],[[0,10],4,90],[[5,-5.5],4.5,0],[[5,5.5],4.5,0]],15];};
	case "9": {_return = [[[[-5,-8],2,0],[[-5,5],5,0],[[0,-10],4,90],[[0,0],4,90],[[0,10],4,90],[[5,0],10,0]],15];};
	case "A": {_return = [[[[-5,-0.5],10.5,0],[[0,0],4,90],[[0,10],4,90],[[5,-0.5],10.5,0]],15];};
	case "B": {_return = [[[[-5,0],11,0],[[0,-10],4,90],[[0,10],4,90],[[0.5,0],4.5,90],[[5,-5.5],4.5,0],[[5,5.5],4.5,0]],15];};
	case "C": {_return = [[[[-5,0],10,0],[[0,-10],4,90],[[0,10],4,90],[[5,-8],2,0],[[5,8],2,0]],15];};
	case "D": {_return = [[[[-5,0],11,0],[[0,-10],4,90],[[0,10],4,90],[[5,0],10,0]],15];};
	case "E": {_return = [[[[-5,0],11,0],[[-1,0],3,90],[[1,-10],5,90],[[1,10],5,90]],15];};
	case "F": {_return = [[[[-5,0],11,0],[[-1,0],3,90],[[1,10],5,90]],15];};
	case "G": {_return = [[[[-5,0],10,0],[[0,-10],4,90],[[0,10],4,90],[[2,0],2,90],[[5,-4.5],5.5,0],[[5,8],2,0]],15];};
	case "H": {_return = [[[[-5,0],11,0],[[0,0],4,90],[[5,0],11,0]],15];};
	case "I": {_return = [[[[-5,0],11,0]],5];};
	case "J": {_return = [[[[-5,-8],2,0],[[0,-10],4,90],[[5,0.5],10.5,0]],15];};
	case "K": {_return = [[[[-5,0],11,0],[[-1.5,0],2.5,90],[[1,-3],2,0],[[1,3],2,0],[[3,-6],2,0],[[3,6],2,0],[[5,-9],2,0],[[5,9],2,0]],15];};
	case "L": {_return = [[[[-5,0],11,0],[[0,-10],4,90]],13];};
	case "M": {_return = [[[[-5,0],11,0],[[-3,10],1,0],[[-2,7],2,0],[[0,4],2,0],[[2,7],2,0],[[3,10],1,0],[[5,0],11,0]],15];};
	case "N": {_return = [[[[-5,0],11,0],[[-3,10],1,0],[[-2,6],3,0],[[0,0],4,0],[[2,-6],3,0],[[3,-10],1,0],[[5,0],11,0]],15];};
	case "O": {_return = [[[[-5,0],10,0],[[0,-10],4,90],[[0,10],4,90],[[5,0],10,0]],15];};
	case "P": {_return = [[[[-5,0],11,0],[[0,0],4,90],[[0,10],4,90],[[5,5],5,0]],15];};
	case "Q": {_return = [[[[-5,0],10,0],[[0,-10],4,90],[[0,10],4,90],[[2,-8],1,0],[[3,-12],1,0],[[5,0],10,0]],15];};
	case "R": {_return = [[[[-5,0],11,0],[[0,0],4,90],[[0,10],4,90],[[1,-3],2,0],[[3,-6],2,0],[[5,-9],2,0],[[5,5],5,0]],15];};
	case "S": {_return = [[[[-5,-8],2,0],[[-5,5],5,0],[[0,-10],4,90],[[0,0],4,90],[[0,10],4,90],[[5,-5],5,0],[[5,8],2,0]],15];};
	case "T": {_return = [[[[0,-1],10,0],[[0,10],6,90]],15];};
	case "U": {_return = [[[[-5,1],10,0],[[0,-10],5,90],[[5,1],10,0]],15];};
	case "V": {_return = [[[[-5,7],4,0],[[-4,1],2,0],[[-3,-3],2,0],[[-2,-7],2,0],[[-0.5,-10],1.5,90],[[1,-7],2,0],[[2,-3],2,0],[[3,1],2,0],[[4,7],4,0]],14];};
	case "W": {_return = [[[[-5,6],5,0],[[-4,-4],5,0],[[-2.5,-10],1.5,90],[[0,-8],2,90],[[0,-5],2,0],[[2.5,-10],1.5,90],[[4,-4],5,0],[[5,6],5,0]],15];};
	case "X": {_return = [[[[-5,-8],3,0],[[-5,8],3,0],[[-4,-3],2,0],[[-4,3],2,0],[[-1.5,0],2.5,90],[[1,-3],2,0],[[1,3],2,0],[[2,-8],3,0],[[2,8],3,0]],12];};
	case "Y": {_return = [[[[-5,9.5],1.5,0],[[-4,6.5],1.5,0],[[-3,3.5],1.5,0],[[-2,1],1,0],[[0,-6.5],4.5,0],[[0,-1],2,90],[[2,1],1,0],[[3,3.5],1.5,0],[[4,6.5],1.5,0],[[5,9.5],1.5,0]],15];};
	case "Z": {_return = [[[[-4,-8],1, 0],[[-3,-6],1,0],[[-2,-4],1,0],[[-1,-2],1,0],[[0,-10],6,90],[[0,0],1,0],[[0,10],6,90],[[1,2],1,0],[[2,4],1,0],[[3,6],1,0],[[4,8],1,0]],15];};
	case " ": {_return = [[],15];};
	case ".": {_return = [[[[-5,-10],1,0]],5];};
	case ",": {_return = [[[[-5,-11],2,0]],5];};
	case "!": {_return = [[[[-5,-10],1,0],[[-5,2],9,0]],5];};
	case "?": {_return = [[[[-5,8],2,0],[[0,-10],1,0],[[0,-3.5],3.5,0],[[0,10],4,90],[[2.5,0],1.5,90],[[5,5],5,0]],15];};
	case "-": {_return = [[[[-4,0],3,90]],7];};
	case "'": {_return = [[[[-5,10],3,0]],5];};
	default {_return = [[],0];};
};
_return;
