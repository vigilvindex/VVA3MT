// Initialises the military markers module.
private ["_side","_group","_module","_map","_hud","_selectable"];
_side = createCenter sideLogic;
_group = createGroup _side;
_module = _group createUnit ["MartaManager",[0,0,0],[],0,"FORM"];
_map = true;
_hud = false;
_selectable = true;
setGroupIconsVisible [_map,_hud];
setGroupIconsSelectable _selectable;
