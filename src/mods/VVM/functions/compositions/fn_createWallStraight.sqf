/* VG Straight Walls Generator - =VG= SemlerPDX @ http://www.veterans-gaming.com/ - Copies the x/y/z coords of straight walls for creation of a perfect straight wall.
this addAction ["BIS_DEBUG_CAM (right click to exit)","camera.sqs"];
this addAction ["<t color='#DBA901'>VG Straight Wall</t>", "VGStraightWalls.sqf",(["Land_HBarrier_large",4,-0.1,0])];
this addAction [action, script filename, (["wallType", numberOfWalls, distanceBetweenCorrection, straightAlignmentCorrection])];
*/
_wallTypeToClone = _this select 3 select 0;
_numberOfClones = (_this select 3 select 1) - 1;
_distanceBetweenCorrection = (_this select 3 select 2) - 1.25;
_straightAlignmentCorrection = _this select 3 select 3;
_directionWall = 0;
_posArray = [];
_textArray = [];
player setDir _directionWall + 5;
_newClone = _wallTypeToClone createVehicle [0,0,0];
_newClone setDir _directionWall;
_newClone setPos [(getpos player select 0)+0,(getpos player select 1)+10,(getpos player select 2)+0];
_newClone setVehicleVarName "VG_Straight_Wall_1";
_checkPos = [(getpos _newClone select 0),(getpos _newClone select 1),(getpos _newClone select 2)];
_checkPosArray = text format["%1",_checkPos];
_posArray = _posArray + [_checkPos];
_textPosArray = text format["Position VGstraightWall_1 = %1", _posArray select 0];
_textArray = _textArray + [_textPosArray];
sleep 0.1;
for "_i" from 1 to _numberOfClones do {
	call compile format ["_newClone setVehicleVarName 'VG_Straight_Wall_%1'", _i + 1];
	sleep 0.1;
	_wallDim = boundingBox _newClone;
	_maxX = _wallDim select 1 select 0;
	_lastClone = _newClone;
	_newClone = _wallTypeToClone createVehicle [0,0,0];
	_newClone setDir ((getDir _lastClone) +0);
	_newClone setPos [(getpos _lastClone select 0)+ _maxX*2 + _distanceBetweenCorrection,(getpos _lastClone select 1)+_straightAlignmentCorrection,(getpos _lastClone select 2)+0];
	_checkPos = [(getpos _newClone select 0),(getpos _newClone select 1),(getpos _newClone select 2)];
	_checkPosArray = text format["%1",_checkPos];
	_posArray = _posArray + [_checkPos];
	_textPosArray = text format["Position VGstraightWall_%1 = %2",_i + 1, _posArray select _i];
	_textArray = _textArray + [_textPosArray];

};
_clipboardData = text format["%1",_textArray];
copyToClipboard format["%2 VGstraightWall Positions: %1",_clipboardData,_numberOfClones + 1];
sleep 1;
hint format["%1 Positions Copied to Clipboard",_numberOfClones + 1];
/* FULL INSTRUCIONS ON HOW TO USE VGStraightWallsCreator.sqf
PASTE THESE ACTIONS INTO YOUR PLAYER UNIT IN EDITOR:
this addAction ["BIS_DEBUG_CAM (right click to exit)","camera.sqs"];
this addAction ["<t color='#DBA901'>VG Straight Wall</t>", "VGStraightWalls.sqf",(["Land_HBarrier_large",4,-0.1,0])];
//Variables Meanings in the addAction syntax:
this addAction [action, script filename, (["wallType", numberOfWalls, distanceBetweenCorrection, straightAlignmentCorrection])];
ExampleWallTypesToSwap = ["Land_fort_bagfence_long","Base_WarfareBBarrier10xTall","Land_HBarrier_large"];
_wallTypeToClone = _this select 3 select 0;		   Set the class name of the object you want to use
_numberOfClones = _this select 3 select 1;		   Set the number of objects long you want the wall to be
_distanceBetweenCorrection = _this select 3 select 2;    Can be used to make minor corrections in gap between walls
_straightAlignmentCorrection = _this select 3 select 3;  Can be used to make a wall jagged, and see where edges mesh
//HOW TO USE//
[STEP ONE: DECIDE ON PARAMETERS]
First, decide on a wall type, and number of walls. Adjust the "addAction" variables to suit your needs.
Don't worry about "distanceBetween" and "straightAlignment" corrections just yet...
Next, actually place the number of barriers into the editor of your mission.
Press F1 and find some walls or barriers to place.
Give them sequential names: i.e. create first barrier, name it in the format:   MyWall
and then copy it, and paste it down anywhere.  The new copy will have the name: MyWall_1
Do this for each barrier you need (if you want 20, you should end up with 21 barriers, after which 
the first one named "MyWall" can be deleted). You only want the ones with numbers.
Literally, you can scatter them anywhere, all over randomly. We will change their positions later.
Just need the placeholders....
Now save the mission.
[STEP TWO: CREATE WALLS]
Click Preview, and load in.
Move anywhere and select the "Create Straight Wall" action.
When done, it saves the positions of each wall to your clipboard.
Examine your wall.  Use the BIS_DEBUG_CAM to get an overhead view. Press Q to go up and Z for down.
(W,A,S,D or Mouse for moving, and NumPad for Looking Around)  Press Right Click to exit the camera.
(NOTE: You can turn off the crosshairs with L, N is nightvision and WH/BH Thermals. Click anywhere on map to move cam there.)
If there is too little or too much space between walls, increase/decrease "_distanceBetweenCorrection",
Use little increments at first, as in:  +0.1 or -0.5  (use positive symbol "+" for Farther Apart and negative symbol "-" for Closer Together)
Same with it's straighness - if it's slightly jagged, you can adjust it left or right by changing "_straightAlignmentCorrection"
You can also use this to get a good view of how the edges of a barrier meet or mesh with the next.
When you are happy with your wall, just exit - the very last set of positions copied is now saved to your clipboard.
[STEP THREE: USE WALL POS DATA]
Exit the preview, close down Arma, and open up a notepad/wordpad and paste (ctrl + v) your wall position data.
it may look like this:
positions copied = [posWallSection1 = [4391.23,10408.8,0.00143433],posWallSection2 = [4399.93,10409.3,0.00143433],posWallSection3 = [4408.62,10409.8,0.00143433],posWallSection4 = [4417.31,10410.3,0.00143433],posWallSection5 = [4426.01,10410.8,0.00143433],posWallSection6 = [4434.7,10411.3,0.00143433],posWallSection7 = [4443.4,10411.8,0.00143433],posWallSection8 = [4452.09,10412.3,0.00143433],posWallSection9 = [4460.78,10412.8,0.00143433],posWallSection10 = [4469.48,10413.3,0.00143433]]
Very long, hard to read!!!
Start making it easier by pressing enter after each comma (  ,  )
like this:
positions copied = [
posWallSection1 = [4391.23,10408.8,0.00143433],
posWallSection2 = [4399.93,10409.3,0.00143433],
posWallSection3 = [4408.62,10409.8,0.00143433],
posWallSection4 = [4417.31,10410.3,0.00143433],
posWallSection5 = [4426.01,10410.8,0.00143433],
posWallSection6 = [4434.7,10411.3,0.00143433],
posWallSection7 = [4443.4,10411.8,0.00143433]]
Again, do not edit the mission.sqm when Arma is running.
Open your mission folder, and open the mission.sqm file:
//>It is best to use a text editor with FIND function for this method.<//
Go ahead and FIND the name of your barriers (without the _1 or _3 numbers) i.e.  "MyWall"
it should find the exact number you made in the editor.  We are going to change their pos data.
Your barrier class names should look something like this:
		class Item126 {
			position[]={4899.2061,340.38986,9658.7744};
			azimut=150.18291;
			id=165;
			side="EMPTY";
			vehicle="Base_WarfareBBarrier10xTall";
			leader=1;
			lock="LOCKED";
			skill=0.73333329;
			text="MyWall_1";
		};
		class Item127 {
			position[]={4940.6719,339,9683.0859};
			azimut=150.18291;
			id=166;
			side="EMPTY";
			vehicle="Base_WarfareBBarrier10xTall";
			leader=1;
			lock="LOCKED";
			skill=0.73333329;
			text="MyWall_2";
		};
		class Item128 {
			position[]={4952.1567,339,9689.6787};
			azimut=150.18291;
			id=167;
			side="EMPTY";
			vehicle="Base_WarfareBBarrier10xTall";
			leader=1;
			lock="LOCKED";
			skill=0.73333329;
			text="MyWall_3";
		};
//Obviously, there may be some missing entries, like lock= skill= or leader=.  This is just a quick example.
You can see that the position has 3 numbers separated by commas just like your copied positions.
Overwrite those numbers with the ones from your notepad
for "MyWall_1", I would copy just the numbers from posWallSection1: 4391.23,10408.8,0.00143433
and paste it over the old ones like this:
		class Item126 {
			position[]={4391.23,10408.8,0.00143433};     <<-----Paste your pos data here for each wall section respectively
			azimut=150.18291;
			id=165;
			side="EMPTY";
			vehicle="Base_WarfareBBarrier10xTall";
			leader=1;
			lock="LOCKED";
			skill=0.73333329;
			text="MyWall_1";
		};
It may be tedious to use this method to create a straight wall, but this is the MOST exact way to do it.
Be very careful while editing the mission.sqm - one mistake could ruin the whole thing, and could be hard to track down.
Use backups often to avoid losing hours of work!
Once you are done, save the file, and close it.
[FINAL STEP: POSITION FINAL WALL IN YOUR MISSION]
Load Arma into the mission editor, and load your mission.
You should see your new wall, instead of all the random wall placeholders you put down earlier.
Now you can drag and select the entire wall, and move it to wherever you want.
Feel free to copy the wall, and place several more. You can shorten it by deleting some of it's parts.
Though the new names of the barriers will get longer and more odd in format (such as "MyWall_2_1_5_2"),
it should not affect anything negatively in your mission.
You can alleviate this by deleting the names of each barrier and saving your mission before copying the entire
wall for further uses. Remember, you can copy (Ctrl+C) any number of objects from one mission to another inside the editor.
TIPS:
When copying and pasting objects in the editor, you can press Ctrl+Shift+V to paste them onto a new mission in the same position
on the map that they were in the previous mission, provided it's the same map.
Ctrl+V will only paste the objects relative to the mouse position.
Use Ctrl+X to delete a large selection of objects: Much faster than the Delete key!
-Hope this helps someone; tried googling it, but only came up with a non-functioning SQS for Arma 1, so I wrote this.
 I sure hate trying to manually make straight walls myself!  =VG= SemlerPDX @ http://www.veterans-gaming.com/
*/