private ["_climates","_return"];
_climates = [
	"Temperate",	// Olive
	"Tropical",		// Dark Green
	"Arid",			// Sand
	"Semi-Arid",	// Brown
	"Lush",			// Olive
	"Urban",		// Black
	"Marine",		// Black
	"Polar"			// White
];
_return = switch (toUpperANSI worldName) do {
	case "ALTIS": {"Semi-Arid"};
	case "ENOCH": {"Temperate"};
	case "GM_WEFERLINGEN_SUMMER": {"Temperate"};
	case "GM_WEFERLINGEN_WINTER": {"Polar"};
	case "MALDEN": {"Temperate"};
	case "STRATIS": {"Semi-Arid"};
	case "TANOA": {"Tropical"};
	case "VR": {"Urban"};
	case "CHERNARUS": {"Temperate"};
	case "TAKISTAN": {"Arid"};
	default {"Temperate"};
};
_return;
