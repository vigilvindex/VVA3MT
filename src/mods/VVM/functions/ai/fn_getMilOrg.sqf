// https://en.wikipedia.org/wiki/Company_(military_unit)
_return = [ // INDEX, NAME, MIN MEN, MAX MEN, LEADER
	[6,"Regiment",1000,5500,"COLONEL"],
	[5,"Battalion",300,1000,"MAJOR"],
	[4,"Company",80,250,"CAPTAIN"],
	[3,"Platoon",15,45,"LIEUTENANT"],
	[2,"Squad",5,14,"SERGEANT"],
	[1,"Team",2,4,"CORPORAL"],
	[0,"Unit",1,1,"PRIVATE"]
] select _this;
_return;
