// _locations = [] call VVM_fnc_getMapBaseSpawnLocs;
// TODO: CHERNARUS, TAKISTAN
private _return = switch (toUpper worldName) do {
	case "ALTIS": {
		[	[24116.8,18129.4,0],
			[2644.41,10113.4,0],
			[12209.5,22858.4,0],
			[19532,5715.29,0]
		];
	};
	case "ENOCH": {
		[	[4150,145,0],
			[8575,12730,0],
			[85,8755,0],
			[12630,6190,0] 
		];
	};
	case "MALDEN": {
		[	[1144.19,680.552,0],
			[6938.17,11535.6,0],
			[9996.99,2272.81,0],
			[5099.3,1144.55,0]
		];
	};
	case "STRATIS": {
		[	[2666.85,668.589,0],
			[3751.9,7657.79,0],
			[4763.14,2825.21,0],
			[2056.12,4136.85,0]
		];
	};
	case "TANOA": {
		[	[3571.47,2472.71,0],
			[9337.58,3678.64,0],
			[14583.5,10558.9,0],
			[5251.12,3168.29,0],
			[2341.98,11258.5,0],
			[1957.8,8149.4,0],
			[9590.2,6566.62,0]
		];
	};
	case "VR": {
		[	[485.046,508.873,0],
			[7485.03,521.476,0],
			[473.942,7518.35,0],
			[7764.16,7812.34,0]
		];
	};
	case "GM_WEFERLINGEN_SUMMER": {
		[	[9686.09,148.067,0],
			[6570.93,20398.2,0],
			[110.116,7494.4,0],
			[20354.2,7312.89,0]
		];
	};
	case "GM_WEFERLINGEN_WINTER": {
		[	[9686.09,148.067,0],
			[6570.93,20398.2,0],
			[110.116,7494.4,0],
			[20354.2,7312.89,0]
		];
	};
};
_return;
